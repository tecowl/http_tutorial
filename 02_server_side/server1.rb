# coding: utf-8
require 'webrick'

srv = WEBrick::HTTPServer.new(
  DocumentRoot: File.expand_path('..', __FILE__),
  BindAddress: '127.0.0.1',
  Port: 8080,
)
srv.mount_proc '/' do |req, res|
  puts "=" * 60
  puts req.request_line # 1行目 (Initial) request line
  puts req.raw_header   # 2行目以降 header
  puts                  # 空白行
  puts req.body         # body
  puts "~" * 60
  res.body = "OK"
end

Signal.trap(:INT){ srv.shutdown }
srv.start
