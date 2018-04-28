.MODEL
.STACK 100H
.DATA       
    TBAO1 DB 13,10,"NHAP SO THU NHAT: $"
    TBAO2 DB 13,10,"NHAP SO THU HAI: $"
    TBAO DB 13,10,"TONG: $"   
    SO1 DB ?
    SO2 DB ?
.CODE       
        MOV AX,@DATA
        MOV DS,AX
                                  
        LEA DX,TBAO1
        MOV AH,9
        INT 21H 
        
        POP AX                      
        
        CALL INPUT
        PUSH BX
     
        LEA DX,TBAO2
        MOV AH,9
        INT 21H
        
        CALL INPUT                      
        PUSH BX
        
        POP AX
        POP BX
        ADD BX,AX
        
        CALL OUTPUT  
         
        MOV AH,4CH
        INT 21H
     
    INPUT PROC         
        BATDAU:
            XOR BX,BX
            XOR CX,CX
            ;NHAP 1 KY TU
            MOV AH,1
            INT 21H
            ;SO SANH KY TU DO
            CMP AL,'-'
            JE DAUTRU
            CMP AL,'+'
            JE DAUCONG
            ;NEU KHONG NHAP DAU
            JMP TIEPTUC
             
            DAUTRU:
                MOV CX,1
             
            DAUCONG:
                INT 21H
             
            TIEPTUC:
                ;SO SANH NEU NHO HON SO 0
                CMP AL,'0'
                JNGE KHONGPHAISO
                CMP AL,'9'
                ;SO SANH NEU LON HON SO 9
                JNLE KHONGPHAISO
                ;DOI KY SO THANH TRI
                AND AX,000FH   
                PUSH AX
                ;TINH TONG=10*TONG+TRI         
                MOV AX,10
                MUL BX          
                MOV BX,AX          
                POP AX
                ADD BX,AX   
                ;NHAP 1 KY TU   
                MOV AH,1
                INT 21H 
                ;SO SANH VOI ENTER,NEU KHONG PHAI THI TIEP TUC LAP
                CMP AL,13      
                JNE TIEPTUC     

                ;KIEM TRA CX CO GIA TRI (1 NEU AM)       
                CMP CX,1
                JNE TRAVE
                NEG BX           
                 
                TRAVE:                
                    RET
                KHONGPHAISO:
                    JMP BATDAU               
    INPUT ENDP 
     
    OUTPUT PROC
        PUSH BX
        LEA DX,TBAO
        MOV AH,9
        INT 21H
        ;LAY LAI GIA TRI CHO BX
        POP BX       
        ;SO SANH TONG VOI SO 0 
        CMP BX,0 
        JGE DOIRATHAPPHAN
        ;NEU NHO HON 0
        MOV DL,'-'
        MOV AH,2
        INT 21H
        NEG BX 
        ;LAP CHIA CHO 10 
        DOIRATHAPPHAN:
            MOV AX,BX
            XOR CX,CX 
            MOV BX,10 
            CHIA:
                XOR DX,DX 
                DIV BX
                ;SO DU CHO VAO NGAN XEP     
                PUSH DX
                INC CX
                ;LAP CHO DEN KHI THUONG BANG 0
                CMP AX,0  
                JNE CHIA   
                MOV AH,2
            DOI:
                ;DOI SO THAP PHAN -> KY SO
                POP DX
                OR DL,30H
                INT 21H
                LOOP DOI
        RET       
    OUTPUT ENDP
END
