#!/bin/sh
cd /usr/local/glassfish3
if [ ! -f /usr/local/glassfish3/bin/asadmin ]; then
  cp -f /binarios/glassfish3 /usr/local/glassfish3
  
  fi
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------

if ! whoami &> /dev/null; then
cd /usr/local/glassfish3
  if [ -w /etc/passwd ]; then
    echo "${USER_NAME:-default}:x:$(id -u):0:${USER_NAME:-default} user:${HOME}:/sbin/nologin" >> /etc/passwd
  fi
fi
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------


        echo "AS_ADMIN_PASSWORD=" > /tmp/glassfishpwd
        echo "AS_ADMIN_NEWPASSWORD=${AS_ADMIN_PASSWORD}" >> /tmp/glassfishpwd

        # Change the admin password
        asadmin --user=admin --passwordfile=/tmp/glassfishpwd change-admin-password --domain_name domain1 && id
su - exemple

        # Log in the admin user
        # 
        # While using the `asadmin login` command is the proper way to do it,
        # there doesn't seem to be a way to pipe input to respond to its
        # interactive prompts for the username and password.
        #
        #   printf "admin\n${AS_ADMIN_PASSWORD}\n" | asadmin login
        #
        # Therefore, manually generate the .asadminpass file to "login".
        
        AS_ADMIN_PASSWORD_GFBASE64=`echo -n "$AS_ADMIN_PASSWORD" | base64`
        echo "asadmin://admin@localhost:4848 $AS_ADMIN_PASSWORD_GFBASE64" > /root/.asadminpass && id
su - exemple
        chmod 600 /root/.asadminpass && id
su - exemple

       
            echo "AS_ADMIN_PASSWORD=${AS_ADMIN_PASSWORD}" > /tmp/glassfishpwd
            asadmin start-domain            
            
            asadmin --user=admin --passwordfile=/tmp/glassfishpwd enable-secure-admin && id
su - exemple
            
            # Call asadmin at least once to establish a trust with the
            # self-signed certificate for the admin API.
            # asadmin --interactive=false version

           # asadmin stop-domain
       # fi

      #  rm /tmp/glassfishpwd
   # fi

  #  exec "$@"
#fi

#exec "$@"
exec "asadmin", "start-domain", "--verbose"
