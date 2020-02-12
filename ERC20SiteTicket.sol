//2020-01-21 Toshiya Y
pragma solidity >=0.5.0 <0.7.0;

import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC20/ERC20Mintable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC20/ERC20Burnable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC20/ERC20Detailed.sol";



contract MyToken is ERC20Mintable, ERC20Burnable, ERC20Detailed {
    
    //ERC20Detailed Burnable Mintable準拠
    //name-symbol-decimals
    //Data is example.
    //if文を敢えて使わずrequireで対応。
    
    string private _name = "Test-SiteTicketToken";
    string private _symbol = "TESTSTT1";
    uint8 private _decimals = 0;
    uint value = 1000;
    
    //Creator address 
    //address private _creatorAddress = 0x86904339D23BF346C1FFF31Cc3Bb7262fa59d837;
    address private _creatorAddress = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;

    //Creator data
    string private _creatorName = "Toshiya Y ";
    string private _creatorContact = "github.com/Toshiya-Y-K-N";
    string private _creatorData =  "toshiya test site";

    //Site
    string private _creatorSitePassWord1 = "123456789";//FirstPassword
    string private _creatorSitePassWord2 = "ABCDEFG98765";//Firstpassword
    string private _creatorSiteAddress1 = "https://toshiyay1111.official.ec/secret_ec/";//example
    string private _creatorSiteAddress2 = "https://toshiyay2222.official.ec/secret_ec/";//example

    //fansite ticket value
    uint _siteTicketValue1 = 10 ;
    uint _siteTicketValue2 = 100 ; 
    
    //enableSwitch
    bool _enableFlag = true ; 


    
    //site section setter getter
    function setSitePassword1(string memory _newPassword) public onlyMinter {
        require(msg.sender == _creatorAddress);
        _creatorSitePassWord1 = _newPassword ; 
    } 
    function getSitePassword1() public view returns (string memory) {
        //ファンサイト入場できるトークンを持っているか確認する
        require(balanceOf( msg.sender ) > _siteTicketValue1 );
        //条件通りならばクリエイターのセットしたパスワードをリターンする
        return _creatorSitePassWord1;
    }


    function setSitePassword2(string memory _newPassword) public onlyMinter {
        require(msg.sender == _creatorAddress);
        _creatorSitePassWord2 = _newPassword ; 
    } 
    function getSitePassword2() public view returns (string memory) {
        require(balanceOf( msg.sender ) > _siteTicketValue2 );
        return _creatorSitePassWord2;
    }


    //address setter getter
    function setSiteAddress1(string memory _newAddress) public onlyMinter {
        require(msg.sender == _creatorAddress);
        _creatorSiteAddress1 = _newAddress ; 
    } 
    function getSiteAddress1() public view  returns (string memory) {
        require(balanceOf( msg.sender ) > _siteTicketValue1 );
        return _creatorSiteAddress1; 
    }
    
    
    function setSiteAddress2(string memory _newAddress) public onlyMinter {
        require(msg.sender == _creatorAddress);
        _creatorSiteAddress2 = _newAddress ; 
    } 
    function getSiteAddress2() public view returns (string memory) {
        require(balanceOf( msg.sender ) > _siteTicketValue2 );
        return _creatorSiteAddress2; 
    }
    
    //サークルサイト入場のための閾値を決める
    function setSiteValue1(uint _newSiteValue) public {
        require(msg.sender == _creatorAddress);
        _siteTicketValue1 = _newSiteValue ; 
    }
    function setSiteValue2(uint _newSiteValue) public {
        require(msg.sender == _creatorAddress);
        _siteTicketValue2 = _newSiteValue ; 
    }
    
    //このコントラクトが有効か無効か。この契約は無効かどうか決めるフラグ
    function setFlag(bool _newFlag) public {
        require(msg.sender == _creatorAddress);
        _enableFlag = _newFlag ; 
    }
    function isThisERC20Enable() public view returns (bool) {
        return _enableFlag; 
    }

////////////////////////////////////////////////////////////////    
    //Creator Data Section　省略

///////////////////////////////////////////////////////////////////////////////////////////////
    constructor()
        ERC20Detailed(_name, _symbol, _decimals)
        ERC20Burnable()
        ERC20Mintable()
        public
    {
        _mint(msg.sender, value);
    }
}
