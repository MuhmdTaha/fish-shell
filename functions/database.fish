################################### DATABASES ############################################
function read_confirm_helper
    while true
        echo -e "You did not specify a user!"
        read -l -P 'Do you want to continue as root ? [Y/n] ' confirm
        switch $confirm
            case Y y ''
                mysql --host=$host --user=root --password
                return 0
            case N n No nO no NO
                echo "Which user?"
                read user
                mysql --host=$host --user=$user --password
                return 1
        end
    end
end
######################################### MySQL ##########################################
function mysqlConnect --argument mysql_user host --description "Connect to MySQL database"
    if ! test "$host"
        set $host localhost
    end
    read_confirm_helper
end
