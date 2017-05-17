# ROX-Filer settings
sudo apt-get intall rox-filer

# Options
# The Options and menus2 file are not created until first run
mkdir -p ~/.config/rox.sourceforge.net/ROX-Filer/

cat > ~/.config/rox.sourceforge.net/ROX-Filer/Options <<'EOF'
<?xml version="1.0"?>
<Options>
  <Option name="display_unkn_colour">#000000</Option>
  <Option name="toolbar_show_info">1</Option>
  <Option name="display_show_headers">1</Option>
  <Option name="pinboard_right_margin">0</Option>
  <Option name="filer_beep_fail">1</Option>
  <Option name="bind_single_click">0</Option>
  <Option name="blackbox_hack">0</Option>
  <Option name="action_delete">0</Option>
  <Option name="display_caps_first">0</Option>
  <Option name="bind_single_pinboard">1</Option>
  <Option name="pinboard_fg_colour">#fff</Option>
  <Option name="action_link">1</Option>
  <Option name="pinboard_clamp_icons">1</Option>
  <Option name="bind_dclick_resizes">1</Option>
  <Option name="display_pipe_colour">#444444</Option>
  <Option name="panel_style">1</Option>
  <Option name="pinboard_tasklist_per_workspace">0</Option>
  <Option name="panel_on_top">0</Option>
  <Option name="toolbar_min_width">1</Option>
  <Option name="panel_avoid">1</Option>
  <Option name="dnd_drag_to_icons">1</Option>
  <Option name="display_cdev_colour">#000000</Option>
  <Option name="display_adir_colour">#006000</Option>
  <Option name="menu_quick">0</Option>
  <Option name="toolbar_disable">gtk-close</Option>
  <Option name="filer_change_size_num">30</Option>
  <Option name="display_exec_colour">#006000</Option>
  <Option name="action_mount_command">mount</Option>
  <Option name="display_colour_types">1</Option>
  <Option name="action_mount">1</Option>
  <Option name="action_brief">0</Option>
  <Option name="display_inherit_options">1</Option>
  <Option name="filer_auto_resize">1</Option>
  <Option name="pinboard_image_scaling">0</Option>
  <Option name="panel_width">52</Option>
  <Option name="pinboard_top_margin">0</Option>
  <Option name="action_newer">0</Option>
  <Option name="pinboard_bg_colour">#888</Option>
  <Option name="session_panel_name">Default</Option>
  <Option name="filer_unique_windows">0</Option>
  <Option name="session_pinboard_name">Default</Option>
  <Option name="dnd_left_menu">1</Option>
  <Option name="panel_monitor">0</Option>
  <Option name="bind_new_button_1">0</Option>
  <Option name="pinboard_tasklist">1</Option>
  <Option name="display_large_width">155</Option>
  <Option name="dnd_no_hostnames">1</Option>
  <Option name="display_err_colour">#ff0000</Option>
  <Option name="display_dirs_first">1</Option>
  <Option name="filer_view_type">1</Option>
  <Option name="display_show_full_type">0</Option>
  <Option name="display_icon_size">3</Option>
  <Option name="vertical_order_small">0</Option>
  <Option name="display_sort_by">0</Option>
  <Option name="action_copy">1</Option>
  <Option name="dnd_uri_handler">x-terminal-emulator -e wget -c $1</Option>
  <Option name="dnd_spring_delay">400</Option>
  <Option name="menu_iconsize">1</Option>
  <Option name="display_bdev_colour">#000000</Option>
  <Option name="action_move">1</Option>
  <Option name="pinboard_bottom_margin">0</Option>
  <Option name="menu_xterm">xfce4-terminal</Option>
  <Option name="display_show_hidden">0</Option>
  <Option name="dnd_middle_menu">1</Option>
  <Option name="vertical_order_large">0</Option>
  <Option name="display_sock_colour">#ff00ff</Option>
  <Option name="pinboard_shadow_colour">#000</Option>
  <Option name="panel_is_dock">1</Option>
  <Option name="display_file_colour">#000000</Option>
  <Option name="filer_size_limit">75</Option>
  <Option name="xattr_show">1</Option>
  <Option name="toolbar_type">1</Option>
  <Option name="action_umount_command">umount</Option>
  <Option name="pinboard_grid_step">32</Option>
  <Option name="session_panel_or_pin">2</Option>
  <Option name="display_door_colour">#ff00ff</Option>
  <Option name="icon_theme">ROX</Option>
  <Option name="filer_beep_multi">1</Option>
  <Option name="pinboard_shadow_labels">1</Option>
  <Option name="label_font"></Option>
  <Option name="iconify_dir">1</Option>
  <Option name="pinboard_forward_buttons_13">0</Option>
  <Option name="panel_obey_workarea">0</Option>
  <Option name="action_eject_command">eject</Option>
  <Option name="pinboard_left_margin">0</Option>
  <Option name="panel_xinerama">0</Option>
  <Option name="action_force">0</Option>
  <Option name="display_dir_colour">#000080</Option>
  <Option name="display_small_width">250</Option>
  <Option name="xattr_ignore">0</Option>
  <Option name="action_recurse">0</Option>
  <Option name="override_redirect">0</Option>
  <Option name="iconify_start">1</Option>
  <Option name="display_details">0</Option>
  <Option name="display_show_thumbs">0</Option>
  <Option name="dnd_spring_open">0</Option>
  <Option name="filer_short_flag_names">0</Option>
</Options>
EOF

