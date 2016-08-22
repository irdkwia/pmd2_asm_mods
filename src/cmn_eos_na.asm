; For use with ARMIPS v0.7d
; By: psycommando@gmail.com
; 2016/08/18
; For Explorers of Sky North American ONLY!
; ------------------------------------------------------------------------------
; Copyright © 2016 Guillaume Lavoie-Drapeau <psycommando@gmail.com>
; This work is free. You can redistribute it and/or modify it under the
; terms of the Do What The Fuck You Want To Public License, Version 2,
; as published by Sam Hocevar. See http://www.wtfpl.net/ for more details.
; ------------------------------------------------------------------------------

; Overlays load offsets
.definelabel Overlay_0011_offset, 0x022DC240

; Known function offsets from the game's binaries:
.definelabel LoadFileFromRom, 0x2008C3C
.definelabel HandleSIR0,      0x201F4B4
.definelabel DebugPrint,      0x200C240

; Alloc
.definelabel MemAlloc,        0x2001170     ;(r0 = SzAlloc, r1 = Align?) Returns r0 = PtrAllocated
.definelabel MemFree,         0x2001188     ;(r0 = BufToFree)
.definelabel MemAlloc2,       0x2001390     ;(r0 = unknown, r1 = SzAlloc, r1 = Align?) Returns r0 = PtrAllocated

.definelabel MemZeroFill,     0x2003250     ;(r0 = PtrBuf, r1 = LengthBuffer)

; file streams
.definelabel FStreamUnk1,     0x2008168     ;(r0 = PtrFStreamStruct, r1 = PtrFPath) Is usually done first, before any reading is done. Unsure what its for.
.definelabel FStreamCtor,     0x2008204     ;(r0 = PtrFStreamStruct)  Zeroes the content of the struct
.definelabel FStreamFOpen,    0x2008210     ;(r0 = PtrFStreamStruct, r1 = PtrFPath) Open the file for reading
;.definelabel FStreamSeek,     0x20082A8     ;??
.definelabel FStreamRead,     0x2008254      ;(r0 = PtrFStreamStruct, r1 = PtrOutBuffer, r2 = BegOffset, r3 = EndOffset ) Read the ammount of bytes specified to the buffer, for the FStream object

; Macros:
.macro InitFileStream, filepathptr, targetstruct
  push  r0,r1
  ldr   r0,=filepathptr
  ldr   r1,=targetstruct
  bl    FStreamUnk1
  ;;;;;;;;;;;;;;;;;;;;;;;TODO;;;;;;;;;;;;;;

  pop   r0,r1
.endmacro