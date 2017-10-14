sudo apt-get -y install hexchat
mkdir -p ~/.config/hexchat
cat > ~/.config/hexchat/chanopt.conf <<'EOF'
network = freenode
channel = #devuan
text_hidejoinpart = 1

network = freenode
channel = #debianfork
text_hidejoinpart = 1
EOF


mkdir -p ~/.config/hexchat/
cat > ~/.config/hexchat/servlist.conf << 'EOF'
v=2.10.1

N=2600net
E=UTF-8 (Unicode)
F=19
D=0
S=irc.2600.net

N=2ch
E=iso-2022-jp
F=19
D=0
S=irc.2ch.sc
S=irc.nurs.or.jp
S=irc.juggler.jp

N=AccessIRC
E=UTF-8 (Unicode)
F=19
D=0
S=irc.accessirc.net
S=eu.accessirc.net

N=AfterNET
E=UTF-8 (Unicode)
F=19
D=0
S=irc.afternet.org
S=us.afternet.org
S=eu.afternet.org

N=Aitvaras
E=UTF-8 (Unicode)
F=19
D=0
S=irc6.ktu.lt/+7668
S=irc6.ktu.lt/7666
S=irc.data.lt/+6668
S=irc.omnitel.net/+6668
S=irc.ktu.lt/+6668
S=irc.kis.lt/+6668
S=irc.vub.lt/+6668
S=irc.data.lt
S=irc.omnitel.net
S=irc.ktu.lt
S=irc.kis.lt
S=irc.vub.lt

N=AlphaChat
L=6
E=UTF-8 (Unicode)
F=19
D=0
S=irc.alphachat.net
S=na.alphachat.net
S=eu.alphachat.net
S=au.alphachat.net
S=za.alphachat.net

N=Anthrochat
E=UTF-8 (Unicode)
F=19
D=0
S=irc.anthrochat.net/+6697
S=irc.anthrochat.net

N=ARCNet
E=UTF-8 (Unicode)
F=19
D=0
S=se1.arcnet.vapor.com
S=us1.arcnet.vapor.com
S=us2.arcnet.vapor.com
S=us3.arcnet.vapor.com
S=ca1.arcnet.vapor.com
S=de1.arcnet.vapor.com
S=de3.arcnet.vapor.com
S=ch1.arcnet.vapor.com
S=be1.arcnet.vapor.com
S=nl3.arcnet.vapor.com
S=uk1.arcnet.vapor.com
S=uk2.arcnet.vapor.com
S=fr1.arcnet.vapor.com

N=AustNet
E=UTF-8 (Unicode)
F=19
D=0
S=au.austnet.org
S=us.austnet.org

N=AzzurraNet
E=UTF-8 (Unicode)
F=19
D=0
S=irc.azzurra.org
S=crypto.azzurra.org

N=Canternet
L=6
E=UTF-8 (Unicode)
F=19
D=0
S=irc.canternet.org/+6697
S=irc.canternet.org

N=Chat4all
E=UTF-8 (Unicode)
F=19
D=0
S=irc.chat4all.org/+7001
S=irc.chat4all.org

N=ChattingAway
E=UTF-8 (Unicode)
F=19
D=0
S=irc.chattingaway.com

N=ChatJunkies
E=UTF-8 (Unicode)
F=19
D=0
S=irc.chatjunkies.org
S=nl.chatjunkies.org

N=ChatNet
E=UTF-8 (Unicode)
F=19
D=0
S=US.ChatNet.Org

N=ChatSpike
E=UTF-8 (Unicode)
F=19
D=0
S=irc.chatspike.net

N=Criten
E=UTF-8 (Unicode)
F=19
D=0
S=irc.criten.net
S=irc.eu.criten.net

N=DALnet
E=UTF-8 (Unicode)
F=19
D=0
S=irc.dal.net
S=irc.eu.dal.net

N=Dark-Tou-Net
E=UTF-8 (Unicode)
F=19
D=0
S=irc.d-t-net.de
S=bw.d-t-net.de
S=nc.d-t-net.de

N=DarkMyst
L=6
E=UTF-8 (Unicode)
F=19
D=0
S=irc.darkmyst.org

N=DeepIRC
E=UTF-8 (Unicode)
F=19
D=0
S=irc.deepirc.net

N=DeltaAnime
E=UTF-8 (Unicode)
F=19
D=0
S=irc.deltaanime.net

