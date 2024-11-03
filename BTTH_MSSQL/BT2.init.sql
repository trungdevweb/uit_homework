CREATE DATABASE DB_QLGV;

USE DB_QLGV;

-- DROP DATABASE DB_QLGV;
-- USE master;
CREATE TABLE
    HOCVIEN (
        MAHV NVARCHAR (10) PRIMARY KEY,
        HO NVARCHAR (50),
        TEN NVARCHAR (50),
        NGSINH DATE,
        GIOITINH NVARCHAR (10),
        NOISINH NVARCHAR (100),
        MALOP NVARCHAR (10)
    );

CREATE TABLE
    LOP (
        MALOP NVARCHAR (10) PRIMARY KEY,
        TENLOP NVARCHAR (50),
        TRGLOP NVARCHAR (10),
        SISO INT,
        MAGVCN NVARCHAR (10)
    );

CREATE TABLE
    KHOA (
        MAKHOA NVARCHAR (10) PRIMARY KEY,
        TENKHOA NVARCHAR (50),
        NGTLAP DATE,
        TRGKHOA NVARCHAR (10)
    );

CREATE TABLE
    MONHOC (
        MAMH NVARCHAR (10) PRIMARY KEY,
        TENMH NVARCHAR (50),
        TCLT INT,
        TCTH INT,
        MAKHOA NVARCHAR (10)
    );

CREATE TABLE
    DIEUKIEN (
        MAMH NVARCHAR (10),
        MAMH_TRUOC NVARCHAR (10),
        PRIMARY KEY (MAMH, MAMH_TRUOC),
        FOREIGN KEY (MAMH) REFERENCES MONHOC (MAMH),
        FOREIGN KEY (MAMH_TRUOC) REFERENCES MONHOC (MAMH)
    );

CREATE TABLE
    GIAOVIEN (
        MAGV NVARCHAR (10) PRIMARY KEY,
        HOTEN NVARCHAR (50),
        HOCVI NVARCHAR (10),
        HOCHAM NVARCHAR (10),
        GIOITINH NVARCHAR (10),
        NGSINH DATE,
        NGVL DATE,
        HESO FLOAT,
        MUCLUONG INT,
        MAKHOA NVARCHAR (10),
        FOREIGN KEY (MAKHOA) REFERENCES KHOA (MAKHOA)
    );

CREATE TABLE
    GIANGDAY (
        MALOP NVARCHAR (10),
        MAMH NVARCHAR (10),
        MAGV NVARCHAR (10),
        HOCKY INT,
        NAM INT,
        TUNGAY DATE,
        DENNGAY DATE,
        PRIMARY KEY (MALOP, MAMH, MAGV, HOCKY, NAM),
        FOREIGN KEY (MALOP) REFERENCES LOP (MALOP),
        FOREIGN KEY (MAMH) REFERENCES MONHOC (MAMH),
        FOREIGN KEY (MAGV) REFERENCES GIAOVIEN (MAGV)
    );

CREATE TABLE
    KETQUATHI (
        MAHV NVARCHAR (10),
        MAMH NVARCHAR (10),
        LANTHI INT,
        NGTHI DATE,
        DIEM FLOAT,
        KQUA NVARCHAR (10),
        PRIMARY KEY (MAHV, MAMH, LANTHI),
        FOREIGN KEY (MAHV) REFERENCES HOCVIEN (MAHV),
        FOREIGN KEY (MAMH) REFERENCES MONHOC (MAMH)
    );

SET
    DATEFORMAT DMY;

-- NHAP DU LIEU HOCVIEN --
INSERT INTO
    HOCVIEN
VALUES
    (
        'K1101',
        'Nguyen Van',
        'A',
        '27/1/1986',
        'Nam',
        'TpHCM',
        'K11'
    );

INSERT INTO
    HOCVIEN
VALUES
    (
        'K1102',
        'Tran Ngoc',
        'Han',
        '14/3/1986',
        'Nu',
        'Kien Giang',
        'K11'
    );

INSERT INTO
    HOCVIEN
VALUES
    (
        'K1103',
        'Ha Duy',
        'Lap',
        '18/4/1986',
        'Nam',
        'Nghe An',
        'K11'
    );

INSERT INTO
    HOCVIEN
