class sshkeyexport::collect (
  $project = "HOLA"
) {
  Ssh_authorized_key <<| tag=$project |>>
}

