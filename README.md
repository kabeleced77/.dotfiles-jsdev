.dotfiles
=========

Provides basic dotfiles for

- bash
- vim
- tmux
- top
- git

Requirements:
-------------
- git client to check this repository out
- rcm for dotfile management creates the links to this repository (https://github.com/thoughtbot/rcm)
- vim-7.3+ with activated Python support to use all the JavaScript bundles configured
- cmake to build a tmux cpu-stats plugin

Installation
------------
- clone this repository to your home: ~/.dotfiles

    git clone https://github.com/kabeleced77/.dotfiles.git ~/.dotfiles

  ATTENTION: This name and location of the cloned repository is required as 
             the pre-up hook for rcup is using it via a magic string (hard coded).

- run rcup to create all the links to the dotfiles and directories of this repository
  + dryrun with ``lsrc`` to see what would be created or might be overridden!
    ATTENTION: Dryrun for the first time does not use the pre-up hooks and therfore 
               the rcm configuration file ~/.rcrc is not used.
               --> will be created by the pre-up hook when rcup is run.
  + run rcup to create dotfiles based on this repository
    rcup

- tmux configuration
  tmux itself is configured through the submodule 'tmux-config'

    cd ~/.dotfiles
  
    git submodule init
  
    git submodule update
  

  tmux-conifg itself has also a submodule which can be loaded

    ``cd ~/.dotfiles/gitsubmodules/tmux-config``
    
    ``git submodule init``
    
    ``git submodule update``
    
    ``cd vendor/tmux-mem-cpu-load``
    
    ``cmake .``
    
    ``make``
    
    ``sudo make install``
    

  run tmux and enjoy

- Vim configuration
  + run ~/.vim/sync-bundles.sh to prepare vim using vundle - could take a while

    cd ~/.vim
    ./sync-bundles.sh

  + install YCM - YouCompleteMe - short:
    cd ~/.vim/bundle/YouCompleteMe
    ./install.sh --clang-completer

    for more see doc of that bundle
