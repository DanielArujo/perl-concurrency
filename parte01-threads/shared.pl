use strict;
use warnings;
use threads;
use threads::shared;

my $contador :shared = 0;  

sub incrementa {
    for (1..1000) {
        $contador++;   
    }
}

my @threads;
for (1..10) {
    push @threads, threads->create(\&incrementa);
}

$_->join() for @threads;

print "Valor final do contador: $contador\n";