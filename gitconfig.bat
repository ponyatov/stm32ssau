git config --global user.email "dponyatov@gmail.com"
git config --global user.name "Dmitry Ponyatov"
pause
exit

rem Create a new repository on the command line

touch README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin git@github.com:ponyatov/stm32ssau.git
git push -u origin master

rem Push an existing repository from the command line

git remote add origin git@github.com:ponyatov/stm32ssau.git
git push -u origin master



