pragma solidity ^0.4.23;

import "openzeppelin-solidity/contracts/token/ERC721/ERC721.sol";

contract StarNotary is ERC721 { 

    struct Coordinators {
        string Dec;
        string Mag;
        string Cent;
    }

    struct Star { 
        string name;
        Coordinators coords;
        string story; 
    }

    mapping(uint256 => Star) private _tokenIdToStarInfo;
    mapping(uint256 => uint256) public starsForSale;

    mapping(bytes32 => bool) private existingDec;
    mapping(bytes32 => bool) private existingMag;
    mapping(bytes32 => bool) private existingCent;

    function createStar(string _name, uint256 _tokenId, string _dec, string _mag, string _cent, string _story) public { 
        require(checkIfStarExist(_dec, _mag, _cent) == true, "Star already exists for the given coordinates");
        existingDec[keccak256(abi.encodePacked(_dec))] = true;
        existingMag[keccak256(abi.encodePacked(_mag))] = true;
        existingCent[keccak256(abi.encodePacked(_cent))] = true;

        Coordinators memory newCoords = Coordinators(_dec, _mag, _cent);
        Star memory newStar = Star(_name, newCoords, _story);

        _tokenIdToStarInfo[_tokenId] = newStar;

        mint(_tokenId);
    }

    function putStarUpForSale(uint256 _tokenId, uint256 _price) public { 
        require(this.ownerOf(_tokenId) == msg.sender, "User does not own this star");

        starsForSale[_tokenId] = _price;
    }

    function buyStar(uint256 _tokenId) public payable { 
        require(starsForSale[_tokenId] > 0, "This star is not for sale");
        
        uint256 starCost = starsForSale[_tokenId];
        address starOwner = this.ownerOf(_tokenId);
        require(msg.value >= starCost, "Insufficient payment");

        _removeTokenFrom(starOwner, _tokenId);
        _addTokenTo(msg.sender, _tokenId);
        
        starOwner.transfer(starCost);

        if(msg.value > starCost) { 
            msg.sender.transfer(msg.value - starCost);
        }
    }

    function checkIfStarExist(string _dec, string _mag, string _cent) public view returns(bool) {
        return !existingDec[keccak256(abi.encodePacked(_dec))]
            && !existingMag[keccak256(abi.encodePacked(_mag))]
            && !existingCent[keccak256(abi.encodePacked(_cent))];
    }

    function mint(uint256 _tokenId) public {
        _mint(msg.sender, _tokenId);
    }

    // function approve() public {

    // }

    // function safeTransferFrom() public {

    // }

    // function SetApprovalForAll() public {

    // }

    // function getApproved() public {

    // }

    // function isApprovedForAll() public {
        
    // }

    // function ownerOf() public {
        
    // }

    // function starsForSale() public {
    //     starsForSale
    // }

    function tokenIdToStarInfo (uint256 _tokenId) public view returns (
            string,
            string,
            string,
            string,
            string){
        Star memory starInfo = _tokenIdToStarInfo[_tokenId];
        return (starInfo.name, starInfo.story, starInfo.coords.Dec, starInfo.coords.Mag, starInfo.coords.Cent);
    }
}