N=EFnet
E=UTF-8 (Unicode)
F=19
D=0
S=irc.blackened.com
S=irc.Prison.NET
S=irc.Qeast.net
S=irc.efnet.pl
S=irc.lightning.net
S=irc.servercentral.net

N=ElectroCode
E=UTF-8 (Unicode)
F=19
D=0
S=irc.electrocode.net/+6697
S=irc.electrocode.net

N=EnterTheGame
E=UTF-8 (Unicode)
F=19
D=0
S=IRC.EnterTheGame.Com

N=EntropyNet
L=6
E=UTF-8 (Unicode)
F=19
D=0
S=irc.entropynet.net/+6697
S=irc.entropynet.net
S=irc6.entropynet.net/+6697
S=irc6.entropynet.net

N=EsperNet
L=6
E=UTF-8 (Unicode)
F=19
D=0
S=irc.esper.net/+6697
S=irc.esper.net

N=EUIrc
E=UTF-8 (Unicode)
F=19
D=0
S=irc.euirc.net
S=irc.ham.de.euirc.net
S=irc.ber.de.euirc.net
S=irc.ffm.de.euirc.net
S=irc.bre.de.euirc.net
S=irc.hes.de.euirc.net
S=irc.inn.at.euirc.net
S=irc.bas.ch.euirc.net

N=EuropNet
E=UTF-8 (Unicode)
F=19
D=0
S=irc.europnet.org

N=FDFNet
E=UTF-8 (Unicode)
F=19
D=0
S=irc.fdfnet.net
S=irc.eu.fdfnet.net

N=FEFNet
L=6
E=UTF-8 (Unicode)
F=19
D=0
S=irc.fef.net

N=freenode
L=6
E=UTF-8 (Unicode)
F=19
D=1
S=chat.freenode.net/+6697
S=chat.freenode.net
S=irc.freenode.net
J=#devuan
J=#devuan-dev
J=#debianfork

N=Furnet
E=UTF-8 (Unicode)
F=19
D=0
S=irc.furnet.org/+6697
S=irc.furnet.org

N=GalaxyNet
E=UTF-8 (Unicode)
F=19
D=0
S=irc.galaxynet.org

N=GameSurge
E=UTF-8 (Unicode)
F=19
D=0
S=irc.gamesurge.net

N=GeeksIRC
L=6
E=UTF-8 (Unicode)
F=19
D=0
S=irc.geeksirc.net/+6697
S=irc.geeksirc.net

N=GeekShed
E=UTF-8 (Unicode)
F=19
D=0
S=irc.geekshed.net

N=German-Elite
E=UTF-8 (Unicode)
F=19
D=0
S=dominion.german-elite.net
S=komatu.german-elite.net

N=GIMPNet
E=UTF-8 (Unicode)
F=19
D=0
S=irc.gimp.org
S=irc.gnome.org

N=Hashmark
E=UTF-8 (Unicode)
F=19
D=0
S=irc.hashmark.net

N=IdleMonkeys
E=UTF-8 (Unicode)
F=19
D=0
S=irc.idlemonkeys.net

N=IndirectIRC
E=UTF-8 (Unicode)
F=19
D=0
S=irc.indirectirc.com/+6697
S=irc.indirectirc.com

N=Interlinked
L=6
E=UTF-8 (Unicode)
F=19
D=0
S=irc.interlinked.me/+6697
S=irc.interlinked.me

N=IRC4Fun
L=6
E=UTF-8 (Unicode)
F=19
D=0
S=irc.irc4fun.net/+6697
S=irc.irc4fun.net

N=IRCHighWay
E=UTF-8 (Unicode)
F=19
D=0
S=irc.irchighway.net/+9999
S=irc.irchighway.net

N=IrcLink
E=UTF-8 (Unicode)
F=19
D=0
S=irc.irclink.net
S=Alesund.no.eu.irclink.net
S=Oslo.no.eu.irclink.net
S=frogn.no.eu.irclink.net
S=tonsberg.no.eu.irclink.net

N=IRCNet
E=UTF-8 (Unicode)
F=19
D=0
S=open.ircnet.net
S=irc.de.ircnet.net

N=IRCNode
L=6
E=UTF-8 (Unicode)
F=19
D=0
S=irc.ircnode.org/+6697
S=irc.ircnode.org

N=Irctoo.net
E=UTF-8 (Unicode)
F=19
D=0
S=irc.irctoo.net

N=iZ-smart.net
E=UTF-8 (Unicode)
F=19
D=0
S=irc.iZ-smart.net/6666
S=irc.iZ-smart.net/6667
S=irc.iZ-smart.net/6668