VALUES
    (
        'K1104',
        'Tran Ngoc',
        'Linh',
        '30/3/1986',
        'Nu',
        'Tay Ninh',
        'K11'
    );

INSERT INTO
    HOCVIEN
VALUES
    (
        'K1105',
        'Tran Minh',
        'Long',
        '27/2/1986',
        'Nam',
        'TpHCM',
        'K11'
    );

INSERT INTO
    HOCVIEN
VALUES
    (
        'K1106',
        'Le Nhat',
        'Minh',
        '24/1/1986',
        'Nam',
        'TpHCM',
        'K11'
    );

INSERT INTO
    HOCVIEN
VALUES
    (
        'K1107',
        'Nguyen Nhu',
        'Nhut',
        '27/1/1986',
        'Nam',
        'Ha Noi',
        'K11'
    );

INSERT INTO
    HOCVIEN
VALUES
    (
        'K1108',
        'Nguyen Manh',
        'Tam',
        '27/2/1986',
        'Nam',
        'Kien Giang',
        'K11'
    );

INSERT INTO
    HOCVIEN
VALUES
    (
        'K1109',
        'Phan Thi Thanh',
        'Tam',
        '27/1/1986',
        'Nu',
        'Vinh Long',
        'K11'
    );

INSERT INTO
    HOCVIEN
VALUES
    (
        'K1110',
        'Le Hoai',
        'Thuong',
        '5/2/1986',
        'Nu',
        'Can Tho',
        'K11'
    );

INSERT INTO
    HOCVIEN
VALUES
    (
        'K1111',
        'Le Ha',
        'Vinh',
        '25/12/1986',
        'Nam',
        'Vinh Long',
        'K11'
    );

INSERT INTO
    HOCVIEN
VALUES
    (
        'K1201',
        'Nguyen Van',
        'B',
        '11/2/1986',
        'Nam',
        'TpHCM',
        'K12'
    );

INSERT INTO
    HOCVIEN
VALUES
    (
        'K1202',
        'Nguyen Thi Kim',
        'Duyen',
        '18/1/1986',
        'Nu',
        'TpHCM',
        'K12'
    );

INSERT INTO
    HOCVIEN
VALUES
    (
        'K1203',
        'Tran Thi Kim',
        'Duyen',
        '17/9/1986',
        'Nu',
        'TpHCM',
        'K12'
    );

INSERT INTO
    HOCVIEN
VALUES
    (
        'K1204',
        'Truong My',
        'Hanh',
        '19/5/1986',
        'Nu',
        'Dong Nai',
        'K12'
    );

INSERT INTO
    HOCVIEN
VALUES
    (
        'K1205',
        'Nguyen Thanh',
        'Nam',
        '17/4/1986',
        'Nam',
        'TpHCM',
        'K12'
    );

INSERT INTO
    HOCVIEN
VALUES
    (
        'K1206',
        'Nguyen Thi Truc',
        'Thanh',
        '4/3/1986',
        'Nu',
        'Kien Giang',
        'K12'
    );

INSERT INTO
    HOCVIEN
VALUES
    (
        'K1207',
        'Tran Thi Bich',
        'Thuy',
        '8/2/1986',
        'Nu',
        'Nghe An',
        'K12'
    );

INSERT INTO
    HOCVIEN
VALUES
    (
        'K1208',
        'Huynh Thi Kim',
        'Trieu',
        '8/4/1986',
        'Nu',
        'Tay Ninh',
        'K12'
    );

INSERT INTO
    HOCVIEN
VALUES
    (
        'K1209',
        'Pham Thanh',
        'Trieu',
        '23/2/1986',
        'Nam',
        'TpHCM',
        'K12'
    );

INSERT INTO
    HOCVIEN
VALUES
    (
        'K1210',
        'Ngo Thanh',
        'Tuan',
        '14/2/1986',
        'Nam',
        'TpHCM',
        'K12'
    );

INSERT INTO
    HOCVIEN
VALUES
    (
        'K1211',
        'Do Thi',
        'Xuan',
        '9/3/1986',
        'Nu',
        'Ha Noi',
        'K12'
    );

INSERT INTO
    HOCVIEN
VALUES
    (
        'K1212',
        'Le Thi Phi',
        'Yen',
        '12/3/1986',
        'Nu',
        'TpHCM',
        'K12'
    );

