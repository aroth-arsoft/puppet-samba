require 'spec_helper_acceptance'

describe 'basic samba' do
 context 'default parameters' do
    let(:pp) {"
      class { 'samba::server':
        workgroup     => 'example',
        server_string => 'Example Samba Server',
        dns_proxy     => 'no',
        server_role   => 'standalone server',
      }

      samba::server::share {'example-share':
        comment                   => 'Example Share',
        path                      => '/path/to/share',
        guest_only                => true,
        guest_ok                  => true,
        guest_account             => 'guest',
        browsable                 => false,
        create_mask               => 0777,
        force_create_mode         => 0777,
        directory_mask            => 0777,
        force_directory_mode      => 0777,
        force_group               => 'group',
        force_user                => 'user',
        hide_dot_files            => false,
        msdfs_root                => true,
        hosts_allow               => '127.0.0.1',
        acl_allow_execute_always  => true,
      }
    "}

    it 'should apply with no errors' do
      apply_manifest(pp, :catch_failures=>true)
    end

    it 'should be idempotent' do
      apply_manifest(pp, :catch_changes=>true)
    end
  end
end
