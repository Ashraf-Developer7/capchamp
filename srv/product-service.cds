using {sap.cap.productshop as my} from '../db/schema';

service productshop {

    entity Product as projection on my.Product actions{
        action orderProduct(name:String,stock:Integer);
        action CreatePO(name:String);
    };
    entity Suppiler as projection on my.Suppiler;

    function MyFunction (name:String) returns String;

    Action MyAction (name:String) returns String;
}