N=Krstarica
E=UTF-8 (Unicode)
F=19
D=0
S=irc.krstarica.com

N=LinkNet
E=UTF-8 (Unicode)
F=19
D=0
S=irc.link-net.org/+7000
S=as.link-net.org/+7000
S=eu.link-net.org/+7000
S=us.link-net.org/+7000
S=irc6.link-net.org/+7000

N=MindForge
E=UTF-8 (Unicode)
F=19
D=0
S=irc.mindforge.org

N=MIXXnet
E=UTF-8 (Unicode)
F=19
D=0
S=irc.mixxnet.net

N=Moznet
E=UTF-8 (Unicode)
F=19
D=0
S=irc.mozilla.org

N=ObsidianIRC
E=UTF-8 (Unicode)
F=19
D=0
S=irc.obsidianirc.net

N=Oceanius
L=6
E=UTF-8 (Unicode)
F=19
D=0
S=irc.oceanius.com

N=OFTC
E=UTF-8 (Unicode)
F=19
D=0
S=irc.oftc.net

N=OtherNet
E=UTF-8 (Unicode)
F=19
D=0
S=irc.othernet.org

N=OzNet
E=UTF-8 (Unicode)
F=19
D=0
S=irc.oz.org

N=PIRC.PL
E=UTF-8 (Unicode)
F=19
D=0
S=irc.pirc.pl

N=PonyChat
L=6
E=UTF-8 (Unicode)
F=19
D=0
S=irc.ponychat.net/+6697
S=irc.ponychat.net

N=PTNet.org
E=UTF-8 (Unicode)
F=19
D=0
S=irc.PTNet.org
S=world.PTnet.org
S=netvisao.PTnet.org
S=uevora.PTnet.org
S=vianetworks.PTnet.org
S=uc.PTnet.org
S=nfsi.ptnet.org
S=fctunl.ptnet.org

N=QuakeNet
L=8
E=UTF-8 (Unicode)
F=19
D=0
S=irc.quakenet.org
S=irc.se.quakenet.org
S=irc.dk.quakenet.org
S=irc.no.quakenet.org
S=irc.fi.quakenet.org
S=irc.be.quakenet.org
S=irc.uk.quakenet.org
S=irc.it.quakenet.org

N=Rizon
E=UTF-8 (Unicode)
F=19
D=0
S=irc.rizon.net

N=RusNet
E=KOI8-R (Cyrillic)
F=19
D=0
S=irc.tomsk.net
S=irc.run.net
S=irc.ru
S=irc.lucky.net

N=SceneNet
E=UTF-8 (Unicode)
F=19
D=0
S=irc.scene.org
S=irc.eu.scene.org
S=irc.us.scene.org

N=SeilEn.de
E=UTF-8 (Unicode)
F=19
D=0
S=irc.seilen.de

N=SeionIRC
L=6
E=UTF-8 (Unicode)
F=19
D=0
S=irc.seion.us/+6697
S=irc.seion.us

N=Serenity-IRC
E=UTF-8 (Unicode)
F=19
D=0
S=irc.serenity-irc.net
S=eu.serenity-irc.net
S=us.serenity-irc.net

N=SlashNET
E=UTF-8 (Unicode)
F=19
D=0
S=irc.slashnet.org
S=area51.slashnet.org
S=moo.slashnet.org
S=radon.slashnet.org

N=Snoonet
L=6
E=UTF-8 (Unicode)
F=19
D=0
S=irc.snoonet.org/+6697
S=irc.snoonet.org/6667

N=Snyde
E=UTF-8 (Unicode)
F=19
D=0
S=irc.snyde.net/6667

N=Sohbet.Net
E=UTF-8 (Unicode)
F=19
D=0
S=irc.sohbet.net

N=SolidIRC
E=UTF-8 (Unicode)
F=19
D=0
S=irc.solidirc.com

N=SorceryNet
L=6
E=UTF-8 (Unicode)
F=19
D=0
S=irc.sorcery.net/9000
S=irc.us.sorcery.net/9000
S=irc.eu.sorcery.net/9000

N=SpotChat
L=6
E=UTF-8 (Unicode)
F=19
D=0
S=irc.spotchat.org/+6697
S=irc.spotchat.org/6667

N=StarChat
E=UTF-8 (Unicode)
F=19
D=0
S=irc.starchat.net
S=gainesville.starchat.net
S=freebsd.starchat.net
S=sunset.starchat.net
S=revenge.starchat.net
S=tahoma.starchat.net
S=neo.starchat.net

