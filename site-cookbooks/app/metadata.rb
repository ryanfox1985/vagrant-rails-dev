name              "app"
maintainer        "Guillermo Guerrero Ibarra"
maintainer_email  "guillermo@guerreroibarra.com"
description       "Main entry point for installing and configuring"
version           "1.0.0"

recipe "app", "Main entry point for installing and configuring"

depends "apt"
depends "git"
depends "build-essential"
depends "openssl"
depends "mysql"
depends "rvm"

%w{ debian ubuntu }.each do |os|
  supports os
end
