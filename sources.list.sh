

#    Add security updates (default: yes)

    cat > /etc/apt/sources.list.d/devuan-security.list <<EOD
    # /etc/apt/sources.list.d/devuan-security.list
      
    deb     http://packages.devuan.org/merged jessie-security main
    deb-src http://packages.devuan.org/merged jessie-security main
    EOD

#    Add stable updates for fast release packages (default: no)

    cat > /etc/apt/sources.list.d/devuan-stable-updates.list <<EOD
    # /etc/apt/sources.list.d/devuan-stable-updates.list

    deb     http://auto.mirror.devuan.org/merged jessie-updates main
    deb-src http://auto.mirror.devuan.org/merged jessie-updates main
    EOD

#    Add stable proposed updates (default: no)

    cat > /etc/apt/sources.list.d/devuan-stable-proposed-updates.list <<EOD
    # /etc/apt/sources.list.d/devuan-stable-proposed-updates.list

    deb     http://auto.mirror.devuan.org/merged jessie-proposed main
    deb-src http://auto.mirror.devuan.org/merged jessie-proposed main
    EOD

#    Add backports (default: no)

    cat > /etc/apt/sources.list.d/devuan-jessie-backports.list <<EOD
    # /etc/apt/sources.list.d/devuan-jessie-backports.list

    deb     http://auto.mirror.devuan.org/merged jessie-backports main
    deb-src http://auto.mirror.devuan.org/merged jessie-backports main
    EOD

#    Add experimental (default: no)

    cat > /etc/apt/sources.list.d/devuan-experimental.list <<EOD
    # /etc/apt/sources.list.d/devuan-experimental.list

    deb     http://auto.mirror.devuan.org/devuan experimental main
    deb-src http://auto.mirror.devuan.org/devuan experimental main
    EOD

#    Move to ascii (testing)

    cat > /etc/apt/sources.list.d/devuan-ascii.list <<EOD
    # /etc/apt/sources.list.d/devuan-ascii.list

    deb     http://auto.mirror.devuan.org/merged ascii main
    deb-src http://auto.mirror.devuan.org/merged ascii main
    EOD

    cat > /etc/apt/sources.list.d/devuan-ascii.list <<EOD
    # /etc/apt/sources.list.d/devuan-ascii-updates.list
    deb     http://auto.mirror.devuan.org/merged ascii-updates main
    deb-src http://auto.mirror.devuan.org/merged ascii-updates main
    EOD

    cat > /etc/apt/sources.list.d/devuan-ascii.list <<EOD
    # /etc/apt/sources.list.d/devuan-ascii-security.list
    deb     http://auto.mirror.devuan.org/merged ascii-security main
    deb-src http://auto.mirror.devuan.org/merged ascii-security main
    EOD


