use strict;
use warnings;
use POE;


POE::Session->create(
    inline_states => {
        _start => sub { print "Ator iniciado.\n"; $_[KERNEL]->delay(send_msg => 1); },
        send_msg => sub {
            print "Ator enviando mensagem...\n";
            $_[KERNEL]->yield("receive_msg");
        },
        receive_msg => sub {
            print "Ator recebeu mensagem!\n";
            $_[KERNEL]->delay(send_msg => 1);  
        },
    },
);


$poe_kernel->run();
print "Fim do programa.\n";