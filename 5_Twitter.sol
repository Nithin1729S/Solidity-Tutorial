// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract Twitter {

    // add our code
    mapping(address => string[] ) public tweets;  //map name

    function createTweet(string memory _tweet) public {
        tweets[msg.sender].push(_tweet);  //msg.sender has our public address
    }

    function getTweet(address _owner, uint _i) public view returns (string memory) {
        return tweets[_owner][_i];
    }

    function getAllTweets(address _owner) public view returns (string[] memory ){
        return tweets[_owner];
    }

}
 
