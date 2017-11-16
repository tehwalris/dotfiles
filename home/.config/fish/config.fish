source ~/.config/fish/theme.fish

set fish_greeting ""

function fish_user_key_bindings
  fish_vi_key_bindings
  bind -M insert \cn forward-char
  bind -M insert \en forward-word
end

pyenv init - | source
