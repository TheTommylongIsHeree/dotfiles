{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    profiles.default.userSettings = {
      # THE BASICS
      "files.autoSave" = "afterDelay";
      "explorer.confirmDragAndDrop" = false;
      "security.workspace.trust.untrustedFiles" = "open";
      "workbench.startupEditor" = "welcomePageInEmptyWorkbench";
      "window.confirmBeforeClose" = "keyboardOnly";
      "workbench.editor.enablePreview" = false;

      # LOOK & FEEL
      "workbench.colorTheme" = "Catppuccin Mocha";
      "workbench.iconTheme" = "catppuccin-mocha";
      "catppuccin.accentColor" = "sky";
      "workbench.sideBar.location" = "right";
      "workbench.activityBar.location" = "top";
      "window.customTitleBarVisibility" = "auto";

      # FONTS (Standardized for Nix)
      "editor.fontFamily" = "'JetBrainsMono Nerd Font'";
      "editor.codeLensFontFamily" = "'JetBrainsMono Nerd Font'";
      "editor.inlayHints.fontFamily" = "'JetBrainsMono Nerd Font'";
      "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font'";
      "editor.fontSize" = 14;

      # VIM & TERMINAL
      "vim.useSystemClipboard" = true;
      "vim.leader" = " ";
      "terminal.integrated.defaultProfile.linux" = "fish";
      "terminal.integrated.enableMultiLinePasteWarning" = "never";
      "terminal.integrated.initialHint" = false;
      "terminal.integrated.profiles.linux" = {
        "fish" = { "path" = "${pkgs.fish}/bin/fish"; };
        "bash" = { "path" = "${pkgs.bash}/bin/bash"; "icon" = "terminal-bash"; };
      };

      # VSCORD (Rich Presence)
      "vscord.app.name" = "Visual Studio Code";
      "vscord.status.details.text.notInFile" = "Ain't editing a file";
      "vscord.status.image.large.editing.text" = "Editing a {lang} file";
      "vscord.status.image.small.notInFile.text" = "Taking a break";
      "vscord.status.buttons.button1.active.label" = "View GitHub profile";
      "vscord.status.buttons.button1.active.url" = "https://www.github.com/TheTommylongIsHeree";

      # DEVELOPMENT
      "git.autofetch" = true;
      "git.enableSmartCommit" = true;
      "redhat.telemetry.enabled" = false;
      
      # FORMATTERS
      "[html]" = { "editor.defaultFormatter" = "esbenp.prettier-vscode"; };
      "[javascript]" = { "editor.defaultFormatter" = "esbenp.prettier-vscode"; };
      "[json]" = { "editor.defaultFormatter" = "esbenp.prettier-vscode"; };

      # NIX SUPPORT
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nixd";
      "nix.formatterPath" = "nixpkgs-fmt";

      # REMOTE SSH
      "remote.SSH.remotePlatform" = {
        "100.85.143.85" = "linux";
        "100.72.59.95" = "linux";
        "Server" = "linux";
      };
    };
  };
}