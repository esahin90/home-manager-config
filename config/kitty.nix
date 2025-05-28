{
  config,
  pkgs,
  ...
}:
let
  tb_bg = "#36a3d9";
  tb_fg = "#0e1419";
in
{
  programs.kitty = {
    enable = true;
    package = config.lib.nixGL.wrap pkgs.kitty;
    settings = {
      font_size = 14;
      background_opacity = 0.4;
      background_blur = 32;
      wheel_scroll_min_lines = 1;
      window_padding_width = 4;
      confirm_os_window_close = 0;
      scrollback_lines = 10000;
      enable_audio_bell = false;
      mouse_hide_wait = 60;
      cursor_trail = 1;
      tab_fade = 1;
      active_border_color = tb_bg;
      inactive_border_color = tb_fg;
      tab_title_template = "{index}:{tab.active_exe}";
      tab_bar_background = tb_bg;
      inactive_tab_background = tb_bg;
      inactive_tab_foreground = tb_fg;
      active_tab_background = tb_fg;
      active_tab_foreground = tb_bg;
      active_tab_font_style = "bold";
      tab_bar_edge = "bottom";
      tab_bar_margin_width = 0;
      tab_bar_style = "slant";
      enabled_layouts = "splits";
    };
    extraConfig = ''

      # Clipboard
      map ctrl+shift+v        paste_from_selection
      map shift+insert        paste_from_selection

      # Scrolling
      map ctrl+shift+up        scroll_line_up
      map ctrl+shift+down      scroll_line_down
      map ctrl+shift+k         scroll_line_up
      map ctrl+shift+j         scroll_line_down
      map ctrl+shift+page_up   scroll_page_up
      map ctrl+shift+page_down scroll_page_down
      map ctrl+shift+home      scroll_home
      map ctrl+shift+end       scroll_end
      map ctrl+shift+h         show_scrollback

      # Window management
      map alt+n               new_os_window
      map alt+w               close_window
      map ctrl+shift+enter    launch --location=hsplit
      map ctrl+shift+s        launch --location=vsplit
      map ctrl+shift+]        next_window
      map ctrl+shift+[        previous_window
      map ctrl+shift+f        move_window_forward
      map ctrl+shift+b        move_window_backward
      map ctrl+shift+`        move_window_to_top
      map ctrl+shift+1        first_window
      map ctrl+shift+2        second_window
      map ctrl+shift+3        third_window
      map ctrl+shift+4        fourth_window
      map ctrl+shift+5        fifth_window
      map ctrl+shift+6        sixth_window
      map ctrl+shift+7        seventh_window
      map ctrl+shift+8        eighth_window
      map ctrl+shift+9        ninth_window # Tab management
      map ctrl+shift+0        tenth_window
      map ctrl+shift+right    next_tab
      map ctrl+shift+left     previous_tab
      map ctrl+shift+t        new_tab
      map ctrl+shift+q        close_tab
      map ctrl+shift+l        next_layout
      map ctrl+shift+.        move_tab_forward
      map ctrl+shift+,        move_tab_backward

      # resize split
      map ctrl+left resize_window narrower
      map ctrl+right resize_window wider

      # Miscellaneous
      map ctrl+shift+up      increase_font_size
      map ctrl+shift+down    decrease_font_size
      map ctrl+shift+backspace restore_font_size
    '';
  };
}
