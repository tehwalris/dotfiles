# Based on Jim-Zenn/fish-theme-ocean

function fish_mode_prompt
  # Turns off mode indicator
end

# Oceanic Next
set -g base03  1B2B34
set -g base02  343D46
set -g base01  4F5B66
set -g base00  546069
set -g base0   65737E
set -g base1   A7ADBA
set -g base2   CDD3DE
set -g base3   D8DEE9
set -g red     EC5F67
set -g orange  F99157
set -g yellow  F8C662
set -g green   8fc189
set -g cyan    5FB3B3
set -g blue    6699CC
set -g magenta C594C5
set -g violet  AB7967

# solarized fish
set -g fish_color_normal      $base0
set -g fish_color_command     -o $green
set -g fish_color_quote       $cyan
set -g fish_color_redirection $base0
set -g fish_color_end         $base0
set -g fish_color_error       $red
set -g fish_color_param       $blue
set -g fish_color_comment     $base01
set -g fish_color_match       $yellow
set -g fish_color_search_match "--background=$base01"
set -g fish_color_operator    $orange
set -g fish_color_escape      $cyan

# Used by fish_prompt
set -g fish_color_hostname    $cyan
set -g fish_color_cwd         $yellow
set -g fish_color_git         $green

# fish Prompt
function fish_prompt
  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
    if not set -q __fish_prompt_char
      switch (id -u)
        case 0
          set -g __fish_prompt_char ' ⚡'
        case '*'
          set -g __fish_prompt_char ''
      end
    end
  end

  set -q oceanic_next_git_branch_glyph
    or set -g oceanic_next_git_branch_glyph " "
  set -q oceanic_next_git_dirty_glyph
    or set -g oceanic_next_git_dirty_glyph ""


  # Cache exit status
  set -l last_status $status
  set -l cwd (basename (prompt_pwd))

  set -g normal_color $blue
  set -g insert_color $green
  set -g visual_color $orange
  set -g replace_color $red

  function __oceanic_next_prompt_bindmode
    set_color -o $base3
    switch $fish_bind_mode
      case default
        set_color -b $normal_color
        echo -n " N "
        set_color normal
        set_color $normal_color
      case insert
        set_color -b $insert_color
        echo -n " I "
        set_color normal
        set_color $insert_color
      case visual
        set_color -b $visual_color
        echo -n " V "
        set_color normal
        set_color $visual_color
      case replace_one
        set_color -b $replace_color
        echo -n " R "
        set_color normal
        set_color $replace_color
      case "*"
        set_color -b $replace_color
        echo -n $fish_bind_mode
        set_color normal
        set_color $replace_color
    end

    set_color -b $base03
    if test (__oceanic_next_git_branch_name)
      set_color -b $base00
    end
    echo -n ""
    set_color normal
  end

  function __oceanic_next_prompt_bindmode_color
    switch $fish_bind_mode
      case default
        set_color $normal_color
      case insert
        set_color $insert_color
      case visual
        set_color $visual_color
      case replace-one
        set_color $replace_color
    end
  end

  function __oceanic_next_prompt_bindmode_color_bg
    set_color -o $base2
    switch $fish_bind_mode
      case default
        set_color -b $normal_color
      case insert
        set_color -b $insert_color
      case visual
        set_color -b $visual_color
      case replace-one
        set_color -b $replace_color
    end
  end


  function __oceanic_next_git_branch_name
    echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
  end

  function __oceanic_next_is_git_dirty
    echo (command git status -s --ignore-submodules=dirty ^/dev/null)
  end

  function __oceanic_next_prompt_git
    if test (__oceanic_next_git_branch_name)
      set_color -b $base00

      set -l git_branch (__oceanic_next_git_branch_name)
      echo -n -s " "$git_branch" "

      if test (__oceanic_next_is_git_dirty)
      echo -n -s $oceanic_next_git_dirty_glyph" "
      end

      set_color -b $base03
      set_color $base00
      echo -n ""
    end
    set normal
  end

  # echo

  # line 2
  set_color normal

  # __oceanic_next_prompt_bindmode_color_bg

  switch (id -u)
    case 0
      set_color -b $red
    case "*"
      set_color -b $base00
  end

  set_color -o $base3

  echo -n -s $__fish_prompt_char


  # Print prompt
  # line 1
  __oceanic_next_prompt_bindmode

  set_color -o $base2

  __oceanic_next_prompt_git

  set_color normal
  set_color -b $base03

  echo -n -s ' '(prompt_pwd)' '

  set_color -b normal
  set_color $base03
  echo -n ""

  set_color normal

  echo -n " "
end
