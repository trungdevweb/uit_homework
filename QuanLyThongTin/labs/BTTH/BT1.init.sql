CREATE DATABASE DB_QLBH;

USE DB_QLBH;

-- DROP DATABASE DB_QLBH;
-- USE master;
CREATE TABLE
    KHACHHANG (
        MAKH CHAR(4) PRIMARY KEY,
        HOTEN VARCHAR(40),
        DCHI VARCHAR(50),
        SODT VARCHAR(20),
        NGSINH smalldatetime,
        NGDK smalldatetime,
        DOANHSO money,
    );

CREATE TABLE
    NHANVIEN (
        MANV CHAR(4) PRIMARY KEY,
        HOTEN VARCHAR(40),
        SODT VARCHAR(20),
        NGVL smalldatetime,
    );

CREATE TABLE
    SANPHAM (
        MASP CHAR(4) PRIMARY KEY,
        TENSP VARCHAR(40),
        DVT VARCHAR(20),
        NUOCSX VARCHAR(40),
        GIA MONEY,
    );

CREATE TABLE
    HOADON (
        SOHD INT PRIMARY KEY,
        NGHD smalldatetime,
        MAKH CHAR(4) REFERENCES KHACHHANG (MAKH),
        MANV CHAR(4) REFERENCES NHANVIEN (MANV),
        TRIGIA money,
    );

CREATE TABLE
    CTHD (
        SOHD INT REFERENCES HOADON (SOHD),
        MASP CHAR(4) REFERENCES SANPHAM (MASP),
        SL INT,
        PRIMARY KEY (SOHD, MASP)
    );

SET
    DATEFORMAT DMY;

INSERT INTO
    NHANVIEN (MANV, HOTEN, SODT, NGVL)
VALUES
    (
        'NV01',
        'Nguyen Nhu Nhut',
        '0927345678',
        '13/4/2006'
    );

INSERT INTO
    NHANVIEN (MANV, HOTEN, SODT, NGVL)
VALUES
    (
        'NV02',
        'Le Thi Phi Yen',
        '0987567390',
        '21/4/2006'
    );

INSERT INTO
    NHANVIEN (MANV, HOTEN, SODT, NGVL)
VALUES
    ('NV03', 'Nguyen Van B', '0997047382', '27/4/2006');

INSERT INTO
    NHANVIEN (MANV, HOTEN, SODT, NGVL)
VALUES
    (
        'NV04',
        'Ngo Thanh Tuan',
        '0913758498',
        '24/6/2006'
    );

INSERT INTO
    NHANVIEN (MANV, HOTEN, SODT, NGVL)
VALUES
    (
        'NV05',
        'Nguyen Thi Truc Thanh',
        '0918590387',
        '20/7/2006'
    );

SET
    DATEFORMAT DMY;

INSERT INTO
    KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK)
VALUES
    (
        'KH01',
        'Nguyen Van A',
        '731, Tran Hung Dao, Q5, TPHCM',
        '08823451',
        '22/10/1960',
        13060000,
        '22/07/2006'
    );

INSERT INTO
    KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK)
VALUES
    (
        'KH02',
        'Tran Ngoc Han',
        '23/5 Nguyen Trai, Q5, TpHCM',
        '0908256478',
        '03/04/1974',
        280000,
        '30/07/2006'
    );

INSERT INTO
    KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK)
VALUES
    (
        'KH03',
        'Tran Ngoc Linh',
        '45 Nguyen Canh Chan, Q1, TpHCM',
        '0938776266',
        '12/06/1980',
        3860000,
        '05/08/2006'
    );

INSERT INTO
    KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK)
VALUES
    (
        'KH04',
        'Tran Minh Long',
        '50/34 Le Dai hanh, Q10, TpHCM',
        '0917325476',
        '09/03/1965',
        250000,
        '02/10/2006'
    );

INSERT INTO
    KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK)
VALUES
    (
        'KH05',
        'Le Nhat Minh',
        '34 Truong Dinh, Q3, TPHCM',
        '08246108',
        '10/03/1960',
        21000,
        '28/10/2006'
    );

INSERT INTO
    KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK)
VALUES
    (
        'KH06',
        'Le Hoai Thuong',
        '227 Nguyen Van Cu, Q5, TpHCM',
        '08631738',
        '31/12/1981',
        915000,
        '24/11/2006'
    );

INSERT INTO
    KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK)
VALUES
    (
        'KH07',
        'Nguyen Van Tam',
        '32/3 Tran Binh Trong, Q5, TpHCM',
        '0916783565',
        '06/04/1971',
        12500,
        '01/12/2006'
    );

