USE csdl_sinh_vien;

-- 1. Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT *
FROM subject sub
WHERE sub.credit = (SELECT MAX(credit) FROM `subject`);
            
-- 2.Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT sub.*, m.mark
FROM `subject` sub
JOIN mark m ON m.sub_id = sub.sub_id
WHERE m.mark = (SELECT MAX(m.mark));

-- 3. Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
SELECT s.*,AVG(mark.mark) AS diem_trung_binh
FROM student s
LEFT JOIN mark ON mark.student_id = s.student_id
GROUP BY mark.student_id
ORDER BY diem_trung_binh DESC;