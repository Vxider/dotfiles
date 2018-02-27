 # =============================================================================
 #                                   Theme
 # =============================================================================
 POWERLEVEL9K_MODE='awesome-patched'
 ZSH_THEME="powerlevel9k/powerlevel9k"

 DEFAULT_FOREGROUND=006
 DEFAULT_BACKGROUND=235
 DEFAULT_COLOR=$DEFAULT_FOREGROUND

 POWERLEVEL9K_CONTEXT_TEMPLATE="%m"
 POWERLEVEL9K_HOME_SUB_ICON=''
 POWERLEVEL9K_PROMPT_ON_NEWLINE=false

 POWERLEVEL9K_SSH_ICON='📡'
 POWERLEVEL9K_VI_INSERT_MODE_STRING=''
 POWERLEVEL9K_VI_COMMAND_MODE_STRING='\u270F'
 POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND="$DEFAULT_FOREGROUND"
 POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND="$DEFAULT_BACKGROUND"
 POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND="$DEFAULT_FOREGROUND"
 POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND="$DEFAULT_BACKGROUND"

 POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=3

 POWERLEVEL9K_DIR_OMIT_FIRST_CHARACTER=true

 POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND="$DEFAULT_FOREGROUND"
 POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND="$DEFAULT_BACKGROUND"
 POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="$DEFAULT_FOREGROUND"
 POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND="$DEFAULT_BACKGROUND"
 POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="$DEFAULT_BACKGROUND"
 POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="$DEFAULT_FOREGROUND"
 POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND="$DEFAULT_BACKGROUND"
 POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND="$DEFAULT_FOREGROUND"
 POWERLEVEL9K_EXECUTION_TIME_ICON="\u23F1"

#POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR="\uE0B6"
#POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR="%F{$(( $DEFAULT_BACKGROUND - 2 ))}|%f"

 #POWERLEVEL9K_TIME_BACKGROUND='175'
 POWERLEVEL9K_TIME_FORMAT='%D{%H:%M}'
 POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator dir_writable vcs)
 #POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(vi_mode_joined context root_indicator dir dir_writable vcs)
 POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time vi_mode_joined)
 POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
