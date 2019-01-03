# MAIN -----------------------

	0x08048618 <+0>:	lea    ecx,[esp+0x4]
	0x0804861c <+4>:	and    esp,0xfffffff0
	0x0804861f <+7>:	push   DWORD PTR [ecx-0x4]
	0x08048622 <+10>:	push   ebp
	0x08048623 <+11>:	mov    ebp,esp
	0x08048625 <+13>:	push   ecx
	0x08048626 <+14>:	sub    esp,0x34
	0x08048629 <+17>:	mov    DWORD PTR [ebp-0x13],0x626d6f62
	0x08048630 <+24>:	mov    WORD PTR [ebp-0xf],0x6461
	0x08048636 <+30>:	mov    BYTE PTR [ebp-0xd],0x0
	0x0804863a <+34>:	mov    DWORD PTR [ebp-0x1d],0x732e2e2e
	0x08048641 <+41>:	mov    DWORD PTR [ebp-0x19],0x33726333
	0x08048648 <+48>:	mov    WORD PTR [ebp-0x15],0x74
	0x0804864e <+54>:	mov    DWORD PTR [ebp-0x24],0x6f6e3068
	0x08048655 <+61>:	mov    WORD PTR [ebp-0x20],0x3333
	0x0804865b <+67>:	mov    BYTE PTR [ebp-0x1e],0x0
	0x0804865f <+71>:	mov    DWORD PTR [ebp-0x2b],0x616b616b
	0x08048666 <+78>:	mov    WORD PTR [ebp-0x27],0x616b
	0x0804866c <+84>:	mov    BYTE PTR [ebp-0x25],0x0
	0x08048670 <+88>:	mov    DWORD PTR [ebp-0x35],0x2e32332a
	0x08048677 <+95>:	mov    DWORD PTR [ebp-0x31],0x785b2a32
	0x0804867e <+102>:	mov    WORD PTR [ebp-0x2d],0x5d
	0x08048684 <+108>:	sub    esp,0x8
	0x08048687 <+111>:	lea    eax,[ebp-0x2b]
	0x0804868a <+114>:	push   eax
	0x0804868b <+115>:	lea    eax,[ebp-0x24]
	0x0804868e <+118>:	push   eax
	0x0804868f <+119>:	call   0x80483d0 <strcmp@plt>
	0x08048694 <+124>:	add    esp,0x10
	0x08048697 <+127>:	test   eax,eax
	0x08048699 <+129>:	jne    0x80486a2 <main+138>
	0x0804869b <+131>:	mov    DWORD PTR [ebp-0xc],0x1
	0x080486a2 <+138>:	sub    esp,0xc
	0x080486a5 <+141>:	push   0x804877f
	0x080486aa <+146>:	call   0x80483e0 <printf@plt>
	0x080486af <+151>:	add    esp,0x10
	0x080486b2 <+154>:	call   0x804855b <do_stuff>
	0x080486b7 <+159>:	mov    eax,0x0
	0x080486bc <+164>:	mov    ecx,DWORD PTR [ebp-0x4]
	0x080486bf <+167>:	leave  
	0x080486c0 <+168>:	lea    esp,[ecx-0x4]
	0x080486c3 <+171>:	ret    

# do_stuff ---------------------------------------

	0x0804855b <+0>:	push   ebp
	0x0804855c <+1>:	mov    ebp,esp
	0x0804855e <+3>:	push   ebx
	0x0804855f <+4>:	sub    esp,0x114
	0x08048565 <+10>:	mov    DWORD PTR [ebp-0x113],0x706c6e73
	0x0804856f <+20>:	mov    DWORD PTR [ebp-0x10f],0x746e6972
	0x08048579 <+30>:	mov    WORD PTR [ebp-0x10b],0xa66
	0x08048582 <+39>:	mov    BYTE PTR [ebp-0x109],0x0
	0x08048589 <+46>:	mov    eax,ds:0x804a040
	0x0804858e <+51>:	sub    esp,0x4
	0x08048591 <+54>:	push   eax
	0x08048592 <+55>:	push   0x100
	0x08048597 <+60>:	lea    eax,[ebp-0x108]
	0x0804859d <+66>:	push   eax
	0x0804859e <+67>:	call   0x80483f0 <fgets@plt>
	0x080485a3 <+72>:	add    esp,0x10
	0x080485a6 <+75>:	sub    esp,0x8
	0x080485a9 <+78>:	lea    eax,[ebp-0x113]
	0x080485af <+84>:	push   eax
	0x080485b0 <+85>:	lea    eax,[ebp-0x108]
	0x080485b6 <+91>:	push   eax
>>>	0x080485b7 <+92>:	call   0x80483d0 <strcmp@plt>
	0x080485bc <+97>:	add    esp,0x10
	0x080485bf <+100>:	test   eax,eax
	0x080485c1 <+102>:	jne    0x80485fe <do_stuff+163>
	0x080485c3 <+104>:	sub    esp,0xc
	0x080485c6 <+107>:	push   0x8048750
	0x080485cb <+112>:	call   0x8048410 <puts@plt>
	0x080485d0 <+117>:	add    esp,0x10
	0x080485d3 <+120>:	call   0x8048400 <geteuid@plt>
	0x080485d8 <+125>:	mov    ebx,eax
	0x080485da <+127>:	call   0x8048400 <geteuid@plt>
	0x080485df <+132>:	sub    esp,0x8
	0x080485e2 <+135>:	push   ebx
	0x080485e3 <+136>:	push   eax
	0x080485e4 <+137>:	call   0x8048430 <setreuid@plt>
	0x080485e9 <+142>:	add    esp,0x10
	0x080485ec <+145>:	sub    esp,0xc
	0x080485ef <+148>:	push   0x8048764
	0x080485f4 <+153>:	call   0x8048420 <system@plt>
	0x080485f9 <+158>:	add    esp,0x10
	0x080485fc <+161>:	jmp    0x804860e <do_stuff+179>
	0x080485fe <+163>:	sub    esp,0xc
	0x08048601 <+166>:	push   0x804876c
	0x08048606 <+171>:	call   0x8048410 <puts@plt>
	0x0804860b <+176>:	add    esp,0x10
	0x0804860e <+179>:	mov    eax,0x0
	0x08048613 <+184>:	mov    ebx,DWORD PTR [ebp-0x4]
	0x08048616 <+187>:	leave  
	0x08048617 <+188>:	ret    
