namespace sap.cap.productshop;

entity Product {
    key ID       : Integer;
        name     : String(50);
        stock    : Integer;
        price    : Integer;
        category : String(100);
}

entity Suppiler {
    key ID    : Integer;
        name  : String(100);
        city  : String(100);
        phone : Integer;
}
