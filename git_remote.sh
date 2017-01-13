YOUR_TOP_LEVEL_FOLDER="./roles"
for dir in `ls $YOUR_TOP_LEVEL_FOLDER`;
do
      ( cd $YOUR_TOP_LEVEL_FOLDER/$dir && `git config --get remote.origin.url > git_remote_origin.url` )
      # $(git config --get remote.origin.url > git_remote_origin.url);
done
