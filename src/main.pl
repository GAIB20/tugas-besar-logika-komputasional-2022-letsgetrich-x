:- dynamic(menu_status/1).
:- dynamic(firstTurn/0).

startGame:-
    ['utility.pl'],
    ['cheats.pl'],
    ['f01_board.pl'],
    ['f02_location.pl'],
    ['f03_property.pl'],
    ['f04_chance.pl'],
    ['f05_tax.pl'],
    ['f06_jail.pl'],
    ['f07_freeparking.pl'],
    ['f08_worldtour.pl'],
    ['f09_player.pl'],
    ['f10_dice.pl'],
    ['f11_bankrupt.pl'],
    ['move.pl'],
    ['help.pl'],
    ['b01_colorset.pl'],
    ['b04_buildgo.pl'],
    ['b05_coinflip.pl'],
    write('        ___                             | \'  \\'),nl,
    write('   ___  \\ /  ___         ,\'\\_           | .-. \\        /|'),nl,
    write('   \\ /  | |,\'__ \\  ,\'\\_  |   \\          | | | |      ,\' |_   /|'),nl,
    write(' _ | |  | |\\/  \\ \\ |   \\ | |\\_|    _    | |_| |   _ \'-. .-\',\' |_   _'),nl,
    write('// | |  | |____| | | |\\_|| |__    //    |     | ,\'_`. | | \'-. .-\',\' `. ,\'\\_'),nl,
    write('\\\\_| |_,\' .-, _  | | |   | |\\ \\  //    .| |\\_/ | / \\ || |   | | / |\\  \\|   \\'),nl,
    write(' `-. .-\'| |/ / | | | |   | | \\ \\//     |  |    | | | || |   | | | |_\\ || |\\_|'),nl,
    write('   | |  | || \\_| | | |   /_\\  \\ /      | |`    | | | || |   | | | .---\'| |'),nl,
    write('   | |  | |\\___,_\\ /_\\ _      //       | |     | \\_/ || |   | | | |  /\\| |'),nl,
    write('   /_\\  | |           //_____//       .||`      `._,\' | |   | | \\ `-\' /| |'),nl,
    write('        /_\\           `------\'        \\ |              `.\\  | |  `._,\' /_\\'),nl,
    write('                                       \\|                    `.\\'),nl,nl,nl,
    write('  __  __  ___  _   _  ___  ____   ___  _  __   __   ____    _    __  __ _____ '),nl,
    write(' |  \\/  |/ _ \\| \\ | |/ _ \\|  _ \\ / _ \\| | \\ \\ / /  / ___|  / \\  |  \\/  | ____|'),nl,
    write(' | |\\/| | | | |  \\| | | | | |_) | | | | |  \\ V /  | |  _  / _ \\ | |\\/| |  _| '),nl,
    write(' | |  | | |_| | |\\  | |_| |  __/| |_| | |___| |   | |_| |/ ___ \\| |  | | |___ '),nl,
    write(' |_|  |_|\\___/|_| \\_|\\___/|_|    \\___/|_____|_|    \\____/_/   \\_\\_|  |_|_____|'),nl,nl,nl,
    write('*** Hi There! First let me introduce myself. You can say that i\'m one of the famous Albus Dumbledore\'s closest friends. ***'),nl,nl,
    write('Press any key to continue'),nl,
    read(_),
    nl,
    write('\n ***In this magical opportunity, I\'d like to give two muggles a chance to study in the best Wizarding School,'),nl,
    write('None other than Hogwarts School of Witchcraft and Wizardry. ***'),nl,nl,
    write('Press any key to continue'),nl,
    read(_), nl,
    write('\n ***The two players will compete in a game of Monopoly to show their worth and their understanding on the Wizarding World***'),nl,
    write('*** What are you waiting for? I hope you enjoy your time in the Wizarding World! ***'),nl,nl,
    write('Press any key to continue'),nl,
    read(_),nl,nl,
    write('Skip tutorial?'),nl,
    write('0. No'),nl,
    write('1. Yes'),nl,

    read(SkipTutorial),
    (
        SkipTutorial = 0 -> help;
        !
    ),
    asserta(firstTurn),
    initPlayer,
    initJail,
    initChanceCard,
    switchPlayer.




