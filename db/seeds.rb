# PWNMuseum Seed Data
# ============================================================================
# This file seeds the database with real console exploit history.
#
# Instructions:
# 1. Create Platforms first
# 2. Create Hackers (individuals and teams)
# 3. Create Exploits with proper dates and impact levels
# 4. Create Credits to link exploits to hackers
#
# Impact Levels:
# - :user_mode (0)     - Green - Application-level exploits
# - :kernel_mode (1)   - Yellow - Kernel code execution
# - :hypervisor (2)    - Orange - Hypervisor breach
# - :bootrom (3)       - Red - Hardware-level exploit (most critical)
#
# ============================================================================

# Clear existing data
puts "Clearing existing data..."
Platform.destroy_all
Hacker.destroy_all

puts "Database cleared. Seeding console exploit history..."

# ============================================================================
# PLATFORMS
# ============================================================================

puts "Creating platforms..."

ds = Platform.create!(
  name: "Nintendo DS",
  slug: "nintendo-ds",
  manufacturer: "Nintendo",
  generation: 7,
  release_date: Date.new(2004, 11, 21)
)

psp = Platform.create!(
  name: "PlayStation Portable",
  slug: "psp",
  manufacturer: "Sony",
  generation: 7,
  release_date: Date.new(2004, 12, 12)
)

xbox_360 = Platform.create!(
  name: "Xbox 360",
  slug: "xbox-360",
  manufacturer: "Microsoft",
  generation: 7,
  release_date: Date.new(2005, 11, 22)
)

ps3 = Platform.create!(
  name: "PlayStation 3",
  slug: "playstation-3",
  manufacturer: "Sony",
  generation: 7,
  release_date: Date.new(2006, 11, 11)
)

wii = Platform.create!(
  name: "Wii",
  slug: "wii",
  manufacturer: "Nintendo",
  generation: 7,
  release_date: Date.new(2006, 11, 19)
)

_3ds = Platform.create!(
  name: "Nintendo 3DS",
  slug: "nintendo-3ds",
  manufacturer: "Nintendo",
  generation: 8,
  release_date: Date.new(2011, 2, 26)
)

ps_vita = Platform.create!(
  name: "PlayStation Vita",
  slug: "playstation-vita",
  manufacturer: "Sony",
  generation: 8,
  release_date: Date.new(2011, 12, 17)
)

wii_u = Platform.create!(
  name: "Wii U",
  slug: "wii-u",
  manufacturer: "Nintendo",
  generation: 8,
  release_date: Date.new(2012, 11, 18)
)

switch = Platform.create!(
  name: "Nintendo Switch",
  slug: "nintendo-switch",
  manufacturer: "Nintendo",
  generation: 9,
  release_date: Date.new(2017, 3, 3)
)

ps4 = Platform.create!(
  name: "PlayStation 4",
  slug: "playstation-4",
  manufacturer: "Sony",
  generation: 8,
  release_date: Date.new(2013, 11, 15)
)

xbox_one = Platform.create!(
  name: "Xbox One",
  slug: "xbox-one",
  manufacturer: "Microsoft",
  generation: 8,
  release_date: Date.new(2013, 11, 22)
)

puts "  Nintendo DS"
puts "  PlayStation Portable"
puts "  Xbox 360"
puts "  PlayStation 3"
puts "  Wii"
puts "  Nintendo 3DS"
puts "  PlayStation Vita"
puts "  Wii U"
puts "  Nintendo Switch"
puts "  PlayStation 4"
puts "  Xbox One"

# ============================================================================
# HACKERS
# ============================================================================

puts "Creating hackers..."

# Nintendo DS
chism = Hacker.create!(handle: "Chishm", team: false)
loopy = Hacker.create!(handle: "Loopy", team: false)

# PSP
fanjita = Hacker.create!(handle: "Fanjita", team: false)
noobz = Hacker.create!(handle: "Noobz", team: true)
dark_alex = Hacker.create!(handle: "Dark_AleX", team: false)
typhoon = Hacker.create!(handle: "TyRaNiD", team: false)
mathieulh = Hacker.create!(handle: "Mathieulh", team: false)
team_m33 = Hacker.create!(handle: "Team M33", team: true)

# Xbox 360
c4eva = Hacker.create!(handle: "c4eva", team: false)
glitching = Hacker.create!(handle: "GliGli", team: false)
xbox_hacker = Hacker.create!(handle: "Xbox Hacker", team: false)

# PlayStation 3
geohot = Hacker.create!(handle: "geohot", team: false)
fail0verflow = Hacker.create!(handle: "fail0verflow", team: true)
kaos = Hacker.create!(handle: "Kaos", team: false)
youness = Hacker.create!(handle: "Youness Alaoui", team: false)
calc84maniac = Hacker.create!(handle: "Calc84maniac", team: false)

# Wii
team_twiizers = Hacker.create!(handle: "Team Twiizers", team: true)
comex = Hacker.create!(handle: "Comex", team: false)
giantpune = Hacker.create!(handle: "Giantpune", team: false)
fullmetal5 = Hacker.create!(handle: "Fullmetal5", team: false)
full_generic_name = Hacker.create!(handle: "FullGeneric Name", team: false)

