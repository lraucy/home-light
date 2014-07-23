Home configuration.

Install:

```
cd ~
git init
git remote add origin https://github.com/lraucy/home-light.git  # Fork the repository and use yours instead
git fetch
git checkout master  # You might need to rename old config files because of conflict
git submodule init
git submodule update
```

Then edit `~/.git/info/exclude` and add the line:
```
*
```
So git won't track anything except if you force it.

Enable zsh as your default shell and you're up!
