#!/bin/bash

#Przygotowanie
rm -rf git-stash
unzip git-stash.zip
cd git-stash
git init
git add .
git commit -m "Initial commit"

# 1) Dowiesz się:
# - do czego służy git stash
sed -i '' 's/testApp/mainTest/g' src/test/java/pl/git/inkubator/AppTest.java
git stash
git stash pop

# 2) Dowiesz się:
# - jak przeglądać listę stashy
# - jak pokazać to ładniej ( parametry komendy git log)
git stash
git stash list
git stash list --relative-date
git stash list --pretty
git stash list --format=raw

# 3) Dowiesz się:
# - git stash pop pobiera tak naprawdę ostatni stash
# - jak pobrać inny stash ( starszy )
sed -i '' 's/World/GIT/g' src/main/java/pl/git/inkubator/App.java
git stash
git stash list
git stash pop 'stash@{1}'

# 4) Dowiesz się:
# - git stash, rozwija się tak naprawdę do komendy git stash save
git stash save
git stash pop 'stash@{0}'

# 5) Dowiesz się:
# - jak pokazać co jest w stashu
# - jak pokazać to ładniej ( parametry komendy git diff)
git stash show
git stash show 'stash@{0}'
git stash show --word-diff

# 6) Dowiesz się:
# - jak utworzyć branch ze stash'a
# - jak usunąć konkretnego stash'a
git stash 
git stash list
git stash branch NewIdea 'stash@{1}'
git stash list
git checkout NewIdea #Nie trzeba bo już jesteśmy
git checkout master
git branch -D NewIdea
git stash

# 7) Dowiesz się:
# - czym różni się pop od apply
git stash pop
git stash list
git stash 
git stash apply
git stash list
git stash drop

# 8) Dowiesz się:
# - jak dodać własne nazwy do stash'a
git stash save MyNewFeature
git stash list

# 9) Dowiesz się:
# - jak zestashować plik, który nie jest w indeksie
echo 'Ten plik nie jest dodany do indeksu' > plikNieDodanyDoIndeksu
git stash
git status
git stash pop
git stash --include-untracked
git stash pop
rm plikNieDodanyDoIndeksu

# 10) Dowiesz się:
# - jak zestashować pliki, które są w ignore
echo 'Ten plik znajduje sie w .gitignore' > plikKtoryJestWIgnore
git status
git stash
file plikKtoryJestWIgnore
git stash --all
file plikKtoryJestWIgnore
git stash pop
file plikKtoryJestWIgnore

# 11) Dowiesz się:
# - jak zostawić (nie resetować ich) pliki, które są przeznaczone do commitowania
git stash pop
git add src/main/java/pl/git/inkubator/App.java
git stash --keep-index
git reset src/main/java/pl/git/inkubator/App.java
git checkout -- src/main/java/pl/git/inkubator/App.java
git stash pop

# 12) Dowiesz się:
# - jak podczas pobierania plików ze stasha, przywrócić im stan dodanych do commitowania
git add src/main/java/pl/git/inkubator/App.java
git stash
git stash pop --index

# 13) Dowiesz się:
# - jak usunąć wszystkie stashe
git stash clear