INSERT INTO
    HOCVIEN
VALUES
    (
        'K1301',
        'Nguyen Thi Kim',
        'Cuc',
        '9/6/1986',
        'Nu',
        'Kien Giang',
        'K13'
    );

INSERT INTO
    HOCVIEN
VALUES
    (
        'K1302',
        'Truong Thi My',
        'Hien',
        '18/3/1986',
        'Nu',
        'Nghe An',
        'K13'
    );

INSERT INTO
    HOCVIEN
VALUES
    (
        'K1303',
        'Le Duc',
        'Hien',
        '21/3/1986',
        'Nam',
        'Tay Ninh',
        'K13'
    );

INSERT INTO
    HOCVIEN
VALUES
    (
        'K1304',
        'Le Quang',
        'Hien',
        '18/4/1986',
        'Nam',
        'TpHCM',
        'K13'
    );

INSERT INTO
    HOCVIEN
VALUES
    (
        'K1305',
        'Le Thi',
        'Huong',
        '27/3/1986',
        'Nu',
        'TpHCM',
        'K13'
    );

INSERT INTO
    HOCVIEN
VALUES
    (
        'K1306',
        'Nguyen Thai',
        'Huu',
        '30/3/1986',
        'Nam',
        'Ha Noi',
        'K13'
    );

INSERT INTO
    HOCVIEN
VALUES
    (
        'K1307',
        'Tran Minh',
        'Man',
        '28/5/1986',
        'Nam',
        'TpHCM',
        'K13'
    );

INSERT INTO
    HOCVIEN
VALUES
    (
        'K1308',
        'Nguyen Hieu',
        'Nghia',
        '8/4/1986',
        'Nam',
        'Kien Giang',
        'K13'
    );

INSERT INTO
    HOCVIEN
VALUES
    (
        'K1309',
        'Nguyen Trung',
        'Nghia',
        '18/1/1987',
        'Nam',
        'Nghe An',
        'K13'
    );

INSERT INTO
    HOCVIEN
VALUES
    (
        'K1310',
        'Tran Thi Hong',
        'Tham',
        '22/4/1986',
        'Nu',
        'Tay Ninh',
        'K13'
    );

INSERT INTO
    HOCVIEN
VALUES
    (
        'K1311',
        'Tran Minh',
        'Thuc',
        '4/4/1986',
        'Nam',
        'TpHCM',
        'K13'
    );

INSERT INTO
    HOCVIEN
VALUES
    (
        'K1312',
        'Nguyen Thi Kim',
        'Yen',
        '7/9/1986',
        'Nu',
        'TpHCM',
        'K13'
    );

SET
    DATEFORMAT DMY;

-- vo hieu hoa khoa ngoai ---
-- alter table hocvien nocheck constraint FK_HV_LOP
-- alter table hocvien check constraint FK_HV_LOP
-- NHAP DU LIEU LOP --
INSERT INTO
    LOP
VALUES
    ('K11', 'Lop 1 khoa 1', 'K1108', 11, 'GV07');

INSERT INTO
    LOP
VALUES
    ('K12', 'Lop 2 khoa 1', 'K1205', 12, 'GV09');

INSERT INTO
    LOP
VALUES
    ('K13', 'Lop 3 khoa 1', 'K1305', 12, 'GV14');

SET
    DATEFORMAT DMY;

-- NHAP DU LIEU KHOA --
INSERT INTO
    KHOA
VALUES
    ('KHMT', 'Khoa hoc may tinh', '7/6/2005', 'GV01');

INSERT INTO
    KHOA
VALUES
    ('HTTT', 'He thong thong tin', '7/6/2005', 'GV02');

INSERT INTO
    KHOA
VALUES
    ('CNPM', 'Cong nghe phan mem', '7/6/2005', 'GV04');

INSERT INTO
    KHOA
VALUES
    (
        'MTT',
        'Mang va truyen thong',
        '20/10/2005',
        'GV03'
    );

INSERT INTO
    KHOA
VALUES
    ('KTMT', 'Ky thuat may tinh', '20/12/2005', NULL);

SET
    DATEFORMAT DMY;

-- NHAP DU LIEU GIAOVIEN --
INSERT INTO
    GIAOVIEN
