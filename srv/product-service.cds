using {sap.cap.productshop as my} from '../db/schema';

service productshop {

    entity Product as projection on my.Product;
    entity Suppiler as projection on my.Suppiler;
}