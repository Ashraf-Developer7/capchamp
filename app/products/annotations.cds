using productshop as service from '../../srv/product-service';
using from '../../db/schema';

annotate service.Product with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Name}',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'price',
                Value : price,
            },
            {
                $Type : 'UI.DataField',
                Label : 'category',
                Value : category,
            },
            {
                $Type : 'UI.DataField',
                Label : 'rating',
                Value : rating,
            },
            {
                $Type : 'UI.DataField',
                Label : 'stock',
                Value : stock,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Suppiler Information',
            ID : 'SuppilerInformation',
            Target : '@UI.FieldGroup#SuppilerInformation',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Conversation',
            ID : 'Conversation',
            Target : 'conversation/@UI.LineItem#Conversation',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'productshop.fingerprint',
            Label : '{i18n>Fingerprint}',
            Inline : true,
            Criticality : #Positive,
            IconUrl:'sap-icon://biometric-thumb'
        },
        {
            $Type : 'UI.DataField',
            Value : name,
            Label : '{i18n>Name}',
            @UI.Importance : #High,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'productshop.orderProduct',
            Label : '{i18n>OrderProduct}',
            Inline : true,
            Criticality : #Positive,
        },
        {
            $Type : 'UI.DataField',
            Value : stock,
            Label : '{i18n>Stock}',
        },
        {
            $Type : 'UI.DataField',
            Value : profit,
            Label : '{i18n>Profit}',
            Criticality : criticality,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'productshop.CreatePO',
            Label : '{i18n>PurchaseOrder}',
        },
        {
            $Type : 'UI.DataField',
            Value : price,
            Label : '{i18n>Price}',
        },
        {
            $Type : 'UI.DataField',
            Value : rating,
            Label : '{i18n>Rating}',
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : '@UI.DataPoint#criticality',
            Label : '{i18n>5StarRating}',
        },
    ],
    UI.SelectionFields : [
        suppiler.name,
        category,
    ],
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : name,
        },
        TypeName : '',
        TypeNamePlural : '',
        Description : {
            $Type : 'UI.DataField',
            Value : suppiler.name,
        },
        TypeImageUrl : 'sap-icon://add-equipment',
    },
    UI.Identification : [
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'productshop.orderProduct',
            Label : '{i18n>OrderProduct}',
            Criticality : #Positive,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'productshop.fingerprint',
            Label : '{i18n>Fingerprint}',
            Determining : true,
            Criticality : #Positive,
        
            
        },
    ],
    UI.FieldGroup #SuppilerInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : suppiler.ID,
                Label : 'ID',
            },
            {
                $Type : 'UI.DataField',
                Value : suppiler.name,
                Label : '{i18n>Name}',
            },
            {
                $Type : 'UI.DataField',
                Value : suppiler.phone,
                Label : 'phone',
            },
            {
                $Type : 'UI.DataField',
                Value : suppiler.city,
                Label : 'city',
            },
        ],
    },
    UI.DataPoint #criticality : {
        Value : criticality,
        Visualization : #Rating,
        TargetValue : 5,
    },
    UI.DataPoint #profit : {
        Value : profit,
        Visualization : #Progress,
        TargetValue : 50000,
    },
    UI.DataPoint #profit1 : {
        Value : profit,
        Visualization : #Progress,
        TargetValue : 10000,
        Criticality : profit,
    },
    UI.DataPoint #profit2 : {
        Value : profit,
        Visualization : #Progress,
        TargetValue : 100,
        Criticality : profit,
    },
);

annotate service.Product with {
    suppiler @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Suppiler',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : suppiler_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'city',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'phone',
            },
        ],
    }
};

annotate service.Suppiler with {
    name @(
        Common.Label : '{i18n>Product1}',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Suppiler',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : name,
                    ValueListProperty : 'name',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'city',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'phone',
                },
            ],
        },
        Common.ValueListWithFixedValues : false,
    )
};

annotate service.Product with {
    category @Common.Label : '{i18n>Category}'
};

annotate service.Product.conversation with @(
    UI.LineItem #Conversation : [
        {
            $Type : 'UI.DataField',
            Value : up_.conversation.processor,
            Label : 'processor',
        },
        {
            $Type : 'UI.DataField',
            Value : up_.conversation.message,
            Label : 'message',
        },
        {
            $Type : 'UI.DataField',
            Value : up_.conversation.timestamp,
            Label : 'timestamp',
        },
    ]
);

