.MODEL
.STACK
.DATA       
    TBAO1 DB 13,10,"NHAP SO THAP PHAN: $"
    TBAO2 DB 13,10,"SO THAP PHAN VUA NHAP: $"
.CODE       
        MOV AX, @DATA
        MOV DS, AX
                                  
        CALL INPUT                      
        CALL OUTPUT  
         
        MOV AH, 4CH
        INT 21H
     
    INPUT PROC         
        BATDAU:
            XOR CX,CX
            LEA DX,TBAO1
            MOV AH,9
            INT 21H
            ;NHAP 1 KY TU
            MOV AH, 1
            INT 21H
            ;SO SANH KY TU DO
            CMP AL, '-'
            JE DAUTRU
            CMP AL, '+'
            JE DAUCONG
            ;NEU KHONG NHAP DAU
            JMP TIEPTUC
             
            DAUTRU:
                MOV CX, 1
             
            DAUCONG:
                INT 21H
             
            TIEPTUC:
                ;SO SANH NEU NHO HON SO 0
                CMP AL, '0'
                JNGE KHONGPHAISO
                CMP AL, '9'
                ;SO SANH NEU LON HON SO 9
                JNLE KHONGPHAISO
                ;DOI KY SO THANH TRI
                AND AX, 000FH   
                PUSH AX
                ;TINH TONG=10*TONG+TRI         
                MOV AX, 10
                MUL BX          
                MOV BX, AX          
                POP AX
                ADD BX, AX   
                ;NHAP 1 KY TU   
                MOV AH, 1
                INT 21H 
                ;SO SANH VOI ENTER, NEU KHONG PHAI THI TIEP TUC LAP
                CMP AL, 13      
                JNE TIEPTUC     
                 
                MOV AX, BX
                ;KIEM TRA CX CO GIA TRI (1 NEU AM)       
                OR CX, CX        
                JE TRAVE
                NEG AX           
                 
                TRAVE:                
                    RET
                KHONGPHAISO:
                    JMP BATDAU               
    INPUT ENDP 
     
    OUTPUT PROC
        ;AX LUC NAY DANG GIU GIA TRI (NEU LA AM) NEN GUI VAO STACK
        PUSH AX
        LEA DX,TBAO2
        MOV AH,9
        INT 21H
        ;LAY LAI GIA TRI CHO AX
        POP AX       
        ;SO SANH TONG VOI SO 0 
        CMP AX, 0 
        JGE DOIRATHAPPHAN
        ;NEU NHO HON 0
        PUSH AX
        MOV DL, '-'
        MOV AH, 2
        INT 21H
        POP AX
        NEG AX 
        ;LAP CHIA CHO 10 
        DOIRATHAPPHAN:
            XOR CX, CX 
            MOV BX, 10 
            CHIA:
                XOR DX, DX 
                DIV BX
                ;SO DU CHO VAO NGAN XEP     
                PUSH DX
                INC CX
                ;LAP CHO DEN KHI THUONG BANG 0
                CMP AX, 0  
                JNE CHIA   
                MOV AH, 2
            DOI:
                ;DOI SO THAP PHAN -> KY SO
                POP DX
                OR DL, 30H
                INT 21H
                LOOP DOI
        RET       
    OUTPUT ENDP
END