VALUES
    (
        'GV01',
        'Ho Thanh Son',
        'PTS',
        'GS',
        'Nam',
        '2/5/1950',
        '11/1/2004',
        5,
        2250000,
        'KHMT'
    );

INSERT INTO
    GIAOVIEN
VALUES
    (
        'GV02',
        'Tran Tam Thanh',
        'TS',
        'PGS',
        'Nam',
        '17/12/1965',
        '20/4/2004',
        4.5,
        2025000,
        'HTTT'
    );

INSERT INTO
    GIAOVIEN
VALUES
    (
        'GV03',
        'Do Nghiem Phung',
        'TS',
        'GS',
        'Nu',
        '1/8/1950',
        '23/9/2004',
        4,
        1800000,
        'CNPM'
    );

INSERT INTO
    GIAOVIEN
VALUES
    (
        'GV04',
        'Tran Nam Son',
        'TS',
        'PGS',
        'Nam',
        '22/2/1961',
        '12/1/2005',
        4.5,
        2025000,
        'KTMT'
    );

INSERT INTO
    GIAOVIEN
VALUES
    (
        'GV05',
        'Mai Thanh Danh',
        'ThS',
        'GV',
        'Nam',
        '12/3/1958',
        '12/1/2005',
        3,
        1350000,
        'HTTT'
    );

INSERT INTO
    GIAOVIEN
VALUES
    (
        'GV06',
        'Tran Doan Hung',
        'TS',
        'GV',
        'Nam',
        '11/3/1953',
        '12/1/2005',
        4.5,
        2025000,
        'KHMT'
    );

INSERT INTO
    GIAOVIEN
VALUES
    (
        'GV07',
        'Nguyen Minh Tien',
        'ThS',
        'GV',
        'Nam',
        '23/11/1971',
        '1/3/2005',
        4,
        1800000,
        'KHMT'
    );

INSERT INTO
    GIAOVIEN
VALUES
    (
        'GV08',
        'Le Thi Tran',
        'KS',
        NULL,
        'Nu',
        '26/3/1974',
        '1/3/2005',
        1.69,
        760500,
        'KHMT'
    );

INSERT INTO
    GIAOVIEN
VALUES
    (
        'GV09',
        'Nguyen To Lan',
        'ThS',
        'GV',
        'Nu',
        '31/12/1966',
        '1/3/2005',
        4,
        1800000,
        'HTTT'
    );

INSERT INTO
    GIAOVIEN
VALUES
    (
        'GV10',
        'Le Tran Anh Loan',
        'KS',
        NULL,
        'Nu',
        '17/7/1972',
        '1/3/2005',
        1.86,
        837000,
        'CNPM'
    );

INSERT INTO
    GIAOVIEN
VALUES
    (
        'GV11',
        'Ho Thanh Tung',
        'CN',
        'GV',
        'Nam',
        '12/1/1980',
        '15/5/2005',
        2.67,
        1201500,
        'MTT'
    );

INSERT INTO
    GIAOVIEN
VALUES
    (
        'GV12',
        'Tran Van Anh',
        'CN',
        NULL,
        'Nu',
        '29/3/1981',
        '15/5/2005',
        1.69,
        760500,
        'CNPM'
    );

INSERT INTO
    GIAOVIEN
VALUES
    (
        'GV13',
        'Nguyen Linh Dan',
        'CN',
        NULL,
        'Nu',
        '23/5/1980',
        '15/5/2005',
        1.69,
        760500,
        'KTMT'
    );

INSERT INTO
    GIAOVIEN
VALUES
    (
        'GV14',
        'Truong Minh Chau',
        'ThS',
        'GV',
        'Nu',
        '30/11/1976',
        '15/5/2005',
        3,
        1350000,
        'MTT'
    );

INSERT INTO
    GIAOVIEN
VALUES
    (
        'GV15',
        'Le Ha Thanh',
        'ThS',
        'GV',
        'Nam',
        '4/5/1978',
        '15/5/2005',
        3,
        1350000,
        'KHMT'
    );

SET
    DATEFORMAT DMY;

-- NHAP DU LIEU MONHOC --
INSERT INTO
    MONHOC
VALUES
    ('THDC', 'Tin hoc dai cuong', 4, 1, 'KHMT');

