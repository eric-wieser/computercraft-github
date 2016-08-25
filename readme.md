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

### Cloning a repo
    github clone <user>/<repo> [-b <branchname> | -t <tagname>] [<destination>] [-a <username>]

The branch and tag arguments are optional, and default to 'master'.  You may only specify a branch or tag, you may not specify both.

The destination folder is optional, and defaults to the current folder name. Watch out - this script will happily overwrite any existing files!

The Authentication argument is optional. You must first create a user with `github auth` (see below) to use the authorized requests.

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

### Adding Authentication
To use authenticated requests you must first [create a github](https://help.github.com/articles/creating-an-access-token-for-command-line-use/) api token on your github account. You do not need to provide any api scopes for the token unless you plan on accessing private repositories.

    github auth <user> [<api token> | -d]

The delete argument is optional and will delete the specified user.

**Warning:** data provided to `github auth` will be stored locally on the computercraft computer. You can delete the access token at anytime by hitting the delete button in your personal [access tokens menu](https://github.com/settings/tokens) on github.
---

Thanks to David Kolf for his [dkjson](http://chiselapp.com/user/dhkolf/repository/dkjson/home) module, which made parsing github APIs possible.
