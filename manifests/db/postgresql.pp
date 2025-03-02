# == Class: cinder::db::postgresql
#
# Class that configures postgresql for cinder
# Requires the Puppetlabs postgresql module.
#
# === Parameters
#
# [*password*]
#   (Required) Password to connect to the database.
#
# [*dbname*]
#   (Optional) Name of the database.
#   Defaults to 'cinder'.
#
# [*user*]
#   (Optional) User to connect to the database.
#   Defaults to 'cinder'.
#
#  [*encoding*]
#    (Optional) The charset to use for the database.
#    Default to undef.
#
#  [*privileges*]
#    (Optional) Privileges given to the database user.
#    Default to 'ALL'
#
class cinder::db::postgresql(
  $password,
  $dbname     = 'cinder',
  $user       = 'cinder',
  $encoding   = undef,
  $privileges = 'ALL',
) {

  include cinder::deps

  openstacklib::db::postgresql { 'cinder':
    password   => $password,
    dbname     => $dbname,
    user       => $user,
    encoding   => $encoding,
    privileges => $privileges,
  }

  Anchor['cinder::db::begin']
  ~> Class['cinder::db::postgresql']
  ~> Anchor['cinder::db::end']
}
