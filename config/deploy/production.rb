server "54.249.239.230", user: "ec2-user", roles: %w{app db web}
#serverのIPと、ログイン可能なuser名を記載してください


set :ssh_options, {
  keys: %w(~/.ssh/indies-app.pem), #秘密キーのpathを記載
  forward_agent: true,
  auth_methods: %w(publickey),
  port: 22
}
