using Z as service from '../../srv/main';
annotate service.Books with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'genre',
                Value : genre,
            },
            {
                $Type : 'UI.DataField',
                Label : 'publishedAt',
                Value : publishedAt,
            },
            {
                $Type : 'UI.DataField',
                Label : 'price',
                Value : price,
            },
            {
                $Type : 'UI.DataField',
                Label : 'pages',
                Value : pages,
            },
            {
                $Type : 'UI.DataField',
                Value : status_code,
                Label : 'Availibility',
                Criticality : status.criticality,
                CriticalityRepresentation : #WithIcon,
            },
            {
                $Type : 'UI.DataField',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Value : currency_code,
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
            Label : 'Entry Section',
            ID : 'EntrySection',
            Target : '@UI.FieldGroup#EntrySection',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Chapters',
            ID : 'Chapters',
            Target : 'Chapters/@UI.LineItem#Chapters',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Book Title',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Label : 'genre',
            Value : genre,
        },
        {
            $Type : 'UI.DataField',
            Label : 'publishedAt',
            Value : publishedAt,
            @UI.Importance : #Low,
        },
        {
            $Type : 'UI.DataField',
            Label : 'price',
            Value : price,
        },
        {
            $Type : 'UI.DataField',
            Label : 'pages',
            Value : pages,
        },
        {
            $Type : 'UI.DataField',
            Value : author.name,
            Label : 'name',
        },
        {
            $Type : 'UI.DataField',
            Value : stock,
            Label : 'stock',
            @UI.Importance : #High,
        },
        {
            $Type : 'UI.DataField',
            Value : status_code,
            Label : 'status_code',
            Criticality : status.criticality,
            CriticalityRepresentation : #WithIcon,
            @UI.Importance : #High,
        },
    ],
    UI.SelectionFields : [
        status_code,
    ],
    UI.HeaderInfo : {
        TypeName : 'Book',
        TypeNamePlural : 'Books',
    },
    UI.FieldGroup #EntrySection : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },
            {
                $Type : 'UI.DataField',
                Value : createdBy,
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedAt,
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedBy,
            },
        ],
    },
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Header',
            ID : 'Header',
            Target : '@UI.FieldGroup#Header',
        },
    ],
    UI.FieldGroup #Header : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : title,
            },
        ],
    },
);

annotate service.Books with {
    author @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Authors',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : author_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
        ],
    }
};

annotate service.Books with {
    title @(
        Common.Label : 'Filter for Title',
        UI.MultiLineText : true,
    )
};

annotate service.Chapters with @(
    UI.LineItem #Chapters : [
        {
            $Type : 'UI.DataField',
            Value : book.Chapters.number,
            Label : 'number',
        },
        {
            $Type : 'UI.DataField',
            Value : book.Chapters.pages,
            Label : 'pages',
        },
        {
            $Type : 'UI.DataField',
            Value : book.Chapters.title,
            Label : 'title',
        },
    ]
);

annotate service.Books with {
    status @(
        Common.Text : status.displayText,
        Common.Label : 'status_code',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'BookStatus',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : status_code,
                    ValueListProperty : 'code',
                },
            ],
            Label : 'Availibility',
            PresentationVariantQualifier : 'vh_Books_status',
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.BookStatus with @(
    UI.PresentationVariant #vh_Books_status : {
        $Type : 'UI.PresentationVariantType',
        SortOrder : [
            {
                $Type : 'Common.SortOrderType',
                Property : code,
                Descending : false,
            },
        ],
    }
);

annotate service.BookStatus with {
    code @Common.Text : displayText
};

annotate service.Books with {
    currency @Common.ValueListWithFixedValues : true
};

