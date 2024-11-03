-- I. Ngôn ngữ định nghĩa dữ liệu (Data Definition Language):
-- 1.	Tạo quan hệ và khai báo tất cả các ràng buộc khóa chính, khóa ngoại. Thêm vào 3 thuộc tính GHICHU, DIEMTB, XEPLOAI cho quan hệ HOCVIEN.
-- 2.	Mã học viên là một chuỗi 5 ký tự, 3 ký tự đầu là mã lớp, 2 ký tự cuối cùng là số thứ tự học viên trong lớp. VD: “K1101”
-- 3.	Thuộc tính GIOITINH chỉ có giá trị là “Nam” hoặc “Nu”.
-- 4.	Điểm số của một lần thi có giá trị từ 0 đến 10 và cần lưu đến 2 số lẽ (VD: 6.22).
-- 5.	Kết quả thi là “Dat” nếu điểm từ 5 đến 10  và “Khong dat” nếu điểm nhỏ hơn 5.
-- 6.	Học viên thi một môn tối đa 3 lần.
-- 7.	Học kỳ chỉ có giá trị từ 1 đến 3.
-- 8.	Học vị của giáo viên chỉ có thể là “CN”, “KS”, “Ths”, ”TS”, ”PTS”.
-- 9.	Lớp trưởng của một lớp phải là học viên của lớp đó.
-- 10.	Trưởng khoa phải là giáo viên thuộc khoa và có học vị “TS” hoặc “PTS”.
-- 11.	Học viên ít nhất là 18 tuổi.
-- 12.	Giảng dạy một môn học ngày bắt đầu (TUNGAY) phải nhỏ hơn ngày kết thúc (DENNGAY).
-- 13.	Giáo viên khi vào làm ít nhất là 22 tuổi.
-- 14.	Tất cả các môn học đều có số tín chỉ lý thuyết và tín chỉ thực hành chênh lệch nhau không quá 3.
-- 15.	Học viên chỉ được thi một môn học nào đó khi lớp của học viên đã học xong môn học này.
-- 16.	Mỗi học kỳ của một năm học, một lớp chỉ được học tối đa 3 môn.
-- 17.	Sỉ số của một lớp bằng với số lượng học viên thuộc lớp đó.
-- 18.	Trong quan hệ DIEUKIEN giá trị của thuộc tính MAMH và MAMH_TRUOC trong cùng một bộ không được giống nhau (“A”,”A”) và cũng không tồn tại hai bộ (“A”,”B”) và (“B”,”A”).
-- 19.	Các giáo viên có cùng học vị, học hàm, hệ số lương thì mức lương bằng nhau.
-- 20.	Học viên chỉ được thi lại (lần thi >1) khi điểm của lần thi trước đó dưới 5.
-- 21.	Ngày thi của lần thi sau phải lớn hơn ngày thi của lần thi trước (cùng học viên, cùng môn học).
-- 22.	Học viên chỉ được thi những môn mà lớp của học viên đó đã học xong.
-- 23.	Khi phân công giảng dạy một môn học, phải xét đến thứ tự trước sau giữa các môn học (sau khi học xong những môn học phải học trước mới được học những môn liền sau).
-- 24.	Giáo viên chỉ được phân công dạy những môn thuộc khoa giáo viên đó phụ trách.

CREATE TABLE
    KHOA (
        MAKHOA CHAR(3) PRIMARY KEY,
        TENKHOA NVARCHAR (50) NOT NULL,
        NGTLAP DATE NOT NULL,
        TRGKHOA CHAR(5) NULL,
    );

CREATE TABLE
    GIAOVIEN (
        MAGV CHAR(5) PRIMARY KEY,
        HOTEN NVARCHAR (50) NOT NULL,
        HOCVI VARCHAR(3) CHECK (HOCVI IN ('CN', 'KS', 'Ths', 'TS', 'PTS')),
        HOCHAM NVARCHAR (10) NULL,
        GIOITINH VARCHAR(3) CHECK (GIOITINH IN ('Nam', 'Nu')),
        NGSINH DATE CHECK (DATEDIFF (YEAR, NGSINH, GETDATE ()) >= 22),
        NGVL DATE NOT NULL,
        HESO FLOAT CHECK (HESO >= 0),
        MUCLUONG DECIMAL(10, 2),
        MAKHOA CHAR(3),
    );

