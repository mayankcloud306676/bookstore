using myapp from '../db/Schema';

service Z {
    entity Books as projection on myapp.Books;
    entity Authors as projection on myapp.Authors{
        *
    };
    entity Chapters as projection on myapp.Chapters;
}