use strict;
use warnings;
use threads;
use threads::shared;

my $contador :shared = 0;

sub incrementa_seguro {
    for (1..1000) {
        lock($contador); 
        $contador++;
    }
}

my @threads;
for (1..10) {
    push @threads, threads->create(\&incrementa_seguro);
}

$_->join() for @threads;

print "Valor final (sincronizado): $contador\n";