ALTER TABLE KHOA ADD CONSTRAINT FK_KHOA_GIAOVIEN FOREIGN KEY (TRGKHOA) REFERENCES GIAOVIEN (MAGV);

ALTER TABLE GIAOVIEN ADD CONSTRAINT FK_GIAOVIEN_KHOA FOREIGN KEY (MAKHOA) REFERENCES KHOA (MAKHOA);

CREATE TABLE
    LOP (
        MALOP CHAR(3) PRIMARY KEY,
        TENLOP NVARCHAR (50) NOT NULL,
        TRGLOP CHAR(5) NULL,
        SISO INT,
        MAGVCN CHAR(5) NULL,
        FOREIGN KEY (MAGVCN) REFERENCES GIAOVIEN (MAGV)
    );

CREATE TABLE
    HOCVIEN (
        MAHV CHAR(5) PRIMARY KEY CHECK (MAHV LIKE '[A-Z][A-Z][A-Z][0-9][0-9]'),
        HO NVARCHAR (20),
        TEN NVARCHAR (10),
        NGSINH DATE CHECK (DATEDIFF (YEAR, NGSINH, GETDATE ()) >= 18),
        GIOITINH VARCHAR(3) CHECK (GIOITINH IN ('Nam', 'Nu')),
        NOISINH NVARCHAR (50),
        MALOP CHAR(3) NOT NULL,
        GHICHU NVARCHAR (255),
        DIEMTB FLOAT,
        XEPLOAI CHAR(2),
    );

ALTER TABLE LOP ADD CONSTRAINT FK_LOP_HOCVIEN FOREIGN KEY (TRGLOP) REFERENCES HOCVIEN (MAHV);

ALTER TABLE HOCVIEN ADD CONSTRAINT FK_HOCVIEN_LOP FOREIGN KEY (MALOP) REFERENCES LOP (MALOP);

CREATE TABLE
    MONHOC (
        MAMH CHAR(5) PRIMARY KEY,
        TENMH NVARCHAR (50) NOT NULL,
        TCLT INT CHECK (TCLT >= 0),
        TCTH INT CHECK (TCTH >= 0),
        MAKHOA CHAR(3) NOT NULL FOREIGN KEY (MAKHOA) REFERENCES KHOA (MAKHOA),
    );

CREATE TABLE
    DIEUKIEN (
        MAMH CHAR(5),
        MAMH_TRUOC CHAR(5),
        PRIMARY KEY (MAMH, MAMH_TRUOC),
        CHECK (MAMH <> MAMH_TRUOC),
        FOREIGN KEY (MAMH) REFERENCES MONHOC (MAMH),
        FOREIGN KEY (MAMH_TRUOC) REFERENCES MONHOC (MAMH),
        UNIQUE (MAMH, MAMH_TRUOC),
    );

CREATE TABLE
    GIANGDAY (
        MALOP CHAR(3),
        MAMH CHAR(5),
        MAGV CHAR(5),
        HOCKY INT CHECK (HOCKY BETWEEN 1 AND 3),
        NAM INT,
        TUNGAY DATE,
        DENNGAY DATE,
        CHECK (DENNGAY > TUNGAY),
        PRIMARY KEY (MALOP, MAMH, MAGV, HOCKY, NAM),
        FOREIGN KEY (MALOP) REFERENCES LOP (MALOP),
        FOREIGN KEY (MAMH) REFERENCES MONHOC (MAMH),
        FOREIGN KEY (MAGV) REFERENCES GIAOVIEN (MAGV)
    );

CREATE TABLE
    KETQUATHI (
        MAHV CHAR(5),
        MAMH CHAR(5),
        LANTHI INT CHECK (LANTHI BETWEEN 1 AND 3),
        NGTHI DATE,
        DIEM DECIMAL(4, 2) CHECK (DIEM BETWEEN 0 AND 10),
        KQUA AS (
            CASE
                WHEN DIEM >= 5 THEN 'Dat'
                ELSE 'Khong dat'
            END
        ),
        GHICHU NVARCHAR (255),
        PRIMARY KEY (MAHV, MAMH, LANTHI),
        FOREIGN KEY (MAHV) REFERENCES HOCVIEN (MAHV),
        FOREIGN KEY (MAMH) REFERENCES MONHOC (MAMH),
        CHECK (
            LANTHI > 1
            AND DIEM < 5
        ),
    );

