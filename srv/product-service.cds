using { sap.cap.productshop as my } from '../db/schema';

service productshop
{
    //@odata.draft.enabled
    entity Product as
        projection on my.Product
        actions
        {
            action orderProduct
            (
                @title : 'stock'
                stock : Integer
            );

            action CreatePO
            (
                name : String
            );

            action fingerprint
            (
                @title : 'User Name'
                username : String
            );
        };

    entity Suppiler as
        projection on my.Suppiler;

    function MyFunction
    (
        name : String
    )
    returns String;

    action MyAction
    (
        name : String
    )
    returns String;
}

//annotate productshop with @(requires:'productmanager');
