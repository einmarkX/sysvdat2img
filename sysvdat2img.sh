#!/bin/bash


#Made By M24-XT
#*****************************#
#*****************************#
#*Bootimage system.new.dat.br*#
#*unpacker v1.5-9 Beta       *#
#*****************************#
#*****************************#
#Happy New Year 2021
#Thanks To NamakuHendra In Github For unpack bootimage binary
#system.new.dat converter credit to xpirt - luxi78 - howellzhu
#vendor.new.dat converter credit to Revanth
W='\033[1;37m'
Y='\033[1;33m'
R='\033[1;31m'
G='\033[1;32m'
B='\033[1;34m'
cwd=`pwd`
os=`echo $OSTYPE`
#*****************************#
#Check OS,python,figlet ,And Br
tomconv(){
	mconv
}
#munp(){
	#clear
#	sleep 1.5
#	echo $G ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#	sleep 0.1
#	echo $G
#	figlet UNPACK
#	echo $G Menu
#	sleep 0.1
#	echo $G ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#	sleep 1.5
#	echo ""
#	echo ""
#	echo $G "S > Unpack System.img		V > Unpack Vendor.img"
#	echo ""
#	echo ""
#	echo $G "B > Unpack Boot.img"
##	echo ""
#	echo $G "K > Kembali"
#	echo ""
#	echo $G
#	read -p " > " cunp
#	case $cunp in
#		S | s) unps;;
#		V | v) unpv;;
#		B | b) unpb;;
#		K | k) tomain;;
#	esac 