-- Trigger để cập nhật SISO của lớp
CREATE TRIGGER trg_UpdateSISO
ON HOCVIEN
AFTER INSERT, DELETE
AS
BEGIN
    DECLARE @MALOP CHAR(3);
    SELECT @MALOP = MALOP FROM INSERTED;
    UPDATE LOP
    SET SISO = (SELECT COUNT(*) FROM HOCVIEN WHERE MALOP = @MALOP)
    WHERE MALOP = @MALOP;
END;

-- Trigger để kiểm tra thứ tự thi của học viên
CREATE TRIGGER trg_CheckThuTuThi
ON KETQUATHI
AFTER INSERT
AS
BEGIN
    DECLARE @MAHV CHAR(5), @MAMH CHAR(5), @NGTHI DATE, @LANTHI INT;
    SELECT @MAHV = MAHV, @MAMH = MAMH, @NGTHI = NGTHI, @LANTHI = LANTHI FROM INSERTED;
    IF EXISTS (
        SELECT 1 FROM KETQUATHI
        WHERE MAHV = @MAHV AND MAMH = @MAMH AND LANTHI < @LANTHI AND NGTHI >= @NGTHI
    )
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR('Ngày thi của lần thi sau phải lớn hơn lần thi trước', 16, 1);
    END
END;

-- Trigger kiểm tra điểm thi lần cuối của học viên trong bảng KETQUATHI
CREATE TRIGGER trg_KETQUATHI_LanThi
ON KETQUATHI
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM KETQUATHI K
        JOIN (
            SELECT MAHV, MAMH, MAX(LANTHI) AS MaxLanThi
            FROM KETQUATHI
            GROUP BY MAHV, MAMH
        ) AS LastExam ON K.MAHV = LastExam.MAHV AND K.MAMH = LastExam.MAMH
        WHERE K.LANTHI < LastExam.MaxLanThi
    )
    BEGIN
        ROLLBACK;
        THROW 50001, 'Lần thi phải là lần cao nhất cho mỗi môn học.', 1;
    END
END;

-- Trigger kiểm tra điều kiện môn học trước-sau trong bảng DIEUKIEN
CREATE TRIGGER trg_DIEUKIEN_DieuKien
ON DIEUKIEN
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM DIEUKIEN D1
        JOIN DIEUKIEN D2 ON D1.MAMH = D2.MAMH_TRUOC AND D1.MAMH_TRUOC = D2.MAMH
    )
    BEGIN
        ROLLBACK;
        THROW 50002, 'Không được phép có cặp môn học trước-sau bị ngược chiều.', 1;
    END
END;

-- Trigger kiểm tra điều kiện "Trưởng khoa phải là giáo viên thuộc khoa và có học vị 'TS' hoặc 'PTS'"
CREATE TRIGGER trg_KHOA_TruongKhoa
ON KHOA
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM KHOA AS k
        JOIN GIAOVIEN AS g ON k.TRGKHOA = g.MAGV
        WHERE g.HOCVI NOT IN ('TS', 'PTS')
        OR g.MAKHOA <> k.MAKHOA 
    )
    BEGIN
        ROLLBACK;
        THROW 50005, 'Trưởng khoa phải là giáo viên thuộc khoa và có học vị "TS" hoặc "PTS".', 1;
    END
END;




-- II. Ngôn ngữ thao tác dữ liệu (Data Manipulation Language):
-- 1.	Tăng hệ số lương thêm 0.2 cho những giáo viên là trưởng khoa.
UPDATE GIAOVIEN
SET
    HESO = HESO + 0.2
WHERE
    MAGV IN (
        SELECT
            TRGKHOA
        FROM
            KHOA
    );

-- 2.	Cập nhật giá trị điểm trung bình tất cả các môn học  (DIEMTB) của mỗi học viên (tất cả các môn học đều có hệ số 1 và nếu học viên thi một môn nhiều lần, chỉ lấy điểm của lần thi sau cùng).
UPDATE HOCVIEN
SET
    DIEMTB = (
        SELECT
            AVG(DIEM)
        FROM
            (
                SELECT
                    MAHV,
                    MAMH,
                    DIEM
                FROM
                    KETQUATHI KQ
                WHERE
                    (
                        LANTHI = (
                            SELECT
                                MAX(LANTHI)
                            FROM
                                KETQUATHI KQ2
                            WHERE
                                KQ.MAHV = KQ2.MAHV
                                AND KQ.MAMH = KQ2.MAMH
                        )
                    )
            )
        WHERE
            MAHV = HOCVIEN.MAHV
    );

