.MODEL SMALL
.STACK
.DATA
    TBAO1 DB 13,10,"NHAP SO THAP LUC PHAN: $"
    TBAO2 DB 13,10,"GIA TRI DAU TIEN CUA SO LA: $"
.CODE
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,TBAO1
    INT 21H
     
    XOR BX,BX          
    MOV AH, 1
    MOV CL,4         
    FOR1:
        INT 21H 
       
        CMP AL, 0DH   
        JE  END_FOR       
       
        CMP AL, 30H
        JB NHAPSAI
       
        CMP AL,'9'
        JBE NUM1
       
        CMP AL,'A'
        JB NHAPSAI
       
        CMP AL,'F'
        JBE LETTER1
       
        JMP NHAPSAI            
                           
        NUM1:
        SUB AL, 48    
        JMP SHIFT
              
        LETTER1:
            SUB AL, 37H
        SHIFT:
            SHL BX, 4
            OR BL, AL
            JMP LAP          
        LAP:
            LOOP FOR1
            JMP END_FOR 
        NHAPSAI:
            JMP KETTHUC    
        
    END_FOR:
    MOV AH,9
    LEA DX,TBAO2
    INT 21H

    MOV CX,1
    MOV AH,2 
    FOR:
            MOV DL,BH
            SHR DL,4
            
            CMP DL,10
            JB NUM2
            JAE LETTER2
            
            NUM2:
                ADD DL,48
                INT 21H
                JMP END_FOR1
                
            LETTER2:
                ADD DL,55
                INT 21H
                
            END_FOR1:
                ROL BX,4
                DEC CX
    JNZ FOR
    
    KETTHUC:
        MOV AH,4CH
        INT 21H
END