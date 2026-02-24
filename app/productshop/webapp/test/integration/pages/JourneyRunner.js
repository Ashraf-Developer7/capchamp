sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"ns/productshop/test/integration/pages/ProductList",
	"ns/productshop/test/integration/pages/ProductObjectPage"
], function (JourneyRunner, ProductList, ProductObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('ns/productshop') + '/test/flp.html#app-preview',
        pages: {
			onTheProductList: ProductList,
			onTheProductObjectPage: ProductObjectPage
        },
        async: true
    });

    return runner;
});

