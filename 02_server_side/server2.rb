# coding: utf-8
require 'webrick'
require 'yaml'

srv = WEBrick::HTTPServer.new(
  DocumentRoot: File.expand_path('..', __FILE__),
  BindAddress: '127.0.0.1',
  Port: 8080,
)
srv.mount_proc '/' do |req, res|
  d = {
    'request line' => req.request_line,
    'method' => req.request_method,
    'URI' => {
      'method' => req.request_method,
      'scheme' => req.request_uri.scheme,
      'user' => req.user,
      'userinfo' => req.request_uri.userinfo,
      'host' => req.host,
      'port' => req.port,
      'path' => req.path,
      'query' => req.query,
      'fragment' => req.request_uri.fragment,
    },
    'header' => req.header,
  }
  puts "=" * 60
  puts YAML.dump(d)
  puts "~" * 60
  puts "body:\n#{req.body}"
  puts "=" * 60
  res.body = "OK"
end

Signal.trap(:INT){ srv.shutdown }
srv.start
