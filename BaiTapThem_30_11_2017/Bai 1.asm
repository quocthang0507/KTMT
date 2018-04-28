.MODEL SMALL
.STACK
.DATA
    TBAO1 DB 13,10,"HOM NAY LA NGAY $"
    TBAO2 DB " THANG $"
    TBAO3 DB " NAM $"
    TBAO4 DB " GIO $"
    TBAO5 DB " PHUT$"
    XUONGDONG DB 13,10,'$'
    
    XUAT_TBAO MACRO THONGBAO
        LEA DX,THONGBAO
        MOV AH,9
        INT 21H
    ENDM
.CODE
    MOV AX,@DATA
    MOV DS,AX
       
    XUAT_TBAO TBAO1
    
    MOV AH,2AH
    INT 21H
    
    POP AX
    XOR AX,AX
    PUSH CX
    PUSH DX
    
    XOR CX,CX
    POP CX    
    XOR BX,BX
    MOV BL,CL
    PUSH CX
    
    CALL OUTPUT
    
    XUAT_TBAO TBAO2
    
    POP CX
    XOR BX,BX
    MOV BL,CH
    
    CALL OUTPUT
    
    XUAT_TBAO TBAO3
    
    POP BX
    CALL OUTPUT
    
    XUAT_TBAO XUONGDONG
            
    MOV AH,2CH
    INT 21H
    PUSH CX
           
    POP CX
    XOR BX,BX
    MOV BL,CH
    PUSH CX
    CALL OUTPUT
    
    XUAT_TBAO TBAO4
    
    POP CX
    XOR BX,BX
    MOV BL,CL
    CALL OUTPUT
    
    XUAT_TBAO TBAO5     
    
    MOV AH,4CH
    INT 21H 
    OUTPUT PROC      
        CMP BX,0 
        JGE DOIRATHAPPHAN
        MOV DL,'-'
        MOV AH,2
        INT 21H
        NEG BX 
        DOIRATHAPPHAN:
            MOV AX,BX
            XOR CX,CX 
            MOV BX,10 
            CHIA:
                XOR DX,DX 
                DIV BX
                PUSH DX
                INC CX
                CMP AX,0  
                JNE CHIA   
                MOV AH,2
            DOI:
                POP DX
                OR DL,30H
                INT 21H
                LOOP DOI
        RET       
    OUTPUT ENDP
END