const SimpleSmartContract=artifacts.require('SimpleSmartContract')
contract('SimpleSmartContract',()=>{
    it('Should Deploy Smart Contract Properly',async()=>{
        const simpleSmartContract=await SimpleSmartContract.deployed();
        console.log(simpleSmartContract.address);
        assert(simpleSmartContract.address!="");
    })
});