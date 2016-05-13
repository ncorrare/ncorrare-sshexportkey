Facter.add('sshpubkey_puppet') do
  setcode do
    contents = File.read("#{ENV['HOME']}/.ssh/puppet.pub")
    pubkey = {}
    data = contents.split(' ')
    pubkey[type] = data[0]
    pubkey[key] = data[1]
    pubkey
  end
end