-- 3.	Cập nhật giá trị cho cột GHICHU là “Cam thi” đối với trường hợp: học viên có một môn bất kỳ thi lần thứ 3 dưới 5 điểm.
UPDATE KETQUATHI
SET
    GHICHU = 'Cam thi'
WHERE
    LANTHI = 3
    AND DIEM < 5;

-- 4.	Cập nhật giá trị cho cột XEPLOAI trong quan hệ HOCVIEN như sau:
-- o	Nếu DIEMTB  9 thì XEPLOAI =”XS”
-- o	Nếu  8  DIEMTB < 9 thì XEPLOAI = “G”
-- o	Nếu  6.5  DIEMTB < 8 thì XEPLOAI = “K”
-- o	Nếu  5    DIEMTB < 6.5 thì XEPLOAI = “TB”
-- o	Nếu  DIEMTB < 5 thì XEPLOAI = ”Y”
UPDATE HOCVIEN
SET
    XEPLOAI = CASE
        WHEN DIEMTB >= 9 THEN 'XS'
        WHEN DIEMTB >= 8 THEN 'G'
        WHEN DIEMTB >= 6.5 THEN 'K'
        WHEN DIEMTB >= 5 THEN 'TB'
        ELSE 'Y'
    END;

-- III. Ngôn ngữ truy vấn dữ liệu:
-- 1.	In ra danh sách (mã học viên, họ tên, ngày sinh, mã lớp) lớp trưởng của các lớp.
SELECT
    MAHV,
    CONCAT (HO, ' ', TEN) AS HOTEN,
    NGSINH,
    MALOP
FROM
    HOCVIEN
WHERE
    MAHV IN (
        SELECT
            TRGLOP
        FROM
            LOP
    );

-- 2.	In ra bảng điểm khi thi (mã học viên, họ tên , lần thi, điểm số) môn CTRR của lớp “K12”, sắp xếp theo tên, họ học viên.
SELECT
    HV.MAHV,
    CONCAT (HO, ' ', TEN) AS HOTEN,
    KQT.LANTHI,
    KQT.DIEM
FROM
    KETQUATHI AS KQT
    LEFT JOIN HOCVIEN AS HV ON HV.MAHV = KQT.MAHV
    LEFT JOIN LOP AS L ON L.MALOP = HV.MALOP
WHERE
    KQT.MAMH = 'CTRR'
    AND L.MALOP = 'K12'
ORDER BY
    HV.TEN,
    HV.HO;

-- 3.	In ra danh sách những học viên (mã học viên, họ tên) và những môn học mà học viên đó thi lần thứ nhất đã đạt.
SELECT
    HV.MAHV,
    CONCAT (HO, ' ', TEN) AS HOTEN,
    MH.TENMH,
    KQT.KQUA
FROM
    KETQUATHI AS KQT
    LEFT JOIN MONHOC AS MH ON MH.MAMH = KQT.MAMH
    LEFT JOIN HOCVIEN AS HV ON HV.MAHV = KQT.MAHV
WHERE
    KQT.LANTHI = 1
    AND KQT.KQUA = 'Dat';

-- 4.	In ra danh sách học viên (mã học viên, họ tên) của lớp “K11” thi môn CTRR không đạt (ở lần thi 1).
SELECT
    HV.MAHV,
    CONCAT (HV.HO, ' ', HV.TEN) AS HOTEN
FROM
    KETQUATHI KQT
    LEFT JOIN HOCVIEN HV ON HV.MAHV = KQT.MAHV
WHERE
    MALOP = 'K11'
    AND MAMH = 'CTRR'
    AND LANTHI = 1
    AND KQUA = 'Khong Dat';

-- 5.	* Danh sách học viên (mã học viên, họ tên) của lớp “K” thi môn CTRR không đạt (ở tất cả các lần thi).
SELECT DISTINCT
    HV.MAHV,
    CONCAT (HV.HO, ' ', HV.TEN) AS HOTEN
FROM
    KETQUATHI KQT
    LEFT JOIN HOCVIEN HV ON HV.MAHV = KQT.MAHV
WHERE
    MALOP LIKE 'K%'
    AND MAMH = 'CTRR'
    AND KQUA = 'Khong Dat';

-- 6.	Tìm tên những môn học mà giáo viên có tên “Tran Tam Thanh” dạy trong học kỳ 1 năm 2006.
SELECT DISTINCT
    m.TENMH
