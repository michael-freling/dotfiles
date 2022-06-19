fish_add_path $HOME/.anyenv/bin
# Load anyenv automatically by adding
# the following to ~/.config/fish/config.fish:

status --is-interactive; and source (anyenv init - fish|psub)

# Load nodenv automatically by appending
# the following to ~/.config/fish/config.fish:

status --is-interactive; and source (nodenv init - fish|psub)

