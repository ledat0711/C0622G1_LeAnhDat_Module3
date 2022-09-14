USE csdl_sinh_vien;

SELECT * FROM student
WHERE student_name LIKE 'h%';
    
SELECT * FROM class
WHERE MONTH(start_date) = 12;

SELECT * FROM subject
WHERE credit BETWEEN 3 AND 5;
    
SET SQL_SAFE_UPDATES = 0;
UPDATE student SET class_id = 2 WHERE student_name = 'Hung';
SET SQL_SAFE_UPDATES = 1;

-- Hiển thị các thông tin: StudentName, SubName, Mark. 
-- Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.

SELECT s.student_name,sub.sub_name, m.mark
FROM mark m 
JOIN student s ON m.student_id = s.student_id
JOIN `subject` sub ON m.sub_id = sub.sub_id
ORDER BY m.mark DESC , s.student_name;
