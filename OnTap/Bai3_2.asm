.MODEL SMALL
.STACK
.DATA
    TBAO1 DB "NHAP SO DAU TIEN : $"
    TBAO2 DB 13,10,"NHAP SO TIEP THEO : $"
    TBAO DB 13,10,"TONG : $"
.CODE
    INCLUDE "emu8086.inc" 
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,TBAO1
    INT 21H
    
    POP AX
    
    CALL SCAN_NUM
    PUSH CX
    
    MOV AH,9
    LEA DX,TBAO2
    INT 21H
    
    CALL SCAN_NUM
    PUSH CX
    
    XOR AX,AX
    XOR BX,BX       
    POP AX
    POP BX
    ADD AX,BX
    PUSH AX
    
    LEA DX,TBAO
    MOV AH,9
    INT 21H
    
    POP AX    
    CALL PRINT_NUM
           
    MOV AH,4CH
    INT 21H 
    
    DEFINE_SCAN_NUM   
    DEFINE_PRINT_NUM
    DEFINE_PRINT_NUM_UNS
END