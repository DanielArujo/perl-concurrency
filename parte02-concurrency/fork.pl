use strict;
use warnings;
use Parallel::ForkManager;

my $pm = Parallel::ForkManager->new(3);

for my $i (1..5) {
    $pm->start and next;   
    print "Processo $i executando no PID $$\n";
    sleep 2;
    $pm->finish;          
}

$pm->wait_all_children;
print "Todos os processos finalizaram.\n";