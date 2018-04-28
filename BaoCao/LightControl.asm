.MODEL SMALL
.STACK
.DATA
    MESSAGE         dw      13, 10, "Nhap so thu tu chuc nang : $"
    ;Cài đặt trạng thái BẬT của mỗi đèn
    ;Vị trí các bit         7654_3210
    all_on          equ     0000_1111b
    first_light     equ     0000_0001b
    second_light    equ     0000_0010b
    third_light     equ     0000_0100b
    fourth_light    equ     0000_1000b
    
    OUTPUT_MESSAGE  MACRO   INPUT
        MOV AH,  9
        LEA DX, INPUT
        INT 21H
    ENDM

.CODE
    MOV AX, @DATA
    MOV DS, AX
    
    MAIN:
        #start=Traffic_Lights.exe#
        
        OUTPUT_MESSAGE MESSAGE 
        
        MOV AH, 1
        INT 21H
        
        ;Nếu ký tự nhập vào nhỏ hơn 0 hoặc lớn hơn 5 thì đó là nhập sai
        CMP AL, '0'
        JB ERROR
        
        CMP AL, '5'
        JA ERROR
        
        ;Ngược lại thì thực hiện chức năng đó
        CMP AL,'0'
        JE TURN_OFF_ALL
        
        CMP AL, '1'
        JE FIRST
        
        CMP AL, '2'
        JE SECOND
        
        CMP AL, '3'
        JE THIRD
        
        CMP AL, '4'        
        JE FOURTH 
        
        JMP TURN_ON_ALL
        ;Phải dùng tạm thanh ghi BX rồi mới chuyển vào AX là vì
        ;Khi lặp lại, giá trị thanh ghi AX bị thay đổi do dùng hàm 1 ngắt 21h
        ;Không còn mang giá trị cũ (Đèn nào Bật, Đèn nào Tắt) nữa
        ;Như vậy, BX sẽ giữ chức năng lưu trạng thái của các đèn
        TURN_OFF_ALL:
            XOR BX, BX
            JMP _LOOP
        TURN_ON_ALL:
            MOV BX, all_on
            JMP _LOOP        
        FIRST:
            XOR BX, first_light
            JMP _LOOP
        SECOND:   
            XOR BX, second_light
            JMP _LOOP
        THIRD:        
            XOR BX, third_light
            JMP _LOOP
        FOURTH:
            XOR BX, fourth_light
    _LOOP:
        MOV AX, BX
        OUT 4, AX
        ERROR:    
            JMP MAIN    
END