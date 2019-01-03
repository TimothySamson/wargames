	0x0804852b <+0>:	lea    ecx,[esp+0x4]
	0x0804852f <+4>:	and    esp,0xfffffff0
	0x08048532 <+7>:	push   DWORD PTR [ecx-0x4]
	0x08048535 <+10>:	push   ebp
	0x08048536 <+11>:	mov    ebp,esp
	0x08048538 <+13>:	push   ebx
	0x08048539 <+14>:	push   ecx
	0x0804853a <+15>:	sub    esp,0x200
	0x08048540 <+21>:	mov    ebx,ecx
	0x08048542 <+23>:	cmp    DWORD PTR [ebx],0x1
0>	0x08048545 <+26>:	jg     0x8048577 <main+76>
	
	// If there is no first argument, then exit immediately
	;0x08048547 <+28>:	sub    esp,0xc
	;0x0804854a <+31>:	push   0x8048690
	;// Prints the header
	;0x0804854f <+36>:	call   0x80483c0 <puts@plt>
	;0x08048554 <+41>:	add    esp,0x10
	;0x08048557 <+44>:	mov    eax,DWORD PTR [ebx+0x4]
	;0x0804855a <+47>:	mov    eax,DWORD PTR [eax]
	;0x0804855c <+49>:	sub    esp,0x8
	;0x0804855f <+52>:	push   eax
	;0x08048560 <+53>:	push   0x80486a5
	;0x08048565 <+58>:	call   0x80483a0 <printf@plt>
	;0x0804856a <+63>:	add    esp,0x10
	;0x0804856d <+66>:	mov    eax,0xffffffff
	;0x08048572 <+71>:	jmp    0x80485fa <main+207>

>	0x08048577 <+76>:	mov    eax,DWORD PTR [ebx+0x4]
	0x0804857a <+79>:	add    eax,0x4 
	0x0804857d <+82>:	mov    eax,DWORD PTR [eax]
	0x0804857f <+84>:	sub    esp,0x8
	// First argument is 
	0x08048582 <+87>:	push   0x4 # Test if file is READ OK
	// EAX contains the first argument
	0x08048584 <+89>:	push   eax

	// Main thing is access. I got to make the output 0
	0x08048585 <+90>:	call   0x8048410 <access@plt>
	0x0804858a <+95>:	add    esp,0x10
	0x0804858d <+98>:	test   eax,eax
0>>	0x0804858f <+100>:	je     0x80485a8 <main+125>
	
	// Test arg1,arg2 will bitwise AND
	// test eax,eax will see if eax is zero. If not, then continue
	// If continue, then it will crash. Program wants eax to be zero
	// at 0x80483c0
	0x08048591 <+102>:	sub    esp,0xc
	// "You cant have that file..."
	0x08048594 <+105>:	push   0x80486b9
	0x08048599 <+110>:	call   0x80483c0 <puts@plt>
	0x0804859e <+115>:	add    esp,0x10
	0x080485a1 <+118>:	mov    eax,0x1
	0x080485a6 <+123>:	jmp    0x80485fa <main+207>
	
	// EBX+0x4 is where the cmd argument is
>>	0x080485a8 <+125>:	mov    eax,DWORD PTR [ebx+0x4]
	0x080485ab <+128>:	add    eax,0x4
	0x080485ae <+131>:	mov    eax,DWORD PTR [eax]
	// CMD argument
	0x080485b0 <+133>:	push   eax
	0x080485b1 <+134>:	push   0x80486d4 // Cat 
	0x080485b6 <+139>:	push   0x1ff // 511
	0x080485bb <+144>:	lea    eax,[ebp-0x208]
	0x080485c1 <+150>:	push   eax
	0x080485c2 <+151>:	call   0x8048400 <snprintf@plt>
	0x080485c7 <+156>:	add    esp,0x10
	0x080485ca <+159>:	call   0x80483b0 <geteuid@plt>
	0x080485cf <+164>:	mov    ebx,eax
	0x080485d1 <+166>:	call   0x80483b0 <geteuid@plt>
	0x080485d6 <+171>:	sub    esp,0x8
	0x080485d9 <+174>:	push   ebx
	0x080485da <+175>:	push   eax

	0x080485db <+176>:	call   0x80483e0 <setreuid@plt>
	0x080485e0 <+181>:	add    esp,0x10
	0x080485e3 <+184>:	sub    esp,0xc
	0x080485e6 <+187>:	lea    eax,[ebp-0x208]
	0x080485ec <+193>:	push   eax
	// System call to cat
	0x080485ed <+194>:	call   0x80483d0 <system@plt>
	0x080485f2 <+199>:	add    esp,0x10
	0x080485f5 <+202>:	mov    eax,0x0
	
	// DONE
	0x080485fa <+207>:	lea    esp,[ebp-0x8]
	0x080485fd <+210>:	pop    ecx
	0x080485fe <+211>:	pop    ebx
	0x080485ff <+212>:	pop    ebp
	0x08048600 <+213>:	lea    esp,[ecx-0x4]
	0x08048603 <+216>:	ret    
