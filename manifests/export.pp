class sshkeyexport::export (
  $project = "HOLA",
  $user    = "root",
)
) {
  if ($sshpubkey_puppet) {
    exec { 'ssh_keygen_puppet':
      command => 'ssh-keygen -P "" -t rsa -f ~/.ssh/puppet.pub',
      creates => '~/.ssh/puppet.pub',
    } 
  } else {
    @@ssh_authorized_key { "puppet@$fqdn":
      user => 'root',
      type => $sshpubkey_puppet::type,
      key  => $sshpubkey_puppet::key,
      tag  => $project,
    }
  }
}
