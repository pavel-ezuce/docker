#!/bin/sh -e
CFG=conf/autoload_configs

echo Setting FreeSWITCH Erlang node name to $NODE
xmlstarlet edit --inplace -u '/configuration/settings/param[@name="nodename"]/@value' -v "$NODE" $CFG/erlang_event.conf.xml
xmlstarlet edit --inplace -u '/configuration/settings/param[@name="shortname"]/@value' -v "false" $CFG/erlang_event.conf.xml

echo Setting BusyTone Erlang node name to $BUSYTONE_NODE

xmlstarlet edit --inplace -u '/include/context/extension/condition/action[@application="erlang"]/@data' \
	-v "call_sup:! $BUSYTONE_NODE" \
	conf/dialplan/dialplan.xml

echo Setting ReachMe FreeSWITCH address to $REACH_FREESWITCH

xmlstarlet edit --inplace -u '/include/param[@name="proxy"]/@value' -v "$REACH_FREESWITCH" conf/sip_profiles/gateways/reach.xml

/usr/bin/epmd -daemon
exec /usr/local/freeswitch/bin/freeswitch -nf -np
