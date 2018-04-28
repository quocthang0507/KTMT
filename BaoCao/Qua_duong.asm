; controlling external device with 8086 microprocessor.
; realistic test for c:\emu8086\devices\Traffic_Lights.exe

#start=Traffic_Lights.exe#

name "traffic"


next:
    mov ax, situation
    out 4, ax
    
    mov ah, 1
    int 21h
    
    cmp al,0Dh
    je red
    
    jmp next
    
    red:
        mov ax, situation >>2
        out 4, ax
        
        mov ah, 1
        int 21h
        
        cmp al, 0Dh
        jne next
    green:
        mov ax, situation <<2
        out 4, ax
               
    jmp next 

;                             FEDC_BA98_7654_3210
    situation        equ      0000_0001_0000_0100b
