.MODEL SMALL
.STACK
.DATA
    TBAO1 DB 13,10,"NHAP MOT KY TU: $"
    TBAO2 DB 13,10,"NAM KY TU KE TIEP: $"
    KYTU DB ?
    NL DB 13,10,'$'
.CODE
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,TBAO1    
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV KYTU,AL 
     
    MOV AH,9
    LEA DX,TBAO2    
    INT 21H
    
    MOV CX,5
    
  VONGLAP:
    MOV AH,2
    INC KYTU
    MOV DL,KYTU
    INT 21H
    DEC CX
    
    MOV AH,9
    LEA DX,NL
    INT 21H
  JNZ VONGLAP
   
    MOV AH,4CH
    INT 21H
END