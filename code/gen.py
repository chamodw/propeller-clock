str1 = "H E L L O ";

letters  = {' ':[0]*6, 'H':[255, 255, 255, 255, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 255, 255, 255, 255],
'E':[255, 255, 255, 255] + [153]*16,
'L': [255, 255, 255, 255] + [3]*16,
'O': [255]*4 + [195]*12 + [255]*4

}


res = [];
for i in range(len(str1)):
	res.extend(letters[str1[i]]);
res = res + [0]*(360 - len(res));
res = [str(x) for x in res]
outstr = "uint8_t LEDs[] = { " + ', '.join(res)  + " };";
print outstr

f = open("/Users/chamod/Documents/avr/clock/328/image.h", 'w');
f.write(outstr);