#}
mconv(){
	clear
	sleep 1.5
	echo $W ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	sleep 0.1
	echo $W 
	figlet CONVERT 
	echo $W Menu 
	sleep 0.1
	echo $W ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	sleep 1.5
	echo ""
	echo ""
	echo $Y "S > System		V > Vendor"
	echo ""
	echo ""
	echo $Y "69 > Menu Utama"
	echo ""
	echo $G
	read -p " -> " convp
	case $convp in
		S | s)sconv;;
		V | v)vconv;;
		69)tomain;;
		*) echo $R [!] Pilihan Invalid 
			tomconv;;
	esac
}
vconv(){
	clear
	sleep 1.5
	echo $Y ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	sleep 0.1
	echo $Y
	figlet CONVERT
	sleep 0.1
	echo $Y "vendor.new.dat.br"
	sleep 0.1
	echo $Y ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	sleep 3
	echo $W
	echo [+] Memulai....
	sleep 0.5
	echo $W [+] Mencari vendor.new.dat.br
	sleep 1
	if [ -f $cwd/vendor.new.dat.br ]
	then
		echo $G [✓] vendor.new.dat.br ditemukan
		sleep 1
		echo $W [+] Memulai Convert......
		sleep 1.5
		brotli -d vendor.new.dat.br
		sleep 0.5
		echo $G [✓] Convert ke vendor.new.dat sukses
		sleep 0.5
	else
		echo $R [!] vendor.new.dat.br tidak ditemukan
		sleep 0.5
		echo $R [!] Gagal Karna vendor.new.dat.br tidak ditemikan
		sleep 1.9
		tomconv
	fi
	echo $W [+] Mencari vdat.......
	sleep 1
	if [ -f $cwd/bin/vdat.py ]
	then
		echo $G [✓] Vdat Ditemukan
		sleep 1
		echo $W [+] Memulai Convert......
		sleep 1.9
		echo $W [+] Mencari vendor.new.dat......
		sleep 1
		if [ -f $cwd/vendor.new.dat ]
		then
			echo $G [✓] vendor.new.dat ditemukan
			sleep 1.9
			echo $W [+] Mencari vendor.transfer.list......
			sleep 1
			if [ -f $cwd/vendor.transfer.list ]
			then
				echo $G [✓] vendor.transfer.list ditemukan
				sleep 1.9
				echo $W [+] Mulai !
				sleep 1.5
				python vdat.py vendor.transfer.list vendor.new.dat vendor.img
				sleep 0.5
				echo $G [✓] Selesai !
				sleep 1.9
				echo $Y 
				read -p "[?] Hapus vendor.new.dat.br,vendor.transfer.list & vendor.new.dat (Y/n" rv
				case $rv in
					Y | y) rm -rf vendor.new.dat.br
						rm -rf vendor.transfer.list
						rm -rf vendor.new.dat
						sleep 0.5
						echo $G [✓] Berhasil
						;;
					n | N) echo $G [%] Okoklh
						;;
				esac 
				sleep 1.5 
				mconv
			else
				echo $R [!] vendor.transfer.list tidak ditemukan
				sleep 0.5
				echo $R [!] Gagal Karna vendor.transfer.list tidak ada 
			fi
		else
			echo $G [!] vendor.new.dat tidak ditemukan
			sleep 0.5
			echo $G [!] Gagal Karna vendor.new.dat tidak ada
			sleep 1
			mconv 
		fi


			
	else
		echo $R [!] Vdat Tidak ditemukan
		sleep 0.5
		echo $R [!] Gagal Karna Vdat Tidak ada 
	fi


}
sconv(){
	clear
	sleep 1.5
	echo $Y ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	sleep 0.1
	echo $Y
	figlet CONVERT
	sleep 0.1
	echo $Y ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	sleep 3
	echo [+] Memulai......
	sleep 0.5 
	echo $Y [+] Mencari system.new.dat.br.......
	sleep 1
	br=`ls | grep 'system.new.dat.br'`
	if [ -f $cwd/system.new.dat.br ]
	then
		echo $G [✓] system.new.dat.br ditemukan
		sleep 1
		echo $Y [+] Memulai Proses...
		if [ -f $cwd/system.new.dat ]
		then
			echo $G [✓] Menskip.......
			sleep 1
		else
			brotli -d system.new.dat.br
			sleep 0.5
			echo $G [✓] Convert Ke system.new.dat Sukses
		fi
	else
		echo $R [!] system.new.dat.br tidak ditemukan 
		sleep 0.5
		echo $R [!] Gagal Karna syetem.new.dat.br tidak ditemukan
		sleep 1.6
		tomain
	fi
	list=`ls | grep 'system.transfer.list'`
	py=`ls | grep 'sdat.py'`
	echo $Y [+] Mencari Sdatimg.....
	sleep 1
	if [ -f $cwd/bin/sdat.py ]
	then
		echo $G [✓] Sdatimg ditemukan
		sleep 0.5
		echo $Y [+] Memulai Proses convert.....
		sleep 1.5 
		echo $Y [+] Medeteksi system.transfer.list.....
		sleep 1.5
		if [ -f $cwd/system.transfer.list ]
		then
			echo $G [✓] system.transfer.list ditemukan 
			sleep 0.5
			echo $Y [+] Mencari system.new.dat......
			dat=`ls | grep 'system.new.dat'`
			if [ -f $cwd/system.new.dat ] 
			then
				echo $G [✓] system.new.dat ditemukan
				sleep 1
				echo $Y [+] Memulai proses.....
				sleep 1.5
				python sdat.py system.transfer.list system.new.dat system.img
				echo $G [✓] Selesai !
				sleep 0.5
				echo $W
				read -p "[?] Hapus system.new.dat.br & system.new.dat (Y/n)" rs
				case $rs in
					Y | y) rm -rf system.new.dat.br 
						rm -rf system.new.dat
						rm -rf system.transfer.list
						sleep 0.5
						echo $G [✓] Berhasil
						tomconv
						;;
					n | N) echo $G [%] Okoklh
						tomconv
						;;
				esac

			else
				echo $R [!] system.new.dat tidak ditemukan 
				sleep 0.5
				echo $R [!] Gagal Karna system.new.dat tidak ditemukan
				sleep 1.5
				tomain
			fi
			
		else
			echo $R [!] system.transfer.list tidak ditemukan
			sleep 0.5
			echo $R [!] Gagal Karna system.transfer.list tidak ditemukan [Err : 2]
			sleep 1.5
			tomain
		fi

	else
		echo $R [!] Sdatimg tidak ditemukan
		sleep 0.5 
		echo $R [!] Gagal Karna Sdat tidak ditemukan [Err : 1]
		sleep 1
		tomain 

	fi
}
repb(){
	clear
	sleep 1.5
	echo $Y ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	sleep 0.1
	echo $Y
	figlet REPACK 
	echo ""
	sleep 0.1
	echo $Y ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	echo ""
	echo $G COMING SOON ! 
	sleep 1.6
	tomain 
}
unpb(){
	clear
	sleep 1.5
	echo $Y ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	sleep 0.1
	echo $Y
	figlet UNPACK
	echo ""
	echo $Y ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	sleep 0.9
	echo $G
	read -p "Nama Bootimage : " nb
	if [ -f $cwd/unpb ] 
	then
		chmod 777 unpb
		mkdir unpack 
		./unpb -i $nb -o unpack
		sleep 1.5
		tomain 
	else
		echo ""
		sleep 0.1
		echo $R [-] Anda Telah Menghapus Binary
		echo $W
		read -p "[•] Tekan Enter Untuk kembali " bck
		case $bck in
			*) tomain;;
		esac
	fi
}
out(){
	clear
	sleep 1.5
	echo $Y ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	sleep 0.1
	echo $G [+] Terimakasih Telah menggunakan 
	sleep 0.1
	echo $Y ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	sleep 1.5
	clear
	sleep 0.5
	echo $W ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	sleep 0.1
	echo $G Made By M24-XT
	sleep 0.1
	echo $W ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	sleep 1 
	clear 
	exit 
} 

