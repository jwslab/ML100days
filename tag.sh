TAG_VER="$(git describe --abbrev=0 --tags)"
echo 'The Latest Tag :'"$TAG_VER" $'\n'

echo '##### Generating New Tag #####'
IFS=. VER=(${TAG_VER##*-})

FIRST=${VER[0]}
SECOND=${VER[1]}
THIRD=${VER[2]}

TAG_AUTO=$FIRST.$SECOND.$(($THIRD + 1))
echo 'The New Tag :'"$TAG_AUTO" $'\n'

echo '##### Adding tag commit #####'
git commit --allow-empty -m "$TAG_AUTO"
git push

echo ''
echo '##### Taging #####'
git tag "$TAG_AUTO"

echo ''
echo '##### Pushing tag #####'
git push origin "$TAG_AUTO"
