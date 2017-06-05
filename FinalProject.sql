
--Create library database--
CREATE DATABASE db_library
/*USE DATABASE db_library*/
USE db_library

--Create Tables--
CREATE TABLE tbl_publisher (
publisher_id INT PRIMARY KEY NOT NULL IDENTITY (100,1),  
publisher_name VARCHAR(50) NOT NULL,
publisher_address VARCHAR(50) NOT NULL,
publisher_phone VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_book (
book_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
book_title VARCHAR(50) NOT NULL,
book_publisher INT NOT NULL CONSTRAINT fk_publisher_id FOREIGN KEY REFERENCES tbl_publisher(publisher_id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE tbl_authors (
authors_book_id INT NOT NULL CONSTRAINT fk_authors_book_id FOREIGN KEY REFERENCES tbl_book(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
author_name VARCHAR(50) NOT NULL,
 );

 CREATE TABLE tbl_branch (
branch_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
branch_name VARCHAR(50) NOT NULL,
branch_address VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_borrower (
card_no INT PRIMARY KEY NOT NULL IDENTITY(220,1),
borrower_name VARCHAR(50) NOT NULL,
borrower_address VARCHAR(50) NOT NULL,
borrower_phone VARCHAR(50) NOT NULL
);


CREATE TABLE tbl_loans (
loans_book_id INT NOT NULL CONSTRAINT fk_loans_book_id FOREIGN KEY REFERENCES tbl_book(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
loans_branch_id INT NOT NULL CONSTRAINT fk_loans_branch_id FOREIGN KEY REFERENCES tbl_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
loans_card_no INT NOT NULL CONSTRAINT fk_card_no FOREIGN KEY REFERENCES tbl_borrower(card_no) ON UPDATE CASCADE ON DELETE CASCADE,
date_out DATETIME2 NOT NULL,
due_date DATETIME2 NOT NULL
);

CREATE TABLE tbl_copies (
copies_book_id INT NOT NULL CONSTRAINT fk_copies_book_id FOREIGN KEY REFERENCES tbl_book(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
copies_branch_id INT NOT NULL CONSTRAINT fk_copies_branch_id FOREIGN KEY REFERENCES tbl_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
no_of_copies INT NOT NULL
);

--Populate Tables
INSERT INTO tbl_publisher
(publisher_name,publisher_address,publisher_phone)
Values
('McGraw-Hill',' 9024 Groble St, New York, NY', '800-331-5094'),
('Vanderguard Books', '8343 Achland St, San Diego, CA', '890-324-5555'),
('Wonder Publishing', '7674 Marchand Ave, Fresno, CA', '777-434-4355')
;


INSERT INTO tbl_book
(book_title, book_publisher)
Values
('The Lost Tribe', 100),
('Fahrenheit 451', 102),
('Moby Dick', 101),
('Computers for Dummies', 101),
('The Old Man and the Sea', 102),
('Logan', 101),
('War and Peace', 100),
('Love and Rage', 101),
('Las Vegas',101),
('The Miracle Worker', 102),
('Guide to Fixing Things', 100),
('Running in Circles', 102),
('Guide to Learning SQL', 102),
('Magic and Mystery', 101),
('Harry Potter and the Sorcerer''s Stone',100 ),
('Old Times in the West', 101),
('Logan II: Revenge of the Mutants',101),
('Albino Cat', 100),
('Misery',101),
('Calling All Jan Michael-Vincent''s', 102)
;

INSERT INTO tbl_authors
(authors_book_id, author_name)
Values
(2,'Donald Goodwin'),
(3,'Ray Bradbury'),
(4,'Herman Melville'),
(5,'For Dummies'),
(6,'Earnest Hemingway'),
(7,'James Howlett'),
(8,'Leon Tolstoy'),
(9,'Horacio Marston'),
(10,'Travel Guide'),
(11,'Tom Gibson'),
(12,'Guide to'),
(13,'Lawrence'),
(14,'James Oren'),
(15,'Rebecca Nance'),
(16,'J.K. Rowling'),
(17,'Marcelo Veracruz'),
(18,'James Howlett'),
(19,'Laura Raditz'),
(20,'Stephen King'),
(21,'Rick Sanchez')
;



INSERT INTO tbl_branch
(branch_name, branch_address)
Values
('Sharpstown', '3454 Madison Lane, Carborro, NC 27516'),
('Central', '4564 Falstad Lane, Chapel Hill, NC 27516'),
('Makers', '5645 Olderplane Street, Carborro, NC 27516'),
('Kyrie', '4364 Illenium Drive, Chapel Hill, NC 27514')
;

INSERT INTO tbl_borrower
(borrower_name,borrower_address,borrower_phone)
Values
('Adam Katz', '4323 Madison Street, Chapel Hill, NC 27514', '323-456-7788'),
('Mira Borowitz', '3343 Opross Street, Carborro, NC 27516', '444-343-9939'),
('Laura Benjani', '8484 Floral Lane, Carborro, NC 27516', '838-333-9898'),
('Van Martin', '8888 Nashton Drive, Chapel Hill, NC 27453', '565-456-3433'),
('Farsahd Amani', '7634 Hialeah Cove, Chapel Hill, NC 27453', '676-898-3004'),
('Mary Nadjana', '33 Jumper Lane, Carborro, NC 27452', '555-343-8898'),
('Nance Ladman', '8545 Ranah Farah, Chapel Hill, NC 27373', '323-333-8788'),
('Miriam Katz', '4323 Madison St, Chapel Hill, NC 27453', '323-456-778')
;



INSERT INTO tbl_loans
(loans_book_id, loans_branch_id, loans_card_no, due_date, date_out)
Values
(2,1,221,'06/05/2017', '05/30/2017'),
(3,3,222, '06/30/2017', '05/02/2017'),
(4,4,223,'06/16/2017', '05/04/2017'),
(2,2,224,'06/30/2017', '05/05/2017'),
(2,1,223,'06/16/2017', '05/04/2017'),
(2,2,226,'06/15/2017', '05/05/2017'),
(3,4,227,'06/20/2017', '05/30/2017'),
(4,3,227,'06/11/2017', '05/05/2017'),
(5,1,221,'06/30/2017', '05/08/2017'),
(10,4,222,'06/22/2017', '05/09/2017'),
(13,3,223,'06/12/2017', '05/20/2017'),
(14,2,224,'06/05/2017', '05/05/2017'),
(15,1,227,'06/12/2017', '05/06/2017'),
(17,2,227,'06/15/2017', '05/07/2017'),
(20,1,225,'06/16/2017', '05/08/2017'),
(19,3,226,'06/22/2017', '05/02/2017'),
(15,4,222,'06/30/2017', '05/15/2017'),
(12,2,223,'06/04/2017', '05/27/2017'),
(15,2,224,'06/05/2017', '05/04/2017'),
(18,3,223,'06/06/2017', '05/05/2017'),
(2,4,226,'06/29/2017', '05/09/2017'),
(3,2,223,'06/23/2017', '05/05/2017'),
(5,4,224,'06/05/2017', '05/06/2017'),
(4,2,223,'06/06/2017', '05/22/2017'),
(6,3,223,'06/07/2017', '05/24/2017'),
(7,2,223,'06/08/2017', '05/25/2017'),
(10,1,223,'06/15/2017', '05/20/2017'),
(13,4,226,'06/16/2017', '05/23/2017'),
(14,2,221,'06/22/2017', '05/30/2017'),
(16,2,226,'06/05/2017', '05/22/2017'),
(18,3,225,'06/08/2017', '05/03/2017'),
(19,4,221,'06/03/2017', '05/29/2017'),
(20,2,226,'06/06/2017', '05/30/2017'),
(11,3,226,'06/05/2017', '05/15/2017'),
(10,4,221,'06/05/2017', '05/31/2017'),
(7,2,226,'06/20/2017', '05/17/2017'),
(19,2,223,'06/23/2017', '05/18/2017'),
(10,4,224,'06/22/2017', '05/19/2017'),
(2,2,223,'06/21/2017', '05/20/2017'),
(2,2,222,'06/08/2017', '05/21/2017'),
(3,3,221,'06/7/2017', '05/22/2017'),
(15,4,221,'06/6/2017', '05/23/2017'),
(18,2,224,'06/5/2017', '05/24/2017'),
(20,2,222,'06/22/2017', '05/03/2017'),
(19,1,226,'06/22/2017', '05/2/2017'),
(2,3,223,'06/20/2017', '05/2/2017'),
(10,4,224,'06/13/2017', '05/15/2017'),
(5,1,225,'06/12/2017', '05/19/2017'),
(8,4,222,'06/11/2017', '05/20/2017'),
(9,3,222,'06/10/2017', '05/11/2017'),
(10,1,221,'06/09/2017', '05/12/2017')
;

INSERT INTO tbl_copies 
(copies_book_id, copies_branch_id, no_of_copies)
Values
(2,1 ,2 ),
(2,1,2 ),
(3,1,2 ),
(4,1,2 ),
(5,1 ,2),
(6,1 , 2),
(7,1 ,2 ),
(8,1 ,2 ),
(9,1 ,2 ),
(10,1 , 2),
(11,2 ,2 ),
(12,2 ,2 ),
(13,2 ,2 ),
(14,2 ,2),
(15,2 , 2),
(16,2 , 2),
(17,2 , 2),
(18,2 , 2),
(19,2 , 2),
(20,2,2),
(21,2 , 2),
(2,3 , 2),
(2,3 , 2),
(3,3 , 2),
(4,3 , 2),
(5,3 , 2),
(6,3 , 2),
(7,3 , 2),
(8,3 , 2),
(9,3 , 2),
(10,3, 2),
(11,4 , 2),
(12,4 , 2),
(13,4 , 2),
(14,4 , 2),
(15,4 , 2),
(16,4 , 2),
(17,4 , 2),
(18,4 , 2),
(19,4 , 2),
(20,4,2),
(21,4 , 2)
;

USE db_library;
GO
CREATE SCHEMA Library
GO
--Find how many copies of the book "The Lost Tribe" are owned by the Library named "Sharpstown"--
USE db_library;
GO
CREATE PROC Library.uspGetLost_SharpCopies
AS
SET NOCOUNT ON;
SELECT 
	a.no_of_copies, b.book_title, c.branch_name
	FROM tbl_copies a
	INNER JOIN tbl_book b ON b.book_id = a.copies_book_id
	INNER JOIN tbl_branch c ON c.branch_id = a.copies_branch_id
	WHERE book_title = 'The Lost Tribe' AND branch_name = 'Sharpstown'
GO
--How many copies of the book titled "The Lost Tribe" are owned by each library branch"--
CREATE PROC Library.uspGetLost_Copies
AS
SET NOCOUNT ON;
SELECT 
	a.no_of_copies, b.book_title, c.branch_name
	FROM tbl_copies a
	INNER JOIN tbl_book b ON b.book_id = a.copies_book_id
	INNER JOIN tbl_branch c ON c.branch_id = a.copies_branch_id
	WHERE book_title = 'The Lost Tribe' 
GO
--Retrieve the names of all borrowers who do not have any books checked out
CREATE PROC Library.uspGetBorrower_Names
AS
SET NOCOUNT ON;
SELECT 
	a.due_date, b.borrower_name
	FROM tbl_loans a
	INNER JOIN tbl_borrower b ON b.card_no = a.loans_card_no
	WHERE due_date < '06/05/2017'
GO
-- Find Info for people with book due today from sharpstown
CREATE PROC Library.uspGetSharpstown_Info
AS
SET NOCOUNT ON;
SELECT 
	a.due_date, b.borrower_name, b.borrower_address, c.book_title, d.branch_name
	FROM tbl_loans a
	INNER JOIN tbl_borrower b ON b.card_no = a.loans_card_no
	INNER JOIN tbl_book c ON c.book_id = a.loans_book_id
	INNER JOIN tbl_branch d ON d.branch_id = a.loans_branch_id
	WHERE due_date = '06/05/2017' AND branch_name = 'Sharpstown'
GO
--total number of books loaned from each branch
CREATE PROC Library.uspNumber_of_books_loaned
AS
SET NOCOUNT ON;
SELECT
	d.branch_name,
	COUNT(a.loans_card_no) AS 'Number of Books Loaned'
	FROM tbl_loans a
	INNER JOIN tbl_borrower b ON b.card_no = a.loans_card_no 
	INNER JOIN tbl_branch d ON d.branch_id = a.loans_branch_id
	GROUP BY d.branch_name
GO		
--Information for borrowers with more than 5 books checked out
CREATE PROC Library.uspBorrowers_more_than_5
AS
SET NOCOUNT ON;
SELECT
	a.borrower_name, a.borrower_address, a.borrower_phone
	FROM tbl_borrower a
	INNER JOIN tbl_loans b ON b.loans_card_no = a.card_no 
	WHERE due_date > '06/05/2017'
	GROUP BY a.borrower_name, a.borrower_address, a.borrower_phone, b.loans_card_no
	HAVING COUNT(b.loans_card_no) > 5 
GO
--Information for Books authored by Stephen King from Central--
CREATE PROC Library.Central_Stephen_King
AS
SET NOCOUNT ON;
SELECT
	a.no_of_copies, b.book_title, c.branch_name
	FROM tbl_copies a
	INNER JOIN tbl_book b ON b.book_id = a.copies_book_id
	INNER JOIN tbl_branch c ON c.branch_id = a.copies_branch_id
	WHERE copies_book_id = 20 AND branch_name = 'Central'
GO


