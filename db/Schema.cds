namespace myapp;

using {
    cuid,
    managed,
    Currency
} from '@sap/cds/common';

using { Attachments } from '@cap-js/attachments';



entity BookStatus {
    key code : String(1) enum 
{
  Available = 'A';
  Low_Stock = 'L';
  Unavailable = 'U';
};
 criticality : Integer;
 displayText : String;
}

type Genre : String enum 
{
    Fiction = 'Fiction';
    Science = 'Science';
    Horror  = 'Horror';
    Religion = 'Religon';

};

entity Genres  {

    key code : Genre;
        descr : String;

}

entity Random
{
    key ID : Integer;
        name : String;
}

entity Books : cuid, managed {
    title       : String;
    author      : Association to Authors;
    genre       : Association to Genres;
    publishedAt : Date;
    price       : Decimal(9, 2);
    currency    : Currency;
    pages       : Integer;
    stock       : Integer;
    status      : Association to BookStatus;
    Chapters    : Composition of many Chapters
                      on Chapters.book = $self;
}

entity Authors : cuid, managed {
    name  : String;
    attachments : Composition of  many Attachments;
    books : Association to many Books
                on books.author = $self;
}

entity Chapters : cuid, managed {
    key book   : Association to Books;
        number : Integer;
        title : String;
        pages : Integer;
}