FROM
    GIANGDAY g
    JOIN MONHOC m ON g.MAMH = m.MAMH
    JOIN GIAOVIEN gv ON g.MAGV = gv.MAGV
WHERE
    gv.HOTEN = 'Tran Tam Thanh'
    AND g.HOCKY = 1
    AND g.NAM = 2006;

-- 7.	Tìm những môn học (mã môn học, tên môn học) mà giáo viên chủ nhiệm lớp “K11” dạy trong học kỳ 1 năm 2006.
SELECT DISTINCT
    m.MAMH,
    m.TENMH
FROM
    GIANGDAY g
    JOIN MONHOC m ON g.MAMH = m.MAMH
    JOIN LOP l ON g.MALOP = l.MALOP
    AND l.MAGVCN = g.MAGV
WHERE
    l.MALOP = 'K11'
    AND g.HOCKY = 1
    AND g.NAM = 2006;

-- 8.	Tìm họ tên lớp trưởng của các lớp mà giáo viên có tên “Nguyen To Lan” dạy môn “Co So Du Lieu”.
SELECT DISTINCT
    CONCAT (h.HO, ' ', h.TEN) AS HOTEN
FROM
    LOP l
    JOIN HOCVIEN h ON l.TRGLOP = h.MAHV
    JOIN GIANGDAY g ON l.MALOP = g.MALOP
    JOIN MONHOC m ON g.MAMH = m.MAMH
    JOIN GIAOVIEN gv ON g.MAGV = gv.MAGV
WHERE
    gv.HOTEN = 'Nguyen To Lan'
    AND m.TENMH = 'Co So Du Lieu';

-- 9.	In ra danh sách những môn học (mã môn học, tên môn học) phải học liền trước môn “Co So Du Lieu”.
SELECT
    dk.MAMH_TRUOC,
    mh.TENMH
FROM
    DIEUKIEN dk
    JOIN MONHOC mh ON dk.MAMH_TRUOC = mh.MAMH
WHERE
    dk.MAMH IN (
        SELECT
            MAMH
        FROM
            MONHOC
        WHERE
            TENMH = 'Co So Du Lieu'
    );

-- 10.	Môn “Cau Truc Roi Rac” là môn bắt buộc phải học liền trước những môn học (mã môn học, tên môn học) nào.
SELECT
    dk.MAMH,
    mh.TENMH
FROM
    DIEUKIEN dk
    JOIN MONHOC mh ON dk.MAMH = mh.MAMH
WHERE
    dk.MAMH_TRUOC = (
        SELECT
            MAMH
        FROM
            MONHOC
        WHERE
            TENMH = 'Cau Truc Roi Rac'
    );

-- 11.	Tìm họ tên giáo viên dạy môn CTRR cho cả hai lớp “K11” và “K12” trong cùng học kỳ 1 năm 2006.
SELECT
    gv.HOTEN
FROM
    GIANGDAY g
    JOIN GIAOVIEN gv ON g.MAGV = gv.MAGV
    JOIN MONHOC m ON g.MAMH = m.MAMH
WHERE
    m.MAMH = 'CTRR'
    AND g.HOCKY = 1
    AND g.NAM = 2006
    AND g.MALOP IN ('K11', 'K12')
GROUP BY
    gv.HOTEN
HAVING
    COUNT(DISTINCT g.MALOP) = 2;

-- 12.	Tìm những học viên (mã học viên, họ tên) thi không đạt môn CSDL ở lần thi thứ 1 nhưng chưa thi lại môn này.
SELECT
    h.MAHV,
    CONCAT (h.HO, ' ', h.TEN) AS HOTEN
FROM
    HOCVIEN h
    JOIN KETQUATHI k ON h.MAHV = k.MAHV
    JOIN MONHOC m ON k.MAMH = m.MAMH
WHERE
    m.MAMH = 'CSDL'
    AND k.LANTHI = 1
    AND k.KQUA = 'Khong Dat'
    AND h.MAHV NOT IN (
        SELECT
            MAHV
        FROM
            KETQUATHI k2
        WHERE
            k2.MAMH = m.MAMH
            AND k2.LANTHI <> 1
    );

-- 13.	Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy bất kỳ môn học nào.
SELECT
    gv.MAGV,
    gv.HOTEN
FROM
    GIAOVIEN gv
    LEFT JOIN GIANGDAY gd ON gv.MAGV = gd.MAGV
