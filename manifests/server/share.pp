# == Define samba::server::share
#
define samba::server::share($ensure = present,
                            $available = '',
                            $browsable = '',
                            $comment = '',
                            $copy = '',
                            $create_mask = '',
                            $directory_mask = '',
                            $force_create_mode = '',
                            $force_directory_mode = '',
                            $force_group = '',
                            $force_user = '',
                            $case_sensitive = '',
                            $preserve_case = '',
                            $short_preserve_case = '',
                            $guest_ok = '',
                            $guest_only = '',
                            $hide_unreadable = '',
                            $path = '',
                            $op_locks = '',
                            $level2_oplocks = '',
                            $veto_oplock_files = '',
                            $read_only = '',
                            $public = '',
                            $read_list = '',
                            $write_list = '',
                            $writable = '',
                            $printable = '',
                            $valid_users = '',
                            $follow_symlinks = '',
                            $wide_links = '',
                            $acl_group_control = '',
                            $map_acl_inherit = '',
                            $profile_acls = '',
                            $store_dos_attributes = '',
                            $strict_allocate = '',
                            $hide_dot_files = '',
                            $root_preexec = '',
                            $inherit_permissions = '',
                            $inherit_acls = '',
                            $delete_readonly = '',
                            $printer_name = '',
                            $msdfs_root = '',
                            $guest_account = '',
                            $hosts_allow = '',
                            $acl_allow_execute_always = '',
                            ) {

  $incl    = $samba::server::incl
  $context = $samba::server::context
  $target  = "target[. = '${name}']"

  $section_changes = $ensure ? {
    present => "set ${target} '${name}'",
    default => "rm ${target} '${name}'",
  }

  augeas { "${name}-section":
    incl    => $incl,
    lens    => 'Samba.lns',
    context => $context,
    changes => $section_changes,
    require => Class['samba::server::config'],
    notify  => Class['samba::server::service']
  }

  if $ensure == 'present' {
    $changes = [
      $available ? {
        true    => "set \"${target}/available\" yes",
        false   => "set \"${target}/available\" no",
        default => "rm  \"${target}/available\"",
      },
      $browsable ? {
        true    => "set \"${target}/browsable\" yes",
        false   => "set \"${target}/browsable\" no",
        default => "rm  \"${target}/browsable\"",
      },
      $comment ? {
        default => "set \"${target}/comment\" '${comment}'",
        ''      => "rm  \"${target}/comment\"",
      },
      $copy ? {
        ''      => "rm  \"${target}/copy\"",
        default => "set \"${target}/copy\" '${copy}'",
      },
      $create_mask ? {
        ''      => "rm  \"${target}/create mask\"",
        default => "set \"${target}/create mask\" '${create_mask}'",
      },
      $directory_mask ? {
        ''      => "rm  \"${target}/directory mask\"",
        default => "set \"${target}/directory mask\" '${directory_mask}'",
      },
      $force_create_mode ? {
        ''      => "rm  \"${target}/force create mode\"",
        default => "set \"${target}/force create mode\" '${force_create_mode}'",
      },
      $force_directory_mode ? {
        ''      => "rm  \"${target}/force directory mode\"",
        default => "set \"${target}/force directory mode\" '${force_directory_mode}'",
      },
      $force_group ? {
        ''      => "rm  \"${target}/force group\"",
        default => "set \"${target}/force group\" '${force_group}'",
      },
      $force_user ? {
        ''      => "rm  \"${target}/force user\"",
        default => "set \"${target}/force user\" '${force_user}'",
      },
      $case_sensitive ? {
        ''      => "rm  \"${target}/case sensitive\"",
        default => "set \"${target}/case sensitive\" '${case_sensitive}'",
      },
      $preserve_case ? {
        ''      => "rm  \"${target}/preserve case\"",
        default => "set \"${target}/preserve case\" '${preserve_case}'",
      },
      $short_preserve_case ? {
        ''      => "rm  \"${target}/short preserve case\"",
        default => "set \"${target}/short preserve case\" '${short_preserve_case}'",
      },
      $guest_ok ? {
        true    => "set \"${target}/guest ok\" yes",
        false   => "set \"${target}/guest ok\" no",
        default => "rm  \"${target}/guest ok\"",
      },
      $guest_only ? {
        true    => "set \"${target}/guest only\" yes",
        false   => "set \"${target}/guest only\" no",
        default => "rm  \"${target}/guest only\"",
      },
      $hide_unreadable ? {
        true    => "set \"${target}/hide unreadable\" yes",
        false   => "set \"${target}/hide unreadable\" no",
        default => "rm  \"${target}/hide unreadable\"",
      },
      $path ? {
        default => "set ${target}/path '${path}'",
        ''      => "rm  ${target}/path",
      },
      $read_only ? {
        true    => "set \"${target}/read only\" yes",
        false   => "set \"${target}/read only\" no",
        default => "rm  \"${target}/read only\"",
      },
      $public ? {
        true    => "set \"${target}/public\" yes",
        false   => "set \"${target}/public\" no",
        default => "rm  \"${target}/public\"",
      },
      $writable ? {
        true    => "set \"${target}/writable\" yes",
        false   => "set \"${target}/writable\" no",
        default => "rm  \"${target}/writable\"",
      },
      $printable ? {
        true    => "set \"${target}/printable\" yes",
        false   => "set \"${target}/printable\" no",
        default => "rm  \"${target}/printable\"",
      },
      $follow_symlinks ? {
        true    => "set \"${target}/follow symlinks\" yes",
        false   => "set \"${target}/follow symlinks\" no",
        default => "rm  \"${target}/follow symlinks\"",
      },
      $wide_links ? {
        true    => "set \"${target}/wide links\" yes",
        false   => "set \"${target}/wide links\" no",
        default => "rm  \"${target}/wide links\"",
      },
      $acl_group_control ? {
        true    => "set \"${target}/acl group control\" yes",
        false   => "set \"${target}/acl group control\" no",
        default => "rm  \"${target}/acl group control\"",
      },
      $map_acl_inherit ? {
        true    => "set \"${target}/map acl inherit\" yes",
        false   => "set \"${target}/map acl inherit\" no",
        default => "rm  \"${target}/map acl inherit\"",
      },
      $profile_acls ? {
        true    => "set \"${target}/profile acls\" yes",
        false   => "set \"${target}/profile acls\" no",
        default => "rm  \"${target}/profile acls\"",
      },
      $store_dos_attributes ? {
        true    => "set \"${target}/store dos attributes\" yes",
        false   => "set \"${target}/store dos attributes\" no",
        default => "rm  \"${target}/store dos attributes\"",
      },
      $strict_allocate ? {
        true    => "set \"${target}/strict allocate\" yes",
        false   => "set \"${target}/strict allocate\" no",
        default => "rm  \"${target}/strict allocate\"",
      },
      $valid_users ? {
        ''      => "rm  \"${target}/valid users\"",
        default => "set \"${target}/valid users\" '${valid_users}'",
      },
      $op_locks ? {
        ''      => "rm  \"${target}/oplocks\"",
        default => "set \"${target}/oplocks\" '${op_locks}'",
      },
      $level2_oplocks ? {
        ''      => "rm  \"${target}/level2 oplocks\"",
        default => "set \"${target}/level2 oplocks\" '${level2_oplocks}'",
      },
      $veto_oplock_files ? {
        ''      => "rm  \"${target}/veto oplock files\"",
        default => "set \"${target}/veto oplock files\" '${veto_oplock_files}'",
      },
      $read_list ? {
        ''      => "rm  \"${target}/read list\"",
        default => "set \"${target}/read list\" '${read_list}'",
      },
      $write_list ? {
        ''      => "rm  \"${target}/write list\"",
        default => "set \"${target}/write list\" '${write_list}'",
      },
      $hide_dot_files ? {
        true    => "set \"${target}/hide dot files\" yes",
        false   => "set \"${target}/hide dot files\" no",
        default => "rm  \"${target}/hide dot files\"",
      },
      $root_preexec ? {
        ''      => "rm  \"${target}/root preexec\"",
        default => "set \"${target}/root preexec\" '${root_preexec}'",
      },
      $inherit_permissions ? {
        true    => "set \"${target}/inherit permissions\" yes",
        false   => "set \"${target}/inherit permissions\" no",
        default => "rm  \"${target}/inherit permissions\"",
      },
      $inherit_acls ? {
        true    => "set \"${target}/inherit acls\" yes",
        false   => "set \"${target}/inherit acls\" no",
        default => "rm  \"${target}/inherit acls\"",
      },
      $delete_readonly ? {
        true    => "set \"${target}/delete readonly\" yes",
        false   => "set \"${target}/delete readonly\" no",
        default => "rm  \"${target}/delete readonly\"",
      },
      $printer_name ? {
        ''      => "rm  \"${target}/printer name\"",
        default => "set \"${target}/printer name\" '${printer_name}'",
      },
      $msdfs_root ? {
        true    => "set \"${target}/msdfs root\" yes",
        false   => "set \"${target}/msdfs root\" no",
        default => "rm  \"${target}/msdfs root\"",
      },
      $guest_account ? {
        ''      => "rm  \"${target}/guest account\"",
        default => "set \"${target}/guest account\" '${guest_account}'",
      },
      $hosts_allow ? {
        ''      => "rm  \"${target}/hosts allow\"",
        default => "set \"${target}/hosts allow\" '${hosts_allow}'",
      },
      $acl_allow_execute_always ? {
        true    => "set \"${target}/acl allow execute always\" yes",
        false   => "set \"${target}/acl allow execute always\" no",
        default => "rm  \"${target}/acl allow execute always\"",
      },
    ]

    augeas { "${name}-changes":
      incl    => $incl,
      lens    => 'Samba.lns',
      context => $context,
      changes => $changes,
      require => Augeas["${name}-section"],
      notify  => Class['samba::server::service']
    }
  }
}
