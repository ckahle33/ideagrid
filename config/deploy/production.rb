set :chruby_ruby, 'ruby-2.5.1'

set :ssh_options, {
   keys: %w(~/.ssh/id_rsa),
   forward_agent: true,
   auth_methods: %w(publickey)
 }
#
# The server-based syntax can be used to override options:
# ------------------------------------
server "178.128.176.93", user: "ideagrid", roles: %w{web app, db}
set :branch, :master