WHERE
    gd.MAGV IS NULL;

-- 14.	Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy bất kỳ môn học nào thuộc khoa giáo viên đó phụ trách.
SELECT
    gv.MAGV,
    gv.HOTEN
FROM
    GIAOVIEN gv
    LEFT JOIN GIANGDAY gd ON gv.MAGV = gd.MAGV
    LEFT JOIN MONHOC mh ON gd.MAMH = mh.MAMH
WHERE
    mh.MAKHOA <> gv.MAKHOA
    OR mh.MAMH IS NULL;

-- 15.	Tìm họ tên các học viên thuộc lớp “K11” thi một môn bất kỳ quá 3 lần vẫn “Khong dat” hoặc thi lần thứ 2 môn CTRR được 5 điểm.
SELECT DISTINCT
    h.MAHV,
    CONCAT (h.HO, ' ', h.TEN) AS HOTEN
FROM
    HOCVIEN h
    JOIN KETQUATHI k ON h.MAHV = k.MAHV
    JOIN LOP l ON h.MALOP = l.MALOP
    JOIN MONHOC m ON k.MAMH = m.MAMH
WHERE
    l.MALOP = 'K11'
    AND (
        (
            k.KQUA = 'Khong Dat'
            AND k.LANTHI > 3
        )
        OR (
            m.MAMH = 'CTRR'
            AND k.LANTHI = 2
            AND k.DIEM = 5
        )
    );

-- 16.	Tìm họ tên giáo viên dạy môn CTRR cho ít nhất hai lớp trong cùng một học kỳ của một năm học.
SELECT
    g.MAGV,
    gv.HOTEN
FROM
    GIANGDAY g
    JOIN GIAOVIEN gv ON g.MAGV = gv.MAGV
    JOIN MONHOC m ON g.MAMH = m.MAMH
WHERE
    m.MAMH = 'CTRR'
GROUP BY
    g.MAGV,
    gv.HOTEN,
    g.HOCKY,
    g.NAM
HAVING
    COUNT(DISTINCT g.MALOP) >= 2;

-- 17.	Danh sách học viên và điểm thi môn CSDL (chỉ lấy điểm của lần thi sau cùng).
SELECT
    k.MAHV,
    CONCAT (h.HO, ' ', h.TEN) AS HOTEN,
    k.DIEM,
    LANTHI
FROM
    KETQUATHI k
    JOIN HOCVIEN h ON k.MAHV = h.MAHV
    JOIN MONHOC m ON k.MAMH = m.MAMH
WHERE
    m.MAMH = 'CSDL'
    AND k.LANTHI IN (
        SELECT
            MAX(k2.LANTHI)
        FROM
            KETQUATHI k2
        WHERE
            h.MAHV = k2.MAHV
            AND k2.MAMH = 'CSDL'
    );

-- 18.	Danh sách học viên và điểm thi môn “Co So Du Lieu” (chỉ lấy điểm cao nhất của các lần thi).
SELECT
    k.MAHV,
    CONCAT (h.HO, ' ', h.TEN) AS HOTEN,
    MAX(k.DIEM) AS DIEMCAONHAT
FROM
    KETQUATHI k
    JOIN HOCVIEN h ON k.MAHV = h.MAHV
    JOIN MONHOC m ON k.MAMH = m.MAMH
WHERE
    m.TENMH = 'Co So Du Lieu'
GROUP BY
    k.MAHV,
    h.HO,
    h.TEN;

-- 19.	Khoa nào (mã khoa, tên khoa) được thành lập sớm nhất.
SELECT
    TOP 1 MAKHOA,
    TENKHOA
FROM
    KHOA
ORDER BY
    NGTLAP;

-- 20.	Có bao nhiêu giáo viên có học hàm là “GS” hoặc “PGS”.
SELECT
    COUNT(*) AS SO_LUONG_GIAO_VIEN
FROM
    GIAOVIEN
WHERE
    HOCHAM IN ('GS', 'PGS');

-- 21.	Thống kê có bao nhiêu giáo viên có học vị là “CN”, “KS”, “Ths”, “TS”, “PTS” trong mỗi khoa.
SELECT
    MAKHOA,
    HOCVI,
    COUNT(*) AS SO_LUONG
FROM
    GIAOVIEN
WHERE
    HOCVI IN ('CN', 'KS', 'Ths', 'TS', 'PTS')
