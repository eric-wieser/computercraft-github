computercraft-github
====================

Seen these cool projects on github? Pain to download? This program is for you!

Installation
------------
The easiest way to install this project on your computercraft computer is by running:

    pastebin run p8PJVxC4 [<branch>|<tag>]

The branch or tag argument is optional, and defaults to 'master'.

Usage
-----

    github clone <user>/<repo> [<branch>|<tag>] [<destination>]

The branch or tag argument is optional, and defaults to 'master'.

The destination folder is optional, and defaults to the current folder name. Watch out - this script will happily overwrite any existing files!

    > github clone eric-wieser/computercraft-github ccgit
    Discovering files...
    Downloading:
      github
      readme.md
      apis/dkjson
      apis/github
      programs/github
    [============================================] 100%
    > ls ccgit
    apis      programs
    github readme.md

---

Thanks to David Kolf for his [dkjson](http://chiselapp.com/user/dhkolf/repository/dkjson/home) module, which made parsing github APIs possible.
