# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/limqingwei/.oh-my-zsh
source /Users/limqingwei/bin/finto-helpers.sh
ZSH_THEME="robbyrussell"


# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"


# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TEXLIVE_PATH=/usr/local/texlive/2016basic/bin/universal-darwin
export LEIN_PATH=$HOME/.lein/bin
export CARGO_PATH=$HOME/.cargo/bin
export GCLOUD_PATH=$HOME/google-cloud-sdk/bin
export PATH="$LEIN_PATH:$CARGO_PATH:$GLOUD_PATH:$HOME/bin:$TEXLIVE_PATH:$PATH"
export SBT_OPTS="-XX:+CMSClassUnloadingEnabled -Xms4096m -Xmx4096m -XX:ReservedCodeCacheSize=192m -Dfile.encoding=UTF8"
export APPENGINE_SDK_HOME="$HOME/appengine-java-sdk-1.9.49"

alias swagger2markup="java -Dswagger2markup.markupLanguage=MARKDOWN -Dswagger2markup.definitionOrderBy=AS_IS -jar /Users/limqingwei/projects/swagger2markup-cli/build/libs/swagger2markup-cli-1.3.1.jar"

fpath+=~/.zfunc
export PATH="/usr/local/Cellar/node/10.2.1:$PATH"
export PATH="/usr/local/Cellar/python/3.6.5/bin/python3.6:$PATH"
export PATH="/Users/limqingwei/Library/Python/3.7/bin:$PATH"
export PATH="/Users/limqingwei/.bloop:$PATH"

export SBT_IGNORE_BUILDTIME=true
export GRAAL_HOME="/Users/limqingwei/graalvm-ce-19.1.1/Contents/Home"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_111.jdk/Contents/Home"
# export PATH="$GRAAL_HOME/bin:$PATH"
export GPG_TTY=$(tty)
# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/limqingwei/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/limqingwei/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/limqingwei/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/limqingwei/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin:/Users/limqingwei/go/bin"
# source "/Users/limqingwei/.ghcup/env"

export NVM_DIR="$HOME/.nvm"

nvm() {
  echo "🚨 NVM not loaded! Loading now..."
  unset -f nvm
  export NVM_PREFIX=$(brew --prefix nvm)
  [ -s "$NVM_PREFIX/nvm.sh" ] && . "$NVM_PREFIX/nvm.sh"
  nvm "$@"
}

. ~/z.sh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/limqingwei/.sdkman"
[[ -s "/Users/limqingwei/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/limqingwei/.sdkman/bin/sdkman-init.sh"

# awsp tool to expose aws creds to env var easily
source ~/awsp_functions.sh
alias awsall="_awsListProfile"
alias awsp="_awsSwitchProfile"
alias awswho="aws configure list"

autoload bashcompinit
bashcompinit
complete -W "$(cat $HOME/.aws/credentials | grep -Eo '\[.*\]' | tr -d '[]')" _awsSwitchProfile
complete -W "$(cat $HOME/.aws/config | grep -Eo '\[.*\]' | tr -d '[]' | cut -d " " -f 2)" _awsSetProfile