GROUP BY
    MAKHOA,
    HOCVI;

-- 22.	Mỗi môn học thống kê số lượng học viên theo kết quả (đạt và không đạt).
SELECT
    k.MAMH,
    m.TENMH,
    k.KQUA,
    COUNT(k.MAHV) AS SO_LUONG
FROM
    KETQUATHI k
    JOIN MONHOC m ON k.MAMH = m.MAMH
GROUP BY
    k.MAMH,
    m.TENMH,
    k.KQUA;

-- 23.	Tìm giáo viên (mã giáo viên, họ tên) là giáo viên chủ nhiệm của một lớp, đồng thời dạy cho lớp đó ít nhất một môn học.
SELECT
    gv.MAGV,
    gv.HOTEN
FROM
    GIAOVIEN gv
    JOIN LOP l ON gv.MAGV = l.MAGVCN
    JOIN GIANGDAY gd ON gv.MAGV = gd.MAGV
    AND l.MALOP = gd.MALOP
GROUP BY
    gv.MAGV,
    gv.HOTEN;

-- 24.	Tìm họ tên lớp trưởng của lớp có sỉ số cao nhất.
SELECT
    TOP 1 CONCAT (h.HO, ' ', h.TEN) AS HOTEN
FROM
    LOP l
    JOIN HOCVIEN h ON l.TRGLOP = h.MAHV
ORDER BY
    l.SISO DESC;

-- 25.	* Tìm họ tên những LOPTRG thi không đạt quá 3 môn (mỗi môn đều thi không đạt ở tất cả các lần thi).
SELECT
    h.MAHV,
    CONCAT (h.HO, ' ', h.TEN) AS HOTEN
FROM
    HOCVIEN h
    JOIN LOP l ON h.MAHV = l.TRGLOP
    JOIN KETQUATHI k ON h.MAHV = k.MAHV
GROUP BY
    h.MAHV,
    h.HO,
    h.TEN
HAVING
    COUNT(DISTINCT k.MAMH) > 3
    AND COUNT(*) = SUM(
        CASE
            WHEN k.KQUA = 'Khong Dat' THEN 1
            ELSE 0
        END
    );

-- 26.	Tìm học viên (mã học viên, họ tên) có số môn đạt điểm 9,10 nhiều nhất.
SELECT
    TOP 1 h.MAHV,
    CONCAT (HO, ' ', TEN) AS HOTEN
FROM
    HOCVIEN h
    JOIN KETQUATHI k ON h.MAHV = k.MAHV
WHERE
    k.DIEM IN (9, 10)
GROUP BY
    h.MAHV,
    h.HO,
    h.TEN
ORDER BY
    COUNT(*) DESC;

-- 27.	Trong từng lớp, tìm học viên (mã học viên, họ tên) có số môn đạt điểm 9,10 nhiều nhất.
SELECT
    l.MALOP,
    h.MAHV,
    CONCAT (h.HO, ' ', h.TEN) AS HOTEN
FROM
    HOCVIEN h
    JOIN KETQUATHI k ON h.MAHV = k.MAHV
    JOIN LOP l ON h.MALOP = l.MALOP
WHERE
    k.DIEM IN (9, 10)
GROUP BY
    l.MALOP,
    h.MAHV,
    h.HO,
    h.TEN
ORDER BY
    l.MALOP,
    COUNT(*) DESC;

-- 28.	Trong từng học kỳ của từng năm, mỗi giáo viên phân công dạy bao nhiêu môn học, bao nhiêu lớp.
SELECT
    g.HOCKY,
    g.NAM,
    g.MAGV,
    gv.HOTEN,
    COUNT(DISTINCT g.MAMH) AS SO_MON,
    COUNT(DISTINCT g.MALOP) AS SO_LOP
FROM
    GIANGDAY g
    JOIN GIAOVIEN gv ON g.MAGV = gv.MAGV
GROUP BY
    g.HOCKY,
    g.NAM,
    g.MAGV,
    gv.HOTEN;

-- 29.	Trong từng học kỳ của từng năm, tìm giáo viên (mã giáo viên, họ tên) giảng dạy nhiều nhất.
SELECT
    TOP 1 g.HOCKY,
    g.NAM,
    g.MAGV,
    gv.HOTEN
FROM
    GIANGDAY g
    JOIN GIAOVIEN gv ON g.MAGV = gv.MAGV
