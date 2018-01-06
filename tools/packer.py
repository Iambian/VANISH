import sys,os,subprocess,struct,time

np,cwd,gbn = (os.path.normpath,os.getcwd(),os.path.basename)
def getFileName(f): return os.path.splitext(gbn(f))[0]
def ep(f): return np(cwd+"/"+f)
def ensuredir(d):
    if not os.path.isdir(d): os.makedirs(d)
def delfile(f):
    if os.path.exists(f): os.remove(f)


# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# Miscellaneous

# Waits either 1 second to ensure that a file is in a certain state or errors
# if the operation times out. Incrase retry value if trying to access high
# a high latency file system.
#fnp: file name and path, isdel: True= ensure deletion, False= ensure existence
def checkdel(fnp,isdel):
    retry=60
    while os.path.isfile(fnp)==isdel:
        time.sleep(0.015)
        retry-=1
        if retry<1: return False
    return True

def readFile(fn):
    a = []
    with open(fn,"rb") as f:
        b = f.read(1)
        while b!=b'':
            a.append(ord(b))
            b = f.read(1)
    return a
    
def writeFile(fn,a):
    with open(fn,"wb+") as f: f.write(bytearray(a))

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# Export data to TI calculator appvar type
TI_VAR_PROG_TYPE, TI_VAR_PROTPROG_TYPE, TI_VAR_APPVAR_TYPE = (0x05,0x06,0x15)
TI_VAR_FLAG_RAM, TI_VAR_FLAG_ARCHIVED = (0x00,0x80)

#fpath: Path to output file; fname: file's base name (no extension);
#fdata: bytearray-compatible iterable containing just the file's data section
def export8xv(fpath,fname,fdata):
    # Ensure that filedata is a string
    fdata = str(bytearray(fdata))
    # Add size bytes to file data as per (PROT)PROG/APPVAR data structure
    fdata = struct.pack('<H',len(fdata)) + fdata
    # Construct variable header
    vheader  = "\x0D\x00" + struct.pack("<H",len(fdata)) + chr(TI_VAR_APPVAR_TYPE)
    vheader += fname.ljust(8,'\x00')[:8]
    vheader += "\x00" + chr(TI_VAR_FLAG_ARCHIVED) + struct.pack("<H",len(fdata))
    variable = vheader + fdata
    # Construct header, add file data, then add footer
    output  = "**TI83F*\x1A\x0A\x00"
    output += "Cherries! Steaks! Gravy! Rawr!".ljust(42)[:42]
    output += struct.pack('<H',len(variable)) + variable
    output += struct.pack('<H',sum(ord(i) for i in variable)&0xFFFF)
    # Output result to file
    writeFile(np(fpath+"/"+fname+".8xv"),output)
    
if len(sys.argv)!=3: sys.exit(2)
infile,outfile = sys.argv[1:3]
if not os.path.isfile(infile): sys.exit(3)
ensuredir(os.path.split(outfile)[0])
print "Compressing "+os.path.split(outfile)[1]
cmpfile = "obj/cmpfile.bin"
delfile(cmpfile)
if not checkdel(cmpfile,True): raise IOError("Cannot clean temp compressed file.")
FNULL = open("NUL","w")
subprocess.call([np(cwd+"/tools/zx7.exe"),infile,cmpfile],stdout=FNULL)
if not checkdel(cmpfile,False):raise IOError("Temp compressed file inaccessible.")
export8xv(*os.path.split(outfile)+(readFile(cmpfile),))
