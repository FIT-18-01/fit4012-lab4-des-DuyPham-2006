# Report 1 page - Lab 4 DES / TripleDES

## Mục tiêu

Triển khai DES encrypt/decrypt và TripleDES encrypt/decrypt theo yêu cầu của bài lab, hỗ trợ multi-block với zero padding, nhận input từ stdin.

## Cách làm / Method

Bổ sung hàm decrypt cho DES bằng cách sử dụng round keys đảo ngược. Thêm class TripleDES để thực hiện E(K3, D(K2, E(K1, P))) cho encrypt và ngược lại cho decrypt. Cập nhật main để đọc mode và data từ stdin, xử lý multi-block cho DES.

## Kết quả / Result

Chương trình biên dịch thành công, chạy được các mode. Test roundtrip, multi-block, tamper, wrong key đều pass. Ciphertext mẫu: 0111111010111111010001001001001100100011111110101111101011111000

## Kết luận / Conclusion

Học được cách triển khai DES và TripleDES, hạn chế của zero padding. Hướng mở rộng: sử dụng padding an toàn hơn như PKCS7, tích hợp với hệ thống lớn hơn.