# Nintendo 3DS
smealum = Hacker.create!(handle: "Smealum", team: false)
sciresm = Hacker.create!(handle: "SciresM", team: false)
plailect = Hacker.create!(handle: "Plailect", team: false)
derrek = Hacker.create!(handle: "Derrek", team: false)
nedwill = Hacker.create!(handle: "nedwill", team: false)

# PlayStation Vita
team_molecule = Hacker.create!(handle: "Team Molecule", team: true)
yifan_lu = Hacker.create!(handle: "Yifan Lu", team: false)
flo = Hacker.create!(handle: "Floxy", team: false)

# Wii U
marionumber1 = Hacker.create!(handle: "Marionumber1", team: false)
gary = Hacker.create!(handle: "GaryOderNichts", team: false)

# Nintendo Switch
reswitched = Hacker.create!(handle: "ReSwitched", team: true)
atlas = Hacker.create!(handle: "atlas44", team: false)
ktemkin = Hacker.create!(handle: "Kate Temkin", team: false)
plutoo = Hacker.create!(handle: "plutoo", team: false)

# PlayStation 4
cturt = Hacker.create!(handle: "CTurt", team: false)
specter = Hacker.create!(handle: "Specter", team: false)
census = Hacker.create!(handle: "Census", team: false)

# Xbox One
mike = Hacker.create!(handle: "Mike Jr", team: false)

puts "  Chishm (DS)"
puts "  Loopy (DS)"
puts "  Fanjita (PSP)"
puts "  Noobz (PSP)"
puts "  Dark_AleX (PSP)"
puts "  TyRaNiD (PSP)"
puts "  Mathieulh (PSP)"
puts "  Team M33 (PSP)"
puts "  c4eva (Xbox 360)"
puts "  GliGli (Xbox 360)"
puts "  geohot (PS3)"
puts "  fail0verflow (PS3)"
puts "  Kaos (PS3)"
puts "  Youness Alaoui (PS3)"
puts "  Team Twiizers (Wii)"
puts "  Comex (Wii)"
puts "  Giantpune (Wii)"
puts "  Fullmetal5 (Wii)"
puts "  Smealum (3DS)"
puts "  SciresM (3DS/Switch)"
puts "  Derrek (3DS)"
puts "  nedwill (3DS)"
puts "  Team Molecule (Vita)"
puts "  Yifan Lu (Vita)"
puts "  Marionumber1 (Wii U)"
puts "  ReSwitched (Switch)"
puts "  Kate Temkin (Switch)"
puts "  CTurt (PS4)"
puts "  Specter (PS4)"

# ============================================================================
# EXPLOITS
# ============================================================================

puts "Creating exploits..."

# ============================================================================
# NINTENDO DS EXPLOITS
# ============================================================================

# PassMe - DS (2005)
passme = ds.exploits.create!(
  title: "PassMe",
  cve_id: nil,
  date_discovered: Date.new(2005, 2, 1),
  impact_level: :kernel_mode,
  description: %{<p>In the early days of Nintendo DS hacking, the system seemed impenetrable. The DS checked cartridges for cryptographic signatures before executing code, making homebrew impossible. But in February 2005, a hacker named Loopy discovered something extraordinary.</p>

<p>PassMe was the first breakthrough that proved the DS could be compromised. The exploit worked by intercepting the communication between the DS and its cartridge slot. By using a modified DS cartridge that passed through authentication from a legitimate game card, then switching to a homebrew card mid-boot, the system could be tricked into running unsigned code.</p>

<p>The original PassMe required soldering skills and specific game cartridges. When the DS booted, it would authenticate the legitimate game, then PassMe would redirect the system to read from a GBA flash cart containing homebrew code instead.</p>

<p>While complex and hardware-dependent, PassMe proved the DS was vulnerable. It paved the way for simpler software exploits like WiFi hack and flashcart-based solutions that would follow.</p>},
  media_url: nil
)

puts "  [+] PassMe (DS, 2005)"

# WiFi Me - DS (2005)
wifi_me = ds.exploits.create!(
  title: "WiFi Me",
  cve_id: nil,
  date_discovered: Date.new(2005, 6, 1),
  impact_level: :user_mode,
  description: %{<p>PassMe required hardware modification, but the DS had another attack vector: its wireless capabilities. In mid-2005, hackers discovered that the DS's download play feature could be exploited.</p>

<p>WiFi Me worked by broadcasting a specially crafted multicast packet over WiFi. When a DS in download mode received this packet, a buffer overflow in the wireless stack allowed arbitrary code execution. The beauty of this approach was that it required no hardware modification, just a DS, a WiFi card, and the right software.</p>

<p>The exploit was limited to user-mode execution and was not as reliable as PassMe, but it demonstrated that even air-gapped features could become attack surfaces. WiFi Me inspired later wireless-based exploits on other Nintendo systems.</p>},
  media_url: nil
)

puts "  [+] WiFi Me (DS, 2005)"

# ============================================================================
# PSP EXPLOITS
# ============================================================================

