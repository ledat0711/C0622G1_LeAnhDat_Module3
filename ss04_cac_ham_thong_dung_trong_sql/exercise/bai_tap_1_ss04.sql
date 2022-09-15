USE csdl_sinh_vien;

-- 1. Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT * FROM `subject` 
order by credit desc
limit 1;

-- 2.Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT sub.*, mark.mark FROM `subject` sub
JOIN mark ON mark.sub_id= sub.sub_id
order by mark desc
limit 1;

-- 3. Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
SELECT s.*, IFNULL((m.mark),0) AS diem_trung_binh
FROM student s 
LEFT JOIN mark m ON m.student_id = s.student_id
GROUP BY m.student_id
ORDER BY diem_trung_binh DESC;