INSERT INTO
    KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK)
VALUES
    (
        'KH08',
        'Phan Thi Thanh',
        '45/2 An Duong Vuong, Q5, TPHCM',
        '0938435756',
        '10/01/1971',
        365000,
        '13/12/2006'
    );

INSERT INTO
    KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK)
VALUES
    (
        'KH09',
        'Le Ha Vinh',
        '873 Le Hong Phong, Q5, TPHCM',
        '08654763',
        '03/09/1979',
        70000,
        '14/01/2007'
    );

INSERT INTO
    KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK)
VALUES
    (
        'KH10',
        'Ha Duy Lap',
        '34/34B Nguyen Trai, Q1, TPHCM',
        '08768904',
        '02/05/1963',
        67500,
        '16/01/2007'
    );

SET
    DATEFORMAT DMY;

INSERT INTO
    SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA)
VALUES
    ('BC01', 'But Chi', 'cay', 'Singapore', 3000);

INSERT INTO
    SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA)
VALUES
    ('BC02', 'But Chi', 'cay', 'Singapore', 5000);

INSERT INTO
    SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA)
VALUES
    ('BC03', 'But Chi', 'cay', 'Viet Nam', 3500);

INSERT INTO
    SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA)
VALUES
    ('BC04', 'But Chi', 'hop', 'Viet Nam', 30000);

INSERT INTO
    SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA)
VALUES
    ('BB01', 'But bi', 'cay', 'Viet Nam', 5000);

INSERT INTO
    SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA)
VALUES
    ('BB02', 'But bi', 'cay', 'Trung Quoc', 7000);

INSERT INTO
    SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA)
VALUES
    ('BB03', 'But bi', 'hop', 'Thai Lan', 100000);

INSERT INTO
    SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA)
VALUES
    (
        'TV01',
        'Tap 100 giay mong',
        'quyen',
        'Trung Quoc',
        2500
    );

INSERT INTO
    SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA)
VALUES
    (
        'TV02',
        'Tap 200 giay mong',
        'quyen',
        'Trung Quoc',
        4500
    );

INSERT INTO
    SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA)
VALUES
    (
        'TV03',
        'Tap 100 giay tot',
        'quyen',
        'Viet Nam',
        3000
    );

INSERT INTO
    SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA)
VALUES
    (
        'TV04',
        'Tap 200 giay tot',
        'quyen',
        'Viet Nam',
        5500
    );

INSERT INTO
    SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA)
VALUES
    (
        'TV05',
        'Tap 100 trang',
        'chuc',
        'Viet Nam',
        23000
    );

INSERT INTO
    SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA)
VALUES
    (
        'TV06',
        'Tap 200 trang',
        'chuc',
        'Viet Nam',
        53000
    );

INSERT INTO
    SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA)
VALUES
    (
        'TV07',
        'Tap 100 trang',
        'chuc',
        'Trung Quoc',
        34000
    );

INSERT INTO
    SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA)
VALUES
    (
        'ST01',
        'So tay 500 trang',
        'quyen',
        'Trung Quoc',
        40000
    );

INSERT INTO
    SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA)
VALUES
    (
        'ST02',
        'So tay loai 1',
        'quyen',
        'Viet Nam',
        55000
    );

INSERT INTO
    SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA)
VALUES
    (
        'ST03',
        'So tay loai 2',
        'quyen',
        'Viet Nam',
        51000
    );

INSERT INTO
    SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA)
VALUES
    ('ST04', 'So tay', 'quyen', 'Thai Lan', 55000);

INSERT INTO
    SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA)
VALUES
    ('ST05', 'So tay mong', 'quyen', 'Thai Lan', 20000);

INSERT INTO
    SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA)
VALUES
    ('ST06', 'Phan viet bang', 'hop', 'Viet Nam', 5000);

INSERT INTO
    SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA)
VALUES
    ('ST07', 'Phan khong bui', 'hop', 'Viet Nam', 5000);

INSERT INTO
    SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA)
VALUES
    ('ST08', 'Bong bang', 'cai', 'Viet Nam', 1000);

INSERT INTO
    SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA)
VALUES
    ('ST09', 'But long', 'cay', 'Viet Nam', 5000);

INSERT INTO
    SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA)
VALUES
    ('ST10', 'But long', 'cay', 'Trung Quoc', 7000);

SET
    DATEFORMAT DMY;

INSERT INTO
    HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA)
