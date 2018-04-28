.model small
.stack
.data
    msg db "Please enter a char : $"
    msg1 db 13,10,"Char has just typed : $"
	char db ?
.code                    
    mov ax,@data
    mov ds,ax
        ;Xuat dong dau tien
    mov ah,09h
    mov dx,offset msg
    int 21h
        ;Nhap ky tu
    mov ah,1
    int 21h
    mov char,al
    int 21h
        ;Xuat dong ke tiep + ky tu vua nhap
    mov ah,09h
    lea dx,msg1
    int 21h   
    
    mov ah,2
    mov dl,char
    int 21h   
        ;Tra quyen dieu hanh
    mov ah,4Ch
    int 21h
end