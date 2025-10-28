use strict;
use warnings;
use AnyEvent;

my $timer = AnyEvent->timer(
    after => 2,
    cb => sub {
        print "Evento disparado após 2 segundos!\n";
        AE::cv()->send;  
    },
);

# Loop de eventos
my $cv = AE::cv;  
print "Esperando evento...\n";
$cv->recv;        
print "Fim do programa.\n";