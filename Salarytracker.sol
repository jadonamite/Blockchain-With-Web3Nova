// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

// Objective

/**
Features:
1. Add Candidates data : { Name, Age , isQualified ,  }
2. Vote Candidate
3. Get Total number of students
**/

contract Salarytracker{
   
    struct Employees{
        string name;
        uint salary ;
    }

    mapping (string => Employees) public employeesMap;


function addEmployee(string memory _name ,uint  _salary, string memory companyName)  external{
    Employees storage newEmployees = employeesMap[companyName];
    newEmployees.name = _name;
    newEmployees.salary=_salary;
      employeesMap[companyName] = newEmployees; 
         }  

function updateEmpSalary(string memory _name, uint salary )external{
    Employees storage emp1 =  employeesMap[_name];
    emp1.salary = salary;
       employeesMap[_name]=emp1; 
         }


function getEmpSalary(string memory _name)public view returns(uint){
            Employees storage emp1 =  employeesMap[_name];
            return (emp1.salary);
         }

function getEmpDetails(string memory company )external view returns ( string memory, uint) {
        Employees storage _employee  = employeesMap[company];
        return (_employee.name ,_employee.salary );
}}