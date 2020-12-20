use strict;
use warnings;
use Socket;

my $destHost = '127.0.0.1';
my $destPort = 50000;

my $sendData = `echo %time%`;
socket(my $socket, PF_INET, SOCK_DGRAM, 0) or die "Failed to create socket. $!";
my $destAddrBin = inet_aton($destHost);
my $destSockAddr = pack_sockaddr_in($destPort, $destAddrBin);
send($socket, $sendData, 0, $destSockAddr) or die "Failed to send. $!";

close($socket) or die "Failed to close. $!";
