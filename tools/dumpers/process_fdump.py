import os,sys
def readFile(fn):
    a = []
    with open(fn,"rb") as f:
        b = f.read(1)
        while b!=b'':
            a.append(ord(b))
            b = f.read(1)
    return a
arr = readFile("FDUMPDAT.8xv")[(55+17+2):-2]
lfont_arr = arr[:1197]
sfont_arr = arr[1344:]
sfont_len = 1024+sum([i>>7 for i in sfont_arr[:1024:4]])*3
sfont_arr = sfont_arr[:sfont_len]
def dumptext(fn,a):
    idx = 0
    arr = a[:]
    with open(fn,"w") as f:
        while arr:
            f.write(".db $"+",$".join([format(i,"02X") for i in arr[:16]])+" ; "+format(idx,"04X")+"\n")
            del arr[:16]
            idx +=16
dumptext("lfont_dmp.asm",lfont_arr)
dumptext("sfont_dmp.asm",sfont_arr)
print "lfont_len: "+str(len(lfont_arr))
print "sfont_len: "+str(len(sfont_arr))
#os.remove("FDUMPDAT.8xv")
#sys.exit()

#
# Debug: Reconstruct font tables to PIL image objects and .show() them.
#
from PIL import Image
def lfont_get(arr,chr):
    a = [6]  #width is always 6
    if chr<171:
        ta = arr[chr*7:(chr+1)*7]
        for i in range(7):
            a.append(ta[i]<<1&0b00111110)
    else:
        chr = chr-171
        ta = arr[chr*14:(chr+1)*14]
        for i in range(0,14,2):
            a.append(ta[i+0]>>5&0x07|ta[i+1]>>2&0x38)
    if len(a)!=8: raise RuntimeError("Well shit. That shouldn't happen.")
    return a
def sfont_get(arr,chr):
    ta1 = arr[chr*4:(chr+1)*4]
    a = [ta1[0]>>4&7]
    if ta1[0]&0x80:
        ta2 = arr[1024+ta1[3]*3:1024+(ta1[3]+1)*3]
        a.append(ta1[0]&0x0F|ta1[1]>>2&0x30)
        a.append(ta1[1]&0x3F)
        a.append(ta1[2]&0x3F)
        a.append(ta2[0]&0x3F)
        a.append(ta2[1]&0x3F)
        a.append(ta2[2]&0x3F)
        a.append(ta2[0]>>6&0x03|ta2[1]>>4&0x0C|ta2[2]>>2&0x30)
    else:
        a.append(ta1[0]&0x0F)
        a.append(ta1[1]>>4&0x0F)
        a.append(ta1[1]&0x0F)
        a.append(ta1[2]>>4&0x0F)
        a.append(ta1[2]&0x0F)
        a.append(ta1[3]>>4&0x0F)
        a.append(ta1[3]&0x0F)
    return a
img = Image.new("P",(128,128))
img.putpalette([255,255,255,0,0,0]*128)

idx = 0
for y in range(0,128,8):
    for x in range(0,128,8):
        a = lfont_get(lfont_arr,idx)
        a[0] = 0
        for sy in range(0,8):
            for sx in range(0,8):
                img.putpixel((x+sx,y+sy),(a[sy]&0x80)>>7)
                a[sy] = a[sy]<<1
        idx +=1
img.show()

'''
idx = 0
for y in range(0,128,8):
    for x in range(0,128,8):
        a = sfont_get(sfont_arr,idx)
        a[0] = 0
        for sy in range(0,8):
            for sx in range(0,8):
                img.putpixel((x+sx,y+sy),(a[sy]&0x80)>>7)
                a[sy] = a[sy]<<1
        idx +=1
img.show()
'''





