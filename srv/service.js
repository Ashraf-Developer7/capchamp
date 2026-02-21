const cds = require('@sap/cds');

module.exports = cds.service.impl(async function(srv){
    srv.on('printhelloworld', req => {
        console.log(req.data)
        return `${req.data.input} world`
    })

    srv.on('addition',req =>{
        console.log(req.data)
        let result = req.data.num1 + req.data.num2;
        return result
    })

    srv.on('subtraction',req =>{
        console.log(req.data)
        let result = req.data.num1 - req.data.num2;
        return result
    })
    srv.on('myfunction',req => {

        let result = {}

        if(req.data.category == 1) {
            result.product = 'Lamborgini',
            result.price = '5000 USD',
            result.location ='America'
        }else {
            result.product ='BenZ',
            result.stock = 120,
            result.priceArray = [
                {
                    "Price": 700000,
                    "Discount": "15 %"
                }
            ]
        }
        console.log(result)
        return result;
    })
})