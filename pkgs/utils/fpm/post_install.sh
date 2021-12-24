#!/bin/sh

# ================================================================
# Post-install Script
# ================================================================

set -xe

[ "$IS_CONTAINER" ] || export IS_CONTAINER=$([ ! -e /proc/1/cgroup ] || [ "$(sed -n 's/^[^:]*:[^:]*:\(..\)/\1/p' /proc/1/cgroup | wc -l)" -le 0 ] || echo true)
[ "$IS_CONTAINER" ] || export IS_CONTAINER=$([ ! -e /.dockerenv ] || echo true)
[ "$IS_CONTAINER" ] || export IS_CONTAINER=$([ ! -e /run/.containerenv ] || echo true)

# ----------------------------------------------------------------
# Clean up empty directory if necessary
# ----------------------------------------------------------------

(
    set -xe
    cd /etc/ld.so.conf.d
    [ -d 'roaster.conf.d' ] && echo 'include roaster.conf.d/*.conf' > /etc/ld.so.conf.d/roaster.conf || rm -f roaster.conf
)

# ----------------------------------------------------------------
# Refresh
# ----------------------------------------------------------------

which systemctl && systemctl daemon-reload || $IS_CONTAINER
ldconfig
sysctl --system || $IS_CONTAINER
