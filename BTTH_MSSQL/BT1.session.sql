-- 1.	In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất.
SELECT
    MASP,
    TENSP
FROM
    SANPHAM
WHERE
    NUOCSX LIKE '%Trung Quoc%';

-- 2.	In ra danh sách các sản phẩm (MASP, TENSP) có đơn vị tính là “cay”, ”quyen”.
SELECT
    MASP,
    TENSP
FROM
    SANPHAM
WHERE
    DVT IN ('cay', 'quyen');

-- 3.	In ra danh sách các sản phẩm (MASP,TENSP) có mã sản phẩm bắt đầu là “B” và kết thúc là “01”.
SELECT
    MASP,
    TENSP
FROM
    SANPHAM
WHERE
    MASP LIKE 'B%01';

-- 4.	In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có giá từ 30.000 đến 40.000.
SELECT
    MASP,
    TENSP,
    GIA
FROM
    SANPHAM
WHERE
    NUOCSX LIKE '%Trung Quoc%'
    AND GIA BETWEEN 30000 AND 40000;

-- 5.	In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” hoặc “Thai Lan” sản xuất có giá từ 30.000 đến 40.000.
SELECT
    MASP,
    TENSP
FROM
    SANPHAM
WHERE
    NUOCSX IN ('Trung Quoc', 'Thai Lan')
    AND GIA BETWEEN 30000 AND 40000;

-- 6.	In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2007 và ngày 2/1/2007.
SELECT
    SOHD,
    TRIGIA
FROM
    HOADON
WHERE
    NGHD IN ('1/1/2007', '2/1/2007');

-- 7.	In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo ngày (tăng dần) và trị giá của hóa đơn (giảm dần).
SELECT
    SOHD,
    TRIGIA
FROM
    HOADON
WHERE
    MONTH (NGHD) = 1
    AND YEAR (NGHD) = 2007
ORDER BY
    NGHD ASC,
    TRIGIA DESC;

-- 8.	In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.
SELECT
    KH.MAKH,
    HOTEN,
    DATE (NGHD)
FROM
    KHACHHANG AS KH
    LEFT JOIN HOADON AS HD ON HD.MAKH = KH.MAKH
WHERE
    NGHD LIKE '1/1/2007';

-- 9.	In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Nguyen Van B” lập trong ngày 28/10/2006.
-- 10.	In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyen Van A” mua trong tháng 10/2006.
-- 11.	Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”.
-- 12.	Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
-- 13.	Tìm các số hóa đơn mua cùng lúc 2 sản phẩm có mã số “BB01” và “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
-- 14.	In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất hoặc các sản phẩm được bán ra trong ngày 1/1/2007.
-- 15.	In ra danh sách các sản phẩm (MASP,TENSP) không bán được.
-- 16.	In ra danh sách các sản phẩm (MASP,TENSP) không bán được trong năm 2006.
-- 17.	In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất không bán được trong năm 2006.
-- 18.	Tìm số hóa đơn đã mua tất cả các sản phẩm do Singapore sản xuất.
-- 19.	Tìm số hóa đơn trong năm 2006 đã mua ít nhất tất cả các sản phẩm do Singapore sản xuất.
-- 20.	Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?
-- 21.	Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006.
-- 22.	Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu ?
-- 23.	Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?
-- 24.	Tính doanh thu bán hàng trong năm 2006.
-- 25.	Tìm số hóa đơn có trị giá cao nhất trong năm 2006.
-- 26.	Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.
-- 27.	In ra danh sách 3 khách hàng (MAKH, HOTEN) có doanh số cao nhất.
-- 28.	In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao nhất.
-- 29.	In ra danh sách các sản phẩm (MASP, TENSP) do “Thai Lan” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của tất cả các sản phẩm).
-- 30.	In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quoc” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của sản phẩm do “Trung Quoc” sản xuất).
-- 31.	* In ra danh sách 3 khách hàng có doanh số cao nhất (sắp xếp theo kiểu xếp hạng).
-- 32.	Tính tổng số sản phẩm do “Trung Quoc” sản xuất.
-- 33.	Tính tổng số sản phẩm của từng nước sản xuất.
-- 34.	Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.
-- 35.	Tính doanh thu bán hàng mỗi ngày.
-- 36.	Tính tổng số lượng của từng sản phẩm bán ra trong tháng 10/2006.
-- 37.	Tính doanh thu bán hàng của từng tháng trong năm 2006.
-- 38.	Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau.
-- 39.	Tìm hóa đơn có mua 3 sản phẩm do “Viet Nam” sản xuất (3 sản phẩm khác nhau).
-- 40.	Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất. 
-- 41.	Tháng mấy trong năm 2006, doanh số bán hàng cao nhất ?
-- 42.	Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.
-- 43.	*Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất.
-- 44.	Tìm nước sản xuất sản xuất ít nhất 3 sản phẩm có giá bán khác nhau.
-- 45.	*Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều nhất.