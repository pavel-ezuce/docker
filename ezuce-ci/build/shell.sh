#!/bin/sh -e
cd rr
exec /home/user/erlang/erts-8.3/bin/erl -name remsh@$HOSTNAME -remsh rr@$HOSTNAME -boot start_clean -boot_var ERTS_LIB_DIR /home/user/erlang/lib -setcookie recordsink -hidden -kernel net_ticktime 60
