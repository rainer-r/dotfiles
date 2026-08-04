-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- ~/.config/hypr/modules/environment.lua
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

-- Cursor
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Toolkit Backend
hl.env("GDK_BACKEND", "wayland,x11,*")
-- set Dota2's launch options:
-- SDL_VIDEODRIVER=x11 %command%: bc dota2 uses x11/XWayland
-- SDL_VIDEODRIVER=wayland: bc OBS on wayland uses pipewire screen capture
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("SDL_AUDIODRIVER", "pulse") -- for steam
hl.env("CLUTTER_BACKEND", "wayland")

-- XDG
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- Qt
-- hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1"): commented out for steamUI
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

-- CPU/GPU
-- Optimus (Intel display, NVIDIA renders)
-- NVIDIA
-- hl.env("LIBVA_DRIVER_NAME", "nvidia") -- transfered to D2 launch options for streaming fix
hl.env("LIBVA_DRIVER_NAME", "i965") -- Fix for moonlight blackscreen / server freezing
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")
-- Display Server: WLR: allow window managers (hypr) to interact directly with GPU
hl.env("WLR_DRM_DEVICES", "/dev/dri/card1") -- Intel owns the display / for Dota2 download crash
hl.env("WLR_NO_HARDWARE_CURSORS", "1") -- Fix for Dota2 download crash

-- Wayland / XWayland compatibility
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto") -- recommended for VSCode
hl.env("XAUTHORITY", os.getenv("HOME") .. "/.Xauthority")
