const symbol = "🎵";
let output = "";
if (Application("Spotify").running()) {
    const track = Application("Spotify").currentTrack;
    const artist = track.artist();
    const title = track.name();
    output = `${symbol} ${title} - ${artist}`.substr(0, 50);
}

output;
