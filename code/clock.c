/*
 Propeller clock sample code for Atmega328P
 */

#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdio.h>
#include <stdbool.h>
#include <string.h>

#include "image.h"

#undef F_CPU
#define F_CPU 8000000UL
#include <util/delay.h>
/*
uint8_t seconds = 0;
uint8_t minutes = 5;
uint8_t hours;

uint32_t ticks;*/

// Definitions/Macros


#define BAUD 9600
#define MYUBRR F_CPU/16/BAUD-1
//#define DEBUG


char temp_disp = 1;



#ifdef DEBUG
void usart_init(uint16_t ubrr);
char usart_getchar( void );
void usart_putchar( char data );
void usart_pstr (char *s);
unsigned char usart_kbhit(void);
int usart_putchar_printf(char var, FILE *stream);
#endif

void draw(unsigned short deg);

void show(unsigned short deg);

volatile uint8_t i = 1;

//Global Variables

unsigned short degree; // current degree of rotation from the origin
unsigned char factor; // timer pulses per degree(this is updated after each complete cycle, and is used for updating degrees)


unsigned short counter = 0;
unsigned short duration;

ISR (INT0_vect)
{
    cli();
    
    //_delay_ms(1);
    duration = TCNT1;
   /*
    ticks+= duration;
    if(ticks > 125000)
    {
        ticks = 0;
        seconds ++;
    }*/
    
    degree = 0;
    
    
    factor = duration / 360;
#ifdef DEBUG
    unsigned char str[10];
    sprintf(str, "%u %u\n\r", duration, factor);
    usart_pstr(str);
#endif
    TCNT1 = 0;
    
    sei();
}





/*
 Timer 1 overflow vector
 Timer 1 should be considered to never reach here because it has to be reset after every cycle
 */

ISR (TIMER1_OVF_vect)
{
 
}


/*
 Timer 0 overflow vector

 */

ISR (TIMER0_OVF_vect)
{
    cli();
    degree++;
   TCNT0 = 256-factor;
    if (degree == 360)
        degree = 0;
    sei();
}

/*
 Try increasing the delays
 */

void sendSerial1(unsigned char b2,  unsigned char b1)
{
    
    char itr;
    
    //LED Set 2
    
    PORTD  &= 0b11011111;           //Bring LATCH low
    for (itr = 7; itr >= 0; itr--)
    {
        PORTD  &= 0b00111111;       //Bring SCK and SDA low
        PORTD |= ((b1 & (1 << itr)) >> itr) << 6; //SDA
        PORTD  |= 0b10000000;
        _delay_us(10);
    }
    //PORTD  |= 0b00100000;
    
    //_delay_ms(1);

    //PORTD  &= 0b11011111;
    //LED Set 1
    for (itr = 7; itr >= 0; itr--)
    {
        
        PORTD  &= 0b00111111;       //Bring SCK and SDA low
        PORTD |= ((b2 & (1 << itr)) >> itr) << 6;  //SDA
        PORTD  |= 0b10000000;       //Bring SCK high

        _delay_us(10);
        
    }
    _delay_ms(1);
    PORTD  |= 0b00100000; //Bring LATCH high
    
}
/*
Lights up the LEDs as relavant to current degree of rotation
*/
void show(unsigned short deg)
{
 
    sendSerial1(0, LEDs[deg]);

}
/*
void clock(uint8_t deg)
{
    uint8_t set1=0, set2=0;
    
    if (seconds >= 60)
    {
        seconds -= 60;
        minutes += 1;
    }
    
    if(deg == 6*seconds)
    {
        //
        set1 |= 0xff;
        set2 += 0xff;
    }
    if(deg > 6*minutes -1 && deg < 6*minutes+1)

    {
        set1 |= 0x0f;
        set2 |= 0xff;
    }
    sendSerial1(set1, set2);
}*/

void init()
{
    
    EICRA |= 0b00000001; // Trigger INT0 on rising edge
    EIMSK =  0b00000001; //Enable INT0 mask
   
    
    
    TCCR0B |= 0b00000011; //64 prescaler
    TIMSK0 |= 0b00000001; //enable TMR0 overflow interrupt
  

    TCCR1B |= 0b00000011; //64 prescaler (TIMER1)
    
    
     sei(); //enable interrupts
    
}

int main(void)
{
    /*
     SCK    PORTD 7
     SDA    PORTD 6
     LATCH  PORTD 5
     */
     
    
    DDRB = 255 ;
    DDRD = 255;
    DDRD &= 0b11111011;
    DDRC = 0b00111111;
   
   // DDRD &= ~(1 << DDD2);
   
    init();
    
       while(1)
    {
            show(degree);
        //clock(degree);
        
    }
    


    for(;;);
    return 0;               /* never reached */
}


#ifdef DEBUG
void usart_init( uint16_t ubrr) {
    // Set baud rate
    UBRRH = (uint8_t)(ubrr>>8);
    UBRRL = (uint8_t)ubrr;
    // Enable receiver and transmitter
    UCSRB = (1<<RXEN)|(1<<TXEN);
    // Set frame format: 8data, 1stop bit
    UCSRC = (1<<URSEL)|(3<<UCSZ0);
}

void usart_putchar(char data) {
    // Wait for empty transmit buffer
    while ( !(UCSRA & (_BV(UDRE))) );
    // Start transmission
    UDR = data;
}
char usart_getchar(void) {
    // Wait for incoming data
    while ( !(UCSRA & (_BV(RXC))) );
    // Return the data
    return UDR;
}
unsigned char usart_kbhit(void) {
    //return nonzero if char waiting polled version
    unsigned char b;
    b=0;
    if(UCSRA & (1<<RXC)) b=1;
    return b;
}

void usart_pstr(char *s) {
    // loop through entire string
    while (*s) {
        usart_putchar(*s);
        s++;
    }
}

// this function is called by printf as a stream handler
int usart_putchar_printf(char var, FILE *stream) {
    // translate \n to \r for br@y++ terminal
    if (var == '\n') usart_putchar('\r');
    usart_putchar(var);
    return 0;
}

#endif

