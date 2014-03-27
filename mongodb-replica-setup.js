cfg = {
	_id : "abc",
	members : [
		{ _id : 0, host:"mongodbcourse:27001" },
		{ _id : 1, host:"mongodbcourse:27002" },
		{ _id : 2, host:"mongodbcourse:27003" }
	]
}
rs.initiate( cfg )
