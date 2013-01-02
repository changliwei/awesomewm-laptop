#!bin/bash

if [ `id -u` -eq 0 ]; then
   echo "Do not run me as root! =)"
   exit
fi

cd ~/.config
git clone https://github.com/idk/awesomewm-X.git
mv ~/.config/awesome ~/.config/awesome.original
cp -r ~/.config/awesomewm-X ~/.config/awesome
mkdir ~/.config/awesome/Xdefaults/$USER
mv ~/.Xdefaults ~/.config/awesome/Xdefaults/$USER/.Xdefaults
ln -sfn ~/.config/awesome/Xdefaults/default/.Xdefaults ~/.Xdefaults
ln -sfn ~/.config/awesome/themes/dunzor ~/.config/awesome/themes/current
ln -sfn ~/.config/awesome/icons/AwesomeLight.png ~/.config/awesome/icons/menu_icon.png
ln -sfn ~/.config/awesome/themes/current/theme.lua ~/.config/luakit/awesometheme.lua
  
mkdir -p ~/.cache/awesome
touch ~/.cache/awesome/stderr
touch ~/.cache/awesome/stdout
mkdir ~/.config/conky/arch/.cache
 
echo "git clone https://github.com/idk/awesomewm-X.git
mv ~/.config/awesome ~/.config/awesome.original
cp -r ~/.config/awesomewm-X ~/.config/awesome
mkdir ~/.config/awesome/Xdefaults/$USER
mv ~/.Xdefaults ~/.config/awesome/Xdefaults/$USER/.Xdefaults
ln -sfn ~/.config/awesome/Xdefaults/default/.Xdefaults ~/.Xdefaults
ln -sfn ~/.config/awesome/themes/pdq ~/.config/awesome/themes/current
ln -sfn ~/.config/awesome/icons/AwesomeLight.png ~/.config/awesome/icons/menu_icon.png
ln -sfn ~/.config/awesome/themes/current/theme.lua ~/.config/luakit/awesometheme.lua
  
mkdir -p ~/.cache/awesome
touch ~/.cache/awesome/stderr
touch ~/.cache/awesome/stdout
mkdir ~/.config/conky/arch/.cache

=====================================================

Add something like the following line in your .xinitrc

exec awesome >> "$HOME"/.cache/awesome/stdout 2>> "$HOME"/.cache/awesome/stderr

Then.... try running 'startx' in the console to start Awesome."


echo ""
echo "Ctrl-c to exit...this will close automatically in 60 seconds..."
sleep 60s
exit 0