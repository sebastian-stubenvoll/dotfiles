on run argv
    set paste to item 1 of argv as boolean
    
    tell application "System Events"
        activate application "Inkscape"
    end tell
    if paste is true then
        delay 0.15
        tell application "System Events"
            keystroke "v" using command down
        end tell
    end if
    
end run
