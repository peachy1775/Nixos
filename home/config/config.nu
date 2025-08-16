$env.config.show_banner = false;
$env.config.use_kitty_protocol = true;
$env.config.buffer_editor = "code";
$env.editor = "code";

screenfetch

# ENV's
$env.XDG_CONFIG_HOME = $"($env.HOME)/.config"


# Custom commands instead of aliases with args
def nv [...args] {
  nvim ...$args
}
def ncim [...args] {
  nvim ...$args
}
def gc [...args] { git clone $args.0 }
# Open file or dir in VS Code
def v [...args] {
  code ...$args
}
# Open image(s) in imv
def pic [...args] {
  imv ...$args
}


# Custom 'cd' command
alias d = cd
alias clr = clear
alias y = yazi
alias usb = yazi /run/media/peaches

# Still works as a regular alias since it's a fixed command
alias nfs = sudo nixos-rebuild switch --flake .#peaches
#alias nfu = sudo nix flake update
alias gparted = sudo -E gparted

export def nfu [] {
  let currDir = (pwd)
# Navigate to your flake dir
  cd $"($env.HOME)/.dotfiles"
# Update the flake and rebuild
  sudo nix flake update
  sudo nixos-rebuild switch --flake .#peaches
# Return to previous directory
  cd $currDir
}

export def dev [] {
  nix develop ~/Dev
}

def force-quit [] {
  let pids = (run sh -c $"ps --ppid $nu.env.PID -o pid=" | lines)
  $pids | each { |pid| run kill -9 $pid }
  exit
}

def e [] {
  exit
}

# Load zoxide commands
source ~/.config/nushell/zoxide.nu


