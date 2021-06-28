import qualified Data.Map as M
import Data.Maybe (Maybe, fromJust, isNothing)
import Data.Monoid
import Graphics.X11.ExtraTypes.XF86
import System.Exit
import System.IO
import XMonad
import XMonad.Actions.CycleWS
import XMonad.Actions.GridSelect
import XMonad.Actions.SpawnOn
import XMonad.Actions.UpdatePointer
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.FadeWindows
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Layout.Gaps
import XMonad.Layout.Maximize
import XMonad.Layout.Minimize
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace (onWorkspace)
import XMonad.Layout.ResizableTile
import XMonad.Layout.SimpleFloat
import XMonad.Layout.Spacing
import XMonad.Layout.Tabbed
import XMonad.Layout.ThreeColumns
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig
import XMonad.Util.NamedScratchpad
import XMonad.Util.Run
import XMonad.Util.SpawnOnce
import XMonad.Util.WorkspaceCompare

myFont :: String
myFont = "xft:JetBrains Mono:Regular:size=12:antialias=true:hinting=true"

myTerminal = "alacritty"

-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

-- Whether clicking on a window to focus also passes the click to the window
myClickJustFocuses :: Bool
myClickJustFocuses = False

-- Width of the window border in pixels.
myBorderWidth = 1

-- Do mod4mask for the windows key
myModMask = mod1Mask

-- Length of the array is the no of workspaces and the string is the name of each
myWorkspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

myNormalBorderColor = "#4b565c"
myFocusedBorderColor = "#abb2bf"

