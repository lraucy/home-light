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
echo '*' >> ~/.git/info/exclude  # git won't track anything except forced.
```

Enable zsh as your default shell and you're up!
