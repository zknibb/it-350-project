# it-350-project

from http://webpy.org/docs/0.3/tutorial

runs on http://0.0.0.0:8080/

documents at https://drive.google.com/drive/folders/0BxJ1w5Qhdj4STFJRLUdWS2FXUm8

GitHub Cheat Sheet https://services.github.com/on-demand/downloads/github-git-cheat-sheet.pdf


pip install web.py

python code.py

mysql -u root -p
    
	show databases;
	
	use police;
    
	show tables;    

sudo apt install git

git config --global user.name "Knibb"

git config --global user.email "zknibb@gmail.com"

git config --global credential.helper cache

git config --global credential.helper 'cache --timeout=3600'

git config --global color.ui auto

git config --global push.default simple

git clone https://github.com/zknibb/it-350-project.git

cd it-350-project

git add web.py/

git commit -m "commit added files"

git commit -a -m "commit all changes"

git push

sudo rsync -av /var/lib/mysql /home/linux/it-350-project/dbbak

sudo zip -r dbbak.zip dbbak