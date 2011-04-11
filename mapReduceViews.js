ouchapp = require('couchapp');
ddoc = {
  _id: '_design/app'
  , views: {}
}
module.exports = ddoc;

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


