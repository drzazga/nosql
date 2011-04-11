couchapp = require('couchapp');
ddoc = {
  _id: '_design/app'
  , views: {}
}
module.exports = ddoc;

ddoc.views.by_isbn = {
	map: function(doc) {
		if(doc.isbn13 == "")
			emit("one", 1);
		else
			emit("two", 1);
		},
	reduce: "_sum"
}

ddoc.views.by_numbers = {
	map: function(doc) {
			var cyferki = doc.isbn.split("");
			for(var i in cyferki)
				emit(i, 1);
		},
	reduce: "_sum"
}

