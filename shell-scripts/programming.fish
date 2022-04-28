#################################################################
######################PROGRAMMING ALIASES########################
#################################################################

##########################NODEJS########################
alias nvm-version=" echo  'nvm: '(nvm --version)"
alias node-version="echo  'node: '(node --version)"
alias npm-version=" echo  'npm: '(npm --version)"
alias node-info="nvm-version && node-version && npm-version"

## you have to specify these commands in package.json ##
alias dev="npm run dev"
alias debug="npm run debug"
alias prod="npm run prod"

##########################C++ Programming########################
function cbuild --argument input_file output_file
    g++ -Wall -std=c++14 $input_file -o $output_file && ./$output_file
end

##########################REACT programming########################
alias new-react="npx create-react-app"

##########################DOCKER########################
### Stop Active Containers

function stopActiveContainers -d "Stopping Active Containers"
    docker stop (docker ps -q)
end
