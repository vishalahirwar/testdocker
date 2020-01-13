JAVA_OPTS="$JAVA_OPTS -DWIP_CONFIG_DIR=/usr/local/tomcat"
JAVA_OPTS="$JAVA_OPTS -DWIP_TIMEOUT=100"
JAVA_OPTS="$JAVA_OPTS -Denv.name=TEST"
#JAVA_OPTS="$JAVA_OPTS -Djavax.net.ssl.trustStore=/usr/local/tomcat/truststore.jks"
#JAVA_OPTS="$JAVA_OPTS -Djavax.net.ssl.trustStorePassword=changeit"
JAVA_OPTS="$JAVA_OPTS -Diap-business-url=${IAP_BUSINESS_URL}"
JAVA_OPTS="$JAVA_OPTS -Doidc.discovery.url=${OIDC_DISCOVERY_URL}"
JAVA_OPTS="$JAVA_OPTS -Doidc.client.id=${OIDC_CLIENT_ID}"
JAVA_OPTS="$JAVA_OPTS -Doidc.client.secret=${OIDC_CLIENT_SECRET}"
JAVA_OPTS="$JAVA_OPTS -Doidc.client.return_url=${OIDC_CLIENT_RETURN_URL}"
JAVA_OPTS="$JAVA_OPTS -Doidc.client.logout_url=${OIDC_CLIENT_LOGOUT_URL}"
JAVA_OPTS="$JAVA_OPTS -Doidc.client.scope=openid,profile,email,office,address,phone"
export JAVA_OPTS