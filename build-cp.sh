set -e

npm run build
rm -rf ../scrabble-word-checker/css
rm -rf ../scrabble-word-checker/js
rm ../scrabble-word-checker/index.html
rm ../scrabble-word-checker/favicon.ico
cp -r ./dist/css ../scrabble-word-checker/
cp ./dist/index.html ../scrabble-word-checker/index.html
cp -r ./dist/js ../scrabble-word-checker/
cp ./favicon.ico ../scrabble-word-checker/favicon.ico 