N=StaticBox
L=6
E=UTF-8 (Unicode)
F=19
D=0
S=irc.staticbox.net

N=Station51
E=UTF-8 (Unicode)
F=19
D=0
S=irc.station51.net/+6697
S=irc.station51.net

N=StormBit
L=6
E=UTF-8 (Unicode)
F=19
D=0
S=irc.stormbit.net/+6697
S=irc.stormbit.net

N=SwiftIRC
E=UTF-8 (Unicode)
F=19
D=0
S=irc.swiftirc.net/+6697
S=irc.swiftirc.net/6667

N=synIRC
E=UTF-8 (Unicode)
F=19
D=0
S=irc.synirc.net/+6697
S=irc.synirc.net/6667

N=Techman's World IRC
L=6
E=UTF-8 (Unicode)
F=19
D=0
S=irc.techmansworld.com/+6697
S=irc.techmansworld.com/6667

N=TinyCrab
L=6
E=UTF-8 (Unicode)
F=19
D=0
S=irc.tinycrab.net

N=TURLINet
E=UTF-8 (Unicode)
F=19
D=0
S=irc.turli.net
S=irc.servx.ru
S=irc.gavnos.ru

N=UnderNet
L=9
E=UTF-8 (Unicode)
F=19
D=0
S=us.undernet.org
C=MSG x@channels.undernet.org login %u %p

N=UniBG
L=9
E=UTF-8 (Unicode)
F=19
D=0
S=irc.lirex.com
S=irc.naturella.com
S=irc.techno-link.com
C=MSG NS IDENTIFY %p

N=ValleyNode
L=6
E=UTF-8 (Unicode)
F=19
D=0
S=irc.valleynode.net

N=Worldnet
E=UTF-8 (Unicode)
F=19
D=0
S=irc.worldnet.net

N=Windfyre
E=UTF-8 (Unicode)
F=19
D=0
S=irc.windfyre.net/+6697
S=irc.windfyre.net

N=Xertion
L=6
E=UTF-8 (Unicode)
F=19
D=0
S=irc.xertion.org/+6697
S=irc.xertion.org
EOF

