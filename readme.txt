do these steps before running archinstall

  sudo pacman -Sy - for updating mirrors
  sudo pacman -S reflector python glibc
  sudo reflector --country 'India' --latest 5 --age 2 --fastest 5 --protocol https --sort rate --save /etc/pacman.d/mirrorlist # maybe not needed
  sudo pacman -Syu
  sudo pacman -S git archinstall
