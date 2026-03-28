sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"bookslistview/test/integration/pages/BooksList",
	"bookslistview/test/integration/pages/BooksObjectPage"
], function (JourneyRunner, BooksList, BooksObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('bookslistview') + '/test/flpSandbox.html#bookslistview-tile',
        pages: {
			onTheBooksList: BooksList,
			onTheBooksObjectPage: BooksObjectPage
        },
        async: true
    });

    return runner;
});

