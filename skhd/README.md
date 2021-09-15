# About these skhd profiles #

Ocassionally, skhd doesn't play nice with different keyboards.
Sometimes buttons can be in physically different locations
or button combinations can be intercepted because they're
engineered into the actual keyboard to control some functionality (e.g. backlight),
so you're forced to either learn two different motions or make two bindings.

I used to opt for the latter but found configuration files getting quite bloated
and generally dislike having half my bindings being redundant because they're
impractical on my current keyboard.

Fortunately however, since skhd supports hotswapping profiles,
this switcher application fix this.
If these config files were installed with the **setup**
script, it is automatically symlinked into ~/.local/bin as **skhs**.

This allows for the creation of seperate config profiles.
The profiles are then exchanged by updating a symlink. To apply a new profile
simply run `skhs PROFILENAME` where PROFILENAME is an existing profile
stored under `~/.config/skhd/profiles`.
