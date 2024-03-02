//SPDX-Licencse-Identifier: GPL-3.0
// SPDX-License-Identifier: MIT
pragma solidity >0.4.0 < 0.9.0;
contract Purchase {
    address public seller;
    string public contractInformation;
    string public owner;

    modifier onlySeller(){
        require(
            msg.sender == seller,
            "Only seller can call this"
        );
        _;
    }

    function abort() public view onlySeller{

    }

    //함수 수정자
    modifier onlyOwner{
    if(msg.sender!=owner) throw;
         _;
    }

    function setContractInformation(string info) onlyOwner{
        contractInformation = info;
    }
    // 위 22~29코드는 다음 아래코드와 같이 해석된다.
    function setContractInformation(string info) onlyOwner{
        if(msg.sender != owner) throw;
        contractInformation = info;
    };

    //throw; 의미 : 트랜잭션 실행중 오류가 발생하면 해당 트랜젝션에 할당한 소비예정가스가 모두
    // 마이너에게 지급된후 이전 state로 상태정보를 회귀 

   //msg.sender는 가장 중요한 전역변수중 하나
   // msg.sender는 현재 스마트계약을 호출한 계정의 주소 
    // require : 특정한 조건이 false일때 에러를 발생하고 gas를 환불시켜줌
    // revert 조건없이 에러를 발생시키고 가스를 환불
    // assert gas를 다소비한 후 조건이 false일때 에러 발생

   // msg.sender 예제 .
   contract MyContract{
    address owner; 

    //consructor(생성자) : 생성자는 계약이 배포될떄 호출된다.
    // 생성자는 단1개 생성자만 작성해야된다. 
    //생정자 규칙 : https://caileb.tistory.com/137
    constructor() public {
        owner = msg.sender;
    }
    
    fucntion ownerSomething() public {
        require(msg.sender == owner, "You ar not the owner of this contract");
        //owner만이 할수있는 기능 작성 
    }
   }
   
}

