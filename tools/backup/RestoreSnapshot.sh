pushd "$(dirname "$0")"

#Decrypt Credentials
pushd keys
sops -d google_key.sops.json > .google_key.json
export GOOGLE_PROJECT_ID=$(sops -d secrets.sops.json | jq -r .private_project)
export RESTIC_PASSWORD=$(sops -d secrets.sops.json | jq -r .private_password)
export BUCKET=$(sops -d secrets.sops.json | jq -r .private_bucket)
popd

export GOOGLE_APPLICATION_CREDENTIALS=${PWD}/keys/.google_key.json

echo $RESTIC_PASSWORD | restic -r gs:${BUCKET}:cluster/restic/$1 restore $2 --target restored/

#Get rid of the Credentials
pushd keys
rm .google_key.json
popd

popd
