const HelloWorld=artifacts.require("HelloWorld")

contract('HelloWorld',()=>{
    it("Should return hello world",async()=>{
        const helloWorld=await HelloWorld.deployed();
        const res=await helloWorld.hello();
        assert(res==='Hello World');
    })
})