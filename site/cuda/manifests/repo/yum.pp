class cuda::repo::yum {
  yum::gpgkey { $::cuda::repo_gpgkey_file:
    content => $::cuda::repo_gpgkey_content,
  }

  yumrepo { 'cuda':
    enabled  => $::cuda::repo_enabled,
    descr    => 'cuda',
    baseurl  => $::cuda::repo_baseurl,
    gpgcheck => $::cuda::repo_gpgcheck,
    gpgkey   => "file:///${::cuda::repo_gpgkey_file}",
    require  => Yum::Gpgkey[$::cuda::repo_gpgkey],
  }
}