# Swaploit - PSP (2005)
swaploit = psp.exploits.create!(
  title: "Swaploit",
  cve_id: nil,
  date_discovered: Date.new(2005, 6, 15),
  impact_level: :kernel_mode,
  description: %{<p>When the PSP launched in 2004, Sony seemed to have learned from the PlayStation's vulnerabilities. The system appeared secure until June 2005, when a hacker named Fanjita proved otherwise.</p>

<p>Swaploit exploited the PSP's ability to run games from Memory Stick. By carefully manipulating the PSP's file system and swapping Memory Sticks at precise moments during boot, Fanjita discovered that the system would execute unsigned code from the second stick.</p>

<p>The process was tedious: load a game on one Memory Stick, swap to another containing homebrew while the PSP was accessing the filesystem, and hope the timing was right. But it worked. Swaploit became the first reliable method for running homebrew on the PSP.</p>

<p>The exploit required patience and dexterity, but it opened the floodgates. Within months, the PSP homebrew scene exploded with emulators, games, and applications, all thanks to a simple filesystem timing vulnerability.</p>},
  media_url: nil
)

puts "  [+] Swaploit (PSP, 2005)"

# EBOOT Loader - PSP (2005)
eboot_loader = psp.exploits.create!(
  title: "EBOOT Loader",
  cve_id: nil,
  date_discovered: Date.new(2005, 10, 1),
  impact_level: :user_mode,
  description: %{<p>By October 2005, Fanjita had refined his work into something more user-friendly: the EBOOT Loader. This exploit targeted a buffer overflow in the PSP's photo viewer specifically when processing TIFF images.</p>

<p>Users would place a specially crafted TIFF file on their Memory Stick, open the PSP's photo viewer, and attempt to display the image. The malformed TIFF data would overflow a buffer, allowing the loader to execute code from the Memory Stick.</p>

<p>While limited to user-mode applications with no kernel access, the EBOOT Loader made homebrew accessible to non-technical users. No more Memory Stick swapping, just copy files and view an image.</p>

<p>The TIFF vulnerability was famously reliable. It worked across multiple PSP firmware versions until Sony patched it in firmware 2.81. By then, however, the homebrew scene was unstoppable.</p>},
  media_url: nil
)

puts "  [+] EBOOT Loader (PSP, 2005)"

# Pandora Battery - PSP (2007)
pandora = psp.exploits.create!(
  title: "Pandora Battery",
  cve_id: nil,
  date_discovered: Date.new(2007, 8, 1),
  impact_level: :bootrom,
  description: %{<p>August 2007 changed everything for PSP hacking. The team Noobz, working with Dark_AleX, released Pandora Battery, a tool so powerful it could unbrick even completely broken PSPs and downgrade any firmware version.</p>

<p>The genius of Pandora was its multi-layered approach. It exploited a hardware vulnerability in the PSP's battery service mode. By modifying a battery's serial EEPROM to a special service mode value, the PSP would enter a forced boot state that ran code from the Memory Stick instead of internal flash.</p>

<p>Combined with a "Magic Memory Stick" containing a custom firmware installer, Pandora could do the impossible: downgrade a PSP from any firmware to version 1.5, the golden age of homebrew. It could also repair bricked PSPs by rewriting the flash0 partition.</p>

<p>But Pandora's most lasting impact was the discovery that the PSP's pre-IPL (initial program loader) could be completely replaced. This led to TimeMachine, a custom IPL that allowed persistent custom firmware across battery removals.</p>

<p>Pandora Battery remains legendary in console hacking, a hardware exploit so complete that Sony never fully patched it. Newer PSP models (3000 and Go) patched the service mode exploit, but for original and 2000 models, Pandora remains the ultimate key to the system.</p>},
  media_url: nil
)

puts "  [+] Pandora Battery (PSP, 2007)"

# ChickHEN - PSP (2008)
chickhen = psp.exploits.create!(
  title: "ChickHEN",
  cve_id: nil,
  date_discovered: Date.new(2008, 5, 1),
  impact_level: :user_mode,
  description: %{<p>By 2008, Sony had released the PSP-3000 with hardware changes that blocked Pandora Battery. The hacking scene seemed dead until Davee (ChickHEN) discovered a new approach: exploiting the PSP's photo viewer again.</p>

<p>ChickHEN (Homebrew Enabler) worked through a buffer overflow in TIFF image processing, similar to early EBOOT exploits. But instead of just loading applications, ChickHEN patched the PSP's memory in real-time to reload custom firmware modules.</p>

<p>The exploit was user-friendly: download some images, copy to a specific folder, open the photo viewer, and watch as the PSP froze, displayed colors, and rebooted into a homebrew-enabled state.</p>

<p>While ChickHEN only provided user-mode access and was lost on reboot (requiring re-exploitation each time), it worked on previously "unhackable" PSP-3000 systems. It proved that even as Sony hardened security, hackers would always find another way in.</p>},
  media_url: nil
)

puts "  [+] ChickHEN (PSP, 2008)"

# ============================================================================
# XBOX 360 EXPLOITS
# ============================================================================

