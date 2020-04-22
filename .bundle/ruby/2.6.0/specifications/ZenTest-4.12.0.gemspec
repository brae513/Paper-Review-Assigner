# -*- encoding: utf-8 -*-
# stub: ZenTest 4.12.0 ruby lib

Gem::Specification.new do |s|
  s.name = "ZenTest".freeze
  s.version = "4.12.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ryan Davis".freeze, "Eric Hodel".freeze]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIDPjCCAiagAwIBAgIBAzANBgkqhkiG9w0BAQsFADBFMRMwEQYDVQQDDApyeWFu\nZC1ydWJ5MRkwFwYKCZImiZPyLGQBGRYJemVuc3BpZGVyMRMwEQYKCZImiZPyLGQB\nGRYDY29tMB4XDTE4MTIwNDIxMzAxNFoXDTE5MTIwNDIxMzAxNFowRTETMBEGA1UE\nAwwKcnlhbmQtcnVieTEZMBcGCgmSJomT8ixkARkWCXplbnNwaWRlcjETMBEGCgmS\nJomT8ixkARkWA2NvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALda\nb9DCgK+627gPJkB6XfjZ1itoOQvpqH1EXScSaba9/S2VF22VYQbXU1xQXL/WzCkx\ntaCPaLmfYIaFcHHCSY4hYDJijRQkLxPeB3xbOfzfLoBDbjvx5JxgJxUjmGa7xhcT\noOvjtt5P8+GSK9zLzxQP0gVLS/D0FmoE44XuDr3iQkVS2ujU5zZL84mMNqNB1znh\nGiadM9GHRaDiaxuX0cIUBj19T01mVE2iymf9I6bEsiayK/n6QujtyCbTWsAS9Rqt\nqhtV7HJxNKuPj/JFH0D2cswvzznE/a5FOYO68g+YCuFi5L8wZuuM8zzdwjrWHqSV\ngBEfoTEGr7Zii72cx+sCAwEAAaM5MDcwCQYDVR0TBAIwADALBgNVHQ8EBAMCBLAw\nHQYDVR0OBBYEFEfFe9md/r/tj/Wmwpy+MI8d9k/hMA0GCSqGSIb3DQEBCwUAA4IB\nAQCbJwLmpJR2PomLU+Zzw3KRzH/hbyUWc/ftru71AopZ1fy4iY9J/BW5QYKVYwbP\nV0FSBWtvfI/RdwfKGtuGhPKECZgmLieGuZ3XCc09qPu1bdg7i/tu1p0t0c6163ku\nnDMDIC/t/DAFK0TY9I3HswuyZGbLW7rgF0DmiuZdN/RPhHq2pOLMLXJmFclCb/im\n9yToml/06TJdUJ5p64mkBs0TzaK66DIB1Smd3PdtfZqoRV+EwaXMdx0Hb3zdR1JR\nEm82dBUFsipwMLCYj39kcyHWAxyl6Ae1Cn9r/ItVBCxoeFdrHjfavnrIEoXUt4bU\nUfBugfLD19bu3nvL+zTAGx/U\n-----END CERTIFICATE-----\n".freeze]
  s.date = "2019-09-23"
  s.description = "ZenTest provides 4 different tools: zentest, unit_diff, autotest, and\nmultiruby.\n\nzentest scans your target and unit-test code and writes your missing\ncode based on simple naming rules, enabling XP at a much quicker pace.\nzentest only works with Ruby and Minitest or Test::Unit. There is\nenough evidence to show that this is still proving useful to users, so\nit stays.\n\nunit_diff is a command-line filter to diff expected results from\nactual results and allow you to quickly see exactly what is wrong.\nDo note that minitest 2.2+ provides an enhanced assert_equal obviating\nthe need for unit_diff\n\nautotest is a continous testing facility meant to be used during\ndevelopment. As soon as you save a file, autotest will run the\ncorresponding dependent tests.\n\nmultiruby runs anything you want on multiple versions of ruby. Great\nfor compatibility checking! Use multiruby_setup to manage your\ninstalled versions.\n\n*NOTE:* The next major release of zentest will not include autotest\n(use minitest-autotest instead) and multiruby will use rbenv /\nruby-build for version management.".freeze
  s.email = ["ryand-ruby@zenspider.com".freeze, "drbrain@segment7.net".freeze]
  s.executables = ["multigem".freeze, "multiruby".freeze, "unit_diff".freeze, "zentest".freeze]
  s.extra_rdoc_files = ["History.txt".freeze, "Manifest.txt".freeze, "README.txt".freeze, "articles/how_to_use_zentest.txt".freeze, "example.txt".freeze]
  s.files = ["History.txt".freeze, "Manifest.txt".freeze, "README.txt".freeze, "articles/how_to_use_zentest.txt".freeze, "bin/multigem".freeze, "bin/multiruby".freeze, "bin/unit_diff".freeze, "bin/zentest".freeze, "example.txt".freeze]
  s.homepage = "https://github.com/seattlerb/zentest".freeze
  s.licenses = ["MIT".freeze]
  s.rdoc_options = ["--main".freeze, "README.txt".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "ZenTest provides 4 different tools: zentest, unit_diff, autotest, and multiruby".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rdoc>.freeze, [">= 4.0", "< 7"])
      s.add_development_dependency(%q<hoe>.freeze, ["~> 3.18"])
    else
      s.add_dependency(%q<rdoc>.freeze, [">= 4.0", "< 7"])
      s.add_dependency(%q<hoe>.freeze, ["~> 3.18"])
    end
  else
    s.add_dependency(%q<rdoc>.freeze, [">= 4.0", "< 7"])
    s.add_dependency(%q<hoe>.freeze, ["~> 3.18"])
  end
end
