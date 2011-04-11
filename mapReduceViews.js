ouchapp = require('couchapp');
ddoc = {
  _id: '_design/app'
  , views: {}
}
module.exports = ddoc;

<<<<<<< HEAD
ddoc.views.by_date = {
	map: function(doc) {
		emit(doc.released.split("-"), 1);
			 },
	reduce: "_sum"
}

ddoc.views.by_runtime = {
  map: function(doc) {
	  emit([doc.runtime, doc.released.split("-")[0]], 1);
	     },
	reduce: "_sum"
=======
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
>>>>>>> 09a3050ea0e7f76345493e414498a45c2879c095
}

