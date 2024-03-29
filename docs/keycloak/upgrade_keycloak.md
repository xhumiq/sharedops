# Upgrade Keycloak Docker container
> https://janikvonrotz.ch/2021/03/08/08-upgrade-keycloak-docker-container/

March 8, 2021

Upgrading Keycloak is not so difficult as supports automatically migrating the database to a new version.

Nonetheless, Keycloak is a critical piece of software in every infrastructure. Under no circumstances you want the upgrade to fail. I will show you some upgrade preparations for a docker-based setup that ensure you can restore the service in the worst case scenario.

Before upgrading the docker image, ensure you have:

__Created a database backup__

Use `pg_dump` to dump the Keycloak database.

__Exported realms including groups, roles and clients__

Open the realm in the Keycloak backend navigate to Mange > Export. Tick on all options and export the realm. Repeat this process for all realms.

__Stopped and renamed the old container__

Stop the existing container and rename it.

```
docker stop $KEYCLOAKD_CONTAINER && docker rename $KEYCLOAKD_CONTAINER $NEW_NAME
```

In the worst case scenario we can restore the database and restore to old container and state.

### Upgrade
Executing the upgrade is simple. In my case I simply had to change the image tag to a newer version.

```
jboss/keycloak:9.0.2 -> jboss/keycloak:12.0.4
```

Avoid using the latest tag!

### Troubleshooting
After upgrade the connected OAuth clients must be tested. While doing so errors might occur due to new restrictions from the Keycloak side.

__Invalid scope parameter__

After the upgrade I could not longer login with one of the OAuth providers. Whenever I tried to initiate the login flow it was immediately aborted. The Keycloak log threw this error:

```
KC-SERVICES0093: Invalid parameter value for: scope.
```

When I checked the login url on the client, I saw that the OAuth provider set scope=False. Explicitly setting the scope param of the OAuth provider resolved the issue.
