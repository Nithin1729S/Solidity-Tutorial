// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract Twitter {
    uint16 public MAX_TWEET_LENGTH=280;
    struct Tweet{
        uint256 id;
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }
    // add our code
    mapping(address => Tweet[] ) public tweets;  //map name
    address public owner;
    constructor(){
        owner=msg.sender;
    }

    modifier  onlyOwner()
    {
        require(msg.sender==owner,"You are not the owner");
        _;
    }

    function changeTweetLenght(uint16 newTweetLength) public onlyOwner{
        MAX_TWEET_LENGTH=newTweetLength;
    }

    function createTweet(string memory _tweet) public {
        require(bytes(_tweet).length<=MAX_TWEET_LENGTH,"Tweet is too long");
        Tweet memory newTweet=Tweet({
            id:tweets[msg.sender].length,
            author:msg.sender,
            content:_tweet,
            timestamp:block.timestamp,
            likes:0


        });
        tweets[msg.sender].push(newTweet);  //msg.sender has our public address
    }

    function likeTweet(address author, uint256 id) external{
        require(tweets[author][id].id==id,"Tweet does not exist");
        tweets[author][id].likes++;
    }

    function unlikeTweet(address author, uint256 id) external{
        require(tweets[author][id].id==id,"Tweet does not exist");
        require(tweets[author][id].likes>0,"Tweet has no likes");
        tweets[author][id].likes--;
    }

    function getTweet(uint _i) public view returns (Tweet memory) {
        return tweets[msg.sender][_i];
    }

    function getAllTweets(address _owner) public view returns (Tweet[] memory ){
        return tweets[_owner];
    }

}
 
