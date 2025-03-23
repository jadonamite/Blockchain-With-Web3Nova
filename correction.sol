// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

        contract Salarytracker{
            struct Employee{
                string name;
                uint256 salary;
                address employeeAddress;
                string Gender;
            }

            mapping(string department => mapping(string _name => Employee )) EmployeeDetails;

            function addEmployee(string memory _department, string memory _name ,uint  _salary, string memory _gender)  external{
                EmployeeDetails[_department][_name] = Employee(_name, _salary , msg.sender,_gender);
   
         }  
            function updateSalary(string memory _department, string memory _name, uint256 _newSalary) public {
                Employee storage newEmployee = EmployeeDetails[_department][_name] ;
                newEmployee.salary = _newSalary;}
   
            function fetchSalary( string memory _department,string memory _name ) public view returns(uint _salary){
                return EmployeeDetails[_department][_name].salary;
            }
  
    } 