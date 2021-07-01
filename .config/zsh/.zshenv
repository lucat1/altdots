#
# Defines environment variables.
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# java bullshit
JDTS=$HOME/.local/java
export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:/bin/java::")
export JAR=$JDTS/plugins/org.eclipse.equinox.launcher_1.6.100.v20201223-0822.jar
export JDTLS_CONFIG=$JDTS/config_linux
export WORKSPACE=$JDTS/workspace
export GRADLE_HOME=$JDTS/gradle
