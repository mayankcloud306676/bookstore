using myapp from '../db/Schema';

service Z {
    entity Books as projection on myapp.Books actions{
           @Common.SideEffects: { TargetProperties: ['stock'] }
        action addStock();
        @Common.SideEffects : {TargetProperties : ['publishedAt']}
        action changeDate(newDate:Date);
        @Common.SideEffects : { TargetProperties : ['status_code'] }
        action changeStatus( @(Common :{
           ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'BookStatus',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : newStatus,
                    ValueListProperty : 'code',
                },
            ],
            Label : 'Availibility',
            PresentationVariantQualifier : 'vh_Books_status',
        },
            ValueListWithFixedValues : true
         } ) newStatus:String);


    };

        @Common.SideEffects : {TargetEntities : ['/Z.EntityContainer/Books']}
    action addDiscount();
    entity Authors as projection on myapp.Authors{
        *
    };
    entity Chapters as projection on myapp.Chapters;
    entity BookStatus as projection on myapp.BookStatus;
    entity Genres as projection on myapp.Genres;
    

}



annotate Z.Books with @odata.draft.enabled;
annotate Z.Authors with @odata.draft.enabled;

