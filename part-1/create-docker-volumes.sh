docker volume create mastodon-db-volume
docker volume create mastodon-volume
docker run --rm -v mastodon-volume:/mastodon busybox /bin/sh -c 'chown -R 991:991 /mastodon'
