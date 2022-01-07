package;

class Main {
  static function main() {
    #if !sys
    return Sys.stderr().writeString("No file system available!\n");
    #end
      
    // Configure the server storage files
      
    var storageDir = "serverStorage";
    var cp = Path.join(["C:\\", storageDir]);
    var cf = Path.join([cp, "config.json"]);
    
    var defaultCF = {
      
      ip: "127.0.0.1",
      port: 8000,
      
      serverName: "Example",
      serverDesc: "This is the default configuration for the Blockate server."
    
    };
    
    if (!FileSystem.isDirectory(cp)) { FileSystem.createDirectory(cp); }
    if (!FileSystem.exists(cf)) { File.saveContent(cf, JSON.stringify(defaultCF)); }
    
    // load config file
    
    var conf = File.getContent(cf);
    
    // load world
    
    var wf = Path.join([cp, "world.json"]);
    
    var defaultWF = {
      
      mode: 0,
      
      worldName: "New World",
    
    };
    
    if (!FileSystem.exists(wf)) { File.saveContent(wf, JSON.stringify(defaultWF)); }
    
    var world = File.getContent(wf);
    
    // Configure our HTTP server to respond with Hello World to all requests.
    var server = js.node.Http.createServer(function(request, response) {
      response.writeHead(200, {"Content-Type": "text/plain"});
      // response.end("Hello World\n");
      response.end(wf, cf);
    });

    // Listen on port 8000, IP defaults to 127.0.0.1
    server.listen(conf.port);

    // Put a console.log on the terminal
    trace('Server running at ${conf.ip}:${conf.port}');
  }
}