cat > ~/.config/rox.sourceforge.net/ROX-Filer/menus2 <<'EOF'
; rox GtkAccelMap rc-file         -*- scheme -*-
; this file is an automated accelerator map dump
;
; (gtk_accel_path "<filer>/Window/Home Directory" "<Primary>Home")
; (gtk_accel_path "<filer>/Help/Manual" "")
; (gtk_accel_path "<filer>/Window/Shell Command..." "<Shift>exclam")
; (gtk_accel_path "<filer>/Display/Reversed" "")
; (gtk_accel_path "<filer>/Display/Sort by Group" "")
; (gtk_accel_path "<filer>/File/Link..." "")
; (gtk_accel_path "<filer>/Display/Show Thumbnails" "")
; (gtk_accel_path "<filer>/Display/Smaller Icons" "minus")
; (gtk_accel_path "<filer>/Window/Follow Symbolic Links" "")
; (gtk_accel_path "<filer>/File/" "")
; (gtk_accel_path "<filer>/File/Shift Open" "")
; (gtk_accel_path "<filer>/Window/" "")
; (gtk_accel_path "<filer>/Window/Switch to Terminal" "")
; (gtk_accel_path "<filer>/New/Blank file" "<Primary>n")
; (gtk_accel_path "<filer>/Display/Sort by Date" "")
; (gtk_accel_path "<filer>/Display/Icons, With.../Times" "")
; (gtk_accel_path "<filer>/Window/Show Log" "")
; (gtk_accel_path "<filer>/Display/Refresh" "")
; (gtk_accel_path "<filer>/File/Send To..." "")
; (gtk_accel_path "<filer>/File/Copy..." "<Primary>c")
; (gtk_accel_path "<filer>/Window/Close Window" "<Primary>q")
; (gtk_accel_path "<filer>/Display/Bigger Icons" "equal")
; (gtk_accel_path "<filer>/Display/Sort by Owner" "")
; (gtk_accel_path "<filer>/Display/Filter Directories With Files" "")
; (gtk_accel_path "<filer>/Window/Enter Path..." "slash")
; (gtk_accel_path "<filer>/File/Set Icon..." "")
; (gtk_accel_path "<filer>/Display/Sort by Name" "")
; (gtk_accel_path "<filer>/Display/Icons, With.../Permissions" "")
; (gtk_accel_path "<filer>/Window/Parent, New Window" "")
; (gtk_accel_path "<filer>/Display/List View" "")
; (gtk_accel_path "<filer>/File/Customise Menu..." "")
; (gtk_accel_path "<filer>/File/Permissions" "")
; (gtk_accel_path "<filer>/Help/Show Help Files" "F1")
; (gtk_accel_path "<filer>/File/Find" "<Primary>f")
; (gtk_accel_path "<filer>/File/Delete" "<Primary>x")
; (gtk_accel_path "<filer>/Display/Sort by Size" "")
; (gtk_accel_path "<filer>/New/Directory" "")
; (gtk_accel_path "<filer>/Display/Icons, With.../Sizes" "")
; (gtk_accel_path "<filer>/Display/Automatic" "")
; (gtk_accel_path "<filer>/Select/Clear Selection" "")
; (gtk_accel_path "<filer>/Window/Resize Window" "<Primary>e")
; (gtk_accel_path "<filer>/Window/Show Bookmarks" "<Primary>b")
; (gtk_accel_path "<filer>/Select/Invert Selection" "")
; (gtk_accel_path "<filer>/File/Properties" "<Primary>p")
; (gtk_accel_path "<filer>/File/Set Type..." "")
; (gtk_accel_path "<filer>/Window/New Window" "")
; (gtk_accel_path "<filer>/Display/Show Hidden" "<Primary>h")
; (gtk_accel_path "<filer>/Window/Terminal Here" "grave")
; (gtk_accel_path "<filer>/Display/Save Current Display Settings..." "")
; (gtk_accel_path "<filer>/Display/Filter Files..." "")
; (gtk_accel_path "<filer>/New/Customise Menu..." "")
; (gtk_accel_path "<filer>/Select/Select If..." "<Shift>question")
; (gtk_accel_path "<filer>/Window/Parent, Same Window" "")
; (gtk_accel_path "<filer>/Options..." "")
; (gtk_accel_path "<filer>/Display/Icons View" "")
; (gtk_accel_path "<filer>/Help/About ROX-Filer..." "")
; (gtk_accel_path "<filer>/File/Set Run Action..." "asterisk")
; (gtk_accel_path "<filer>/Select/Select All" "<Primary>a")
; (gtk_accel_path "<filer>/Display/Sort by Type" "")
; (gtk_accel_path "<filer>/Select/Select by Name..." "period")
; (gtk_accel_path "<filer>/Display/" "")
; (gtk_accel_path "<filer>/Display/Icons, With.../Types" "")
; (gtk_accel_path "<filer>/File/Rename..." "")
; (gtk_accel_path "<filer>/File/Count" "")
EOF

xmlstarlet edit -L -u "/Options/Option[@name='display_inherit_options']" -v '1' ~/.config/rox.sourceforge.net/ROX-Filer/Options
xmlstarlet edit -L -u "/Options/Option[@name='display_dirs_first']" -v '1' ~/.config/rox.sourceforge.net/ROX-Filer/Options
xmlstarlet edit -L -u "/Options/Option[@name='filer_view_type']" -v '1' ~/.config/rox.sourceforge.net/ROX-Filer/Options
xmlstarlet edit -L -u "/Options/Option[@name='menu_xterm']" -v 'xfce4-terminal' ~/.config/rox.sourceforge.net/ROX-Filer/Options
