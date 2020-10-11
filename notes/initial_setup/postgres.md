# Postgres setup

## Steps

1. Connect to the default database with user postgres:
`sudo -u postgres psql template1`

2. Set the password for user postgres, then exit psql (Ctrl-D):
`ALTER USER postgres with encrypted password 'xxxxxxx';`

3. Edit the pg_hba.conf file:

`sudo vim /etc/postgresql/9.1/main/pg_hba.conf`

and change "peer" to "md5" on the line concerning postgres:

`local      all     postgres     peer md5`

To know what version of postgresql you are running, look for the version folder under /etc/postgresql. Also, you can use Nano or other editor instead of VIM.

4. Restart the database :

`sudo /etc/init.d/postgresql restart`

(Here you can check if it worked with psql -U postgres).

5. Create a user having the same name as you (to find it, you can type whoami):

`sudo createuser -U postgres -d -e -E -l -P -r -s <my_name>`

The options tell postgresql to create a user that can login, create databases, create new roles, is a superuser, and will have an encrypted password. The really important ones are -P -E, so that you're asked to type the password that will be encrypted, and -d so that you can do a createdb.

Beware of passwords: it will first ask you twice the new password (for the new user), repeated, and then once the postgres password (the one specified on step 2).

6. Again, edit the pg_hba.conf file (see step 3 above), and change "peer" to "md5" on the line concerning "all" other users:

    local      all     all     peer md5

7. Restart (like in step 4), and check that you can login without -U postgres:

`psql template1`

Note that if you do a mere psql, it will fail since it will try to connect you to a default database having the same name as you (i.e. whoami). template1 is the admin database that is here from the start.

8. Now `createdb <dbname>` should work
