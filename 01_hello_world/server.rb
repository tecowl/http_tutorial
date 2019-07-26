require 'webrick'

srv = WEBrick::HTTPServer.new(
  DocumentRoot: File.expand_path('..', __FILE__),
  BindAddress: '127.0.0.1',
  Port: 8080,
)
srv.mount_proc '/' do |req, res|
  res.body = "Hello, World!"
end

Signal.trap(:INT){ srv.shutdown }
srv.start
