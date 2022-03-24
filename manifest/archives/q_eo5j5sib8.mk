#
# T-ARA[티아라] "SUGAR FREE"[슈가프리] M/V ver.1
# https://www.youtube.com/watch?v=q_eo5j5sib8
#

# -----------------------------------------------------------------------------------------------------------------
# ID  EXT   RESOLUTION FPS |   FILESIZE   TBR PROTO | VCODEC          VBR ACODEC      ABR     ASR MORE INFO
# -----------------------------------------------------------------------------------------------------------------
# 140 m4a   audio only     |    3.67MiB  129k https | audio only          mp4a.40.2  129k 44100Hz medium, m4a_dash
# 251 webm  audio only     |    3.55MiB  125k https | audio only          opus       125k 48000Hz medium, webm_dash
# 137 mp4   1920x1080   24 |  118.34MiB 4172k https | avc1.640028   4172k video only              1080p, mp4_dash
# 248 webm  1920x1080   24 |   72.59MiB 2559k https | vp9           2559k video only              1080p, webm_dash
# -----------------------------------------------------------------------------------------------------------------


vid:=q_eo5j5sib8
fid:=140,251
fid+=137+140
fid+=248+251

