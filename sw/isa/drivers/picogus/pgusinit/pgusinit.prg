`  U�   �   (    MiNT   '   : N��    T�   �   (       �          Vh  �  VX                                                                                                                                                                                �α�    gJ� $f#�  VhO� �N�  2$ o #�  Vh ( �  .@��   @N�  8zNu  NuNu0/ �� 
2/ �� �AH@B@2/ �� 
ЁNu/t"/ jD�D / jD�D// aP�JjD�$Nu/"/  / �   d$ BBHB��0H@4/ 
��0`0$���   d���  ��"��HB��HBJBf
҂e�� cS�$Nu"/  / // a �lP�"/ // a �<P�"/ �� Nu"/  / // a �lP�"/ // a �P�"/ �� Nup 0/ /@  y  VT h N�p / /@ 0/ /@  y  VT h N�p 0/ 
/@ 0/ /@  y  VT h N�H�0 / $< [��E���Hx�N�X�� gS�f�B L�Nup`�H� 8$/ (o &o Hx �Hx�E��|N�p F ��/ Hx�N�6KO� t 4( g�   �/ Hx�N�R�P���n�B� /|  � L�` �4Firmware version: %s
 O�� H� 0Hx �Hx�E��
N�Hx Hx�N�E� Hx B�/
N�  ?�O� t G���Hx�N��( X�g
R��   �f�/
Hz��N�  <�P�L�O� NuERROR: In GUS mode but no ULTRASND variable set or is malformed!
 The ULTRASND environment variable must be set in the following format:
 	set ULTRASND=xxx,y,n,z,n
 Where xxx = port, y = DMA, z = IRQ. n is ignored.
 Port is set via /gusport xxx option; DMA and IRQ configued via jumper.
 /
/9  U�Hz��E�  5 N�/9  U�Hz�N�/9  U�Hz�BN�/9  U�Hz�QN�O� .�  U�Hz�tN�P�$_NuERROR: In SB mode but no BLASTER variable set or is malformed!
 The BLASTER environment variable must be set in the following format:
 	set BLASTER=Axxx Iy Dz T3
 Where xxx = port, y = IRQ, z = DMA. T3 indicates an SB 2.0 compatible card.
 Port is set via /sbport xxx option; DMA and IRQ configued via jumper.
  /
/9  U�Hz��E�  5 N�/9  U�Hz��N�/9  U�Hz�'N�/9  U�Hz�7N�O� .�  U�Hz�tN�P�$_NuSettings saved to flash.  /
Hx �Hx�E���N�Hx �Hx�N�Hz��N�  =XHx dN�  2�O� $_NuWiFi status:  //
Hx �Hx�E��PN�Hx THx�N�B�Hx�N�Hz��N�  <�O� G��E�  =DHx�N�X�J fHx 
N�X�$_&_NuH�0@/N�X�`�Hx� y  VT h N�X�NuUsage:    /?            - show this message (/?? to show options for all modes)    /flash fw.uf2 - program the PicoGUS with the firmware file fw.uf2    /mode x       - change card mode to x (gus, sb, mpu, tandy, cms, adlib, usb)    /save         - save settings to the card to persist on system boot    /defaults     - set all settings for all modes to defaults    /wtvol x      - set volume of wavetable header. Scale 0-100, Default: 100                    (for PicoGUS v2.0 boards only)    /joy 1|0      - enable/disable USB joystick support, Default: 0 MPU-401 settings:    /mpuport x    - set the base port of the MPU-401. Default: 330, 0 to disable    /mpudelay 1|0 - delay SYSEX (for rev.0 Roland MT-32)    /mpufake 1|0  - fake all notes off (for Roland RA-50) GUS settings:    /gusport x  - set the base port of the GUS. Default: 240    /gusbuf n   - set audio buffer to n samples. Default: 4, Min: 1, Max: 256                  (tweaking can help programs that hang or have audio glitches)    /gusdma n   - force DMA interval to n us. Default: 0, Min: 0, Max: 255                  Specifying 0 restores the GUS default behavior.                  (increase to fix games with streaming audio like Doom)    /gus44k 1|0 - Fixed 44.1kHz output for all active voice #s [EXPERIMENTAL] Sound Blaster settings:    /sbport x    - set the base port of the Sound Blaster. Default: 220 AdLib settings:    /oplport x   - set the base port of the OPL2. Default: 388, 0 to disable    /oplwait 1|0 - wait on OPL2 write. Can fix speed-sensitive early AdLib games Tandy settings:    /tandyport x - set the base port of the Tandy 3-voice. Default: 2C0 CMS settings:    /cmsport x - set the base port of the CMS. Default: 220 Serial Mouse settings:    /mousecom n - mouse COM port. Default: 0, Choices: 0 (disable), 1, 2, 3, 4    /mouseproto n - set mouse protocol. Default: 0 (Microsoft)           0 - Microsoft Mouse 2-button,      1 - Logitech 3-button           2 - IntelliMouse 3-button + wheel, 3 - Mouse Systems 3-button    /mouserate n  - set report rate in Hz. Default: 60, Min: 20, Max: 200           (increase for smoother cursor movement, decrease for lower CPU load)    /mousesen n   - set mouse sensitivity (256 - 100%, 128 - 50%, 512 - 200%)
 NE2000/WiFi settings:    /ne2kport x   - set the base port of the NE2000. Default: 300    /wifissid abc - set the WiFi SSID to abc    /wifipass xyz - set the WiFi WPA/WPA2 password/key to xyz    /wifinopass   - unset the WiFi password to connect to an open access point    /wifistatus   - print current WiFi status  H�0 $/ / Hz��E�  =XN�Hz��N�Hz�0N�Hz�oN�Hz��N�Hz��N�Hz�2N�Hz�yN�O� .�  	?N�Hz��N�Hz��N�Hz�2N�Hz�dN�O� p��gJg4Hz��N�Hz��N�Hz��N�Hz�N�Hz�WN�Hz��N�Hz��N�Hz�N�O�  p��g  �Jf  �p��f  �Hz��N�Hz��N�Hz��N�O� p��gJg  �Hz�.N�Hz�8N�P�p��f  �Hz�oN�Hz�wN�P�p��epKF  fJg  �Hz��N�Hz��N�Hz��N�Hz�'N�Hz�dN�Hz��N�Hz��N�Hz�2N�  <�O�  Q�fbHz�nN�Hz�~N�Hz��N�Hz��N�Hz�N�O� /|  ( L�N�  =XHz�{N�Hz��N�P�p��g �"` �Jf �` �*Jf �F` �PJf�L�NuQ�f�`�p��f �8` �&enabled disabled on off nope , wait on  PicoGUSinit v3.3.0 (c) 2024 Ian Scott - licensed under the GNU GPL v2 ERROR: no PicoGUS detected!
 PicoGUS detected:  /flash %255s rb ERROR: unable to open firmware file %s
 Older fw protocol version %d detected, upgrading firmware in compatibility mode
 ERROR: file %s is not a valid UF2 file - too short
 ERROR: file %s is not a valid UF2 file - bad magic
 ERROR: Card is not in programming mode?
 Programming %d blocks 
ERROR: file %s is not a valid UF2 file - block mismatch
 
ERROR: Card is not in firmware writing mode?
 
ERROR: Card has written last firmware byte but is not done
 
Programming complete. Waiting for the card to reboot... ERROR: card is not alive after programming firmware
 ERROR: PicoGUS card using protocol %u, needs %u
 Please run the latest PicoGUS firmware and pgusinit.exe versions together!
 /? /?? /joy %1[01] /mode %7s /wtvol %hhu /save /defaults /gus44k /gusbuf /gusdma /gusport %hx /sbport /oplport /oplwait /mpuport /mpudelay /mpufake /tandyport /cmsport /mousecom /mousesen %hi /mouseproto /mouserate /ne2kport /wifistatus /wifissid %32s /wifipass %63s /wifinopass Unknown option: %s
 Rebooting to fw: %s...
 ERROR: card is not alive after rebooting to new firmware
 Hardware: PicoGUS v1.x or PicoGUS Femto Hardware: PicoGUS v2.0 Hardware: Unknown USB joystick support %s
 Wavetable volume set to %u
 MPU-401: port %x; sysex delay: %s,  fake all notes off: %s
 MPU-401 disabled ULTRASND ULTRASOUND ENV = [%s]
 %hx,%*hhu,%*hhu,%*hhu,%*hhu port is %04x
 ERROR: Card not responding to GUS commands on port %x
 GUS-like card detected on port %x...
 GUS mode:  Audio buffer: %u samples;  DMA interval: default;  DMA interval: %u us;  Sample rate: fixed 44.1k Sample rate: variable Running in GUS mode on port %x
 Running in AdLib/OPL2 mode on port %x Running in MPU-401 only mode (with IRQ)
 Running in USB mode
 Running in Tandy 3-voice mode on port %x
 Running in CMS/Game Blaster mode on port %x
 BLASTER A%hx I%*hhu D%*hhu T3 Running in Sound Blaster 2.0 mode on port %x  (AdLib port %x %s)
 (AdLib port disabled) Running in NE2000 mode on port %x
 Running in unknown mode (maybe upgrade pgusinit?) Serial Mouse  disabled (enable with /mousecom n option) enabled on COM1 enabled on COM2 enabled on COM3 enabled on COM4 enabled on IO port %x
 Mouse report rate: %d Hz,  protocol: %s
 Mouse sensitivity: %d (%d.%02d)
 PicoGUS initialized! 
Mode change requested.  NV��H�?<Hy  VT/<_ISAN�  7�P�R�g X&���� Hx B�/E�  ?�N�Hx !B�Hn��N�Hx @B�Hn��N�*�����O� $Hx B�/N�Hz�6K�  =XN�Hx �Hx�E��N�B�Hx�N�O�  Hx�I���N�X� ��g/9  U�Hz�>N�  5 P�Hz�ON�  <�G��N�X�xG�  =���  VPmRHx Hx�N�Hx�N�O�   g Hx �   �/ Hz�\/9  U�N�  5 /9  U�Hz�wN�  5 O� ta`  �,܄܆Hz�� y  VL/0h N�$ R�P�J�f���  VPmB�B�N��RP�t F`V/Hz�� y  VL/0hN�  =�O� S�gB�B�N��$P�t`*Hz��/N�  3x* P�f$/Hz��/9  U�N�  5 O� t
 L�<��`N^NuHx Hx�N�Hx�N� O�   bp / Hz�jN�  <�P�~x I���/Hx Hx Hn� N�  5XO� �   g/Hz��/9  U�N�  5 O� t`��
2FU� f��]QW�f
�
�o0��g/Hz��/9  U�N�  5 O� t` �LJ�fj..�Hx �Hx�N�Hx �Hx�N�Hx dN�  2�B�N��6O� J f/9  U�Hz�aN�  5 P�t` � /9  U�N�  3d/Hz�j/9  U�N�  5 O� ���g/Hz�d/9  U�N�  5 O� t` ����"S�-A��A�� p 0� / Hx�N�P�����e���g&Hx N�X�J f  �/9  U�Hz�FN�  5 P�t` �l c0Hx �N�X�J f/9  U�Hz�K`�Hx �Hx�N�Hx �Hx�N�O� /9  U�Hx .N�  =R�P���e �^/N�  3 Hz�HN�Hx �N��O� J f$/9  U�Hz�eN�  5 P�tc` ��R��� f �,`�Hz�%N�  <�N��X�` ��Hx Hx�N�Hx�N�@��v  O� tBBG�  =���  VPm2J.��g 	�G�*tI�  >THx //N�O� J�g �R�p��f�`h(؂؄Hz�} y  VL/0H N�P�J�fB�/N��2P�t ` �8Hz�Z y  VL/0H N�P�J�fHx `�Hz�B y  VL/0H N�P�J�flR���  VPmB�/` ��Hn� Hz� ЂЀ y  VL/0 N�  =�O� S�gB�/` ��. 1� W�D @��Hx Hx�N�p .��/ Hx�N�O� `FHz�� y  VL/0H N�P�J�f6R���  VPl �~/Hz�� ЂЀ y  VL/0 N�  =�O� S�f�R�` ��Hz� y  VL/0H N�P�J�fRR���  VPl �2Hn��Hz�k ЂЀ y  VL/0 N�  =�O� S�f. d��cB�/N���P�t` ��Hx  ` �4Hz�. y  VL/0H N�P�J�g �Hz� y  VL/0H N�P�J�fHx �Hx�N�Hx �` �Hz�� y  VL/0H N�P�J�fJR���  VPl ��Hn� Hz� ЂЀ y  VL/0 N�  =�O� S�f ��. 1� W�D @��Hx ` ��Hz� y  VL/0H N�P�J�fbR���  VPl �*Hn��Hz�c ЂЀ y  VL/0 N�  =�O� S�fJ.��fB�/N���P�t` ��Hx Hx�N�.��S �   �` �(Hz�6 y  VL/0H N�P�J�f<R���  VPl ��Hn��Hz�� ЂЀ y  VL/0 N�  =�O� S�f ��Hx ` ��Hz�� y  VL/0H N�P�J�fVR���  VPl �`Hn��Hz�� y  VL/0HN�  =�O� S�f �<n���b �2Hx Hx�N�p 0.��/ Hx�N��` �rHz� y  VL/0H N�P�J�f>R���  VPl ��Hn��Hz�c y  VL/0HN�  =�O� S�f ��n���b ��Hx `�Hz�A y  VL/0H N�P�J�f@R���  VPl ��Hn��Hz� y  VL/0HN�  =�O� S�f �|n���b �rHx ` �>Hz�� y  VL/0H N�P�J�fDR���  VPl �JHn� Hz�k y  VL/0HN�  =�O� S�f �V. 1� W�D @��Hx 0` �ZHz� y  VL/0H N�P�J�f@R���  VPl ��Hn��Hz�_ y  VL/0HN�  =�O� S�f ��n���b ��Hx ` ��Hz�V y  VL/0H N�P�J�fDR���  VPl ��Hn� Hz� y  VL/0HN�  =�O� S�f ��. 1� W�D @��Hx !` ��Hz� y  VL/0H N�P�J�fDR���  VPl �@Hn� Hz�a y  VL/0HN�  =�O� S�f �L. 1� W�D @��Hx "` �PHz� y  VL/0H N�P�J�f@R���  VPl ��Hn��Hz�U y  VL/0HN�  =�O� S�f ��n���b ��Hx ` ��Hz�j y  VL/0H N�P�J�f@R���  VPl ��Hn��Hz�� y  VL/0HN�  =�O� S�f �ln���b �bHx 	` �.Hz� y  VL/0H N�P�J�ffR���  VPl �:Hn��Hz�s y  VL/0HN�  =�O� S�f �.�� b �
0<� g0<� g0<� gB@=@��Hx @` ��Hz� y  VL/0H N�P�J�f6R���  VPl ��Hn��Hz� y  VL/0HN�  =�O� S�f ��Hx C` �fHz�m y  VL/0H N�P�J�f^R���  VPl �rHn��Hz� y  VL/0HN�  =�O� S�f �N. ��b �DHx AHx�(<  > DN�p .��/ Hx� DN�` �|Hz� y  VL/0H N�P�J�fDR���  VPl ��Hn��Hz�7 y  VL/0HN�  =�O� S�f ��.�� �� ��b ��Hx B`�Hz� y  VL/0H N�P�J�fHR���  VPl ��Hn��Hz� y  VL/0HN�  =�O� S�f ��n���b �vHx PHx�N��@` �@Hz�b y  VL/0H N�P�J�fN���` ��Hz�P y  VL/0H N�P�J�fRR���  VPl �("�����/Hz�. y  VL/0H-A��N�  =�O� ".��S�f ��Hx  /Hx QN��(O� ` ��Hz�� y  VL/0H N�P�J�fHR���  VPl ��"�����/Hz�� y  VL/0H-A��N�  =�O� ".��S�f ��Hx ?/Hx R`�Hz�� y  VL/0H N�P�J�fHx Hz�KHx RN�؜O� ~` �� y  VL/0H Hz�zN�  <�B�/N��$O� ` ��|` ��Hz�oN�  <�N���X�` ��.���.��fJgHx SHx�N�B�Hx�N�O� Hx �Hx�N�Hx�N�t  O� f ,Hz�lN�r
.�N�  =DHx Hx�N�Hx�N�@��O� "<  0J g"<  (/Hz�N�  <�P�S�f&Hx  Hx�N�Hx�N��   �/ Hz�tN�  <�O� Hx Hx�N�G��0N�=@��P�g  �Hx !Hx�N�Hx�N�@��O� "<  <J g"<  9/p 0.��/ Hz�6N�  <�Hx "Hx�N�Hx�N�@��O� "<  <J g"<  9/Hz�&N�  <�P�.��S   b ^�   �Ѐ0;N�  0D�"Hb
&r��fHz�d` ��Hz�s` ��Hz��N�X�`�Hz��N�  8$ X� <  @J�g / Hz��N�  <�P�J�f
N�ؠt` �PHn��Hz��/N�  =�O� S�f�p 0.��/ Hz��N�  <�Hx Hx�N�N�O� �n��f�Hx C@? BgN�B�0.��@? Bg$<  \ BN�Hx D0.��@? BgN�B�0.��@? Bg BN�O�  Hx �0.��@? BgN�0.��@? BgN�O� r 2.�� ��g/Hz�K/9  U�N�  5 O� ` �$/Hz�hN�  <�Hx p 0.��/ N�Hx L0.��@? BgN�Hx 0.��@? BgN�O� .�  �N�  <�Hx Hx�N�Hx�N�@ �R@=@��" �  �/Hz�)N�  <�Hx Hx�N�O�  Hx�N�@��X�fRHz�N�  <�X�Hx Hx�N�Hx�N�@��O� gBHz�&N�p.�Hx�N�N�=@��? BgHz�;N�  <�O� `  ��   �/ Hz��N�  <�P�`�Hz��`�Hx Hx�N�N�=@��? BgHz�N�  <�Hx 0Hx�N�Hx�N�@��O� "<  OJ g"<  E/N�X�Hx @Hx�N�N�=@��Hz�WN�  <�0.��O� @�g Zb �J@g �@�g X? BgHz�N�  <�P�` �p 0.��/ Hz�N�  <�P�Hz��N�X�Jg �xN���` �pp 0.��/ Hz�N�  <�P�` �pHx Hx�N�N�=@��? BgHz�N�  <�O� ` �JHx 	Hx�N�N�=@��? BgHz�`�Hz��N�  8X�J�fN��` ��Hn��Hz�/ N�  =�O� S�f�Hx Hx�N�N�P��n��f�Hx Hx�N�N�=@��? BgHz�N�  <�Hx Hx�N�N�=@��O� g@? BgHz�N�  <�Hx 0Hx�N�Hx�N�@��O� "<  OJ g"<  E/Hz�u` ��Hz�rN�X�` ��Hx PHx�N�N�=@��? BgHz�hN�  <�N���` ��Hz�y`�@�g  �@�f �lHz��`Hz�N�X�Jn��g �~Hx BHx�N�Hx�N�@���   �/ Hz��N�  <�Hx AHx�N�Hx�N�@��O�  �   �ЀЀA�P/0 Hz��N�  <�Hx CHx�N�N�=@��2 A ��� d��/2 �Ix Fȁ/? BgHz�N�  <�O�  ` ��Hz�-` �THz�5` �LHz�=` �DHx �Hx�N�Hx Hx�N�/Hx�N�Hx dG�  2�N�Hz�N�O�  JgN�ՊԂԂA� �/0( Hz�N�  <�Hx �Hx�N�Hx �Hx�N�Hx dN�Hx �N��0O�  J f ��/9  U�Hz�l` �/
/N�  (#�   VP#�   VL <  �/ ?< &NN\�$$_NuMicrosoft Logitech IntelliMouse Mouse Systems   1�  1�  1�  1�INVALID GUS ADLIB MPU TANDY CMS SB USB NE2000   1�  1�  1�  1�  1�  1�  1�  1�  1�/
/ 9  V<R��f
#�     V< 9  V<jD�#�  V<p���  V<#�  V</ ?< HNA\�й  V</ N�  @@By  U�B�/9  U�/9  U�N�  1d/ N�  2�  H�0 Hx // N�  xP�$ E�  @�N�& N�" ����n�L�Nu/
/J�  VXf / ? ?< LNAX� 9  V\" X�#�  V\"@ QN�S�  VX`�H� 0&o ��  gB��ھ�f: + ? ?< >NAX�p�'@ B� y  VpC�  Vp��  g��f"� /N�  5�X�p L�NuC�  h `�   o p�!@ !@ p Nu  H�80(/ $o ��  gJ�fp(#�  Vd�� L�NuHx Hx N�  @L&@P�J�g�  rg  �  wg  �  af  � + h p2  bg  � xg  � +f +�� R�r��f�+   g  �  gz�@ �R@? /?< =NAP�& kfp x??/ ?< BNAO� 
&��ھ�'C p�'@ '@ 'y  Vp #�  Vp` �6 + H ` �j +�� ` �` +  ` �x +  ` �nB@`�+  g:B@? /?< <NAP�& jD�#�  Vd/N�  5�X�` ��J+ m �x??< >NAX�+  g + �@ �R@? /?< =NAP�& j �H`�B@`�  NV  Hn /. /. N�  ?O� N^Nu  //&/ /N�  =�X�$ // / Hx /N�  6�O� ��gt� $&NuH�<0(/  &o (// $/N�  ,P�&  + */ //? ?< ?NAO� J�l + @ D�#�  Vdp L�<Nu��c +�� // N�  xP�`�  H� 0 o ��  g  ���
���f  �C���!|��
���$y  U���  U�f  �!J��&j !K��'I &h��'I  (��"	Ҁ��f���
�fЪ !@��!j ��$j %I $h����  U�g,���
�f$ * "
Ҁ��fШ��%@ %h��  h��!J "J&i ��  U�g.��M
�f& + �� f k !i  "i #H /?< INA\�L�Nu��c �B$j ` �0O�� H�?>(o 0,/ 4&o <.+ // 8/N�  ,P�( +  g  �// ??< @NAO� & J�m  �//N�  xP�`  �t�� g@C� ,��| � R�`0ր�Ř�J�g� D�    c Mz p 4X  
fJ�g�4 X�f�C� ,��A� H�2A'I R�R���d��f�// ??< @NAO� J�l�&  + @ D�#�  Vdp L�|�O�  Nuv :|  M� ,` �|  H�00&o 0<hv�/? ?< NMP� @��  gB�J�g" / ��f��  fp L�Nu&� `�P�J�f�p�`�  H�08&/ $y  V`��  g8/N�  =�X�$ &JI�  =�$[��  g///
N�O� J�f�2 =( f�E�( 
L�Nuunknown application   H�<>3�   U�(y  Vh*l ��  X�r�*A#�  V`"l ,6| A� fr,HB�X�"�   �, � H�2BJBo � ��H�4@��E� K� #�  U�tԊ%|  8x G� *AR���  o �   g �  	g �  'f �p `   Af &) R f ) G f ) V f ) = f  �B�BM� ) N f  �) U f  �) L f  �) L f  �) : 	f  �E� 
Jf�#�  U�$P�+N P�Jf� y  U�*P��  g:Jg6#�  U�Hx \/&<  >� CN�P�J�fHx // CN�P�J�g*@R�#�  U�p#�  U�X�Jf X*BB���  f z , Ь Ь �  $ ԋp�Ā",  ������ ��J�n �p�? ?< LNAX���` �D *�X�,I$Irf2"JJ�g&"9  V`X���d$m�� JJf�( =��ffB *@` � =f�r `��`�$H` �:S�` �NR�   g  	f4S�$M*J��  g   g  	gB(����  f�BB( ��` ��S�`�@��g�S�`�$M(	S� 'f.J�gFS�E� "R�- ' f� ' A*J"D��  n�`�Bp `�"R�  fJ�g�  `�B`��`�"p`� B �$R�  U�Jf�` ����  U�l ��Ѐ y  U� p B$MJg ��*J"R�g  ,f�B*AT��� �� 	b �\H�A� � ЈJg�Ѐ����`�(9  V<&R�z��e  �փ0{8( �& �N�� � 
 � � �#�     V<p���  V<#�  V<&@������ Ћ��l �#�  Vl Ћ�   @.@//Bg?< JNAO� (9  V`&y  U�&9  U�Jy  U�gp? ?<NAX� SJf"Hx N�  QLX�J�gp8|��?? ?< FNA\�///N�  1dP�.�N�  2�#�  V<` �P��#�  V<` �Dp���o �<D�#�  V<` �0  'f �` �@unknown application   NV  Hn /. N�  ?,P�N^NuNV��n ��/. Hx Hx Hn��N�  6�O� J�mp .��N^Nu  /9  U�// N�  =P�Nu/9  U�// N�  5 P�J�mHx 
N�  =DЀ��X�Nup�`�NV  Hn /. /. N�  ?jO� N^Nu  H�0 t E�  >� o p 0( / N�&  o p 0( .�N�X�"����fR�J�f�L�Nu `� /  @Jf��� S�Nu  /
"o ��$o 2� $o 2� S���  m.J g R�� g�J gJg �   ��   ���$_Nup Jg�p�`�p `�p`�  H�0 t E�  >д� fp `4 o 0( H�0@/N�&  o 0( H�0@.�N�X�"  ����fR�J�f�L�Nu/$/ /N�  =�X� B���/ gS���d�� $Nu   / A�  @�r F0  gr�ЁNu  // // N�  =P�r���V�H�H�D�Nu// // // Hz��N�  A�O� Nu  // // /9  U�N�  ?O� Nu  / o ""AH�0H�JBgR� �$Nup�`�NV��-n ��B���/. /. Hn��B�Hz��N�  HlO� N^Nu o / "/ g  �/��4  g S� �H4 HB4 p ��g8H�6 &(*,.$B&B*B,BH�6H�6H�6H�6H�6H�0S�f�L�l�? �Hg2 DAA S@�H�AN�!!!!Q���0  g1   g$ Nu"_.W��   DN�//// // N�  ,P�& / N�  Q�$ X�g// N�  T�P� $&Nu 8�Nu/
/ <  @�/ ?< &NN\�$$_Nu������������������������� �����������Ą������������������������������Ȉ����������������������� 0123456789abcdef 0123456789ABCDEF x0 0 (nil)  O��lH�?>*o �./ �&o �$o �v f L�|�O� �Nu  %f A� B/ 4r ��z &H  +g  n  �   g   #g   *f  �$jD�<| G�  .f H+   *f (T� lf+ l g .R�8@|    Sg �pQ��g �pX��g �0 ��  Eg J2|����p��e  �0     H�H�  xn �2|����p��e � 	Ѐ0;N� � �� ����������(�����/�   �/ N�րP�` Z  -g4  0g t "K �� 	b � B����Ԉ B��H�A� �$&I`�<| R�` ��R� ��  	b*//A 0N�  UH( X� K"/ , ��&HR�  	c�` ��x�` ��T�` ��px��m  �pW��m �r%��f  �/Hx %` �P,j  �D�r/A 8I� @/L <Hx 
/N�  �P�  0�Hx 
//F 4N�  xP�, "/ ,p	��e�J�or��jt  rz Ԁ|@܏"L�Ɛ�J�n �J� 8gb� -(o <T� ������  f(�   �J�nb"S� jp $��S���c\��  gJ�ndR�` �tB� 8` �R 0f r t `�r p `�J/ 4g�� 4`�(I` xJ/ 4g |� 4` t//N�րS�P�`�/p / N�րS�P�`�/Hx  N�րS�P�`�"y  V@A� @((H�Jf�#�  V@P��Ĕ���  f*J�n0"S� jp $����c.��  g �HJ�o �B/Hx  N�րS�P�`�/Hx  N�րS�P�`�/p / N�րS�P�`�r|x Zpo��g  �px��g  �pX��g  �p
/@ 4/|  A� 8��  fr I� @// 4//A 4/H 8N�  �P�"o 8�  o 0// 4//H 8N�  xP� @"/ ,"o 0�� 4d�J�g  �A���po��gp���rX��flA����rJ�of��jt z Ԅ/B 4t@ԏ"L����  g hpo��g 0fJ�o��J�n T�Jf�` fp` �8p` �2p/@ 4/|  A� 8` �,r ��`� 0f��  gx `�(t `�//N�րS�P�` 4/p / N�րS�P�` 6,gS���  f(�   �J�n6"S� jp $��//N�րP���  g ��J�o ��/Hx  N�րS�P�`�//N�րS�P�`�(Z��  fI���/N�  =�X�����  f,�   �J�n>"S� jp $��z 4X g
r���g0��m,��  g � J�o �/Hx  N�րS�P�`�//N�րS�P�`�/�   �/ N�րR�P�`�J�oS�"LR�� 0J�f��  g�Jf�z "��(/ 4����  f,�   �J�n ��"S� jp (��S���c ����  g ��J�o ��/Hx  N�րS�P�`��  fFC�  L� 0��f�J�f ��I��J� 8g ��� -J�f(Iz ` �
/ 4r@ 4` �z0/ 4`�z0J�o ��`�)taolf(               O���H�?>&oP,/X$o\x BBv B� <g ��g fJ�g
Jf ` ,z  A�  @�0 X g<Jgp 0  g(/N�"  R�X� ��g �p F ��C�  @�1  f�R�`�  %g(Jf /N� R�X���g ��V�H�H�D�B`�`�I� *   %f*Jf"/N� R�X���g T�* V�H�H�D�$L`�`�J g @  *f >I� ~/G @ ��  	b .//A 4N�  UH* X� L"/ 0 ��(HR�  	c�$L  hg   lg  �  Lg *$L��B� HB� DJ�fz�R // A /g �/ / ��  c �/ X /g x/ g /n 
/ d /n t/ c /g �/ d /g �/ [ /f ��J� @f � o`(X/H`B/ L* ^ g �R�z  ]f �R�| ] Lp Jg ]f �E� Jg A�L��B(� Jf
/N� R�X�~LޏK�  R�` �B� @` ��z ` ��, l f@E� ��B� H~/G D` �, h f.E� ��B� D~/G H` ��B� HB� D8| ` �֙�B� H~`�B� D~`�/ /��8G b ��0�   �0| .��  ��0J�f>  
g �  f ��J� @f �� o`"X JgS�"�R� </H`x ` ��| x /p�   �A��0 H�8BA��0 H�<@Jf
/N� R�X�K�  @�`��<| 
`�/N� R�X�p 5  f� -f Z| - L/N� R�X�p���gS�g ���  f �:| r ��~��e � < . g>J�f: 0f4��  g  //A 4/H 8N� R�"/ 4R�X� o 4���g  ���f�`  ���  f0p��g~��f^~��f&`p��f �      xf \<| `�~��f z ��  	c �� ��  b  �A�L��B� R�0| ` �f~
��f� ��  	cڰ�  g �A�L��B-� J� @f,"o`X�`*YpLЏ/ p /f:/B�/ N�  S0*�O� R� <��V��` ��<| ` ��B/ L��` ��<| `�J� DfJ� Hf��  f�/B�/ N�  R�`�r�� Hf$��  g/B�/ N�  S0�`�/B�/ N�  R�`��  g/B�/ N�  S0:�` �r/B�/ N�  R�`�Jf^/N� R�X���g �J� @fJ o`./H`p���fzJ�g G�.J�oS�g/N� R�X� ��f�J� @f �R� <x ` �
`�~ `�J� @fZ o`*X/H`JfP/N� R�X���g lI�  @���  g�J�oS�g/N� R�X� ��f ���  g ��BR� <` ����`�`�Jf
/N� R�X�*CM�  @�`
/N� R�X�p 6  f�B/ LM� Lr �ȓ�~ &֍J�f  � .g nN +gT -gNJ�f  ���  g  �J� @f �$"o`X�` Y��  g  �(z�R*z�R,z�R �!M !N ` �� ��  	b�R��//A 4/H 8/I <N� &֍X�"/ 0 o 4"o 8�  �g���f �^` �zJ�gR +g -f6    �  eg�A�L��(�   +g  -g      ef �@x` �l ��  	c �t`�    eg$ ��  	c .f ���  f �0| ` �Dr` �>2| ` �6J� Dg
B�B� ` �B�` ���` �*T�z` �4�  �n �<A�L��G� R�` �,p ` �&H�<@//N�P�J�gJ�gJ� @fBx ` ��J�g��  g�/N� R�X���f�J� @f ��B` �~$Hx` �Z$L` �$L` �NJgJ�Tg/H�0A/"o\N�P���fJ� <fr�/A < / <L�|�O� Nu~��f.` ��r F��4  g �P` �nJf�`°�  g ��p��f �� ��  c ��<| ` �� 











              H�> */ p v??/ ?< BNAO� 
( BFp??/ ?< BNAO� 
& ??/?< BNAO� 
J�W�H�H�D�L�|Nu / #�  VH#�  VDNuH�0> /  V�r�&AI�  y  U���  U�g:�� b.��M
�g& ( G�  ��d  ΐ�!@ ��!L  ��
�pЈ`L h `�A� $ 9  VH��e��  VDd
" Ҁ#�  VH @A��&C� /?< HNA\�"@J�fp'#�  Vdp L�|Nu*y  U���  U�fJr#A 4|����"��M
�#J A� #H ,m #N -I ,i -I #J  #|��
� #M +H ` �2��c�*m `�"h #h  $h %I ` �,   o  �/ gJf�p Nu  NV��Hn��/. /. /. N�  S\O� J�l <���J���g <�   N^NuJ���g�D�`�  NV��Hn��/. /. /. N�  S\O� J���gD�N^Nu  H�> */ "o  (/ $$E Jg   g�  	g�  -W�H�H�$o (D�$�  -fR�g  �  0fJ R�( �� Bg Xg"J�g  � @v`p�Ȁf  �T�vx,Bp `jr�ȁf  �T�vx`�BCJ�f�x
`��� 	bdH�0AA��и�oFJf2J�g&"B�`  �g  Ѐe    g ��րd ��U� Јd  P�v$FR�Jf�JCg4��  g"�Jf6L�|Nu��H�0AA���r	��m�0| %`� @vx` �N��  fp `�"�`�p�`�   o "/ g  �B /��4  g S� �H4 HB4 p ��g8H�6 &(*,.$B&B*B,BH�6H�6H�6H�6H�6H�0S�f�L�l�? �Hg2 DAA S@�H�AN�!!!!Q���0  g1   g$ Nu  // / &< � "@R��� b�   �f�r ` +f"@`� -f�"@rp ` @����Ј @��H�A� � �� 	c�J�gD�$&Nu��
�  U�  U�      U�  8d            <�  <�  U�  V  V$�ھ�   ��������    @   �ھ�   ��������    @   �ھ�    ��������    �        HV  �        �

�.6
N
J
D0460�:4
4

">20
H
 $

2.&
F

2(
*
B

<
$
&
*
&
*
*
&
&
L

""
*
..$, Z
(<

Z
 8h<.&@(
 0*$,:$
4Z48F*2B2



4H�R\*.4P8h0�zNF
�$r�R2"$
8&


"�R($&P��n��"���8�dL�TF
$�D~P 