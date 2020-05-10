#!/usr/bin/perl
delete($ENV{'IFS'});
delete($ENV{'CDPATH'});
delete($ENV{'ENV'});
delete($ENV{'BASH_ENV'});
$ENV{'PATH'} = '/bin:/usr/bin';
$< = $>;
$( = $);
open(CONF, "/etc/webmin/miniserv.conf") || die "Failed to open /etc/webmin/miniserv.conf : $!";
while(<CONF>) {
        $root = $1 if (/^root=(.*)/);
        }
close(CONF);
$root || die "No root= line found in /etc/webmin/miniserv.conf";
$ENV{'PERLLIB'} = "$root";
$ENV{'WEBMIN_CONFIG'} = "/etc/webmin";
$ENV{'WEBMIN_VAR'} = "/var/webmin";
chdir("$root/virtual-server");
exec("$root/virtual-server/lookup-domain.pl", @ARGV) || die "Failed to run $root/virtual-server/lookup-domain.pl : $!";
