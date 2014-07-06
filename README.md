.dotfiles
=========

Creates basic dotfiles like .bashrc or .vimrc in the home directory.

Requirements:
-------------
- git client
- rcm for dotfile management

Installation
------------
- clone this repository to your home: ~/.dotfiles
  ATTENTION: This name and location of the cloned repository is required as 
             the pre-up hook for rcup is using it via a magic string (hard coded).
- run rcm
  + dryrun with lsrc to see what would be created or might be overridden!
    ATTENTION: Dryrun for the first time does not use the pre-up hooks and therfore 
               the rcm configuration file ~/.rcrc is not used.
               --> will be created by the pre-up hook when rcup is run.
  + run rcup to create dotfiles based on this repository