INSERT INTO
    MONHOC
VALUES
    ('CTRR', 'Cau truc roi rac', 5, 0, 'KHMT');

INSERT INTO
    MONHOC
VALUES
    ('CSDL', 'Co so du lieu', 3, 1, 'HTTT');

INSERT INTO
    MONHOC
VALUES
    (
        'CTDLGT',
        'Cau truc du lieu va giai thuat',
        3,
        1,
        'KHMT'
    );

INSERT INTO
    MONHOC
VALUES
    (
        'PTTKTT',
        'Phan tich thiet ke thuat toan',
        3,
        0,
        'KHMT'
    );

INSERT INTO
    MONHOC
VALUES
    ('DHMT', 'Do hoa may tinh', 3, 1, 'KHMT');

INSERT INTO
    MONHOC
VALUES
    ('KTMT', 'Kien truc may tinh', 3, 0, 'KTMT');

INSERT INTO
    MONHOC
VALUES
    ('TKCSDL', 'Thiet ke co so du lieu', 3, 1, 'HTTT');

INSERT INTO
    MONHOC
VALUES
    (
        'PTTKHTTT',
        'Phan tich thiet ke he thong thong tin',
        4,
        1,
        'HTTT'
    );

INSERT INTO
    MONHOC
VALUES
    ('HDH', 'He dieu hanh', 4, 0, 'KTMT');

INSERT INTO
    MONHOC
VALUES
    (
        'NMCNPM',
        'Nhap mon cong nghe phan mem',
        3,
        0,
        'CNPM'
    );

INSERT INTO
    MONHOC
VALUES
    ('LTCFW', 'Lap trinh C for win', 3, 1, 'CNPM');

INSERT INTO
    MONHOC
VALUES
    (
        'LTHDT',
        'Lap trinh huong doi tuong',
        3,
        1,
        'CNPM'
    );

SET
    DATEFORMAT DMY;

-- NHAP DU LIEU GIANGDAY --
INSERT INTO
    GIANGDAY
VALUES
    (
        'K11',
        'THDC',
        'GV07',
        1,
        2006,
        '2/1/2006',
        '12/5/2006'
    );

INSERT INTO
    GIANGDAY
VALUES
    (
        'K12',
        'THDC',
        'GV06',
        1,
        2006,
        '2/1/2006',
        '12/5/2006'
    );

INSERT INTO
    GIANGDAY
VALUES
    (
        'K13',
        'THDC',
        'GV15',
        1,
        2006,
        '2/1/2006',
        '12/5/2006'
    );

INSERT INTO
    GIANGDAY
VALUES
    (
        'K11',
        'CTRR',
        'GV02',
        1,
        2006,
        '9/1/2006',
        '17/5/2006'
    );

INSERT INTO
    GIANGDAY
VALUES
    (
        'K12',
        'CTRR',
        'GV02',
        1,
        2006,
        '9/1/2006',
        '17/5/2006'
    );

INSERT INTO
    GIANGDAY
VALUES
    (
        'K13',
        'CTRR',
        'GV08',
        1,
        2006,
        '9/1/2006',
        '17/5/2006'
    );

INSERT INTO
    GIANGDAY
VALUES
    (
        'K11',
        'CSDL',
        'GV05',
        2,
        2006,
        '1/6/2006',
        '15/7/2006'
    );

INSERT INTO
    GIANGDAY
VALUES
    (
        'K12',
        'CSDL',
        'GV09',
        2,
        2006,
        '1/6/2006',
        '15/7/2006'
    );

INSERT INTO
    GIANGDAY
VALUES
    (
        'K13',
        'CTDLGT',
        'GV15',
        2,
        2006,
        '1/6/2006',
        '15/7/2006'
    );

INSERT INTO
    GIANGDAY
VALUES
    (
        'K13',
        'CSDL',
        'GV05',
        3,
        2006,
        '1/8/2006',
        '15/12/2006'
    );

INSERT INTO
    GIANGDAY
VALUES
    (
        'K13',
        'DHMT',
        'GV07',
        3,
        2006,
        '1/8/2006',
        '15/12/2006'
    );

INSERT INTO
    GIANGDAY
VALUES
    (
        'K11',
        'CTDLGT',
        'GV15',
        3,
        2006,
        '1/8/2006',
        '15/12/2006'
    );

