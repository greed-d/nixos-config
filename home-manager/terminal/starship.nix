{ ... }:
{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      format = "$battery$directory ";
      right_format = " $git_branch $git_status $cmd_duration";
      directory = {
        format = "[ 󰀘  ](bg:#7aa2f7 fg:#1a1b26)[ $path ](bg:#353b45 fg:#BBC3DF)";
        truncation_length = 1;
        fish_style_pwd_dir_length = 1;
      };

      battery = {
        full_symbol = "󰂄";
        charging_symbol = "";
        discharging_symbol = "󰂅 ";
      };

      cmd_duration = {
        min_time = 1;
        # duration & style 
        format = "[[ 󰔚 ](bg:#32302f fg:#f7768e bold)$duration ](bg:#32302f fg:#BBC3DF)";
        disabled = false;
        style = "bg:none fg:#32302f";
      };

      git_branch = {
        format = "[[  ](bg:#32302f fg:#A2DD9D bold)$branch ](bg:#32302f fg:#86AAEC)";
      };

      git_status = {
        format = "[$all_status$ahead_behind ](bg:#32302f fg:#b4befe)";
        style = "bg:none fg:#161821";
        conflicted = "=";
        ahead = " ⇡\${count}";
        behind = " ⇣\${count}";
        diverged = " ⇕⇡$\{ahead_count}⇣\${behind_count}";
        up_to_date = " ";
        untracked = " ?$\{count}";
        modified = " !$\{count}";
        staged = " +$\{count}";
        deleted = " 󰅖$\{count}";
        stashed = " 󰏖";
        renamed = " »$\{count}";
      };

    };
  };
}