------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
myKeys conf@(XConfig {XMonad.modMask = modm}) =
  M.fromList $

    -- launch a terminal
    [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf),

      -- launch rofi
      ((modm, xK_p), spawn "rofi -modi drun -theme slate  -show drun -icon-theme Papirus -show-icons"),
      
      -- launch dmenu
      ((modm, xK_d), spawn "exe=`dmenu_path | dmenu` && eval \"exec $exe\""),

      -- launch Brave
      ((modm .|. shiftMask, xK_g), spawn "microsoft-edge-beta"),

      -- launch nautilus
      ((modm .|. shiftMask, xK_f), spawn "nautilus"),

      -- launch Qute Browser
      ((modm .|. shiftMask, xK_b), spawn "qutebrowser"),

      -- launch audio
      ((modm .|. shiftMask, xK_a), spawn "pavucontrol"),

      -- Lock the screen
      ((modm .|. shiftMask, xK_l), spawn "xscreensaver-command --lock"),

      --Wallpaper
      ((modm .|. shiftMask, xK_w), spawn "nitrogen --set-zoom-fill --random ~/Wallpapers &"),

      -- launch Vs Code
      ((modm .|. shiftMask, xK_v), spawn "code"),

      -- launch  Sublime
      ((modm .|. shiftMask, xK_s), spawn "gnome-screenshot -a"),

      -- close focused window
      ((modm .|. shiftMask, xK_c), kill),

      -- Rotate through the available layout algorithms
      ((modm, xK_space), sendMessage NextLayout),

      --  Reset the layouts on the current workspace to default
      ((modm .|. shiftMask, xK_space), setLayout $ XMonad.layoutHook conf),

      -- Resize viewed windows to the correct size
      ((modm, xK_n), refresh),

      -- Move focus to the next window
      ((modm, xK_Tab), windows W.focusDown),

      -- Move focus to the next window
      ((modm, xK_j), windows W.focusDown),

      -- Move focus to the previous window
      ((modm, xK_k), windows W.focusUp),
      
      -- Move focus to the master window
      ((modm, xK_m), windows W.focusMaster),

      -- Swap the focused window and the master window
      ((modm, xK_Return), windows W.swapMaster),

      -- Swap the focused window with the next window
      ((modm .|. shiftMask, xK_j), windows W.swapDown),

      -- Swap the focused window with the previous window
      ((modm .|. shiftMask, xK_k), windows W.swapUp),

      -- Shrink the master area
      ((modm, xK_h), sendMessage Shrink),

      -- Expand the master area
      ((modm, xK_l), sendMessage Expand),

      -- Push window back into tiling
      ((modm, xK_t), withFocused $ windows . W.sink),

      --    -- Increment the number of windows in the master area
      ((modm, xK_comma), sendMessage (IncMasterN 1)),

      --    -- Deincrement the number of windows in the master area
      ((modm, xK_period), sendMessage (IncMasterN (-1))),

      -- Brightness Control
      ((modm, xK_F7), spawn "light -A 5"),
      ((modm, xK_F6), spawn "light -U 5"),

      --Hide Xmobar
      ((modm, xK_b), sendMessage ToggleStruts),

      -- Quit xmonad
      ((modm .|. shiftMask, xK_q), io (exitWith ExitSuccess)),

      -- Restart xmonad
      ((modm, xK_q), spawn "xmonad --recompile; xmonad --restart"),

      -- Run xmessage with a summary of the default keybindings (useful for beginners)
      ((modm .|. shiftMask, xK_slash), spawn ("echo \"" ++ help ++ "\" | xmessage -file -"))
    ]
      ++

      --Switch Workspaces
      [ ((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9],
          (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
      ]
      ++

      --Switch Monitors
      [ ((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0 ..],
          (f, m) <- [(W.view, 0), (W.shift, shiftMask)]
      ]

------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
myMouseBindings (XConfig {XMonad.modMask = modm}) =
  M.fromList $
    -- mod-button1, Set the window to floating mode and move by dragging
    [ ( (modm, button1),
        ( \w ->
            focus w >> mouseMoveWindow w
              >> windows W.shiftMaster
        )
      ),
      -- mod-button2, Raise the window to the top of the stack
      ((modm, button2), (\w -> focus w >> windows W.shiftMaster)),
      -- mod-button3, Set the window to floating mode and resize by dragging
      ( (modm, button3),
        ( \w ->
            focus w >> mouseResizeWindow w
              >> windows W.shiftMaster
        )
      )
    ]

myTabConfig =
  def
    { fontName = myFont,
      activeColor = "#56b6c2",
      inactiveColor = "#282c34",
      activeBorderColor = "#56b6c2",
      inactiveBorderColor = "#282c34",
      activeTextColor = "#282c34",
      inactiveTextColor = "#abb2bf"
    }

------------------------------------------------------------------------
-- Layouts:
myLayout =
  onWorkspace "6: MEDIA" simpleFloat $
    smartBorders $
      avoidStruts $
        minimize (mkToggle (NOBORDERS ?? FULL ?? EOT) (tiled ||| tabbed shrinkText myTabConfig ||| Full ||| threeTall ||| Mirror threeTall))
  where
    tiled = ResizableTall nmaster delta ratio []
    threeTall = ThreeCol nmaster delta ratio
    -- The default number of windows in the master pane
    nmaster = 1
    -- Default proportion of screen occupied by master pane
    ratio = 1 / 2
    -- Percent of screen to increment by when resizing panes
    delta = 1 / 100

------------------------------------------------------------------------
-- Window rules:
myManageHook =
  composeAll
    [ className =? "MPlayer" --> doFloat,
      className =? "pavucontrol" --> doFloat,
      className =? "gnome-calculator" --> doFloat,
      className =? "Blueman-manager" --> doFloat,
      className =? "Pavucontrol" --> doFloat,
      className =? "Gimp" --> doFloat,
      className =? "Org.gnome.Nautilus" --> doFloat,
      resource =? "desktop_window" --> doIgnore,
      resource =? "crx_jlhoajbaojeilbdnlldgecmilgppanbh" --> doIgnore,
      resource =? "kdesktop" --> doIgnore
    ]

-- Event handling

--myEventHook = handleEventHook def <+> XMonad.Hooks.EwmhDesktops.fullscreenEventHook
--myEventHook = memset

------------------------------------------------------------------------
-- Status bars and logging
myLogHook = return ()

------------------------------------------------------------------------
-- Startup hook
myStartupHook = do
  spawnOnce "nitrogen --set-zoom-fill ~/Downloads/base.png &"
  spawnOnce "systemctl start tlp start &"
  spawnOnce "tlp start &"
  spawnOnce "microsoft-edge-beta &"


------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.
-- Run xmonad with the settings you specify. No need to modify this.

main = do
  xmproc <- spawnPipe "xmobar -x 0 /home/rosekamallove/.xmonad/xmobar/xmobarrc.hs"
  xmonad $ docks defaults

-- No need to modify this.
defaults =
  def
    { -- simple stuff
      terminal = myTerminal,
      focusFollowsMouse = myFocusFollowsMouse,
      clickJustFocuses = myClickJustFocuses,
      borderWidth = myBorderWidth,
      modMask = myModMask,
      workspaces = myWorkspaces,
      normalBorderColor = myNormalBorderColor,
      focusedBorderColor = myFocusedBorderColor,

      -- key bindings
      keys = myKeys,
      mouseBindings = myMouseBindings,

      -- hooks, layouts
      layoutHook = myLayout,
      manageHook = myManageHook,

      --handleEventHook    = myEventHook,
      logHook = myLogHook,
      startupHook = myStartupHook
    }

-- | Finally, a copy of the default bindings in simple textual tabular format.
help :: String
help =
  unlines
    [ "The default modifier key is 'alt'. Default keybindings:",
      "",
      "-- launching and killing programs",
      "mod-Shift-Enter  Launch xterminal",
      "mod-p            Launch dmenu",
      "mod-Shift-p      Launch gmrun",
      "mod-Shift-c      Close/kill the focused window",
      "mod-Space        Rotate through the available layout algorithms",
      "mod-Shift-Space  Reset the layouts on the current workSpace to default",
      "mod-n            Resize/refresh viewed windows to the correct size",
      "",
      "-- move focus up or down the window stack",
      "mod-Tab        Move focus to the next window",
      "mod-Shift-Tab  Move focus to the previous window",
      "mod-j          Move focus to the next window",
      "mod-k          Move focus to the previous window",
      "mod-m          Move focus to the master window",
      "",
      "-- modifying the window order",
      "mod-Return   Swap the focused window and the master window",
      "mod-Shift-j  Swap the focused window with the next window",
      "mod-Shift-k  Swap the focused window with the previous window",
      "",
      "-- resizing the master/slave ratio",
      "mod-h  Shrink the master area",
      "mod-l  Expand the master area",
      "",
      "-- floating layer support",
      "mod-t  Push window back into tiling; unfloat and re-tile it",
      "",
      "-- increase or decrease number of windows in the master area",
      "mod-comma  (mod-,)   Increment the number of windows in the master area",
      "mod-period (mod-.)   Deincrement the number of windows in the master area",
      "",
      "-- quit, or restart",
      "mod-Shift-q  Quit xmonad",
      "mod-q        Restart xmonad",
      "mod-[1..9]   Switch to workSpace N",
      "",
      "-- Workspaces & screens",
      "mod-Shift-[1..9]   Move client to workspace N",
      "mod-{w,e,r}        Switch to physical/Xinerama screens 1, 2, or 3",
      "mod-Shift-{w,e,r}  Move client to screen 1, 2, or 3",
      "",
      "-- Mouse bindings: default actions bound to mouse events",
      "mod-button1  Set the window to floating mode and move by dragging",
      "mod-button2  Raise the window to the top of the stack",
      "mod-button3  Set the window to floating mode and resize by dragging"
    ]
