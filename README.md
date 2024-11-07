# ubuntu-cfg

This repository provides a quick setup for configuring an Ubuntu environment, helping you install essential tools and configurations in one go. The repository includes:

- `README.md`: Documentation on how to run the setup script.
- `santos-rj-cfg.sh`: The actual script that installs and configures various packages, tools, and Git settings on your Ubuntu machine.

To get started, you can download the script directly from [this link](https://github.com/santos-rj/ubuntu-cfg) or clone the repository.

## Getting Started

To run the setup, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/santos-rj/ubuntu-cfg.git
   cd ubuntu-cfg
   ```

2. **Run the Script**:
   ```bash
   chmod +x santos-rj-cfg.sh
   ./santos-rj-cfg.sh
   ```

   This script will:
   - Update the system.
   - Install essential packages, including `curl`, `git`, `xclip`, and `zsh`.
   - Configure Git with your username and email.
   - Generate an SSH key and copy it to the clipboard for easy pasting into GitHub or GitLab.
   - Install development tools like VSCode, DBeaver, and PyCharm.
   - Set up Brave and Chrome browsers.
   - Install Oh My Zsh for an improved terminal experience.

   **Note**: During setup, you’ll be asked for your Git configuration and if you'd like to set Vim as your default Git editor.

## Terminal Configuration

After running the script, you can further configure your terminal by customizing Oh My Zsh. To set up a stylish terminal theme, follow the guide on [Rocketseat’s blog for configuring Oh My Zsh](https://blog.rocketseat.com.br/terminal-com-oh-my-zsh-spaceship-dracula-e-mais/), which provides step-by-step instructions for themes and plugins to enhance your terminal's look and usability.

## Gnome Extensions

To enhance your Ubuntu desktop experience, consider installing the following GNOME extensions:

1. **User Themes**: Allows for custom themes in the Gnome Shell.
2. **Dash to Dock**: Provides a dock similar to macOS, making window management easier.
3. **Clipboard Indicator**: Keeps a history of your clipboard entries.
4. **cpufreq**: System Monitor and Power Manager.
5. **Desktop Icons NG (DING)**: Adds icons to the desktop. Fork of the original Desktop Icons extension, with several enhancements.
6. **Sound Input & Output Device Chooser**: Shows a list of sound output and input devices (similar to gnome sound settings) in the status menu below the volume slider. Various active ports like HDMI , Speakers etc. of the same device are also displayed for selection. V20+ needs python as dependency. If you want to continue with the old method without Python, use options to switch off New Port identification. But it works with only English.
7. **Simple System Monitor**: Show current CPU usage, memory usage and net speed on panel.
For best experience, please use monospaced font.



To install GNOME extensions:

1. Open Firefox and visit [Gnome Extensions](https://extensions.gnome.org/).
2. Follow the instructions to install the Gnome Shell Integration extension for your Browser.
3. Use the website to install the extensions listed above.

This completes your Ubuntu setup with essential tools, terminal enhancements, and desktop optimizations.

Happy coding!