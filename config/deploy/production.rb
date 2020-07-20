server "54.168.251.188", user: "ec2-user", roles: %w{app db web}
#serverのIPと、ログイン可能なuser名を記載してください


set :ssh_options, {
  keys: %w(~/.ssh/kondooo_key_rsa), #秘密キーのpathを記載
  forward_agent: true,
  auth_methods: %w(publickey),
  port: 22
}