# JTAG Hack - Xbox 360 (2009)
jtag = xbox_360.exploits.create!(
  title: "JTAG Hack",
  cve_id: nil,
  date_discovered: Date.new(2009, 8, 1),
  impact_level: :bootrom,
  description: %{<p>Throughout 2008 and 2009, the Xbox 360 seemed impenetrable. Microsoft had learned from the original Xbox's mistakes, implementing robust encryption and secure boot. But in August 2009, a hacker named GliGli revealed a vulnerability that would change everything.</p>

<p>The JTAG exploit targeted the Xbox 360's hypervisor, the software layer that virtualized the Xbox operating system from the hardware. Specifically, it exploited how the system handled ECC (error correction code) memory checks.</p>

<p>By using a modified game (specifically, "King Kong" with altered shader code) combined with a voltage glitching attack on the memory bus during boot, attackers could cause a single bit error in the hypervisor's memory. This single flipped bit disabled the console's signature verification.</p>

<p>Once signature checks were disabled, the Xbox 360 would run any code: homebrew, Linux, or modified games. The exploit was nicknamed "JTAG" because it initially required soldering a JTAG interface to the motherboard for the voltage glitch.</p>

<p>The JTAG hack was devastating for Microsoft. It allowed complete system compromise with kernel-level access. But Microsoft fought back aggressively: in summer 2009, they updated the Xbox 360 kernel to version 849x and higher, which patched the vulnerability in new consoles and prevented JTAG exploitation on updated ones.</p>

<p>Today, JTAG-able Xbox 360s (those manufactured before June 2009 and never updated) are collector's items in the modding community. The exploit remains one of the most sophisticated hardware hacks in console history.</p>},
  media_url: nil
)

puts "  [+] JTAG Hack (Xbox 360, 2009)"

# Reset Glitch Hack (RGH) - Xbox 360 (2011)
rgh = xbox_360.exploits.create!(
  title: "Reset Glitch Hack (RGH)",
  cve_id: nil,
  date_discovered: Date.new(2011, 6, 1),
  impact_level: :bootrom,
  description: %{<p>After Microsoft patched the JTAG vulnerability, the Xbox 360 seemed secure again. But in 2011, hackers discovered that the CPU's own reset behavior could be weaponized.</p>

<p>The Reset Glitch Hack exploited a critical flaw in the Xbox 360's boot sequence. When the CPU reset, it momentarily lost synchronization with the fuse controller, the hardware component responsible for verifying cryptographic signatures.</p>

<p>By sending a carefully timed reset pulse (the "glitch") at precisely the right nanosecond during boot, hackers could cause the CPU to read incorrect data from the fuse. This corrupted data would accidentally bypass signature verification, allowing unsigned code to execute.</p>

<p>The beauty of RGH was that it worked on all Xbox 360 models, including Slim versions that JTAG could not touch. While it required a modchip (the CoolRunner or similar) to generate the precise timing glitch, it was cheaper and easier than JTAG's soldering requirements.</p>

<p>RGH went through several iterations (RGH 1.0, RGH 1.2, RGH 2.0) as Microsoft adjusted hardware. The final version, RGH 2.0 (aka "Slim RGH"), worked even on the latest Xbox 360 E models.</p>

<p>The Reset Glitch Hack remains the gold standard for Xbox 360 modification. It is a testament to the fact that as long as hardware exists, timing attacks will find a way.</p>},
  media_url: nil
)

puts "  [+] Reset Glitch Hack (Xbox 360, 2011)"

# ============================================================================
# PLAYSTATION 3 EXPLOITS
# ============================================================================

# OtherOS Removal - PS3 (2010)
otheros = ps3.exploits.create!(
  title: "OtherOS Removal Backlash",
  cve_id: nil,
  date_discovered: Date.new(2010, 4, 1),
  impact_level: :user_mode,
  description: %{<p>In March 2010, Sony made a fateful decision: they removed the "Install Other OS" feature from PS3 Slim models and via firmware update on original FAT models. This feature had allowed users to install Linux, turning the PS3 into an affordable computing platform.</p>

<p>The removal enraged the security community, particularly a hacker named George Hotz (geohot), who had been using Linux for research. Geohot vowed to "retake" the feature through exploitation.</p>

<p>By April 2010, geohot announced he had compromised the PS3's hypervisor through a hardware glitch attack. While his initial exploit was limited (he used it to restore OtherOS, not for piracy), it proved the PS3 was not invincible.</p>

<p>The damage was done: Sony's decision to remove OtherOS attracted some of the world's best hackers to the PS3, setting in motion events that would culminate in the full PS3 jailbreak a year later.</p>},
  media_url: nil
)

puts "  [+] OtherOS Removal Backlash (PS3, 2010)"

# PS Jailbreak USB - PS3 (2010)
ps_jailbreak = ps3.exploits.create!(
  title: "PS Jailbreak USB",
  cve_id: nil,
  date_discovered: Date.new(2010, 8, 20),
  impact_level: :kernel_mode,
  description: %{<p>August 2010 shocked the gaming world. A USB dongle called "PS Jailbreak" appeared, claiming to allow backup games on unmodified PS3s. Sony initially dismissed it as fake until review sites confirmed it worked.</p>

<p>The exploit was ingenious in its simplicity. The PS3 had a debug mode for developers that allowed unsigned code execution. PS Jailbreak emulated a Sony USB hub, tricking the PS3 into believing it was connected to Sony's internal development tools.</p>

<p>When the PS3 attempted to enumerate the USB devices, the dongle responded with specially crafted descriptors that triggered a buffer overflow in the USB hub driver. This overflow redirected code execution to a payload that injected custom system calls into the running OS.</p>

<p>The result: backup managers could run, allowing users to play games from hard drive. More importantly, the exploit opened the door for homebrew.</p>

<p>Sony's response was swift. Within weeks, they released firmware 3.42, which patched the USB enumeration vulnerability. But the cat was out of the bag. Clone dongles flooded the market, and hackers began reverse-engineering the exploit to create software-only versions.</p>},
  media_url: nil
)

puts "  [+] PS Jailbreak USB (PS3, 2010)"

# Geohot's Metldr Exploit - PS3 (2011)
metldr = ps3.exploits.create!(
  title: "Metldr Root Key Extraction",
  cve_id: nil,
  date_discovered: Date.new(2011, 1, 22),
  impact_level: :bootrom,
  description: %{<p>January 22, 2011, a date that lives in PlayStation history. George Hotz (geohot) announced he had extracted the PS3's root encryption keys, compromising the system at the most fundamental level.</p>

<p>Metldr is the PS3's bootloader, the first code that runs when the console boots, stored in read-only memory. Its job is to verify the operating system before execution. If you can compromise metldr, you own the system forever.</p>

<p>Geohot's exploit used hardware glitching to bypass metldr's security checks. By manipulating the PS3's memory bus during boot, he could dump metldr's decrypted contents from memory, contents that included the root signing keys.</p>

<p>With these keys, anyone could sign code that the PS3 would accept as legitimate from Sony. Custom firmware could be created that Sony could not patch without breaking all existing software.</p>

<p>The fallout was enormous. Sony sued geohot and other hackers. The PS3's security model was shattered. While later PS3 models (Super Slim) changed metldr to invalidate the keys, original and Slim models were permanently compromised.</p>},
  media_url: nil
)

puts "  [+] Metldr Root Key Extraction (PS3, 2011)"

# fail0verflow's ECDSA Signing Failure - PS3 (2010)
ecdsa_fail = ps3.exploits.create!(
  title: "ECDSA Random Number Generator Flaw",
  cve_id: nil,
  date_discovered: Date.new(2010, 12, 29),
  impact_level: :bootrom,
  description: %{<p>On December 29, 2010, the hacker group fail0verflow revealed at the Chaos Communication Congress that they had broken PS3 encryption completely, not through glitching, but through a catastrophic implementation mistake.</p>

<p>The PS3 used Elliptic Curve Digital Signature Algorithm (ECDSA) to sign all software. ECDSA's security depends on properly random numbers. The Sony engineers had made a fatal error: instead of using random numbers for signatures, they used a static value, literally the same number for every signature.</p>

<p>In cryptography, this is unforgivable. With two signatures signed with the same "random" nonces, fail0verflow could mathematically derive Sony's private key. They did, and published it.</p>

<p>The implications were apocalyptic for Sony. The key fail0verflow extracted could sign any code (homebrew, backup managers, Linux loaders) that all PS3s would accept as genuine. Sony could not revoke the key without breaking all existing games.</p>

<p>Combined with geohot's metldr work, the ECDSA failure meant the PS3 was permanently compromised. Software updates could add checks, but the fundamental trust model was broken. It remains one of the most embarrassing cryptographic failures in corporate history.</p>},
  media_url: nil
)

puts "  [+] ECDSA Random Number Generator Flaw (PS3, 2010)"

# ============================================================================
# WII EXPLOITS
# ============================================================================

# Twilight Hack - Wii (January 1, 2008)
twilight_hack = wii.exploits.create!(
  title: "Twilight Hack",
  cve_id: nil,
  date_discovered: Date.new(2008, 1, 1),
  impact_level: :kernel_mode,
  description: %{<p>It began with a legend, or rather, a save file from one.</p>

<p>In the winter of 2008, a group of curious minds discovered something extraordinary hidden within <em>The Legend of Zelda: Twilight Princess</em>. They realized that the game's horse, Epona, whose name you could customize, held a secret power.</p>

<p>The hackers crafted a modified save file where Epona's name wasn't a name at all, but instead, a carefully crafted string of computer code, disguised as text. When this save file was loaded and an unsuspecting villager greeted Link and asked about his horse, the game attempted to display the "name."</p>

<p>But this name was too large for the memory space assigned to it. Like water spilling over the edge of a glass, the extra data overflowed into parts of the Wii's memory where instructions lived. This was a buffer overflow, one of the most classic vulnerabilities in computing.</p>

<p>The genius of this exploit lay in what happened next. Instead of crashing the system (which would have been annoying but harmless), the Wii began reading this spilled data as if it were a legitimate command. The payload told the Wii to lower its defenses, to ignore the security checks that normally prevented unsigned code from running.</p>

<p>With the system's guard down, the Wii looked for a file on the SD card: <code>boot.elf</code> or <code>boot.dol</code>. And if it found one, it executed it without question.</p>

<p>The homebrew era had begun. Users could now run custom applications, installers, emulators, and media players, all through a Zelda save file. The Twilight Hack opened the door to an entire ecosystem of homebrew software, turning the Wii from a closed gaming console into a platform for experimentation and creativity.</p>

<p>Nintendo would eventually patch this vulnerability in system updates, but by then, the floodgates had opened. The Twilight Hack became legendary, not just as a piece of technical wizardry, but as a symbol of the hacker ethos: with enough curiosity and skill, even the most fortified systems can be unlocked.</p>},
  media_url: nil
)

puts "  Twilight Hack (Wii, 2008)"

# Bannerbomb - Wii (May 2009)
bannerbomb = wii.exploits.create!(
  title: "Bannerbomb",
  cve_id: nil,
  date_discovered: Date.new(2009, 5, 1),
  impact_level: :kernel_mode,
  description: %{<p>The Twilight Hack had been patched, but the hacking community refused to be silenced. In May 2009, a hacker known as Comex unveiled something unprecedented: an exploit that required no game whatsoever.</p>

<p>Bannerbomb attacked the Wii's System Menu itself, the very heart of the console's interface. The genius of this approach was its accessibility. Where previous exploits required specific games that owners might not own, Bannerbomb only needed an SD card.</p>

<p>Here's how the heist unfolded: When the Wii Menu displayed channels from your SD card, it rendered animated banners to show them off. Comex discovered that the banner renderer was careless, it didn't check if a banner's data was too large before copying it into memory.</p>

<p>By crafting a malicious banner file and placing it on the SD card in a folder named <code>private</code>, the exploit tricked the Wii into loading corrupted banner data. When the menu tried to display this banner, the oversized payload spilled out of its allocated memory buffer, overwriting critical processor registers.</p>

<p>This wasn't just a crash, it was a hijacking. The overflow redirected the Wii's execution flow to code controlled by the attacker. With control established, the exploit launched the HackMii Installer from the SD card, granting users full access to their hardware.</p>

<p>Bannerbomb evolved through two versions. The original worked on System Menu versions 3.0 to 4.1, activated through the Data Management menu. When Nintendo closed that door in version 4.2, Comex struck again with Bannerbomb v2, exploiting the same vulnerability in the SD Card Menu icon on the main screen.</p>

<p>But all good things must end. Nintendo's System Menu 4.3 finally tightened banner validation, causing exploited channels to trigger the dreaded Error#004 ("Corrupt system files"). Yet even in defeat, Bannerbomb's legacy lived on, it had proven that the system menu itself was vulnerable, inspiring a new generation of exploits that would eventually crack even the most fortified Wii systems.</p>},
  media_url: nil
)

puts "  Bannerbomb (Wii, 2009)"

# Indiana Pwns - Wii (2009)
indiana_pwns = wii.exploits.create!(
  title: "Indiana Pwns",
  cve_id: nil,
  date_discovered: Date.new(2009, 9, 1),
  impact_level: :kernel_mode,
  description: %(<p>With Nintendo patching vulnerabilities as quickly as Team Twiizers could find them, the hacking community needed new vectors. Enter LEGO Indiana Jones: The Original Adventures, an unlikely candidate for one of the Wii's most reliable exploits.</p>

<p>Discovered in September 2009, Indiana Pwns followed in the footsteps of the Twilight Hack: it was a save file exploit. Players would load a specially modified save file, start the game, and simply walk to a specific location in the game world. When the game tried to load the next area, the corrupted save data triggered a buffer overflow.</p>

<p>What made Indiana Pwns particularly elegant was its simplicity. Unlike Twilight Hack, which required owning Zelda, LEGO Indiana Jones was a budget title, easily accessible and affordable. The exploit worked across multiple versions of the game, making it a versatile tool in the homebrew community's arsenal.</p>

<p>The exploit redirected the game's execution to load the HackMii Installer from the SD card, granting users the same homebrew capabilities that Twilight Hack had provided before being patched.</p>),
  media_url: nil
)

puts "  Indiana Pwns (Wii, 2009)"

# Smash Stack - Wii (2009)
smash_stack = wii.exploits.create!(
  title: "Smash Stack",
  cve_id: nil,
  date_discovered: Date.new(2009, 11, 1),
  impact_level: :kernel_mode,
  description: %(<p>Super Smash Bros. Brawl wasn't just a fighting game, it was, unknowingly, a delivery system for homebrew. Enter Smash Stack, an exploit that turned the game's stage builder into a weapon.</p>

<p>The exploit worked by exploiting a buffer overflow in how Brawl handled custom stages saved to an SD card. When the game loaded a malformed stage file, the oversized level data overflowed into adjacent memory, corrupting the stack, the very memory structure that tracks where a program should return after completing a function.</p>

<p>By carefully crafting the overflow data, attackers could overwrite the return address with a pointer to their own code. When the game tried to return from the current function, it jumped instead to the payload, which loaded the HackMii Installer.</p>

<p>Smash Stack was particularly valuable because Super Smash Bros. Brawl was one of the best-selling Wii games. Millions of players already owned it, making the exploit accessible to a massive audience.</p>),
  media_url: nil
)

puts "  Smash Stack (Wii, 2009)"

# Bathaxx - Wii (2010)
bathaxx = wii.exploits.create!(
  title: "Bathaxx",
  cve_id: nil,
  date_discovered: Date.new(2010, 3, 1),
  impact_level: :kernel_mode,
  description: %(<p>LEGO Batman joined the ranks of unlikely exploit delivery vehicles with Bathaxx, discovered in early 2010. Like its predecessors Indiana Pwns and Smash Stack, it exploited a buffer overflow, this time in how the game handled save file data.</p>

<p>The exploit followed the now-familiar pattern: load a modified save file, perform specific in-game actions to trigger the vulnerability, and watch as the Wii's security crumbled, replaced by the homebrew channel installer.</p>

<p>Bathaxx was part of Team Twiizers' strategy of providing multiple exploit vectors. By spreading exploits across different games, they ensured that even if Nintendo patched one game, others would remain vulnerable.</p>),
  media_url: nil
)

puts "  Bathaxx (Wii, 2010)"

# LetterBomb - Wii (August 2011)
letterbomb = wii.exploits.create!(
  title: "LetterBomb",
  cve_id: nil,
  date_discovered: Date.new(2011, 8, 1),
  impact_level: :kernel_mode,
  description: %(<p>By 2011, Nintendo had patched save file exploits and hardened the system menu. But the Wii had an unlikely vulnerability hiding in plain sight: the Message Board.</p>

<p>LetterBomb, created by hacker Giantpune, was a masterpiece of social engineering and technical cleverness. It exploited a buffer overflow in how the Wii Message Board processed incoming messages, specifically, the envelope animation that played when you received a new letter.</p>

<p>Here's the ingenious part: LetterBomb didn't require any games at all. Users simply visited a website, entered their Wii's MAC address, and downloaded a set of files to copy to their SD card. When the Wii's Message Board tried to display the specially crafted message, the malformed envelope data triggered a buffer overflow.</p>

<p>The payload executed the HackMii Installer, granting full homebrew access without owning a single specific game. Even more impressively, LetterBomb worked on System Menu 4.3, the final, most fortified version of Nintendo's Wii software.</p>

<p>LetterBomb remains one of the most popular Wii exploits in 2026. Its game-free approach, combined with compatibility with the latest system menu, made it the gold standard for Wii homebrew installation for over a decade.</p>),
  media_url: nil
)

puts "  LetterBomb (Wii, 2011)"

# Wilbrand - Wii (2012)
wilbrand = wii.exploits.create!(
  title: "Wilbrand",
  cve_id: nil,
  date_discovered: Date.new(2012, 6, 1),
  impact_level: :kernel_mode,
  description: %(<p>LetterBomb was brilliant, but it required an internet connection to generate the exploit files specific to each Wii's MAC address. In 2012, Giantpune returned with Wilbrand, an offline alternative.</p>

<p>Wilbrand exploited the same Message Board vulnerability as LetterBomb but worked differently. Instead of requiring users to visit a website and enter their MAC address, Wilbrand was a downloadable application that could generate the necessary exploit files on any PC.</p>

<p>This offline approach made Wilbrand particularly useful for users with limited internet access or privacy concerns. It also served as a backup method if the LetterBomb generation website ever went down.</p>),
  media_url: nil
)

puts "  Wilbrand (Wii, 2012)"

# FlashHax - Wii (2018)
flashhax = wii.exploits.create!(
  title: "FlashHax",
  cve_id: nil,
  date_discovered: Date.new(2018, 1, 1),
  impact_level: :kernel_mode,
  description: %(<p>Seven years after the Wii's launch, most thought its exploits had been exhausted. But in 2018, hacker Fullmetal5 demonstrated that old hardware still held secrets with FlashHax, an exploit that targeted the Wii's Internet Channel.</p>

<p>The Internet Channel was a version of the Opera web browser for the Wii, and it included Adobe Flash Player. FlashHax exploited a vulnerability in this aging Flash implementation.</p>

<p>The beauty of FlashHax was its simplicity: all users needed was an internet connection. By visiting a specific URL hosting malicious Flash content, the browser's Flash plugin would execute the exploit payload, launching the homebrew installer.</p>

<p>No SD card manipulation, no specific games, no modified save files, just point the Wii browser to a website, and the system was yours. FlashHax proved that even long-neglected components of the Wii's software stack could still yield vulnerabilities to a dedicated researcher.</p>),
  media_url: nil
)

puts "  FlashHax (Wii, 2018)"

# str2hax - Wii (2019)
str2hax = wii.exploits.create!(
  title: "str2hax",
  cve_id: nil,
  date_discovered: Date.new(2019, 4, 1),
  impact_level: :kernel_mode,
  description: %{<p>The simplest Wii exploit didn't come from Nintendo's heyday, it arrived in 2019, when Fullmetal5 unveiled str2hax. The name refers to its target: the "str" (string) handling in the Wii's End User License Agreement display.</p>

<p>Here's how it worked: When the Wii tried to display the EULA from its network settings, it fetched the license text from Nintendo's servers via DNS. By changing the Wii's DNS settings to point to a custom server, str2hax served a malicious EULA file that triggered a buffer overflow.</p>

<p>The exploit was elegant in its simplicity. No SD card, no games, no browsers, just change two DNS settings, attempt to view the EULA from network configuration, and the exploit executed.</p>

<p>str2hax became one of the easiest methods for installing homebrew on the Wii, proving that even the most mundane system functions, the license agreement, of all things, could become gateways to system-level access.</p>},
  media_url: nil
)

puts "  str2hax (Wii, 2019)"

# BlueBomb - Wii (2020)
bluebomb = wii.exploits.create!(
  title: "BlueBomb",
  cve_id: nil,
  date_discovered: Date.new(2020, 6, 1),
  impact_level: :kernel_mode,
  description: %{<p>The Wii Mini was Nintendo's budget-conscious redesign of the Wii, stripped of WiFi, SD card slot, and other features. These cost-cutting measures also blocked most known Wii exploits. In 2020, FullGeneric Name found a way in, through Bluetooth.</p>

<p>BlueBomb exploits a vulnerability in the Wii's Bluetooth stack, specifically in how it handles certain pairing requests. By sending malformed Bluetooth packets from a computer (typically running Linux), an attacker could trigger a buffer overflow in the Wii's Bluetooth module.</p>

<p>What makes BlueBomb remarkable is its universality. It works on original Wii systems, Wii Minis, and even Wiis with bricked system menus. Because it attacks the Bluetooth firmware, a low-level component that initializes before the main system, it can execute code even when the rest of the system is non-functional.</p>

<p>BlueBomb requires more technical setup than other exploits (a Linux computer and Bluetooth adapter), but it's the only method that works on Wii Mini, making it an essential tool for the homebrew community.</p>},
  media_url: nil
)

puts "  BlueBomb (Wii, 2020)"

# ============================================================================
# CREDITS (Link exploits to hackers)
# ============================================================================

puts "Assigning credits..."

# Nintendo DS credits
Credit.create!(exploit: passme, hacker: loopy)
puts "  [+] Loopy → PassMe"

Credit.create!(exploit: wifi_me, hacker: loopy)
puts "  [+] Loopy → WiFi Me"

# PSP credits
Credit.create!(exploit: swaploit, hacker: fanjita)
puts "  [+] Fanjita → Swaploit"

Credit.create!(exploit: eboot_loader, hacker: fanjita)
puts "  [+] Fanjita → EBOOT Loader"

Credit.create!(exploit: pandora, hacker: noobz)
Credit.create!(exploit: pandora, hacker: dark_alex)
puts "  [+] Noobz + Dark_AleX → Pandora Battery"

Credit.create!(exploit: chickhen, hacker: fanjita)
puts "  [+] Fanjita → ChickHEN"

# Xbox 360 credits
Credit.create!(exploit: jtag, hacker: glitching)
puts "  [+] GliGli → JTAG Hack"

Credit.create!(exploit: rgh, hacker: glitching)
puts "  [+] GliGli → Reset Glitch Hack"

# PS3 credits
Credit.create!(exploit: otheros, hacker: geohot)
puts "  [+] geohot → OtherOS Removal Backlash"

Credit.create!(exploit: ps_jailbreak, hacker: kaos)
puts "  [+] Kaos → PS Jailbreak USB"

Credit.create!(exploit: metldr, hacker: geohot)
puts "  [+] geohot → Metldr Root Key Extraction"

Credit.create!(exploit: ecdsa_fail, hacker: fail0verflow)
puts "  [+] fail0verflow → ECDSA Flaw"

# Wii credits
Credit.create!(exploit: twilight_hack, hacker: team_twiizers)
puts "  [+] Team Twiizers → Twilight Hack"

Credit.create!(exploit: bannerbomb, hacker: comex)
puts "  Comex → Bannerbomb"

Credit.create!(exploit: indiana_pwns, hacker: team_twiizers)
puts "  Team Twiizers → Indiana Pwns"

Credit.create!(exploit: smash_stack, hacker: team_twiizers)
puts "  Team Twiizers → Smash Stack"

Credit.create!(exploit: bathaxx, hacker: team_twiizers)
puts "  Team Twiizers → Bathaxx"

Credit.create!(exploit: letterbomb, hacker: giantpune)
puts "  Giantpune → LetterBomb"

Credit.create!(exploit: wilbrand, hacker: giantpune)
puts "  Giantpune → Wilbrand"

Credit.create!(exploit: flashhax, hacker: fullmetal5)
puts "  Fullmetal5 → FlashHax"

Credit.create!(exploit: str2hax, hacker: fullmetal5)
puts "  Fullmetal5 → str2hax"

Credit.create!(exploit: bluebomb, hacker: full_generic_name)
puts "  FullGeneric Name → BlueBomb"

# ============================================================================
# SUMMARY
# ============================================================================

puts ""
puts "=" * 70
puts "SEEDING COMPLETE"
puts "=" * 70
puts "Platforms: #{Platform.count}"
puts "Hackers: #{Hacker.count}"
puts "Exploits: #{Exploit.count}"
puts "Credits: #{Credit.count}"
puts ""
puts "Timeline is ready. Launch the server and visit / to see the exploits."
puts "=" * 70
