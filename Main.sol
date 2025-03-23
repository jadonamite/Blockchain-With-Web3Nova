// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract StudentRecord{


    struct Student{
        string name;
        uint256 age;
        uint256 studentsID;
        uint256 grades;
    }
    Student[] public Cohort;
    mapping (uint256 => Student) public studentRecords;

    function addStudents(
        string memory _name,
        uint256 _age ,
        uint256 _studentsID,
         uint256 _grades
         )
          public {
     Student memory newStudent = Student({
        name: _name,
        age: _age,
        studentsID: _studentsID,
        grades: _grades
     });
     Cohort.push(newStudent);
     studentRecords[_studentsID] = newStudent;
    }

    function updateStudent(

            uint256 _studentsID,
            string memory _name,
            uint256 _age,
            uint256 _grades
        ) public {
            Student memory student = studentRecords[_studentsID];
            student.name = _name;
            student.age = _age;
            student.grades = _grades;
            studentRecords[_studentsID] = student;
            Cohort[_studentsID] = student;

    }
function getStudent(uint256 _studentsID) public view returns (string memory){
    return studentRecords[_studentsID].name;
}
function getTotalStudent() public view returns (uint256) {
    return Cohort.length;
}
}
