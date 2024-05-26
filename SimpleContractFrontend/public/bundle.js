var contractABI=[];
var contractAddress='0xef59C73bA6B7d3D8D2f68f9c521051463a3DCABe';
var web3=new Web3('https://localhost:9545')
console.log(web3);
var simpleSmartContract=new web3.eth.Contract(contractABI,contractAddress);
console.log(simpleSmartContract)

web3.eth.getAccounts()
.then(console.log);