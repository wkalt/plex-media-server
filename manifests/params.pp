class plexmediaserver::params {
  # Get download URL
  case $::operatingsystem {
    'Darwin': {
      $plex_url      = 'https://downloads.plex.tv/plex-media-server/1.10.1.4602-f54242b6b'
      $plex_pkg      = 'PlexMediaServer-1.10.1.4602-f54242b6b-OSX.zip'
      $plex_provider = 'pkgdmg'
    }
    'Ubuntu': {
      $plex_url         = 'https://downloads.plex.tv/plex-media-server/1.10.1.4602-f54242b6b'
      $plex_pkg         = "plexmediaserver-1.10.1.4602-f54242b6b.${::architecture}.rpm"
      $plex_provider    = 'dpkg'
      $plex_ubuntu_deps = [ 'libavahi-core7', 'libdaemon0', 'avahi-daemon' ]
      $plex_config      = '/etc/default/plexmediaserver'
    }
    'Fedora': {
      $plex_url      = 'https://downloads.plex.tv/plex-media-server/1.10.1.4602-f54242b6b'
      $plex_pkg      = "plexmediaserver-1.10.1.4602-f54242b6b.${::architecture}.rpm"
      $plex_provider = 'rpm'
      $plex_config   = '/etc/sysconfig/PlexMediaServer'
    }
    'CentOS': {
      $plex_url      = 'https://downloads.plex.tv/plex-media-server/1.10.1.4602-f54242b6b'
      $plex_pkg      = "plexmediaserver-1.10.1.4602-f54242b6b.${::architecture}.rpm"
      $plex_provider = 'rpm'
      $plex_config   = '/etc/sysconfig/PlexMediaServer'
    }
    default: { fail("${::operatingsystem} is not supported by this module.") }
  }

  # General stuff
  $plex_user                                       = 'plex'
  $plex_media_server_home                          = '/usr/lib/plexmediaserver'
  $plex_media_server_application_support_dir_array = [
    '`getent passwd $PLEX_USER|awk -F : \'{print $6}\'`',
    '/Library/Application Support'
  ]
  $plex_media_server_application_support_dir =
    join($plex_media_server_application_support_dir_array, '')
  $plex_media_server_max_plugin_procs        = '6'
  $plex_media_server_max_stack_size          = '10000'
  $plex_media_server_max_lock_mem            = '3000'
  $plex_media_server_max_open_files          = '4096'
  $plex_media_server_tmpdir                  = '/tmp'
}
