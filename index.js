// Init express
var express = require('express');
var bodyParser = require('body-parser');
var app = express();
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
var fishRouter = express.Router();

//init mysql
var mysql = require('mysql');
var connection = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	database: 'tag4reel'
});


// Speed up calls to hasOwnProperty
var hasOwnProperty = Object.prototype.hasOwnProperty;

function isEmpty(obj) {

    // null and undefined are "empty"
    if (obj == null) return true;

    // Assume if it has a length property with a non-zero value
    // that that property is correct.
    if (obj.length > 0)    return false;
    if (obj.length === 0)  return true;

    // Otherwise, does it have any properties of its own?
    // Note that this doesn't handle
    // toString and valueOf enumeration bugs in IE < 9
    for (var key in obj) {
        if (hasOwnProperty.call(obj, key)) return false;
    }

    return true;
}

connection.connect();

function buildSQL(tableName, params) {
	var stringToReturn = 'SELECT * FROM ' + tableName;
	console.log(params.length);
	if(!isEmpty(params)) {
		stringToReturn += ' WHERE ';
		var isFirst = true;
		for(attrName in params) {
			if (!isFirst){
				stringToReturn += ' AND ';
			}
			stringToReturn += attrName + ' = ' + params[attrName];
			isFirst = false;
		}
	}
	stringToReturn += ';';
	return stringToReturn;

}

function buildSQLArray(tableName, params) {
	var toReturn = [];
	toReturn.push(tableName);
	for (key in params) {
		toReturn.push(key);
		toReturn.push(params[key]);
	}
	return toReturn;
}

function buildSQLString(tableName, params) {
	var formatString = 'SELECT * FROM ??';
	if(!isEmpty(params)) {
		formatString += ' WHERE ';
		var isFirst = true;
		for(key in params) {
			if (!isFirst) {
				formatString += ' AND '; 
			}
			formatString += '?? = ?';
			isFirst = false;
		}
	}
	formatString += ';';
	return formatString;
}


//Returns a list of all of the fish.
fishRouter.route('/api/fish').get(function(req, res, next) {
	var sqlArray = buildSQLArray('fish', req.query);
	var sqlString = buildSQLString('fish', req.query);
		connection.query(sqlString, sqlArray, function(err, rows, fields) {
			if(err)
				res.json(err);
			res.json(rows);
		});
})
.post(function(req, res, next) {
	connection.query('INSERT INTO fish SET ?;', req.body, function(err, result) {
		if(err)
			res.json(err);
		res.json(result);
	});
});

fishRouter.route('/api/updatefish').post(function(req, res, next){
	if(!req.body.tag_id || req.body.tag_id < 1) {

	} else {
		connection.query('UPDATE fish SET ? WHERE tag_id = ' + req.body.tag_id + ';', req.body, function(err, result){
			if(err)
				res.json(err);
			res.json(result);
		});
	}
});;



//Returns a list of all of the species.
fishRouter.route('/api/species').get(function(req, res, next) {
	var sqlArray = buildSQLArray('species', req.query);
	var sqlString = buildSQLString('species', req.query);
		connection.query(sqlString, sqlArray, function(err, rows, fields) {
			if(err)
				res.json(err);
			res.json(rows);
		});
})
.post(function(req, res, next) {
	connection.query('INSERT INTO species SET ?;', req.body, function(err, result) {
		if(err)
			res.json(err);
		res.json(result);
	});
});

fishRouter.route('/api/updatespecies').post(function(req, res, next){
	if(!req.body.species_id || req.body.species_id < 1) {

	} else {
		connection.query('UPDATE species SET ? WHERE species_id = ' + req.body.species_id + ';', req.body, function(err, result){
			if(err)
				res.json(err);
			res.json(result);
		});
	}
});

fishRouter.route('/api/specieslike').get(function(req, res, next){
	connection.query('SELECT * FROM species WHERE name LIKE \'' + req.query.name + '%\';', function(err, rows, fields) {
		res.json(rows);
	});
});

fishRouter.route('/api/catch').get(function(req, res, next) {

	var sqlArray = buildSQLArray('catch', req.query);
	var sqlString = buildSQLString('catch', req.query);
		connection.query(sqlString, sqlArray, function(err, rows, fields) {
			if(err)
				res.json(err);
			res.json(rows);
		});
	}
)
.post(function(req, res, next) {
	connection.query('INSERT INTO catch SET ?;', req.body, function(err, result) {
		if(err)
			res.json(err);
		res.json(result);
	});
});

fishRouter.route('/api/updatecatch').post(function(req, res, next){
	if(!req.body.catch_id || req.body.catch_id < 1) {

	} else {
		connection.query('UPDATE catch SET ? WHERE catch_id = ' + req.body.catch_id + ';', req.body, function(err, result){
			if(err)
				res.json(err);
			res.json(result);
		});
	}
});

fishRouter.route('/api/deletecatch').post(function(req, res, next) {
	if(!req.body.catch_id || req.body.catch_id < 1) {
		res.send(400);
	} else {
		connection.query('DELETE FROM catch WHERE catch_id = ' + req.body.catch_id + ';', function(err, result) {
			if(err)
				res.json(err);
			res.json({affectedRows: result.affectedRows});
		});
	}
});

fishRouter.route('/api/angler').get(function(req, res, next) {

	var sqlArray = buildSQLArray('angler', req.query);
	var sqlString = buildSQLString('angler', req.query);
		connection.query(sqlString, sqlArray, function(err, rows, fields) {
			if(err)
				res.json(err);
			res.json(rows);
		});
	}
)
.post(function(req, res, next) {
	connection.query('INSERT INTO angler SET ?;', req.body, function(err, result) {
		if(err)
			res.json(err);
		res.json(result);
	});
});

fishRouter.route('/api/updateangler').post(function(req, res, next){
	if(!req.body.angler_id || req.body.angler_id < 1) {
		res.send(400);
	} else {
		connection.query('UPDATE angler SET ? WHERE angler_id = ' + req.body.angler_id + ';', req.body, function(err, result){
			if(err)
				res.json(err);
			res.json(result);
		});
	}
});



app.use(fishRouter);
app.listen(3000, function(){
	console.log('Listening on port 3000.');
});