cat > ~/.config/hexchat/hexchat.conf <<'EOF'
version = 2.10.1
away_auto_unmark = 0
away_omit_alerts = 0
away_reason = I'm busy
away_show_once = 1
away_size_max = 300
away_timeout = 60
away_track = 1
completion_amount = 5
completion_auto = 0
completion_sort = 1
completion_suffix = ,
dcc_auto_chat = 0
dcc_auto_recv = 1
dcc_auto_resume = 1
dcc_blocksize = 1024
dcc_completed_dir = 
dcc_dir = ~/Downloads
dcc_fast_send = 1
dcc_global_max_get_cps = 0
dcc_global_max_send_cps = 0
dcc_ip = 
dcc_ip_from_server = 0
dcc_max_get_cps = 0
dcc_max_send_cps = 0
dcc_permissions = 384
dcc_port_first = 0
dcc_port_last = 0
dcc_remove = 0
dcc_save_nick = 0
dcc_send_fillspaces = 0
dcc_stall_timeout = 60
dcc_timeout = 180
flood_ctcp_num = 5
flood_ctcp_time = 30
flood_msg_num = 5
flood_msg_time = 30
gui_autoopen_chat = 1
gui_autoopen_dialog = 1
gui_autoopen_recv = 1
gui_autoopen_send = 1
gui_chanlist_maxusers = 9999
gui_chanlist_minusers = 5
gui_compact = 0
gui_dialog_height = 256
gui_dialog_left = 0
gui_dialog_top = 0
gui_dialog_width = 500
gui_filesize_iec = 0
gui_focus_omitalerts = 0
gui_hide_menu = 0
gui_input_attr = 1
gui_input_icon = 1
gui_input_nick = 1
gui_input_spell = 1
gui_input_style = 1
gui_join_dialog = 1
gui_lagometer = 1
gui_lang = 15
gui_mode_buttons = 0
gui_pane_divider_position = 0
gui_pane_left_size = 128
gui_pane_right_size = 100
gui_pane_right_size_min = 80
gui_quit_dialog = 1
gui_search_pos = 0
gui_slist_fav = 0
gui_slist_select = 31
gui_slist_skip = 1
gui_tab_chans = 1
gui_tab_dialogs = 1
gui_tab_dots = 0
gui_tab_icons = 1
gui_tab_layout = 2
gui_tab_newtofront = 2
gui_tab_pos = 1
gui_tab_scrollchans = 0
gui_tab_server = 1
gui_tab_small = 0
gui_tab_sort = 1
gui_tab_trunc = 20
gui_tab_utils = 0
gui_throttlemeter = 1
gui_topicbar = 1
gui_transparency = 255
gui_tray = 1
gui_tray_away = 0
gui_tray_blink = 1
gui_tray_close = 0
gui_tray_minimize = 0
gui_tray_quiet = 0
gui_ulist_buttons = 0
gui_ulist_color = 0
gui_ulist_count = 1
gui_ulist_doubleclick = QUERY %s
gui_ulist_hide = 0
gui_ulist_icons = 1
gui_ulist_pos = 3
gui_ulist_resizable = 1
gui_ulist_show_hosts = 0
gui_ulist_sort = 0
gui_ulist_style = 1
gui_url_mod = 0
gui_usermenu = 0
gui_win_height = 1145
gui_win_fullscreen = 0
gui_win_left = 0
gui_win_modes = 0
gui_win_save = 1
gui_win_state = 1
gui_win_swap = 0
gui_win_top = 0
gui_win_ucount = 0
gui_win_width = 1920
identd = 1
input_balloon_chans = 0
input_balloon_hilight = 0
input_balloon_priv = 0
input_balloon_time = 20
input_beep_chans = 0
input_beep_hilight = 0
input_beep_priv = 0
input_command_char = /
input_filter_beep = 0
input_flash_chans = 0
input_flash_hilight = 1
input_flash_priv = 1
input_perc_ascii = 0
input_perc_color = 0
input_tray_chans = 0
input_tray_hilight = 1
input_tray_priv = 1
irc_auto_rejoin = 0
irc_ban_type = 1
irc_cap_server_time = 1
irc_conf_mode = 0
irc_extra_hilight = 
irc_hide_nickchange = 0
irc_hide_version = 0
irc_hidehost = 0
irc_id_ntext = 
irc_id_ytext = 
irc_invisible = 0
irc_join_delay = 5
irc_logging = 0
irc_logmask = %n/%c.log
irc_nick1 = cyteen
irc_nick2 = cyteen_
irc_nick3 = cyteen42
irc_nick_hilight = 
irc_no_hilight = NickServ,ChanServ,InfoServ,N,Q
irc_notice_pos = 0
irc_part_reason = Leaving
irc_quit_reason = Leaving
irc_raw_modes = 0
irc_real_name = realname
irc_servernotice = 0
irc_skip_motd = 0
irc_user_name = cyteen42_
irc_wallops = 0
irc_who_join = 1
irc_whois_front = 1
net_auto_reconnect = 1
net_auto_reconnectonfail = 0
net_bind_host = 
net_ping_timeout = 0
net_proxy_auth = 0
net_proxy_host = 
net_proxy_pass = 
net_proxy_port = 0
net_proxy_type = 0
net_proxy_use = 0
net_proxy_user = 
net_reconnect_delay = 10
net_throttle = 1
notify_timeout = 15
notify_whois_online = 0
perl_warnings = 0
stamp_log = 1
stamp_log_format = %b %d %H:%M:%S 
stamp_text = 1
stamp_text_format = [%H:%M:%S] 
text_autocopy_color = 0
text_autocopy_stamp = 0
text_autocopy_text = 1
text_background = 
text_color_nicks = 0
text_font = Monospace 9
text_font_main = Monospace 9
text_font_alternative = Arial Unicode MS,Lucida Sans Unicode,MS Gothic,Unifont
text_indent = 1
text_max_indent = 256
text_max_lines = 500
text_replay = 1
text_search_case_match = 0
text_search_highlight_all = 0
text_search_follow = 1
text_search_regexp = 0
text_show_marker = 1
text_show_sep = 1
text_spell_langs = en_US
text_stripcolor_msg = 0
text_stripcolor_replay = 1
text_stripcolor_topic = 1
text_thin_sep = 1
text_transparent = 0
text_wordwrap = 1
url_grabber = 1
url_grabber_limit = 100
url_logging = 0
EOF

#bash -c `perl -p -i -e 's/irc_conf_mode =.""/irc_conf_mode = "1"/g'  ~/.xchat2/xchat.conf`
#bash -c `perl -p -i -e 's/irc_conf_mode =.""/irc_conf_mode = "1"/g'  ~/.config/hexchat/h/xchat.conf`
perl -p -i -e 's/irc_conf_mode =.""/irc_conf_mode = "1"/g'  ~/.config/hexchat/hexchat.conf
