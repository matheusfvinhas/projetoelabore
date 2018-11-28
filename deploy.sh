eval "$(ssh-agent -s)"
openssl aes-256-cbc -K $encrypted_700619d89018_key -iv $encrypted_700619d89018_iv -in .travis/deploy.key.enc -out .travis/deploy.key -d
chmod 600 .travis/deploy.key
ssh-add .travis/deploy.key
ssh-keyscan 68.183.139.87 >> ~/.ssh/known_hosts
git remote add deploy dokku@68.183.139.87:elabore
git config --global push.default simple
git push deploy master
