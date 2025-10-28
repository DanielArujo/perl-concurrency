use strict;
use warnings;
use threads;

sub worker {
    my $id = shift;
    print "Thread $id iniciada\n";
    sleep(1);
    print "Thread $id finalizada\n";
}


my @threads;
for my $i (1..3) {
    push @threads, threads->create(\&worker, $i);
}

$_->join() for @threads;

print "Todas as threads finalizaram.\n";
