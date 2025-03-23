// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;


contract Library{

    struct Book{
        string title;
        uint copiesRemaining;
        uint bookIndex;
        bool isBorrowed;
        bool isReturned;
        Borrower[] hasBorrowed;
    }
    struct Borrower { 
        string borrowedBy;
        Book borrowedBook;
    }
  struct Returned { 
        string returnedBy;
        Book ReturnedBook;
    }


mapping(string => uint) public NametoBorrowersIndex;
    mapping (uint => Book) public booksId;
    mapping (string BorrowedBy => mapping (uint => Book) ) public borrowedBook;
   string[] public hasBorrowed;
   uint totalBorrowers;
    

    function addBook(string memory _title,uint _bookIndex, uint _copies )public { 
        Book storage newBook = booksId[_bookIndex];
        newBook.title = _title;
        newBook.copiesRemaining =_copies;
        newBook.bookIndex = _bookIndex;
        
    }

    function borrowingBook(uint256 _id,string memory _borrowedBy, uint _copiesBorrowed)public{
        booksId[_id].isBorrowed = true;
        Book storage BorrowedBooks = booksId[_id];
        borrowedBook[_borrowedBy][_id] = BorrowedBooks;
        BorrowedBooks.copiesRemaining -= _copiesBorrowed;
        hasBorrowed.push(_borrowedBy); 
        NametoBorrowersIndex[_borrowedBy] = totalBorrowers++;

    }
        function returnedBook(uint256 _id,string memory _returnedBy, uint _copiesReturned)public{
        booksId[_id].isReturned = true;
        Book storage BorrowedBooks = booksId[_id];
        borrowedBook[_returnedBy][_id] = BorrowedBooks;
         BorrowedBooks.copiesRemaining += _copiesReturned;
        uint indexposition = NametoBorrowersIndex[_returnedBy];
        hasBorrowed[indexposition] = hasBorrowed[hasBorrowed.length -1 ];
        hasBorrowed.pop();

        

    }
     function vieBorrowers() public view returns(string[] memory){
        return hasBorrowed;
        }

}