tomain(){
	main
}
setup(){
	sleep 1.5
	clear
	echo $Y ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	sleep 0.1
	echo $Y [!] SETUP UNTUK MENJALANKAN SCRIPT
	sleep 0.1
	echo $Y ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	sleep 0.5
	echo $G [%] Menjalankan Setup........
	sleep 1.5
	clear
	sleep 0.5
	pkg install brotli
	apt-get install python python2 -y
	apt-get install figlet
	sleep 0.5
	clear
	sleep 1
	echo $Y ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	sleep 0.1
	echo $G [+] Setup Selesai. 
	sleep 0.1
	echo $Y ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	sleep 1
	inf
}
inf(){
	sleep 1
	clear
	echo $W ------------------------------------------------------------
	sleep 0.1
	echo $G "System.new.dat.br converter & Bootimage unpack"
	sleep 0.1
	echo $W ------------------------------------------------------------
	echo $W Terimakasih Telah memilih tools ini !
	sleep 1.5
	tomain 
}
repm(){
	echo $G COMING SOON !
	tomain
}
main(){
	clear
	sleep 1.5
	echo $Y ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	sleep 0.1
	echo $Y
	figlet MAIN MENU
	echo ""
	sleep 0.1
	echo $Y ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
	sleep 1
	echo $G v1.5-9 Beta
	echo ""
	echo $G "1 > Unpack Boot		2 > Repack Menu "
	sleep 0.1
	echo ""
	echo "" 
	echo $G "3 > Convert Menu		00 > Keluar "
	echo ""
	sleep 0.5
	echo $W
	read -p " •> " pil
	case "$pil" in
		1) unpb;;
		2) repm;;
		3) mconv;;
		00) out;;
		*) echo $R [-] Pilihan Invalid
			tomain;;
	esac 
}
if [ $os=="linux-android" ]
then
	bin_loc=/data/data/com.termux/files/usr/bin
	if [ -f $bin_loc/python ]
	then
		if [ -f $bin_loc/brotli ]
		then
			if [ -f $bin_loc/figlet ]
			then
				sleep 1
				clear
				sleep 0.5
				echo $W ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
				sleep 0.1
				echo $G [+] Python, Figlet,Brotli Telah diinstall 
				sleep 0.1
				echo $W ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
				sleep 1
				inf 
			else
				setup
			fi
		fi
	fi
elif [ $os=="linux-gnu" ];then
	bin_loc=/usr/bin
	if [ -f $bin_loc/python ]
        then
                if [ -f $bin_loc/brotli ]
                then
                        if [ -f $bin_loc/figlet ]
                        then
                                sleep 1
                                clear
                                sleep 0.5
                                echo $W ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
                                sleep 0.1
                                echo $G [+] Python, Figlet,Brotli Telah diinstall
                                sleep 0.1
                                echo $W ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
                                sleep 1
                                main
                        else
                                setup
                        fi
                fi
        fi
else
	echo $R Unknown OS, Or not supported
fi 
