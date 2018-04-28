.MODEL SMALL
.STACK
.DATA
    TBAO1 DB 13,10,"NHAP MOT KY TU : $"
    TBAO2 DB 13,10,"MA THAP LUC PHAN TUONG UNG : $"
.CODE 
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,TBAO1
    MOV AH,9
    INT 21H  
    
    MOV AH,1
    INT 21H 
    
    MOV BL,AL
    
    LEA DX,TBAO2
    MOV AH,9
    INT 21H 
    
    MOV CX,4         
    MOV AH,2           
  LAP:       
    MOV DL,BH
    SHR DL,4
         
    CMP DL,10
    JB NUM
    JAE LETTER
        
    NUM:
    ADD DL,48
    INT 21H
    JMP END
        
    LETTER:
    ADD DL,55
    INT 21H 
        
    END:
    ROL BX,4 
  LOOP LAP  
         
    MOV AH,4CH
    INT 21H    
END