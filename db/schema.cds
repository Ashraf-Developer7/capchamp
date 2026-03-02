namespace sap.cap.productshop;

using {
    cuid,
    managed
} from '@sap/cds/common';

aspect details {
    profit : Integer;
    rating : Integer;
}

entity Product : cuid, managed, details {
    name         : String(50);
    category     : String(100);
    price        : Integer;
    stock        : Integer;
    criticality:Integer;
    suppiler     : Association to one Suppiler;
    conversation : Composition of many {
                       key ID        : UUID;
                           timestamp : String;
                           processor : String;
                           message   : String;
                   }
}

entity Suppiler {
    key ID      : Integer;
        name    : String(100);
        city    : String(100);
        phone   : String(15);
        product : Association to many Product
                      on product.suppiler = $self;
}
