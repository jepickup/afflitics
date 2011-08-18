var sio     = require('socket.io'),
    redis   = require('redis'),
    express = require('express'),
    stylus = require('stylus'),
    nib = require('nib');

var app = express.createServer();

app.configure(function () {
  app.use(stylus.middleware({ src: __dirname + '', compile: compile }))
  app.use(express.static(__dirname + ''));
  app.set('views', __dirname);
  app.set('view engine', 'jade');

  function compile (str, path) {
    return stylus(str)
    .set('filename', path)
    .use(nib());
  };
});

app.register('.html', require('jade'));
app.get('/', function (req, res) {
  res.render('client.html', { layout: false });
});

app.listen(3000, function () {
  var addr = app.address();
   console.log('   app listening on http://' + addr.address + ':' + addr.port);
});


var io = sio.listen(app)

io.sockets.on('connection', function(socket) {

  var token   = '',
      session = '';

  socket.on('auth', function(session_id) {

    session = session_id;
    //Dummy authentication
    token = 'win';

    console.log("Received session " + session_id);

    /* Rails session ID : User ID
     * is stored in Redis */

    // if(session_id in redis)
          sub.psubscribe("stats." + token + ".*");
          console.log("Subscribed to " + token);
          socket.emit('ready');
    /* else
     *  disconnect client
     */
  });

  var job = redis.createClient();
  var sub = redis.createClient();

  sub.on("pmessage", function(pattern, channel, message) {
        socket.emit(session, message);
  })

 socket.on('disconnect', function() {
   socket.del('token', function() {
     console.log("Token destroyed successfully");
   });
   job.quit();
   sub.quit();
 });

})
                
