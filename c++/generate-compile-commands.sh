# here is a template for a command I use to genereate the compile_comands.json 
# https://stackoverflow.com/questions/21134120/how-to-turn-makefile-into-json-compilation-database

make --always-make --dry-run\
    | grep -wE 'gcc|g\+\+'\
    | grep -w '\-c'\
    | jq -nR\
    '[inputs|{directory:".", command:., file: match(" [^ ]+$").string[1:]}]'\
    > compile_commands.json
