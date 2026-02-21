//@protocol: 'rest'
service product {
    function printhelloworld (input: String)returns String;

    function addition(num1: Integer,num2: Integer)returns Integer;

    function subtraction(num1: Integer,num2: Integer)returns Integer;
    
    @open
    type object {};
    function myfunction(category: Integer)returns object;


    }