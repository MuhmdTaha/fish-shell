#!/usr/bin/fish
function getTime --argument directory --description "Get Total Hours and Minutes for mp4 videos listed in directory"
    set total_seconds 0
    for x in (command ls | grep ".mp4")
        set total_seconds_item (ffprobe -i $x -show_entries format=duration -v quiet -of csv="p=0")
        set total_seconds (math $total_seconds+$total_seconds_item)
    end
    set total_minutes (math round $total_seconds/60)
    set actual_hours (math round $total_seconds/3600)
    set actual_minutes (math "$total_minutes -  $actual_hours * 60")


    echo "Those videos total seconds is: " $total_seconds seconds
    echo "converting to hours and minutes..."
    echo $actual_hours hours $actual_minutes minutes
end