INSERT INTO
    GIANGDAY
VALUES
    (
        'K12',
        'CTDLGT',
        'GV15',
        3,
        2006,
        '1/8/2006',
        '15/12/2006'
    );

INSERT INTO
    GIANGDAY
VALUES
    (
        'K11',
        'HDH',
        'GV04',
        1,
        2007,
        '2/1/2007',
        '18/2/2007'
    );

INSERT INTO
    GIANGDAY
VALUES
    (
        'K12',
        'HDH',
        'GV04',
        1,
        2007,
        '2/1/2007',
        '20/3/2007'
    );

INSERT INTO
    GIANGDAY
VALUES
    (
        'K11',
        'DHMT',
        'GV07',
        1,
        2007,
        '18/2/2007',
        '20/3/2007'
    );

SET
    DATEFORMAT DMY;

-- NHAP DU LIEU DIEUKIEN --
INSERT INTO
    DIEUKIEN
VALUES
    ('CSDL', 'CTRR');

INSERT INTO
    DIEUKIEN
VALUES
    ('CSDL', 'CTDLGT');

INSERT INTO
    DIEUKIEN
VALUES
    ('CTDLGT', 'THDC');

INSERT INTO
    DIEUKIEN
VALUES
    ('PTTKTT', 'THDC');

INSERT INTO
    DIEUKIEN
VALUES
    ('PTTKTT', 'CTDLGT');

INSERT INTO
    DIEUKIEN
VALUES
    ('DHMT', 'THDC');

INSERT INTO
    DIEUKIEN
VALUES
    ('LTHDT', 'THDC');

INSERT INTO
    DIEUKIEN
VALUES
    ('PTTKHTTT', 'CSDL');

SET
    DATEFORMAT DMY;

-- NHAP DU LIEU KETQUATHI --
INSERT INTO
    KETQUATHI
VALUES
    ('K1101', 'CSDL', 1, '20/7/2006', 10, 'Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1101', 'CTDLGT', 1, '28/12/2006', 9, 'Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1101', 'THDC', 1, '20/5/2006', 9, 'Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1101', 'CTRR', 1, '13/5/2006', 9.5, 'Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1102', 'CSDL', 1, '20/7/2006', 4, 'Khong Dat');

INSERT INTO
    KETQUATHI
VALUES
    (
        'K1102',
        'CSDL',
        2,
        '27/7/2006',
        4.25,
        'Khong Dat'
    );

INSERT INTO
    KETQUATHI
VALUES
    ('K1102', 'CSDL', 3, '10/8/2006', 4.5, 'Khong Dat');

INSERT INTO
    KETQUATHI
VALUES
    (
        'K1102',
        'CTDLGT',
        1,
        '28/12/2006',
        4.5,
        'Khong Dat'
    );

INSERT INTO
    KETQUATHI
VALUES
    ('K1102', 'CTDLGT', 2, '5/1/2007', 4, 'Khong Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1102', 'CTDLGT', 3, '15/1/2007', 6, 'Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1102', 'THDC', 1, '20/5/2006', 5, 'Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1102', 'CTRR', 1, '13/5/2006', 7, 'Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1103', 'CSDL', 1, '20/7/2006', 3.5, 'Khong Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1103', 'CSDL', 2, '27/7/2006', 8.25, 'Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1103', 'CTDLGT', 1, '28/12/2006', 7, 'Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1103', 'THDC', 1, '20/5/2006', 8, 'Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1103', 'CTRR', 1, '13/5/2006', 6.5, 'Dat');

INSERT INTO
    KETQUATHI
VALUES
    (
        'K1104',
        'CSDL',
        1,
        '20/7/2006',
        3.75,
        'Khong Dat'
    );

INSERT INTO
    KETQUATHI
VALUES
    (
        'K1104',
        'CTDLGT',
        1,
        '28/12/2006',
        4,
        'Khong Dat'
    );

INSERT INTO
    KETQUATHI
VALUES
    ('K1104', 'THDC', 1, '20/5/2006', 4, 'Khong Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1104', 'CTRR', 1, '13/5/2006', 4, 'Khong Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1104', 'CTRR', 2, '20/5/2006', 3.5, 'Khong Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1104', 'CTRR', 3, '30/6/2006', 4, 'Khong Dat');

