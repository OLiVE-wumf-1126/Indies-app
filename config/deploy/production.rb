server "54.168.251.188", user: "kondooo", roles: %w{app db web}
#serverのIPと、ログイン可能なuser名を記載してください


set :ssh_options, {
  keys: %w(~/.ssh/kondooo.pem), #秘密キーのpathを記載
  forward_agent: true,
  auth_methods: %w(publickey),
  port: 22
}