GROUP BY
    g.HOCKY,
    g.NAM,
    g.MAGV,
    gv.HOTEN
ORDER BY
    COUNT(*) DESC;

-- 30.	Tìm môn học (mã môn học, tên môn học) có nhiều học viên thi không đạt (ở lần thi thứ 1) nhất.
SELECT
    TOP 1 m.MAMH,
    m.TENMH
FROM
    KETQUATHI k
    JOIN MONHOC m ON k.MAMH = m.MAMH
WHERE
    k.LANTHI = 1
    AND k.KQUA = 'Khong Dat'
GROUP BY
    m.MAMH,
    m.TENMH
ORDER BY
    COUNT(*) DESC;

-- 31.	Tìm học viên (mã học viên, họ tên) thi môn nào cũng đạt (chỉ xét lần thi thứ 1).
SELECT
    h.MAHV,
    CONCAT (h.HO, ' ', h.TEN) AS HOTEN
FROM
    HOCVIEN h
WHERE
    NOT EXISTS (
        SELECT
            1
        FROM
            KETQUATHI k
        WHERE
            k.MAHV = h.MAHV
            AND k.LANTHI = 1
            AND k.KQUA = 'Khong Dat'
    );

-- 32.	* Tìm học viên (mã học viên, họ tên) thi môn nào cũng đạt (chỉ xét lần thi sau cùng).
SELECT
    h.MAHV,
    CONCAT (h.HO, ' ', h.TEN) AS HOTEN
FROM
    HOCVIEN h
WHERE
    h.MAHV IN (
        SELECT DISTINCT
            k1.MAHV
        FROM
            KETQUATHI k1
        WHERE
            KQUA = 'Dat'
            AND k1.LANTHI = (
                SELECT
                    MAX(k2.LANTHI)
                FROM
                    KETQUATHI k2
                WHERE
                    k2.MAHV = k1.MAHV
                    AND k2.MAMH = k1.MAMH
            )
    );

-- 33.	* Tìm học viên (mã học viên, họ tên) đã thi tất cả các môn đều đạt (chỉ xét lần thi thứ 1).
SELECT
    h.MAHV,
    CONCAT (h.HO, ' ', h.TEN) AS HOTEN
FROM
    HOCVIEN h
WHERE
    h.MAHV IN (
        SELECT DISTINCT
            MAHV
        FROM
            KETQUATHI
        WHERE
            KQUA = 'Dat'
            AND LANTHI = 1
        GROUP BY
            MAHV,
            MAMH
        HAVING
            COUNT(MAMH) = (
                SELECT
                    COUNT(*)
                FROM
                    MONHOC
            )
    );

-- 34.	* Tìm học viên (mã học viên, họ tên) đã thi tất cả các môn đều đạt  (chỉ xét lần thi sau cùng).
SELECT
    h.MAHV,
    CONCAT (h.HO, ' ', h.TEN) AS HOTEN
FROM
    HOCVIEN h
WHERE
    h.MAHV IN (
        SELECT DISTINCT
            k1.MAHV
        FROM
            KETQUATHI k1
        WHERE
            k1.KQUA = 'Dat'
            AND k1.LANTHI = (
                SELECT
                    MAX(k2.LANTHI)
                FROM
                    KETQUATHI k2
                WHERE
                    k2.MAHV = k1.MAHV
                    AND k2.MAMH = k1.MAMH
            )
        GROUP BY
            k1.MAHV,
            k1.MAMH
        HAVING
            COUNT(k1.MAMH) = (
                SELECT
                    COUNT(*)
                FROM
                    MONHOC
            )
    );

-- 35.	** Tìm học viên (mã học viên, họ tên) có điểm thi cao nhất trong từng môn (lấy điểm ở lần thi sau cùng).
SELECT
    h.MAHV,
    CONCAT (h.HO, ' ', h.TEN) AS HOTEN,
    k.MAMH,
    k.DIEM
FROM
    KETQUATHI k
    JOIN HOCVIEN h ON k.MAHV = h.MAHV
WHERE
    (k.MAMH) IN (
        SELECT
            MAMH
        FROM
            KETQUATHI
        WHERE
            LANTHI = (
                SELECT
                    MAX(LANTHI)
                FROM
                    KETQUATHI k2
                WHERE
                    k2.MAHV = KETQUATHI.MAHV
                    AND k2.MAMH = KETQUATHI.MAMH
            )
        GROUP BY
            MAMH,
            MAHV
    );