VALUES
    (1001, '23/07/2006', 'KH01', 'NV01', 320000);

INSERT INTO
    HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA)
VALUES
    (1002, '12/08/2006', 'KH01', 'NV02', 840000);

INSERT INTO
    HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA)
VALUES
    (1003, '23/06/2006', 'KH02', 'NV01', 100000);

INSERT INTO
    HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA)
VALUES
    (1004, '01/09/2006', 'KH02', 'NV01', 180000);

INSERT INTO
    HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA)
VALUES
    (1005, '20/10/2006', 'KH01', 'NV02', 3800000);

INSERT INTO
    HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA)
VALUES
    (1006, '16/10/2006', 'KH01', 'NV03', 2430000);

INSERT INTO
    HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA)
VALUES
    (1007, '28/10/2006', 'KH03', 'NV03', 510000);

INSERT INTO
    HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA)
VALUES
    (1008, '28/10/2006', 'KH01', 'NV03', 440000);

INSERT INTO
    HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA)
VALUES
    (1009, '28/10/2006', 'KH03', 'NV04', 320000);

INSERT INTO
    HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA)
VALUES
    (1010, '01/11/2006', 'KH01', 'NV01', 5200000);

INSERT INTO
    HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA)
VALUES
    (1011, '04/11/2006', 'KH04', 'NV03', 250000);

INSERT INTO
    HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA)
VALUES
    (1012, '30/11/2006', 'KH05', 'NV03', 21000);

INSERT INTO
    HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA)
VALUES
    (1013, '12/12/2006', 'KH06', 'NV01', 5000);

INSERT INTO
    HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA)
VALUES
    (1014, '31/12/2006', 'KH03', 'NV02', 3150000);

INSERT INTO
    HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA)
VALUES
    (1015, '01/01/2007', 'KH06', 'NV01', 910000);

INSERT INTO
    HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA)
VALUES
    (1016, '01/01/2007', 'KH07', 'NV02', 12500);

INSERT INTO
    HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA)
VALUES
    (1017, '02/01/2007', 'KH08', 'NV03', 35000);

INSERT INTO
    HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA)
VALUES
    (1018, '13/01/2007', 'KH08', 'NV03', 330000);

INSERT INTO
    HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA)
VALUES
    (1019, '13/01/2007', 'KH01', 'NV03', 30000);

INSERT INTO
    HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA)
VALUES
    (1020, '14/01/2007', 'KH09', 'NV04', 70000);

INSERT INTO
    HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA)
VALUES
    (1021, '16/01/2007', 'KH10', 'NV04', 67500);

INSERT INTO
    HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA)
VALUES
    (1022, '16/01/2007', NULL, 'NV03', 7000);

INSERT INTO
    HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA)
VALUES
    (1023, '17/01/2007', NULL, 'NV01', 330000);

SET
    DATEFORMAT DMY;

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1001, 'TV02', 10);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1001, 'ST01', 5);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1001, 'BC01', 5);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1001, 'BC02', 10);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1001, 'ST08', 10);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1002, 'BC04', 20);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1002, 'BB01', 20);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1002, 'BB02', 20);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1003, 'BB03', 10);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1004, 'TV01', 20);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1004, 'TV02', 10);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1004, 'TV03', 10);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1004, 'TV04', 10);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1005, 'TV05', 50);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1005, 'TV06', 50);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1006, 'TV07', 20);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1006, 'ST01', 30);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1006, 'ST02', 10);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1007, 'ST03', 10);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1008, 'ST04', 8);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1009, 'ST05', 10);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1010, 'TV07', 50);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1010, 'ST07', 50);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1010, 'ST08', 100);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1010, 'ST04', 50);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1010, 'TV03', 100);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1011, 'ST06', 50);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1012, 'ST07', 3);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1013, 'ST08', 5);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1014, 'BC02', 80);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1014, 'BB02', 100);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1014, 'BC04', 60);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1014, 'BB01', 50);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1015, 'BB02', 30);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1015, 'BB03', 7);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1016, 'TV01', 5);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1017, 'TV02', 1);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1017, 'TV03', 1);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1017, 'TV04', 5);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1018, 'ST04', 6);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1019, 'ST05', 1);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1019, 'ST06', 2);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1020, 'ST07', 10);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1021, 'ST08', 5);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1021, 'TV01', 7);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1021, 'TV02', 10);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1022, 'ST07', 1);

INSERT INTO
    CTHD (SOHD, MASP, SL)
VALUES
    (1023, 'ST04', 6);