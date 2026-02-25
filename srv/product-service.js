const cds = require('@sap/cds');

module.exports = cds.service.impl(async function(srv) {
    
    srv.on('MyFunction', async(req) => {
        let result =`Super Cool ${req.data.name}`
        return result
    })
    srv.on('MyAction', async(req) => {
        let result =`Super Cool ${req.data.name}`
        return result
    })
})