sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'logajog/orders/test/integration/FirstJourney',
		'logajog/orders/test/integration/pages/OrderList',
		'logajog/orders/test/integration/pages/OrderObjectPage',
		'logajog/orders/test/integration/pages/ItemObjectPage'
    ],
    function(JourneyRunner, opaJourney, OrderList, OrderObjectPage, ItemObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('logajog/orders') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheOrderList: OrderList,
					onTheOrderObjectPage: OrderObjectPage,
					onTheItemObjectPage: ItemObjectPage
                }
            },
            opaJourney.run
        );
    }
);