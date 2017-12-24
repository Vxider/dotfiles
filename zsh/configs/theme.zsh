 # =============================================================================
 #                                   Theme
 # =============================================================================
 POWERLEVEL9K_MODE='awesome-patched'
 ZSH_THEME="powerlevel9k/powerlevel9k"

 POWERLEVEL9K_CONTEXT_TEMPLATE="%m"
 POWERLEVEL9K_HOME_SUB_ICON=''
 POWERLEVEL9K_PROMPT_ON_NEWLINE=true

 POWERLEVEL9K_VI_INSERT_MODE_STRING='⌨'
 POWERLEVEL9K_VI_COMMAND_MODE_STRING="✏"
 POWERLEVEL9K_VI_MODE_FOREGROUND="0"
 #POWERLEVEL9K_VI_MODE_BACKGROUND="7"
 POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=3

 POWERLEVEL9K_DIR_OMIT_FIRST_CHARACTER=true

 POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND='black'
 POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND='178'
 POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="black"
 POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND="216"
 POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="112"
 POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="015"

 #POWERLEVEL9K_COMMAND_TIME_FOREGROUND='gray'
 POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='245'
 POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='black'

 #POWERLEVEL9K_TIME_BACKGROUND='175'
 POWERLEVEL9K_TIME_FORMAT='%D{%H:%M}'
 POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(vi_mode time context root_indicator dir dir_writable vcs)
 POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(background_jobs command_execution_time)