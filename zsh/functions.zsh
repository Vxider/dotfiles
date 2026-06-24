# =============================================================================
#                                 Functions 
# =============================================================================

function clearTmp()
{
    find /var/tmp -type f -delete 2>/dev/null || true
}

function dateupdate()
{
    date_utc=$(curl -sD - google.com | grep '^Date:' | cut -d' ' -f3-6) 
    [ -n "$date_utc" ] && sudo date -s "${date_utc}Z"
    echo "$date_utc"
}

function videocut()
{
    ( set -e
    filename=$(basename -- "$3")
    filename="${filename%.*}"
    mkdir -p bak
    ffmpeg -ss "$1" -to "$2" -i "$3" -avoid_negative_ts make_zero -acodec copy -vcodec copy -scodec copy -map 0 -map_metadata 0 -ignore_unknown -f mov -y "${filename}.cut.mov"
    mv "$3" bak/
    )
}

function video2hevc()
{
    ( set -e

    filename=$(basename -- "$1")
    filename="${filename%.*}"
    mkdir -p bak
    ffmpeg -i "$1" -c:v libx265 -crf 28 -tag:v hvc1 -c:a aac -b:a 128k -preset fast -map 0 -map_metadata 0 -ignore_unknown -f mov "${filename}.out.mov"
    mv "$1" bak/
    )
}

function video2mov()
{
    ( set -e

    filename=$(basename -- "$1")
    filename="${filename%.*}"
    mkdir -p bak
    ffmpeg -i "$1" -f mov "${filename}.out.mov"
    mv "$1" bak/
    )
}

function video_all_to_hevc()
{
    for file in *.mov
    do
        echo "Converting $file to hevc"
        video2hevc "$file"
    done
}

function git_pull_subfolder()
{
    here=$PWD
    echo "**********************************************"
    for folder in ./*
    do
        echo "pulling from $folder"
        echo "**********************************************"
        cd "$here" && cd "$folder" && git pull origin
        echo "**********************************************"
    done
}

function google_response_time()
{
    if [ -z "$1" ];
    then
        printf "No proxy : "
        curl -s -w %{time_total}\\n -o /dev/null http://www.gstatic.com/generate_204
    else
        printf "Proxy 127.0.0.1:$1 : "
        curl --socks5-hostname 127.0.0.1:"$1" -s -w %{time_total}\\n -o /dev/null http://www.gstatic.com/generate_204
    fi
}

function rsyncDotfilesTo127(){
    rsync -azP ~/Documents/Configurations/dotfiles/ 127:~/dotfiles
}

function rsyncDotfilesFrom127(){
    rsync -azP 127:~/dotfiles ~/Documents/Configurations/dotfiles
}

function scp120-127(){
    _scp "$1" 120,121,122,123,124,125,126,127 "$2"
}

function scp124-127(){
    _scp "$1" 124,125,126,127 "$2"
}

function scp126-127(){
    _scp "$1" 126,127 "$2"
}

function scp127() {
    _scp "$1" 127 "$2"
}

function scp126() {
    _scp "$1" 126 "$2"
}

function scp125() {
    _scp "$1" 125 "$2"
}

function scp124() {
    _scp "$1" 124 "$2"
}

function scp123() {
    _scp "$1" 123 "$2"
}

function scp122() {
    _scp "$1" 122 "$2"
}

function scp121() {
    _scp "$1" 121 "$2"
}

function scp120() {
    _scp "$1" 120 "$2"
}
