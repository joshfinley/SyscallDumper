
from capstone import *

with open('../x64/Debug/ntdll.dll', 'rb') as fd:
    ntdll_bytes = fd.read()

md = Cs(CS_ARCH_X86, CS_MODE_64)
for i in md.disasm(ntdll_bytes, 0x1000):
    print("0x%x:\t%s\t%s" %(i.address, i.mnemonic, i.op_str))
