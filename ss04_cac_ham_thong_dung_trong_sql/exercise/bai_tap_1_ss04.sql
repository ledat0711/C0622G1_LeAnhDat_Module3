USE csdl_sinh_vien;

-- 1. Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT *
FROM subject sub
WHERE sub.credit = (SELECT MAX(credit) FROM `subject`);
            
-- 2.Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT sub.*, m.mark
FROM `subject` sub
JOIN mark m ON m.sub_id = sub.sub_id
WHERE m.mark = (SELECT MAX(mark) FROM mark);

-- 3. Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
SELECT sub.*, AVG(m.mark) AS diem_trung_binh
FROM student sub 
LEFT JOIN mark m ON m.student_id = sub.student_id
GROUP BY m.student_id
ORDER BY diem_trung_binh DESC;
