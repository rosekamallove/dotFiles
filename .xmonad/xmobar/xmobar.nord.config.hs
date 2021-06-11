	Config { 

				 font               = "xft:Fira Code Nerd Font:pixelsize=11:weight=600:antialias=true:hinting=true"
			 , additionalFonts    = []
			 , border             = BottomB
			 , borderColor        = "#2e3440"
			 , bgColor            = "#2e3440"
			 , fgColor            = "#d8dee9"
			 , alpha              = 255 
			 , position           = Top
			 , textOffset         = -1
			 , iconOffset         = -1
			 , lowerOnStart       = True
			 , pickBroadest       = False
			 , persistent         = False
			 , hideOnStart        = False
			 , iconRoot           = "/home/rosekamallove/.xmonad/xpm" --default: "."
			 , allDesktops        = True
			 , overrideRedirect   = True

			 , commands = 
			 [  					 Run Cpu           ["-t", " <total> %"
																			 ,"-L"           ,"3"
																			 ,"-H"           ,"50"
																			 ,"--normal"     ,"#8ec07c"
																			 ,"--high"       ,"#fb4934"
																			 ] 1


										, Run Memory         ["-t"," <usedratio>%"] 10


										, Run Com "light"    ["-G"] "brightness" 1


										, Run Battery        [ "--template" , "<acstatus>"
																				 , "--Low"      , "10"        -- units: %
																				 , "--High"     , "80"        -- units: %
																				 , "--low"      , "#f77647"
																				 , "--normal"   , "#dde298"
																				 , "--high"     , "#b8e298"

																				 , "--" -- battery specific options
																									 -- discharging status
																									 , "-o"    , " <left>% <fc=#ebcb8b> (<timeleft>) </fc>"
																									 -- AC "on" status
																									 , "-O"    , "<fc=#a3be8c>Charging</fc><fc=#ebcb8b> (<left>)</fc>"
																									 -- charged status
																									 , "-i"    , "<fc=#a3be8c>Fully Charged</fc>"
																				 ] 1


										, Run DynNetwork     [ "--template" , "  <tx>  <rx>"
																				 , "--Low"      , "1000"       -- units: B/s
																				 , "--High"     , "5000"       -- units: B/s
																				 , "--low"      , "#98b7d1"
																				 , "--normal"   , "#98b7d1"
																				 , "--high"     , "#98b7d1"
																				 ] 10


										, Run Memory         [ "--template" ,"<usedratio>%"
																				 , "--Low"      , "20"        -- units: %
																				 , "--High"     , "90"        -- units: %
																				 , "--low"      , "#9e9e9e"
																				 , "--normal"   , "#ead581"
																				 , "--high"     , "#f77647"
																				 ] 10

										, Run Date "%a %b %_d %H:%M" "date" 10
										]
			 , sepChar = "%"
			 , alignSep = "}{"
			 , template = "<fc=#88c0d0>  </fc><fc=#8fbcbb> %whoami% </fc>  <fc=#ebcb8b> %brightness% </fc>  <fc=#98c379>%cpu%</fc>   <fc=#938374> %memory% </fc> } <fc=#b48ead> %date%</fc>{<fc=#5e81ac>%dynnetwork%</fc>   %battery% "
