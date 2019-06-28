var mysql = require('mysql');
var express = require('express');
var session = require('express-session');
var bodyParser = require('body-parser');
var path = require('path');
var router = express.Router();
var connection = mysql.createConnection({
	host     : 'localhost',
	user     : 'root',
	password : '',
	database : 'loginforma'
});

var app = express();
app.use(session({
	secret: 'secret',
	resave: true,
	saveUninitialized: true
}));
app.use(bodyParser.urlencoded({extended : true}));
app.use(bodyParser.json());

app.use(express.static(path.join(__dirname, 'public')));

app.set('view engine', 'ejs');

// index page 
app.get('/', function(req, res) {
    res.render('pages/index');
});
// list page 
app.get('/listarticles', function(req, res) {
    res.render('pages/listarticles');
});
// create page 
app.get('/create', function(req, res) {
    res.render('pages/create');
});
//delete
app.get('/delete', function(req, res) {
    res.render('pages/delete');
});

/*
app.get('/', function(request, response) {
	response.sendFile(path.join(__dirname + '/index.html'));
});

app.get('/create', function(request, response) {
	response.sendFile(path.join(__dirname + '/create.html'));
});

app.get('/list', function(req, res) {
	res.render( 'C:\Users\mitar\Desktop\LoginForma\views\listarticles\ejs');
});*/

app.post('/auth', function(request, response) {
	var username = request.body.username;
	var password = request.body.password;
	if (username && password) {
		connection.query('SELECT * FROM users WHERE username = ? AND password = ?', [username, password], function(error, results, fields) {
			if (results.length > 0) {
				request.session.loggedin = true;
                request.session.userId = results[0].id;
                console.log( request.session.userId);
				response.redirect('/home');
			} else {
				response.send('Incorrect Username and/or Password!');
			}			
			response.end();
		});
	} else {
		response.send('Please enter Username and Password!');
		response.end();
	}
});

app.get('/home', function(request, response) {
	if (request.session.loggedin) {
	return	response.redirect('/list');
	} else {
		response.send('Please login to view this page!');
	}
	response.end();
});

//dodavanje vesti u bazu

app.post('/add',function(req, res) {

    console.log("userid " + req.session.userId);
    let title = req.body.title;
    let picture = req.body.picture;
    let text = req.body.text;
    let user_id = req.session.userId;
    
    connection.query("INSERT INTO `loginforma`.`articles` (`title`, `picture`, `text`, `user_id`) VALUES ('"+title+"', '"+picture+"', '"+text+"', '"+user_id+"');", function(err, result) {

        if (err) {
            throw err;
        } else {
            var data = {};
            res.json(req.body);
      }
    })
})

//prikaz vesti
/*app.get('/listarticles', function(req, res) {
    connection.query('SELECT article_id, title,text, password FROM articles', function(err, result) {
        if (err) {
            throw err;
        } else {
            
            console.log(main);
			res.render('listarticles', { data: results });
        }
    })
})*/

app.get('/logout', function(req, res){
  req.session.loggedin = false;
  req.session.userId = null;
  res.redirect('/')
});


app.get('/list', function(req, res){

    let userId = req.session.userId;
    connection.query('SELECT article_id, title,picture,text FROM articles where user_id = ?', [userId], function(err, result) {

        if(err){
            throw err;
        } else {
            main = result;
            console.log(main);
            res.render('pages/listarticles', main);                
        }
    });

});


//delete





app.get('/del',(req, res) => {
    let delete_id = req.query.articleId;
    console.log("delete " + delete_id);
    connection.query('DELETE FROM articles where article_id= ?', [delete_id],(err, rows,fields)=> {
        if (!err) {
            data = {
                deleted: true
            }
            res.redirect('/list');
            
        } else {
            console.log(err);
            console.log(main);
       }
   })
})

app.listen(3000);
console.log("Server running at http://localhost:3000/");