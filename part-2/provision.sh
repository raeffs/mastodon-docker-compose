#!/bin/bash

echo "Migrating database..."
bundle exec rake db:migrate

CHECK=/mastodon/public/system/provisioned

if [ -f "$CHECK" ]; then
    echo "Provisioning not required"
else
    echo "Provisioning mastodon..."

    bin/tootctl accounts create $MASTODON_ADMIN_USERNAME --email $MASTODON_ADMIN_EMAIL --confirmed --role Owner

    echo "Provisioning done"
    touch "$CHECK"
fi
