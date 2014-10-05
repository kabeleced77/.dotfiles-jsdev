.dotfiles
=========

Provides basic dotfiles for

- ``bash``
- ``vim``
- ``tmux``
- ``top``
- ``git``

Requirements:
-------------
- ``git`` client to check this repository out
- ``rcm`` (https://github.com/thoughtbot/rcm) for dotfile management
  --> creates links of the dotfiles to the checked out repository
- ``vim`` (7.3+) with activated Python support to use all the JavaScript bundles configured. Usually standard ``vim`` packages are build witout Python support - but it's very easy to install ``vim`` from sources.

  Requirements for ``vim`` to build from sources (for Debian):
  ``python-dev`` and ``ncurseslib-dev`` must be available
  ```  
  apt-get install python-dev ncurseslib[version]-dev
  wget [URL-to-latest-source-code-version]
  ```  

  Configure ``vim`` source code
  ``--prefix`` where to be installed to, ``/opt/bin`` is assumed in later installed scripts
  ``--with-feature`` based on your taste and required ``vim`` features
  ``--enable-pythoninterp=yes`` required for many of the later installed plugins
  ``--with-python-conig-dir`` path containing Python config files, e.g. ``/usr/lib/python2.7/config``
  ```  
  ./configure --prefix=/opt/bin --with-features=huge --enable-pythoninterp=yes --with-python-config-dir=[Path-to-Ptyhon-config-dir]
  ```  

  Build and install (root privileges required) ``vim``
  ```  
  make
  make install
  ```  

- ``cmake`` to build a ``tmux`` cpu-stats plugin
- ``nodejs/npm`` to run install and updates of the ``vim`` plugin ``tern_for_vim``
  --> Try your package manager or install from sources - following the HOWTO for Debian:

  Preparation - get required building tools:
  ```  
  apt-get update
  apt-get install g++ curl libssl-dev
  ```  

  Get latest source code:
  ```  
  wget http://nodejs.org/dist/node-latest.tar.gz
  tar -xzvf node-latest.tar.gz
  cd node-v[VERSION]
  ```  

  Configure, compile and install - install must be done as user ``root`` if the installation shall be done into the system path - default:
  ```  
  ./configure
  make
  make install
  ```  

Installation
------------
- clone this repository to your home: ``~/.dotfiles``

  ```  
  git clone https://github.com/kabeleced77/.dotfiles.git ~/.dotfiles  
  ```  

  ATTENTION: This name and location of the cloned repository is required as the pre-up hook for ``rcup`` is using it via a magic string (hard coded).  

- run ``rcup`` to create all the links to the dotfiles and directories of this repository
  + dryrun with ``lsrc`` to see what would be created or might be overridden!

    ATTENTION: Dryrun for the first time does not use the pre-up hooks and therfore the ``rcm`` configuration file ``~/.rcrc`` is not used.  
      --> will be created by the pre-up hook when rcup is run.  
  + run ``rcup`` to create dotfiles based on this repository

- load submodules of this repository


  ```  
  cd ~/.dotfiles

  git submodule init

  git submodule update
  ```  

- ``tmux`` is configured through submodule ``tmux-conifg`` which itself has also a submodule which can be loaded

  HINT: Only required once per system as it is installed system wide.


  ```  
  cd ~/.dotfiles/gitsubmodules/tmux-config

  git submodule init

  git submodule update

  cd vendor/tmux-mem-cpu-load

  cmake .

  make

  sudo make install
  ```  

  run ``tmux`` and enjoy

- ``vim`` configuration
  + run ``~/.vim/sync-bundles.sh`` to prepare ``vim`` using ``vundle`` - could take a while

    HINT: Errors regarding missing of misconfigured ``vim`` plugins can be ignored here as they will be installed/configured in this step.

  ```
    cd ~/.vim

    ./sync-bundles.sh
  ```

  + install YCM - YouCompleteMe - short:

  ```  
    cd ~/.vim/bundle/YouCompleteMe
  ```  

    Run ``install.sh`` with option ``--clang-completer`` if you want to have support for C/C++/Objective-C/Objective-C++ otherwise without is enough. For more information or problems see YCM docs:

  ```  
    ./install.sh
  ```  
