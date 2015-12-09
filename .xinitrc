bar &
set_theme &
compton --config ~/.config/compton/config &
[ ! -s ~/.config/mpd/pid ] && mpd &
[[ -z $(pgrep -xU $UID mpdscribble) ]] && mpdscribble &
redshift &
sxhkd &
exec bspwm
