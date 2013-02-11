CyanogenMod 10.0 for ZTE Warp (WIP)

A lot of things still do not work, but we are trying

Credits

hroark13 

joe.stone 

PlayfulGod 

shinru2004 

downthemachine 

Dm47021

superr 

Junkie2100 

QuietStorm1785

Jetx2x

kraziejedi
  
   
 
  
   
   



How to build

your system must be setup as an Android Build system



mkdir cm10


cd cm10

repo init -u git://github.com/CyanogenMod/android.git -b jellybean

repo sync -j32

./vendor/cm/get-prebuilts

mkdir device/zte

cd device/zte

git clone https://github.com/hroark13/android_device_zte_arthur.git -b master arthur

cd ../..

source ./build/envsetup.sh

make clobber

source ./build/envsetup.sh && brunch arthur
