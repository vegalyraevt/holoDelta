# holoDelta (Vega's Branch)
This is a custom branch of the unofficial Hololive TCG simulator, maintained by Vega. It includes major updates adding a music player and associated UI elements and keybinds, as well as other improvements overhauling the audio.

## Quick start


Try the main branch game at https://holodelta.azurewebsites.net/game/index.html (mainline) or build locally from this branch for the audio features!

To setup and run the web server locally:
```bash
git clone https://github.com/vegalyraevt/holoDelta
cd holoDelta/ServerStuff
python -m pip install -r requirements.txt
uvicorn server:app --reload
```


Notes for setting up:
- For running your own version of the server, all you need is in the "ServerStuff" folder, with the exception of a "holodelta_web" folder containing a web export of the project. DO NOT EXPORT WITH DEBUG.
- Change the "websocketURL" in server.gd to wherever you're running your local server.
- You may need to set "WebSocket" in "board" to not use WSS.


## Music Player & BGM System Update (2026)

**Major Features:**
- Global, shuffled BGM system with support for music folders and playlists
- Seamless, visually styled "Now Playing" popup with scrolling ticker and fade
- Skip song button and keybind, works everywhere (menus and in-game)
- Robust UI overlay, styled to match the menu, always visible and non-intrusive
- Ticker always scrolls, even for short titles, and is robust to rapid skips
- Fixed popup duration and fade, no blank or stuck popups

See the Scripts/GlobalBGM.gd and Scripts/NowPlayingPopup.gd for implementation details.

---

## Added Song List

Below is the current BGM playlist (alphabetized). I added this as the base game only had one song and that annoyed me to listen to.

<details>
<summary>Click to expand song list</summary>

