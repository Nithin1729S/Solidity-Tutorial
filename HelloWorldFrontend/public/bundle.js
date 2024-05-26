var helloWorldABI = [
    {
        "constant": true,
        "inputs": [],
        "name": "hello",
        "outputs": [
            {
                "internalType": "string",
                "name": "",
                "type": "string"
            }
        ],
        "payable": false,
        "stateMutability": "pure",
        "type": "function"
    }
];
console.log("hi")
var helloWorldAddress = '0xef59C73bA6B7d3D8D2f68f9c521051463a3DCABe';
var web3 = new Web3('http://localhost:9545');
console.log(web3)
var helloWorld = new web3.eth.Contract(helloWorldABI, helloWorldAddress);
console.log(helloWorld.methods.hello())

// document.addEventListener('DOMContentLoaded', () => {
//     helloWorld.methods.hello().call()
//     .then(result => {
//         document.getElementById('hello').innerHTML = result;
//     })
//     .catch(error => {
//         console.error('Error calling hello method:', error);
//     });
// });