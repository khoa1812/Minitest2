create database minitest2;

use minitest;

create table Classes (
    id int primary key,
    name varchar(255),
    language varchar(255),
    description varchar(255)
);

create table Address (
    id int primary key,
    address varchar(255)
);

create table Student (
    id int primary key,
    name varchar(255),
    address_id int, foreign key (address_id) references Address (id),
    age int,
    phone varchar(255) unique,
    classes_id int, foreign key (classes_id) references Classes(id)
);

create table Course (
    id int primary key,
    name varchar(255),
    description varchar(255)
);

create table Point (
    id int primary key,
    course_id int, foreign key (course_id) references Course (id),
    student_id int, foreign key (student_id) references Student (id),
    point double
);

insert into Classes values (1, 'C01', 'Java', 'lớp chọn'),
                           (2, 'C02', 'JS', 'lớp thường'),
                           (3, 'C03', 'Python', 'chuyên bảo mật'),
                           (4, 'C04', 'C++', 'lập trình nhúng'),
                           (5, 'C05', 'MySQL', 'chuyên về dữ liệu');

insert into Address values (1, 'Hà Nội'), (2, 'Đà Nẵng'), (3, 'Huế'),
                           (4, 'Sài Gòn'), (5, 'Cần Thơ');

insert into Student values (1, 'Nguyen Van A', 2, 23, '123456789', 1),
                           (22, 'Tran Thi B', 4, 18, '987654321', 2),
                           (3, 'Le Van C', 3, 16, '111223344', 3),
                           (14, 'Pham Thi D', 5, 20, '222334455', 4),
                           (5, 'Hoang Van Anh', 4, 22, '333445566', 5),
                           (6, 'Nguyen Thi F', 1, 15, '444556677', 1),
                           (12, 'Vo Van Anh', 3, 19, '555667788', 2),
                           (8, 'Bui Thi H', 3, 17, '666778899', 3),
                           (13, 'Dao Van I', 1, 20, '777889900', 4),
                           (10, 'Mai Thi J', 2, 18, '888990011', 5);

insert into Course values (1, 'Tiếng Anh I', 'Sơ cấp'), (2, 'Tiếng Anh II', 'Trung cấp'),
                          (3, 'Tiếng Anh III', 'Cao cấp'), (4, 'Tiếng Nhật I', 'Sơ cấp'),
                          (5, 'Tiếng Nhật II', 'Trung cấp'), (6, 'Tiếng Nhật III', 'Cao cấp'),
                          (7, 'Tiếng Trung I', 'Sơ cấp'), (8, 'Tiếng Trung II', 'Trung cấp'),
                          (9, 'Tiếng Trung III', 'Cao cấp'), (10, 'Tiếng Pháp I', 'Sơ cấp'),
                          (11, 'Tiếng Pháp II', 'Trung cấp'), (12, 'Tiếng Pháp III', 'Cao cấp'),
                          (13, 'Tiếng Đức I', 'Sơ cấp'), (14, 'Tiếng Đức II', 'Trung cấp'),
                          (15, 'Tiếng Đức III', 'Cao cấp'), (16, 'Tiếng Hàn I', 'Sơ cấp'),
                          (17, 'Tiếng Hàn II', 'Trung cấp'), (18, 'Tiếng Hàn III', 'Cao cấp'),
                          (19, 'Tiếng Việt I', 'Sơ cấp'), (20, 'Tiếng Việt II', 'Trung cấp');

insert into Point values (1, 10, 13, 9.5), (2, 14, 6, 8.6), (3, 8, 8, 5.9), (4, 10, 14, 8.5), (5, 18, 13, 7.8),
                         (6, 20, 5, 9.5), (7, 17, 6, 8.9), (8, 11, 8, 5.9), (9, 12, 14, 5.5), (10, 16, 13, 9.8),
                         (11, 10, 3, 9.7), (12, 4, 6, 8.6), (13, 18, 8, 5.9), (14, 10, 14, 5.5), (15, 19, 13, 7.8);

select S.*, C.name as class_name, A.address
from Student S
         join Classes C on S.classes_id = C.id
         join Address A on S.address_id = A.id
where S.name LIKE 'Nguyen%';

select S.*, C.name as class_name, A.address
from Student S
         join Classes C on S.classes_id = C.id
         join Address A on S.address_id = A.id
where S.name like '%Anh';

select S.*, C.name as class_name, A.address
from Student S
         join Classes C on S.classes_id = C.id
         join Address A on S.address_id = A.id
where S.age between 15 AND 18;

select S.*, C.name AS class_name, A.address
from Student S
         join Classes C on S.classes_id = C.id
         join Address A on S.address_id = A.id
where S.id = 12 or S.id = 13;



select C.name as 'Tên Lớp', count(*) as 'Số Sinh Viên' from Student
                                                               left join Classes C on Student.classes_id = C.id
group by classes_id;

select A.address as 'Tỉnh', count(*) as 'Số Sinh Viên' from Student
                                                                  left join Address A on Student.address_id = A.id
group by address_id;

select C.name as 'Khóa học', avg(P.point) as 'Điểm Trung Bình' from Course C
                                                                    left join Point P on C.id = P.course_id
group by C.id;

select C.name as 'Khóa học', Max(P.point) as 'Điểm cao nhất', min(P.point) as 'Điểm thấp nhất' from Course C
                                                                                                            left join Point P on C.id = P.course_id
group by C.id;

select ucase(S.name) as 'Ten HS' from Student S;

