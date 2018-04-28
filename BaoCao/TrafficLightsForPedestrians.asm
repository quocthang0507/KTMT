#start=Traffic_Lights.exe#

name "Traffic_Lights_for_Pedestrians"

start:
nop

;Đèn giao thông đang ở trạng thái Xanh - Đỏ - Xanh - Đỏ
mov ax, 030Ch       ;030Ch <=> 0000_0011_0000_1100b
out 4, ax

;Đèn dành cho người đi bộ sẽ ở trạng thái Đỏ - Xanh - Đỏ - Xanh
xor ax, ax
mov ax, 66h         ;66h <=> 0000_0000_0110_0110b
out 10, ax

;Chờ chuyển tín hiệu
mov     cx, 4Ch             ;Chuyển 2 bit cao vào thanh ghi CX
mov     dx, 4B40h           ;Chuyển 4 bit thấp vào thanh ghi DX
;Gọi hàm chờ BIOS với đầu vào là CX:DX (đơn vị micro giây)
mov     ah, 86h
int     15h

;Đèn giao thông đang ở trạng thái Đỏ - Xanh - Đỏ - Xanh
mov ax, 0861h        ;0861h <=> 0000_1000_0110_0001b
out 4, ax

;Đèn dành cho người đi bộ sẽ ở trạng thái Xanh - Đỏ - Xanh - Đỏ
xor ax, ax
mov ax, 99h         ;99h <=> 0000_0000_1001_1001b
out 10, ax

mov     cx, 4Ch             ;Chuyển 2 bit cao vào thanh ghi CX
mov     dx, 4B40h           ;Chuyển 4 bit thấp vào thanh ghi DX
;Gọi hàm chờ BIOS với đầu vào là CX:DX (đơn vị micro giây)
mov     ah, 86h
int     15h

;Quay lại từ đầu
jmp start
