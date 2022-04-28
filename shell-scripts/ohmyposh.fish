############################################################################################
######################### MY Configuration File For OH MY POSH #############################
############################################################################################

if ! test -e ~/jandedobbeleer.omp.json
    touch ~/jandedobbeleer.omp.json
end

set MAIN_OH_MY_POSH_FILE_THEME          ~/jandedobbeleer.omp.json

set MAIN_OHMYPOSH_THEMES                $MY_APPLICATIONS/$OH_MY_POSH_REPO/themes 

function setOMPTheme --argument theme_json
    set __themes__ (command ls $MAIN_OHMYPOSH_THEMES | grep ".omp.json" | wc -l)

    # set $theme_json ""
    echo -e "We have $__themes__ theme, which one?\n\n"
    command ls $MAIN_OHMYPOSH_THEMES #| sed "s:.omp.json::g"
    echo -e "\n\n"
    # echo $__themes__
    set my_theme ""
    if test "$theme_json" = ""
        read my_theme
        set foun (command ls $MAIN_OHMYPOSH_THEMES | grep "$my_theme")
        set founNum (echo $foun | xargs -n1 | wc -l)
        echo $founNum
        set k (seq $founNum | xargs -I {} echo -e {}: $foun \n | xargs -n1)
        if test "$foun" = ""
            echo "No themes found with your choice!"
            return 1
        end
        if test "$founNum" -ge 1
            echo $k | grep $my_theme
            read -P "which theme? " inner_themes
            set cho (echo $k | grep $inner_themes | awk '{print $NF}')
            set theme_json $cho
            # set theme_json $inner_themes.omp.json
            cat $MAIN_OHMYPOSH_THEMES/$theme_json >$MAIN_OH_MY_POSH_FILE_THEME
            return 0
        end

    end
    set theme_json $my_theme.omp.json
    cat $MAIN_OHMYPOSH_THEMES/$theme_json >$MAIN_OH_MY_POSH_FILE_THEME
end
