computercraft-github
====================

Seen these cool projects on github? Pain to download? This program is for you!

Installation
------------
If only there were some easy way to download this program from github...

Copy both files in `apis/` to `/apis/`, and put `programs/github` wherever you want it.

Usage
-----

    github clone <user>/<repo name> [destination folder]

The destination folder is optional, and defaults to the current folder name. Watch out - this script will happily overwrite any existing files!

    > github clone eric-wieser/computercraft-github ccgit
    Discovering files...
    Downloading:
      readme.md
      apis/dkjson
      apis/github
      programs/github
    [============================================] 100%
    > ls ccgit
    apis      programs
    readme.md