eval "$(ssh-agent -s)"
chmod 600 .travis/deploy.key
ssh-add .travis/deploy.key
ssh-keyscan 68.183.139.87 >> ~/.ssh/known_hosts
git remote add deploy dokku@68.183.139.87:elabore
git config --global push.default simple
git push deploy master
