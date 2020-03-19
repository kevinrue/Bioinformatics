sshfs USERNAME@SERVER:ABSOLUTE_SERVER_PATH ABSOLUTE_LOCAL_PATH \
      -oauto_cache \
      -oreconnect \
      -oallow_other \
      -onegative_vncache \
      -ofollow_symlinks \
      -odefer_permissions \
      -ovolname="VOLUME NAME"

# see: https://github.com/osxfuse/osxfuse/wiki/Mount-options
# -o auto_cache:        enable caching based on modification times
# -o oreconnect:        reconnect to server
# -o allow_other:       allow access to other users
# -o negative_vncache:  enables negative vnode name caching in the kernel (deprecated?)
# -o follow_symlinks:   follow symlinks on the server
# -o defer_permissions: causes osxfuse to assume that all accesses are allowed (deprecated?)
# -o volname:           specify a name for the osxfuse volume being mounted (deprecated?)