SET
    DATEFORMAT DMY;

INSERT INTO
    KETQUATHI
VALUES
    ('K1201', 'CSDL', 1, '20/7/2006', 6, 'Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1201', 'CTDLGT', 1, '28/12/2006', 5, 'Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1201', 'THDC', 1, '20/5/2006', 8.5, 'Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1201', 'CTRR', 1, '13/5/2006', 9, 'Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1202', 'CSDL', 1, '20/7/2006', 8, 'Dat');

INSERT INTO
    KETQUATHI
VALUES
    (
        'K1202',
        'CTDLGT',
        1,
        '28/12/2006',
        4,
        'Khong Dat'
    );

INSERT INTO
    KETQUATHI
VALUES
    ('K1202', 'CTDLGT', 2, '5/1/2007', 5, 'Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1202', 'THDC', 1, '20/5/2006', 4, 'Khong Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1202', 'THDC', 2, '27/5/2006', 4, 'Khong Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1202', 'CTRR', 1, '13/5/2006', 3, 'Khong Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1202', 'CTRR', 2, '20/5/2006', 4, 'Khong Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1202', 'CTRR', 3, '30/6/2006', 6.25, 'Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1203', 'CSDL', 1, '20/7/2006', 9.25, 'Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1203', 'CTDLGT', 1, '28/12/2006', 9.5, 'Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1203', 'THDC', 1, '20/5/2006', 10, 'Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1203', 'CTRR', 1, '13/5/2006', 10, 'Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1204', 'CSDL', 1, '20/7/2006', 8.5, 'Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1204', 'CTDLGT', 1, '28/12/2006', 6.75, 'Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1204', 'THDC', 1, '20/5/2006', 4, 'Khong Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1204', 'CTRR', 1, '13/5/2006', 6, 'Dat');

SET
    DATEFORMAT DMY;

INSERT INTO
    KETQUATHI
VALUES
    (
        'K1301',
        'CSDL',
        1,
        '20/12/2006',
        4.25,
        'Khong Dat'
    );

INSERT INTO
    KETQUATHI
VALUES
    ('K1301', 'CTDLGT', 1, '25/7/2006', 8, 'Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1301', 'THDC', 1, '20/5/2006', 7.75, 'Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1301', 'CTRR', 1, '13/5/2006', 8, 'Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1302', 'CSDL', 1, '20/12/2006', 6.75, 'Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1302', 'CTDLGT', 1, '25/7/2006', 5, 'Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1302', 'THDC', 1, '20/5/2006', 8, 'Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1302', 'CTRR', 1, '13/5/2006', 8.5, 'Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1303', 'CSDL', 1, '20/12/2006', 4, 'Khong Dat');

INSERT INTO
    KETQUATHI
VALUES
    (
        'K1303',
        'CTDLGT',
        1,
        '25/7/2006',
        4.5,
        'Khong Dat'
    );

INSERT INTO
    KETQUATHI
VALUES
    ('K1303', 'CTDLGT', 2, '7/8/2006', 4, 'Khong Dat');

INSERT INTO
    KETQUATHI
VALUES
    (
        'K1303',
        'CTDLGT',
        3,
        '15/8/2006',
        4.25,
        'Khong Dat'
    );

INSERT INTO
    KETQUATHI
VALUES
    ('K1303', 'THDC', 1, '20/5/2006', 4.5, 'Khong Dat');

INSERT INTO
    KETQUATHI
VALUES
    (
        'K1303',
        'CTRR',
        1,
        '13/5/2006',
        3.25,
        'Khong Dat'
    );

INSERT INTO
    KETQUATHI
VALUES
    ('K1303', 'CTRR', 2, '20/5/2006', 5, 'Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1304', 'CSDL', 1, '20/12/2006', 7.75, 'Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1304', 'CTDLGT', 1, '25/7/2006', 9.75, 'Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1304', 'THDC', 1, '20/5/2006', 5.5, 'Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1304', 'CTRR', 1, '13/5/2006', 5, 'Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1305', 'CSDL', 1, '20/12/2006', 9.25, 'Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1305', 'CTDLGT', 1, '25/7/2006', 10, 'Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1305', 'THDC', 1, '20/5/2006', 8, 'Dat');

INSERT INTO
    KETQUATHI
VALUES
    ('K1305', 'CTRR', 1, '13/5/2006', 10, 'Dat');

SET
    DATEFORMAT DMY;