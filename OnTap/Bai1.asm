.MODEL SMALL
.STACK
.DATA
    TBAO DB "NHAP VAO 1 KY TU CHU : $"
    LOI DB "KHONG PHAI LA CHU!$"
    KETQUA DB 13,10,"KET QUA : $"
    KYTU DB ?
.CODE
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,TBAO
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV KYTU,AL
               
    MOV AH,9
    LEA DX,KETQUA
    INT 21H 
    
    XOR AX,AX
    MOV AL,KYTU
    CMP AL,'A'    
    JB KHONGPHAICHU
    CMP AL,'Z'
    JBE CHUHOA
    CMP AL,'a'
    JB KHONGPHAICHU
    CMP AL,'z'
    JBE CHUTHUONG 
    JMP KHONGPHAICHU
    
    CHUHOA:
        ADD AL,32 
        JMP XUATCHU
    
    CHUTHUONG:
        SUB AL,32
     
    XUATCHU:
        XOR CX,CX
        MOV CL,AL   
        MOV AH,2
        MOV DL,CL
        INT 21H
        JMP KETTHUC
        
    KHONGPHAICHU:
        LEA DX,LOI
        MOV AH,9
        INT 21H 
           
    KETTHUC:
        MOV AH,4CH
        INT 21H 
END