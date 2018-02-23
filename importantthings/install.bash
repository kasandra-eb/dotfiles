update_installed_lists() {
    brew ls > installed_via_brew.txt
    brew cask ls > installed_via_cask.txt 
    # brew_apps.txt is static (ie you have to update it manually)
}

install_brew_stuff() {
  # install normal brew stuff
  for package in $(cat ~/dotfiles/importantthings/installed_via_brew.txt)
    do
        brew install $package
  done

  # install cask brew stuff 
  for package in $(cat ~/dotfiles/importantthings/installed_via_cask.txt)
    do
        brew cask install $package
  done

  # install misc brew stuff
  for package in $(cat brew_apps.txt)
    do 
      brew install $package 

  done
}

install_eventbrite_repos() {
  EB_GITHUB_URL="https://github.com/eventbrite/"
  
  # make the eventbrite directory
  mkdir -p ~/eventbrite
  pushd $(pwd)
  cd ~/eventbrite 

  #git clone all of the eventbrite repos that you currently have downloaded

  for repo in $(cat ~/dotfiles/importantthings/eventbrite_repo_names.txt)
    do 
      git clone "$EB_GITHUB_URL$repo.git"

  done

  # change back to orginial directory
  popd 
}

install_presto_stuff() {
  echo “follow instructions at https://docs.evbhome.com/data-foundry/tools_presto.html#access-via-presto-cli”
}

main() {
    install_brew_stuff
    install_eventbrite_repos
    install_presto_stuff
}

main
