:- dynamic(menu_status/1).

startGame:-
    ['utility.pl'],
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
    ['b01_colorset.pl'],
    ['b04_buildgo.pl'],
    ['b05_coinflip.pl'],
    initPlayer,
    initJail,
    initChanceCard,
    switchPlayer.




