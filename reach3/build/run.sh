#!/bin/sh -e
COMMAND=${1:-"console"}
. erlang/activate
cd reach
CFG_ROOT=config
SYS=$CFG_ROOT/sys.config
sed -i "s|freeswitch@freeswitch.ezuce|$FSNODE|g" $SYS
sed -i "s|mongodb.ezuce|$MONGODB|g" $SYS
sed -i "s|elastic.ezuce|$ELASTIC|g" $SYS
sed -i "s|sipxcom.ezuce|$SIPXCOM|g" $SYS
sed -i "s|reach@172.17.0.1|$NODE|g" $CFG_ROOT/vm.args
exec _build/default/rel/reach/bin/reach $COMMAND $*
