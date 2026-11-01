CREATE TABLE DEPARTMENT (
    Dept_ID NUMBER(5) PRIMARY KEY,
    Dept_Name VARCHAR2(50) NOT NULL,
    Office_No VARCHAR2(15)
);

CREATE TABLE STUDENT (
    Student_ID NUMBER(10) PRIMARY KEY,
    First_Name VARCHAR2(30) NOT NULL,
    Last_Name VARCHAR2(30),
    DOB DATE,
    Street VARCHAR2(100),
    City VARCHAR2(50),
    State VARCHAR2(50),
    Pincode VARCHAR2(10),

    Dept_ID NUMBER(5),

    CONSTRAINT fk_student_dept
    FOREIGN KEY (Dept_ID)
    REFERENCES DEPARTMENT(Dept_ID)
);

CREATE TABLE FACULTY (
    Faculty_ID NUMBER(10) PRIMARY KEY,
    First_Name VARCHAR2(30) NOT NULL,
    Last_Name VARCHAR2(30),
    Salary NUMBER(10,2),

    Dept_ID NUMBER(5),

    CONSTRAINT fk_faculty_dept
    FOREIGN KEY (Dept_ID)
    REFERENCES DEPARTMENT(Dept_ID)
);

CREATE TABLE COURSE (
    Course_ID NUMBER(5) PRIMARY KEY,
    Course_Name VARCHAR2(100) NOT NULL,
    Duration NUMBER(3),
    Credits NUMBER(2)
);

CREATE TABLE STUDENT_EMAIL (
    Student_ID NUMBER(10),
    Email_ID VARCHAR2(100),

    PRIMARY KEY (Student_ID, Email_ID),

    FOREIGN KEY (Student_ID)
    REFERENCES STUDENT(Student_ID)
);

CREATE TABLE STUDENT_PHONE (
    Student_ID NUMBER(10),
    Phone_No VARCHAR2(15),

    PRIMARY KEY (Student_ID, Phone_No),

    FOREIGN KEY (Student_ID)
    REFERENCES STUDENT(Student_ID)
);

CREATE TABLE FACULTY_EMAIL (
    Faculty_ID NUMBER(10),
    Email VARCHAR2(100),

    PRIMARY KEY (Faculty_ID, Email),

    FOREIGN KEY (Faculty_ID)
    REFERENCES FACULTY(Faculty_ID)
);

CREATE TABLE FACULTY_PHONE (
    Faculty_ID NUMBER(10),
    Phone_No VARCHAR2(15),

    PRIMARY KEY (Faculty_ID, Phone_No),

    FOREIGN KEY (Faculty_ID)
    REFERENCES FACULTY(Faculty_ID)
);

CREATE TABLE ENROLLMENT (
    Student_ID NUMBER(10),
    Faculty_ID NUMBER(10),
    Course_ID NUMBER(5),

    Enrollment_Date DATE,
    Grade VARCHAR2(5),

    PRIMARY KEY (Student_ID, Faculty_ID, Course_ID),

    FOREIGN KEY (Student_ID)
    REFERENCES STUDENT(Student_ID),

    FOREIGN KEY (Faculty_ID)
    REFERENCES FACULTY(Faculty_ID),

    FOREIGN KEY (Course_ID)
    REFERENCES COURSE(Course_ID)
);
