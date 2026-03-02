const cds = require('@sap/cds');

module.exports = cds.service.impl(async function (srv) {

    const { Product } = srv.entities;

    /* ============================
       Function & Action Examples
    ============================= */

    srv.on('MyFunction', async (req) => {
        return `Super Cool ${req.data.name}`;
    });

    srv.on('MyAction', async (req) => {
        return `Super Cool ${req.data.name}`;
    });

    /* ============================
       Order Product Logic
    ============================= */

    srv.on('orderProduct', async (req) => {

        // 🔹 Extract ID properly from bound action
        const ID = req.params[0]?.ID;

        if (!ID) {
            return req.error(400, 'Product ID is missing');
        }

        if (!req.data.stock || req.data.stock <= 0) {
            return req.error(400, 'Stock increment must be greater than 0');
        }

        // 🔹 Use transaction for safe execution
        const tx = cds.transaction(req);

        // 🔹 Fetch product safely
        const product = await tx.run(
            SELECT.one
                .from(Product)
                .columns('stock')
                .where({ ID })
        );

        if (!product) {
            return req.error(404, 'Product not found');
        }

        const currentStock = product.stock;

        console.log("Current Stock:", currentStock);

        // 🔹 Business Validation
        if (currentStock > 500) {
            return req.error(400, 'Stock should not be greater than 500');
        }

        // 🔹 Atomic Update (Race-condition safe)
        await tx.run(
            UPDATE(Product)
                .set({ stock: { '+=': req.data.stock } })
                .where({ ID })
        );

        // 🔹 Fetch updated value (optional but good practice)
        const updatedProduct = await tx.run(
            SELECT.one
                .from(Product)
                .columns('stock')
                .where({ ID })
        );

        console.log("Updated Stock:", updatedProduct.stock);

        return  {
            message: "Stock updated successfully",
            previousStock: currentStock,
            updatedStock: updatedProduct.stock
        };
    });

});