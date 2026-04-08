El sistema que vamos a construir tiene tres componentes:

1. **Kernel Linux** - el nucleo del sistema operativo
2. **BusyBox** - proporciona las utilidades basicas de Unix (ls, pwd, vi ,etc.) en un solo binario
3. **Syslinux** - el bootloader que carga todo al arrancar

#Updates the list of packages available on Debian/Ubuntu based systems
sudo apt update
#Update all packages installed on your system to their latest available versions.
sudo apt upgrade

sudo apt install -y git vim make gcc libncurses-dev flex bison bc cpio libelf-dev libssl-dev syslinux dosfstools qemu-system-x86
#¿Para qué sirve cada paquete?*
#"gcc, "make - compilación del kernel y BusyBox
#"libncurses-dev' - menús interactivos de configuración ("menuconfig")
#"flex", "bison, "be" - requeridos por el proceso de build del kernel
#cpio" -para crear el initramfs
#"libelf-dev', "libssl-dev - dependencias del kernel
#syslinux - el bootloader
#dosfstools - para crearyel filesystem FAT
#genu- systen x86"- para probar la imagen sin necesidad de hardware real

git clone --depth 1 https://github.com/torvalds/linux.git
cd linux 
#Configure the options of compilation
make menuconfig
#Adjust the number of cores that I want to use
make -j 2