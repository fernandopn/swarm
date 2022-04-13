pushd "$(dirname "$0")" || exit

#Decrypt Credentials
pushd keys || exit
sops -d google_key.sops.json > .google_key.json

GOOGLE_PROJECT_ID=$(sops -d secrets.sops.json | jq -r .private_project)
export GOOGLE_PROJECT_ID

RESTIC_PASSWORD=$(sops -d secrets.sops.json | jq -r .private_password)
export RESTIC_PASSWORD

BUCKET=$(sops -d secrets.sops.json | jq -r .private_bucket)
export BUCKET

popd || exit

GOOGLE_APPLICATION_CREDENTIALS=${PWD}/keys/.google_key.json
export GOOGLE_APPLICATION_CREDENTIALS

echo "$RESTIC_PASSWORD" | restic -r "gs:${BUCKET}:cluster/restic/$1" restore "$2" --target restored/

#Get rid of the Credentials
pushd keys || exit
rm .google_key.json
popd || exit

popd || exit
