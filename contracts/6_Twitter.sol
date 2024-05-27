// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract Twitter {

    struct Tweet{
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }
    // add our code
    mapping(address => Tweet[] ) public tweets;  //map name

    function createTweet(string memory _tweet) public {
        Tweet memory newTweet=Tweet({
            author:msg.sender,
            content:_tweet,
            timestamp:block.timestamp,
            likes:0


        });
        tweets[msg.sender].push(newTweet);  //msg.sender has our public address
    }

    function getTweet(address _owner, uint _i) public view returns (Tweet memory) {
        return tweets[_owner][_i];
    }

    function getAllTweets(address _owner) public view returns (Tweet[] memory ){
        return tweets[_owner];
    }

}
 
