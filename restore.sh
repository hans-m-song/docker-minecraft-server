last=$(ls -1t backups | tail -1)
echo "restoring from last archive $last"
docker run --rm -it \
  -v minecraft-server_server-data:/destination \
  -v $(pwd)/backups:/source \
  ubuntu:20.04 \
  tar \
  -zxf \
  /source/$last \
  --directory /destination
