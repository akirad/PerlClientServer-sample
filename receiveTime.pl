use strict;
use warnings;
use Socket;

my $port = 50000;
my $buffSize  = 32;
my $outFile = 'actionTime.txt';

if (-f $outFile) {
    unlink($outFile) or die "Failed to unlink $outFile. $!\n";
}

my $socket;
socket($socket, PF_INET, SOCK_DGRAM, 0) or die "Failed to create socket. $!\n";
bind($socket, pack_sockaddr_in($port, INADDR_ANY)) or die "Failed to bind socket. $!\n";

my $count = 0;
while (1) {
    my $trapData;
    recv($socket, $trapData, $buffSize, 0) or die "Failed to receive data. $!\n";
    # print $trapData;
    open(my $out, ">>$outFile") or die "Failed to open $outFile: $!";
    print $out $trapData;
    $count++;
    print "$count\n";
    close($out);
}
close($socket);
