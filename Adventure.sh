#CMD#
if [[ ! -f "save" ]]
then
	mkdir save
fi

######IDs###Func####
alias getType="cat Adventure.IDS|grep $type |cut -c 4-15"
alias getID="cat Adventure.IDS|grep $id |cut -c 4-15"
alias TyID="$(echo "$getType $getID")"
alias readInv="cat save/$prof|grep inv|cut -c 4-50"


###########Menu#########
while true;
do
echo '©~{==============>    '
echo 'Adventure by ArastaD0t'
echo '~~~~~~~~~~~~~~~~~~~~~~'
echo ' 1)Load Story'
echo ' 2)New Story'
echo ' 3)Settings'
echo ' 4)Go Sleep'
echo '©~{======>'
read c
case $c in
	1) ##Load##
	echo "What Story You Want Load ?"
	echo '©~{===========>'
	ls save
	echo '©~{======>'
	echo "back"
	read prof
	case $prof in
		   exit|quit|Exit|Quit|q|Q)
		   exit & ./Adventure.sh
		   ;;
		   *)
		   name=$(cat save/$prof |grep name|cut -c 6-50)
	           class=$(cat save/$prof|grep class|cut -c 7-50)
	           born=$(cat save/$prof|grep born|cut -c 6-50)
	           hp=$(cat save/$prof|grep hp|cut -c 4-50)
	           inv=$(cat save/$prof|grep inv|cut -c 5-50)
	           xp=$(cat save/$prof|grep xp|cut -c 4-50)
	           mana=$(cat save/$prof|grep mana|cut -c 6-50)
	           money=$(cat save/$prof|grep money|cut -c 7-50)
	           extra=$(cat save/$prof|grep extra|cut -c 7-50)
	           status=$(cat save/$prof|grep status|cut -c 8-50)
	           place=$(cat save/$prof|grep place|cut -c 7-50)
	           story=$prof
	           echo "You $(cat save/$prof |grep name |cut -c 6-29) wake up with $(cat save/$prof |grep inv|cut -c 5-50) ...."

	esac
;;
	2) ##New##
	echo 'What is yours name hero ?'
	read name
	echo "What is your class $name ?"
	echo "1)Knight 2)Archer 3)Bandit 4)Mag"
	read  class
	case $class in
              	1|Knight|knight)
		class=Knight
		hp=80
		inv=dEi1
		xp=10
		mana=0
		money=10
		extra=
	;;
		2|Archer|archer)
		class=Archer
		hp=90
		inv=dDi3,dDi4-100
		xp=9
		mana=0
		money=10
		extra=
	;;
		3|Bandit|bandit)
		class=Bandit
		hp=100
		inv=
		xp=6
		mana=0
		money=10
		extra=
	;;
		4|Mag|mag)
		class=Mag
		hp=70
		inv=
		xp=4
		mana=100
		money=10
		extra=nothing
	;;
		*)
		echo 'Select 1 ~ 4'
	esac
##story###creating###
	echo "You are $name,$class from ?"
	read born
	echo "This story is about $class $name from $born.."
	place=$born
	echo "name=$name" >> save/$name.save
	echo "class=$class" >> save/$name.save
	echo "born=$born" >> save/$name.save
	echo "hp=$hp" >> save/$name.save
	echo "inv=$inv" >> save/$name.save
	echo "xp=$xp" >> save/$name.save
	echo "mana=$mana" >> save/$name.save
	echo "money=$money" >> save/$name.save
	echo "extra=$extra" >> save/$name.save
	echo "status=$status" >> save/$name.save
	echo "place=$place" >> save/$name.save
	break
;;
	3) ##settings##
	ces=True
	echo "Emoji Support $ces"
;;
	4|quit|Quit|Exit|q|Q|exit) ##quit##
	echo 'Good sleep hero.. Good sleep...'
	exit
;;
	*)
	echo 'Select 1 ~ 4 '
esac
done
###Tutorial###
echo "You are wakeup in soo... soo... cold night"
echo "You little out of mind..."
echo 'If you have whenever out of your mind you can ask yourself for /help '
echo "And now is one of this times ( type /help )"
read c

###interactivated###
while [ True ];
do

if [[ "$c" == */* ]]; then
case $c in
	/help|/Help|/HELP)
	echo " Commands:"
	echo '		 /me    Show name        '
	echo '		 /hp    Show yours Health'
	echo ' 		 /inv   Show Inventory   '
	echo '		 /xp    Show XP          '
	echo '		 /money Show yours money '
	echo '		 /mana  Show Mana Status '
	echo " Controls: "
	echo '		where   Show where are u '
	echo '		sleep   Save and leave story'
	read c
;;
	/me|/Me|/ME)
	echo "You are $class $name from $born"
	read c
;;
	/hp|/Hp|/HP)
	echo "Yours HP is $hp"
	read c
;;
	/inv|/Inv|/INV)
	echo "In yours backpack is $inv"
	read c
;;
	/xp|/Xp|/XP)
	echo "You have $xp exps"
	read c
;;
	/money|/Money|/MONEY)
	echo "You have $money coins"
	read c
;;
	/mana|/Mana|/MANA)
	echo "You have $mana of mana"
	read c
;;
	*)
	read c
esac
else
case $c in
	sleep|Sleep|SLEEP)
	echo "Good sleep hero... good sleep..."
	exit
;;
	where|Where|WHERE)
	echo "You are in $place"
	read c
esac
echo "Try it /help..."
read c
fi
done
