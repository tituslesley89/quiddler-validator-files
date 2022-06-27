set -e

npm run build
rm -rf ../scrabble-word-checker/css
rm -rf ../scrabble-word-checker/js
rm ../scrabble-word-checker/index.html
cp ./dist/css ../scrabble-word-checker/
cp ./dist/index.html ../scrabble-word-checker
cp ./dist/js ../scrabble-word-checker
