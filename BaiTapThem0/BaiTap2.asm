.model    small
.stack
.data
    TBao1    db    "Hay nhap mot ky tu: $"
    TBao2    db    0DH,0AH,"Ky tu da nhap: $"
    TBao3   db    0DH,0AH,"Ky tu truoc ky tu da nhap: $"
    TBao4   db    0DH,0AH,"Ky tu sau ky tu da nhap: $"
    KyTu    db    ?
.code
    ProgramStart:
        Mov ax,@data
        Mov ds,ax

        ;Xuat thong bao nhap mot ky tu
        Lea dx, TBao1
        Mov ah, 9            
        int 21h

        ;Nhap 1 ky tu
        Mov ah, 1        
        Int 21h
        Mov KyTu, al

        ;Xuat thong bao ket qua
        lea dx, TBao2
        mov ah, 9        
        int 21h

        ;Hien thi ky tu da nhap
        Mov ah, 2        
        Mov dl, KyTu
        Int 21h

        ;Hien thi ky tu truoc ky tu nhap
        lea dx, TBao3
        mov ah, 9        
        int 21h
        mov ah, 2        
        mov dl, KyTu
        dec dl	;Giam mot don vi
        int 21h

        ;Hien thi ky tu sau ky tu nhap
        lea dx, TBao4
        mov ah, 9        
        int 21h
        mov ah, 2        
        mov dl, KyTu
        inc dl	;Tang 1 don vi
        int 21h

        ;Tra quyen dieu hanh cho DOS
        mov ah, 4Ch
        int 21h
end