<ul>
<li>#Aquairo Palette⧸Minato Aqua [Music Box]</li>
<li>3_12⧸TAKU INOUE & Hoshimachi Suisei [Music Box]</li>
<li>A New Start</li>
<li>A New Start⧸Nanashi Mumei [Music Box]</li>
<li>ALiCE & u</li>
<li>ALiCE＆u⧸Ayunda Risu [Music Box]</li>
<li>Ahoy!! Warera Houshou Kaizoku-dan☆⧸Houshou Marine [Music Box]</li>
<li>Ahoy!! 我ら宝鐘海賊団☆</li>
<li>Ai no Chiisana Uta⧸Moona Hoshinova [Music Box]</li>
<li>Aimai Chocolate⧸Tsunomaki Watame [Music Box]</li>
<li>Alibi Bunny⧸Usada Pekora [Music Box]</li>
<li>Andromeda⧸Hoshimachi Suisei [Music Box]</li>
<li>Asa ga Kite⧸Shirakami Fubuki [Music Box]</li>
<li>Ash Again ⧸ Gawr Gura x Casey Edwards</li>
<li>Astrogirl</li>
<li>Asuiro ClearSky⧸hololive IDOL PROJECT [Music Box]</li>
<li>BERSERKER</li>
<li>BITE! カム! BITE!</li>
<li>BLUE CLAPPER</li>
<li>BLUE CLAPPER⧸hololive IDOL PROJECT [Music Box]</li>
<li>BOOM</li>
<li>Black Sheep</li>
<li>Bluerose⧸Hoshimachi Suisei [Music Box]</li>
<li>Bye Bye Rainy⧸Hoshimachi Suisei [Music Box]</li>
<li>CHIMERA</li>
<li>CRINGECORE</li>
<li>Caesura of Despair</li>
<li>Caesura of Despair⧸IRyS [Music Box]</li>
<li>Caesura of Despair（attacca ver.）</li>
<li>Candy-Go-Round⧸hololive IDOL PROJECT [Music Box]</li>
<li>CapSule</li>
<li>Capture the Moment</li>
<li>Carousel of Imaginary Images</li>
<li>ChikuTaku - Original Song ✨ チクタク - オリジナル曲</li>
<li>ChocoLove⧸Yuzuki Choco [Music Box]</li>
<li>Choco♡Melty⧸Yuzuki Choco & Yozora Mel [Music Box]</li>
<li>Cloudy Sheep⧸Tsunomaki Watame feat. Calliope Mori [Music Box]</li>
<li>Connect the World</li>
<li>Cursed Night⧸Calliope Mori [Music Box]</li>
<li>DAILY DIARY⧸hololive IDOL PROJECT [Music Box]</li>
<li>DEAD BEATS</li>
<li>DEAD BEATS⧸Calliope Mori [Music Box]</li>
<li>DO U</li>
<li>DROWN</li>
<li>Dance Past Midnight</li>
<li>Dawn Blue⧸Mori Calliope [Music Box] (Anime ＂Hololive Alternative＂ Theme Song)</li>
<li>Daydream</li>
<li>Daydream⧸Ouro Kronii [Music Box]</li>
<li>Dead On Arrival</li>
<li>Docchi-Docchi Song⧸Kumiyuki Susumu feat. Nakiri Ayame [Music Box]</li>
<li>Doggy god's street</li>
<li>Dreaming Days</li>
<li>Dreaming Days⧸hololive IDOL PROJECT [Music Box]</li>
<li>Excuse My Rudeness, But Could You Please RIP？⧸Calliope Mori [Music Box]</li>
<li>FACT⧸Tokoyami Towa [Music Box]</li>
<li>Fake.Fake.Fake⧸AZKi [Music Box]</li>
<li>Fever Night</li>
<li>Fire N Ice</li>
<li>For The Win⧸Minato Aqua [Music Box]</li>
<li>Future Island</li>
<li>GHOST ⧸ 星街すいせい(official)</li>
<li>GHOST⧸Hoshimachi Suisei [Music Box]</li>
<li>Gate Open： START! (Japanese ver.)</li>
<li>Gawr Gura [Campfire Karaoke] Sings Can't Take My Eyes Off You</li>
<li>Gawr Gura [Campfire Karaoke] Sings Chiisana Boukensha</li>
<li>Gawr Gura [Campfire Karaoke] Sings Dream A Litle Dream Of Me</li>
<li>Gawr Gura [Campfire Karaoke] Sings Fuyu Biyori</li>
<li>Gawr Gura [Campfire Karaoke] Sings I See The Light</li>
<li>Gawr Gura [Campfire Karaoke] Sings Ouchi Ni Kaeritai</li>
<li>Gawr Gura [Campfire Karaoke] Sings The Moon Song</li>
<li>Gawr gura Sings 24 Hour Cinderella From Yakuza</li>
<li>Gawr gura Sings All Star - Smash Mouth</li>
<li>Gawr gura Sings Bubbly</li>
<li>Gawr gura Sings Can't Help Falling In Love - Elvis Presley</li>
<li>Gawr gura Sings Girl From Ipanema</li>
<li>Gawr gura Sings Judgement From Yakuza</li>
<li>Gawr gura Sings La Vida Loca</li>
<li>Gawr gura Sings Paradise</li>
<li>Gawr gura Sings Stay With Me</li>
<li>Gawr gura Sings Tonight From Yakuza</li>
<li>Gawr gura Sings YMCA by Village People</li>
<li>GawrGura [Campfire Karaoke] Sings Dragon Night</li>
<li>Go-Getters</li>
<li>Graveyard Shift</li>
<li>Graveyard Shift⧸Calliope Mori ft. BOOGEY VOXX [Music Box]</li>
<li>Gravity</li>
<li>Gura And Okayu Sing Mogu Mogu Yummy【Gawr Gura⧸Hololive English】</li>
<li>Gura Sings Come Fly With Me【𝑭𝑹𝑨𝑵𝑲 𝑺𝑰𝑵𝑨𝑻𝑹𝑨 𝑪𝑶𝑴𝑷𝑰𝑳𝑨𝑻𝑰𝑶𝑵】</li>
<li>Gura Sings Fly Me To The Moon【𝑭𝑹𝑨𝑵𝑲 𝑺𝑰𝑵𝑨𝑻𝑹𝑨 𝑪𝑶𝑴𝑷𝑰𝑳𝑨𝑻𝑰𝑶𝑵】</li>
<li>Gura Sings Luck Be A Lady【𝑭𝑹𝑨𝑵𝑲 𝑺𝑰𝑵𝑨𝑻𝑹𝑨 𝑪𝑶𝑴𝑷𝑰𝑳𝑨𝑻𝑰𝑶𝑵】</li>
<li>Gura Sings New York, New York【𝑭𝑹𝑨𝑵𝑲 𝑺𝑰𝑵𝑨𝑻𝑹𝑨 𝑪𝑶𝑴𝑷𝑰𝑳𝑨𝑻𝑰𝑶𝑵】</li>
<li>Gura Sings Strangers In The Night【𝑭𝑹𝑨𝑵𝑲 𝑺𝑰𝑵𝑨𝑻𝑹𝑨 𝑪𝑶𝑴𝑷𝑰𝑳𝑨𝑻𝑰𝑶𝑵】</li>
<li>Gura Sings Summer Wind【𝑭𝑹𝑨𝑵𝑲 𝑺𝑰𝑵𝑨𝑻𝑹𝑨 𝑪𝑶𝑴𝑷𝑰𝑳𝑨𝑻𝑰𝑶𝑵】</li>
<li>Gura Sings That's Life【𝑭𝑹𝑨𝑵𝑲 𝑺𝑰𝑵𝑨𝑻𝑹𝑨 𝑪𝑶𝑴𝑷𝑰𝑳𝑨𝑻𝑰𝑶𝑵】</li>
<li>Gura Sings The Girl From Ipanema【𝑭𝑹𝑨𝑵𝑲 𝑺𝑰𝑵𝑨𝑻𝑹𝑨 𝑪𝑶𝑴𝑷𝑰𝑳𝑨𝑻𝑰𝑶𝑵】</li>
<li>Gura Sings You Make Me Feel So Young【𝑭𝑹𝑨𝑵𝑲 𝑺𝑰𝑵𝑨𝑻𝑹𝑨 𝑪𝑶𝑴𝑷𝑰𝑳𝑨𝑻𝑰𝑶𝑵】</li>
<li>Gura and Amelia</li>
<li>HERE COMES HOPE</li>
<li>HI-15</li>
<li>HINOTORI</li>
<li>HINOTORI⧸Takanashi Kiara [Music Box]</li>
<li>HOLOGRAM CIRCUS⧸Omaru Polka [Music Box]</li>
<li>HOLOTORI Dance!</li>
<li>HUGE W</li>
<li>Heart Challenger⧸Takanashi Kiara [Music Box]</li>
<li>HiHi High Tension!⧸Natsuiro Matsuri [Music Box]</li>
<li>High Tide</li>
<li>High Tide⧸Moona Hoshinova [Music Box]</li>
<li>HoloCure OST - Asuiro ClearSky (Extended Loop)</li>
<li>HoloCure OST - Bokura Ga Kuru Kara (Extended Loop)</li>
<li>HoloCure OST - Candy-Go-Round (Extended Loop)</li>
<li>HoloCure OST - Go Peko, Go Peko, Go Peko!!</li>
<li>HoloCure OST - Intro (Save the Fans)</li>
<li>HoloCure OST - Koyoi wa Halloween Night! (Extended Loop)</li>
<li>HoloCure OST - Miraculous Fantasia (Extended Loop)</li>
<li>HoloCure OST - Myth or Treat (Extended Loop)</li>
<li>HoloCure OST - PEKOGAMBLEBRAIN (Extended Loop)</li>
<li>HoloCure OST - Shijoshugi Adtruck (Extended Loop)</li>
<li>HoloCure OST - Shiny Smily Story (Extended Loop)</li>
<li>HoloCure OST - Stardust Song (Extended Loop)</li>
<li>HoloCure OST - Suspect (Extended Loop)</li>
<li>HoloCure OST - Welcome Home (Yumemiru Sora e) (Extended Loop)</li>
<li>HoloCure OST - id：entity voices (Extended Loop)</li>
<li>Hololive Myth⧸Holocure - Myth or Treat (8 bit, Rock, DnB Remix)</li>
<li>Holy Shitto</li>
<li>Homenobi⧸Shirogane Noel [Music Box]</li>
<li>Hoshimachi Suisei - BIBBIDIBA (8-bit, Rock) Remix #ほしまちぎゃらりー #星詠み</li>
<li>Howling⧸Ookami Mio [Music Box]</li>
<li>Hyakka Ryouran Hanafubuki⧸Shirakami Fubuki, Nakiri Ayame, Ookami Mio (hololive) [Music Box]</li>
<li>I Wanna⧸Minato Aqua [Music Box]</li>
<li>Ibasho (Where I Belong)⧸Mori Calliope [Music Box] (Game ＂Princess Connect! Re： Dive＂ Collab Song)</li>
<li>Idol Showdown OST Track 01 - ＂Idol Showdown＂ (Main Menu)</li>
<li>Idol Showdown OST Track 02 - ＂Who Wants A Showdown？＂ (Idol Select)</li>
<li>Idol Showdown OST Track 03 - ＂World Wide Showdown＂ (Lobby)</li>
<li>Idol Showdown OST Track 04 - ＂Practice Makes Perfect＂ (Tutorial)</li>
<li>Idol Showdown OST Track 05 - ＂Symphony Of Sora＂【コトバカゼ ⧸ IMAGE source ⧸ リアリモシンパサイザー】</li>
<li>Idol Showdown OST Track 06 - ＂Welcome To Budokan＂【Stellar Stellar】</li>
<li>Idol Showdown OST Track 07 - ＂Say Again＂【Say! Fanfare】</li>
<li>Idol Showdown OST Track 08 - ＂Midnight Rose＂【シャルイース】</li>
<li>Idol Showdown OST Track 10 - ＂Shrine Of The Elite＂【花月ノ夢】(Reveal Trailer)</li>
<li>Idol Showdown OST Track 11 - ＂Super Korone World＂【ころねの最凶天災☆わんだふぉー❤わーるど】</li>
<li>Idol Showdown OST Track 12 - ＂Blood Lust＂【RED】</li>
<li>Idol Showdown OST Track 13 - ＂City Lights and Chill Vibes＂【Live Again⧸High Tide⧸リルビ⧸天球⧸彗星は夜を跨いで】</li>
<li>Idol Showdown OST Track 14 - ＂львица＂【Lioness' Pride】</li>
<li>Idol Showdown OST Track 15 - ＂Big Red Beat＂【RED HEART】</li>
<li>Idol Showdown OST Track 16 - ＂Dreams Of Fluffy Sheep＂【My song】</li>
<li>Idol Showdown OST Track 17 - ＂Hacking The Weather Channel＂【Weather Hackers☆】</li>
<li>Idol Showdown Ost Track 09 - ＂Nousagi Jazz Band＂ 【 ぺこらんだむぶれいん！】</li>
<li>Ijimekko Bully⧸Mori Calliope [Music Box]</li>
<li>Infinity (Remastered)</li>
<li>Infinity ⧸ 赤井はあと (Official)</li>
<li>Infinity⧸Akaihaato×HAACHAMA [Music Box]</li>
<li>Inochi⧸AZKi [Music Box]</li>
<li>Interact Fantasia⧸HOLOLIVE FANTASY (Pekora, Rushia, Flare, Noel, Marine) [Music Box]</li>
<li>Internet Brain Rot</li>
<li>Iris⧸Uruha Rushia [Music Box]</li>
<li>I’m Greedy</li>
<li>I’m Your Treasure Box ＊あなたは マリンせんちょうを...</li>
<li>JOLLIE JOLLIE</li>
<li>JOURNEY to FIND STARS⧸HOLOSTARS [Music Box]</li>
<li>Jibunkatte Dazzling⧸Hoshimachi Suisei [Music Box]</li>
<li>Journey Like a Thousand Years 〜千年の旅〜</li>
<li>Journey Like a Thousand Years⧸hololive English -Myth- [Music Box]</li>
<li>Just Follow Stars⧸holostars [Music Box]</li>
<li>Kagetsu no Yume⧸Sakura Miko [Music Box]</li>
<li>Kaisou Ressha⧸Minato Aqua [Music Box]</li>
<li>Kakero⧸Hoshimachi Suisei [Music Box]</li>
<li>Kamouflage</li>
<li>Kaputto Night☆Sky⧸Yozora Mel [Music Box]</li>
<li>Kimi to Nagameru Natsu no Hana⧸Natsuiro Matsuri [Music Box]</li>
<li>Kira Killer</li>
<li>Kirakira⧸Minato Aqua [Music Box]</li>
<li>Kirameki Rider⧸hololive IDOL PROJECT [Music Box]</li>
<li>Kiseki Musubi⧸hololive 4th generation (Luna, Kanata, Towa, Watame, Coco) [Music Box]</li>
<li>Koyoi wa Halloween Night!⧸Rushia, Choco, Mel, Shion (hololive IDOL PROJECT) [Music Box]</li>
<li>Let Me Stay Here</li>
<li>Let’s End The World</li>
<li>Lioness’ Pride ⧸ 獅白ぼたん【original】</li>
<li>Lioness’ Pride⧸Shishiro Botan [Music Box]</li>
<li>Live Again</li>
<li>Live Again⧸Calliope Mori [Music Box]</li>
<li>Love Me Love Me</li>
<li>Lunch with me⧸Momosuzu Nene [Music Box]</li>
<li>MERA MERA</li>
<li>MESS</li>
<li>Madoromi⧸Amane Kanata & Tokoyami Towa [Music Box] (Game ＂Deep Insanity ASYLUM＂ Theme Song)</li>
<li>Mage of Violet⧸Murasaki Shion [Music Box]</li>
<li>Make ’Em Afraid</li>
<li>Melody For You⧸Tsunomaki Watame [Music Box]</li>
<li>Midnight Mayoi</li>
<li>Mogu Mogu YUMMY!⧸Nekomata Okayu [Music Box]</li>
<li>Momonone⧸Momosuzu Nene [Music Box]</li>
<li>Monologue in a row⧸Kanade Izuru [Music Box]</li>
<li>My song⧸Tsunomaki Watame [Music Box]</li>
<li>NEW [zom] BIE!!</li>
<li>NEXT COLOR PLANET ⧸ 星街すいせい(official)</li>
<li>NEXT COLOR PLANET⧸Hoshimachi Suisei [Music Box]</li>
<li>NEZUMI Scheme</li>
<li>NOW ON SPACE⧸Hoshimachi Suisei [Music Box] (＂Hoshimachi Suisei's MUSIC SPACE＂ Theme Song)</li>
<li>Nenenenenenenene! Daibakusou⧸Momosuzu Nene [Music Box]</li>
<li>Non-Fiction</li>
<li>Ochame Kinou - hololive English Cover</li>
<li>Ochame Kinou - hololive Indonesia (Cover)</li>
<li>Ode to an Eternal Future⧸Tsunomaki Watame [Music Box]</li>
<li>Off With Their Heads</li>
<li>Off With Their Heads⧸Calliope Mori [Music Box]</li>
<li>Omoi Kou⧸Uruha Rushia [Music Box]</li>
<li>One Step at a Time</li>
<li>Onikemo Dance⧸Irohanihohetto AyaFubuMi (Shirakami Fubuki, Nakiri Ayame, Ookami Mio) [Music Box]</li>
<li>Opening BGM⧸Gawr Gura [Music Box]</li>
<li>Our Bright Parade</li>
<li>PSYCHO</li>
<li>Palette⧸Tokoyami Towa [Music Box]</li>
<li>PekoMiko Daisensou!!⧸REDALiCE feat. Usada Pekora & Sakura Miko [Music Box]</li>
<li>Pieces⧸Hoshimachi Suisei [Music Box]</li>
<li>Pineapple</li>
<li>Plasmagic Seasons!⧸hololive 1st Generation [Music Box]</li>
<li>Play Dice!</li>
<li>Po⧸Omaru Polka [Music Box]</li>
<li>Precious Photograph⧸Fubuki, Aqua, Marine, Kanata, Nene (hololive IDOL PROJECT) [Music Box]</li>
<li>Prism Melody</li>
<li>Prism Melody⧸hololive IDOL PROJECT [Music Box]</li>
<li>Q</li>
<li>Q & A=E</li>
<li>Q&A=E⧸Airani Iofifteen [Music Box]</li>
<li>Q⧸Calliope Mori x Gawr Gura x DECO＊27 [Music Box]</li>
<li>RAINBOW⧸Tsunomaki Watame [Music Box]</li>
<li>RED HEART (Remastered)</li>
<li>RED HEART⧸Akai Haato [Music Box]</li>
<li>REFLECT</li>
<li>REFLECT⧸Gawr Gura [Music Box]</li>
<li>ReUnion</li>
<li>Reaper vs. Sheep -Ouen ver.-</li>
<li>ReaperかRapper？ 自己紹介ラップ</li>
<li>Rebellion</li>
<li>Red</li>
<li>Red⧸Calliope Mori [Music Box]</li>
<li>Rise</li>
<li>SHALLYS⧸Aki Rosenthal [Music Box]</li>
<li>SHIJOSHUGI ADTRUCK⧸Natsuiro Matsuri, Ookami Mio, Shiranui Flare (hololive IDOL PROJECT) [Music Box]</li>
<li>SHINKIRO</li>
<li>SNEAKING</li>
<li>SPARKS</li>
<li>SPARKS⧸Takanashi Kiara [Music Box]</li>
<li>STARDUST SONG⧸Shiranui Flare, Amane Kanata, Tokoyami Towa (hololive IDOL PROJECT) [Music Box]</li>
<li>Saikyo Tensai Wonderful World of Korone⧸Inugami Korone [Music Box]</li>
<li>Sakurakaze⧸Sakura Miko [Music Box]</li>
<li>Say! Fanfare!⧸Shirakami Fubuki [Music Box]</li>
<li>Say!ファンファーレ!⧸白上フブキ【オリジナル曲】</li>
<li>Scuffed Up Age</li>
<li>Secret Class⧸Yuzuki Choco [Music Box]</li>
<li>See the world</li>
<li>Shiny Smily Story</li>
<li>Shiny Smily Story⧸hololive IDOL PROJECT [Music Box]</li>
<li>Smile & Go!!⧸Shiranui Flare [Music Box]</li>
<li>Sparks of Joy</li>
<li>Starry Jet⧸Hoshimachi Suisei [Music Box]</li>
<li>Stellar Stellar ⧸ 星街すいせい(official)</li>
<li>Stellar Stellar⧸Hoshimachi Suisei [Music Box]</li>
<li>Step and Go!!⧸Tokino Sora [Music Box]</li>
<li>Suspect</li>
<li>Suspect (Bouquet ver.)</li>
<li>Suspect⧸Roboco san, Aki Rosenthal, Nakiri Ayame (hololive IDOL PROJECT) [Music Box]</li>
<li>Sweet Appetite</li>
<li>TEMPLATE</li>
<li>TROUBLE “WAN”DER！</li>
<li>Taste of Death</li>
<li>Tenkyuu, Suisei wa Yoru wo Mataide⧸Hoshimachi Suisei [Music Box]</li>
<li>Tenshi no Agape⧸Amane Kanata [Music Box]</li>
<li>The Grim Reaper is a Live-Streamer</li>
<li>The Grim Reaper is a Live-Streamer （Lofi Ver.）</li>
<li>The Grim Reaper is a Live-Streamer⧸Calliope Mori [Music Box]</li>
<li>Tokusya-Seizon Wonder-la-der!!⧸Amane Kanata [Music Box]</li>
<li>Tokyo Wabi-Sabi Lullaby</li>
<li>Tsunomaki Janken⧸Tsunomaki Watame [Music Box]</li>
<li>UnAlive</li>
<li>Unison</li>
<li>Unison⧸Houshou Marine [Music Box]</li>
<li>VIOLET</li>
<li>VIOLET⧸Ninomae Ina'nis [Music Box]</li>
<li>Wanted, Wasted</li>
<li>Watame's Lullaby⧸Tsunomaki Watame [Music Box]</li>
<li>Weather Hackers☆ ⧸ 桐生ココ 卒業ライブver【#桐生ココ卒業LIVE】</li>
<li>Weather Hackers☆⧸Kiryu Coco [Music Box]</li>
<li>Wicked</li>
<li>Wonky Monkey</li>
<li>Youkoso! Sweet Carnival!⧸Minato Aqua [Music Box]</li>
<li>Zero no Ashiato⧸Tsunomaki Watame [Music Box]</li>
<li>Zettai Chusei Nano Nanora!⧸Himemori Luna [Music Box]</li>
<li>[Gawr Gura Karaoke] Gawr gura Sings A Kiss From The Rose Seal</li>
<li>[Gawr Gura Karaoke] Gawr gura Sings It's Beginning To Look A Lot Like Christmas - Michael Bublé</li>
<li>[Gawr Gura Karaoke] Gawr gura Sings Plastic Love V2</li>
<li>[Gawr Gura Karaoke] Gawr gura Sings Renai Circulation</li>
<li>[Gawr Gura Karaoke] Gawr gura Sings Ride On Time V2</li>
<li>[Gawr Gura Karaoke] Gawr gura Sings Sorairo Days V2</li>
<li>[Gawr Gura Karaoke] Gawr gura Sings Take Me Home, Country Roads - John Denver</li>
<li>[Gawr Gura] Can't Take My Eyes Off You But Slower</li>
<li>[Hololive] ＂Asuiro ClearSky＂ ⧸ hololive IDOL PROJECT (Romaji & CC English Lyrics)</li>
<li>[Hololive] ＂Candy Go Round＂ ⧸ hololive IDOL PROJECT (Romaji & CC English Lyrics)</li>
<li>[Hololive] ＂Daily Diary＂ ⧸ hololive IDOL PROJECT (Romaji & CC English Lyrics)</li>
<li>[Hololive] ＂Suspect＂ ⧸ hololive IDOL PROJECT (Romaji & CC English Lyrics)</li>
<li>[Mega Man & Bass] King Stage (MM10 Style Remix)</li>
<li>[Mega Man： The Power Battle] STAGE WILY BOSS (NES 8-bit remix, remake)</li>
<li>[My Dress-Up Darling] Ao to Kirameki (NES 8-bit remix)</li>
<li>[ORIGINAL SONG]  失礼しますが、RIP♡ ｜｜ “Excuse My Rudeness, But Could You Please RIP？” - Calliope Mori</li>
<li>[Original MV] Myth or Treat - Happy Halloween - holoMyth</li>
<li>[Touhou 20： FW] Watatsuki's Spell Card ~ Divine Sea Battle (NES 8-bit remix)</li>
<li>blue horizon!! - Gawr Gura</li>
<li>comet⧸Hoshimachi Suisei [Music Box]</li>
<li>diorama</li>
<li>end of a life</li>
<li>end of a life⧸Calliope Mori [Music Box]</li>
<li>guh</li>
<li>id：entity voices</li>
<li>id：entity voices⧸hololive ID [Music Box]</li>
<li>mumei</li>
<li>six feet under</li>
<li>soul food</li>
<li>spiral tones</li>
<li>spiral tones⧸Morikka (Rikka × Mori Calliope) [Music Box]</li>
<li>uni-birth⧸Minato Aqua [Music Box]</li>
<li>‎Yoi no Yo,Yoi!⧸Nakiri Ayame [Music Box]</li>
<li>『 Hyakka Ryouran Hanafubuki [hololive IDOL PROYECT] 』</li>
<li>【#ホロWACCA】『ぺこみこ大戦争！！』フルMV【さくらみこ⧸兎田ぺこら ホロライブ】</li>
<li>【MV】 Our Bright Parade (English ver.) 【hololive English -Advent-】</li>
<li>【MV】Kirameki Rider - English ver.【hololive English -Myth- & -Promise-】</li>
<li>【MV】Mantra Hujan - Kobo Kanaeru</li>
<li>【おちゃめ機能】ホロライブが吹っ切れた【24人で歌ってみた】</li>
<li>【オリジナルMV】Plasmagic Seasons!【ホロライブ1期生】 #from1st</li>
<li>【オリジナル曲】　Palette⧸常闇トワ　【フルMV】</li>
<li>あすいろClearSky (Bouquet ver.)</li>
<li>いじめっ子Bully</li>
<li>おーしゃんうぇーぶ・Party☆らぃ</li>
<li>もぐもぐYUMMY！⧸ 猫又おかゆ(official)</li>
<li>アデュー、サロー</li>
<li>アバンチュール♡ホリック</li>
<li>オーバード</li>
<li>キセキ結び</li>
<li>マリン出航！！</li>
<li>今宵はHalloween Night!</li>
<li>夢見る空へ</li>
<li>天球、彗星は夜を跨いで ⧸ 星街すいせい(official)</li>
<li>失礼しますが、RIP▽</li>
<li>常夜リペイント</li>
<li>心臓が止まるまで</li>
<li>毒の王子さま</li>
<li>浸食!! 地球全域全おーしゃん⧸UMISEA (湊あくあ、宝鐘マリン、一伊那尓栖、がうる・ぐら)【オルゴール】</li>
<li>瞬間ハートビート</li>
<li>美少女無罪♡パイレーツ</li>
<li>迷宮なラビリンス</li>
<li>青春アーカイブ</li>
</ul>
</details>