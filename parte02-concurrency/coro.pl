use strict;
use warnings;
use Coro;


my $co1 = async {
    for (1..5) {
        print "Corrotina 1 - passo $_\n";
        Coro::cede();   
    }
};


my $co2 = async {
    for (1..5) {
        print "Corrotina 2 - passo $_\n";
        Coro::cede();
    }
};

Coro::schedule;  
print "Todas as corrotinas finalizaram.\n";