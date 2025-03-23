// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

// Objective
/**
Features:
1. Add Student data : { Name, Age , ID , Grades }
2. Remove Student data by ID
3. Update Students data
4. Retrieve Students Details
5. Get Total number of students
**/



contract StudentRecord{
    struct StudentData{
        string name;
        uint age;
        string iD;
        Grade[] grades;
    }
    struct Grade{
        string  subjectName;
        uint marks;

    }
    Grade[] grades;
    uint totalNumberOfStudents;
    mapping(string => StudentData) public student;


    function addStudent(string memory _name, uint _age, string memory _iD)public{
            StudentData storage newStudent = student[_iD];
            newStudent.name = _name;
            newStudent.age=_age;
            newStudent.iD=_iD;
            totalNumberOfStudents += 1;
        }

    
    function removeStudent(string memory _iD )public {
        delete student[_iD];
        totalNumberOfStudents -= 1;
    }

    function updateStudentGrade(string memory _iD, string memory subjectName ,uint marks)public{
        Grade memory newGrade = Grade(subjectName , marks);
        StudentData storage newStudent = student[_iD];
        newStudent.grades.push(newGrade);
    }

// The Above can be also done using this method

     /**  function updateStudentGrade(string memory _iD, string memory subjectName ,uint marks)public{
        Grade memory newGrade = Grade(subjectName , marks);
        StudentData storage newStudent = student[_iD];
        newStudent.grades.push(newGrade);
    }
    **/
    function viewStudentsGrade(string memory _iD )public view returns (Grade[] memory) {
        return student[_iD].grades;
    } 
 function getTotalNumberOfStudents()public view returns (uint){
    return totalNumberOfStudents;
 }

}