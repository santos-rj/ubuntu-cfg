# Setting Up Your Terminal with Oh My Zsh, Spaceship, Dracula, and FiraCode

This tutorial will guide you through configuring your terminal with Oh My Zsh, the Spaceship prompt, the Dracula theme, and the FiraCode font. These tools enhance both the aesthetics and functionality of your terminal.

---

## Prerequisites

Ensure you have a Unix-based system (Mac or Linux). For Windows users, consider setting up a Linux subsystem (WSL).

---

## Step 1: Install Zsh

Install Zsh by following the instructions from the [Oh My Zsh wiki](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH).

Verify the installation:

```sh
zsh --version
```

You should see a version number like `zsh 5.9`.

---

## Step 2: Install Oh My Zsh

Run the following command to install Oh My Zsh:

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Edit configurations in the `~/.zshrc` file instead of `~/.bash_profile` moving forward. Restart your terminal to apply changes.

---

## Step 3: Set Up Dracula Theme

Dracula is a widely-used color scheme available for many terminal applications. Find your terminal-specific instructions on the [Dracula theme site](https://draculatheme.com):

- **Mac Terminal**: [Dracula for Terminal](https://draculatheme.com/terminal/)
- **Linux with Gnome**: [Dracula for Gnome Terminal](https://github.com/dracula/gnome-terminal)

---

## Step 4: Install FiraCode Font

1. Download the latest release of [FiraCode](https://github.com/tonsky/FiraCode/releases).
2. Extract the downloaded file and install the `.ttf` files on your system.
3. Configure your terminal to use FiraCode as the default font.

---

## Step 5: Install and Configure Spaceship Prompt

### Install Spaceship Prompt

Clone the Spaceship repository:

```sh
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
```

Create a symbolic link:

```sh
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
```

Set `ZSH_THEME` to `spaceship` in your `~/.zshrc` file:

```sh
ZSH_THEME="spaceship"
```

Restart your terminal.

### Optimize Spaceship Configuration

Add the following to `~/.zshrc` to customize the prompt:

```sh
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  exec_time     # Execution time
  line_sep      # Line break
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "
```

---

## Step 6: Add Plugins with ZInit

Install ZInit for plugin management:

```sh
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
```

Add the following plugins to `~/.zshrc` below the ZInit configuration:

```sh
zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light "spaceship-prompt/spaceship-vi-mode"
```

### Plugin Features

- **Fast Syntax Highlighting**: Highlights commands as you type.
- **Auto Suggestions**: Suggests commands from your history.
- **Command Completions**: Provides autocompletions for common tools like Yarn and Node.js.

---

## Step 7: Configure Integrated Terminal in VSCode

If you use VSCode, set Zsh as the default terminal by adding this to your `settings.json`:

```json
"terminal.integrated.shell.osx": "/bin/zsh"
```

---

## Final Touches

Your terminal should now be functional and visually appealing. For further customization, check out the full `.zshrc` file at [this Gist](https://gist.github.com/diego3g/b0513d5ff6d9d983c48bed3fd8f10cdb).

Enjoy your new terminal setup!
