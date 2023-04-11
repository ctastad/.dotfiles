# .dotfiles
A collection of my linux configuration files

## New Environment

```sh
git clone --separate-git-dir=$HOME/.dotfiles git@github.com:ctastad/.dotfiles.git tmpdotfiles
rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
rm -r tmpdotfiles
```
