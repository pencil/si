FasdUAS 1.101.10   ��   ��    k             l     ��  ��    3 - si - A System Information Script for Textual     � 	 	 Z   s i   -   A   S y s t e m   I n f o r m a t i o n   S c r i p t   f o r   T e x t u a l   
  
 l     ��  ��      Coded by Xeon3D     �       C o d e d   b y   X e o n 3 D      l     ��  ��    @ :  Very loosely based on KSysInfo for Linkinus by KanadaKid     �   t     V e r y   l o o s e l y   b a s e d   o n   K S y s I n f o   f o r   L i n k i n u s   b y   K a n a d a K i d      l     ��������  ��  ��        l     ��  ��      2 step Installation:     �   *   2   s t e p   I n s t a l l a t i o n :      l     ��  ��    F @ Copy this to ~/Library/Application Support/Textual IRC/Scripts/     �   �   C o p y   t h i s   t o   ~ / L i b r a r y / A p p l i c a t i o n   S u p p o r t / T e x t u a l   I R C / S c r i p t s /     !   l     �� " #��   " , & Run /si or /si help for more options.    # � $ $ L   R u n   / s i   o r   / s i   h e l p   f o r   m o r e   o p t i o n s . !  % & % l     ��������  ��  ��   &  ' ( ' l     �� ) *��   )   | DEBUG COMMAND | --    * � + + *   |   D E B U G   C O M M A N D   |   - - (  , - , l     �� . /��   .  set cmd to ""    / � 0 0  s e t   c m d   t o   " " -  1 2 1 l     ��������  ��  ��   2  3 4 3 l     �� 5 6��   5   | SCRIPT START | --    6 � 7 7 (   |   S C R I P T   S T A R T   |   - - 4  8 9 8 l     �� : ;��   :   |Properties| --    ; � < <     | P r o p e r t i e s |   - - 9  = > = l     ��������  ��  ��   >  ? @ ? j     �� A�� 0 
scriptname 
ScriptName A m      B B � C C  s i @  D E D j    �� F�� &0 scriptdescription ScriptDescription F m     G G � H H N A   S y s t e m   I n f o r m a t i o n   S c r i p t   f o r   T e x t u a l E  I J I j    �� K��  0 scripthomepage ScriptHomepage K m     L L � M M * h t t p : / / x e o n 3 d . n e t / s i / J  N O N j   	 �� P�� 0 scriptauthor ScriptAuthor P m   	 
 Q Q � R R  X e o n 3 D O  S T S j    �� U�� ,0 scriptauthorhomepage ScriptAuthorHomepage U m     V V � W W * h t t p : / / w w w . x e o n 3 d . n e t T  X Y X j    �� Z��  0 currentversion CurrentVersion Z m     [ [ � \ \ 
 0 . 0 . 1 Y  ] ^ ] j    �� _��  0 supportchannel SupportChannel _ m     ` ` � a a L i r c : / / i r c . w y l d r y d e . o r g / # t e x t u a l - e x t r a s ^  b c b l     ��������  ��  ��   c  d e d i     f g f I      �� h���� 0 
textualcmd   h  i�� i o      ���� 0 cmd  ��  ��   g k    u j j  k l k l     ��������  ��  ��   l  m n m l     �� o p��   o   |Variables| --    p � q q    | V a r i a b l e s |   - - n  r s r l     ��������  ��  ��   s  t u t l     �� v w��   v @ : Defines the version of Textual where it's being run from.    w � x x t   D e f i n e s   t h e   v e r s i o n   o f   T e x t u a l   w h e r e   i t ' s   b e i n g   r u n   f r o m . u  y z y r      { | { n      } ~ } 1    ��
�� 
vers ~ m       �                                                                                  TXTL  alis    >  LionOS                     �07ZH+     ]Textual.app                                                     �@�<a�        ����  	                Applications    �07Z      �<a�       ]   LionOS:Applications: Textual.app    T e x t u a l . a p p    L i o n O S  Applications/Textual.app  / ��   | o      ����  0 textualversion TextualVersion z  � � � l   ��������  ��  ��   �  � � � l   �� � ���   � M G Defines the path for the Scripts folder inside the Textual executable.    � � � � �   D e f i n e s   t h e   p a t h   f o r   t h e   S c r i p t s   f o l d e r   i n s i d e   t h e   T e x t u a l   e x e c u t a b l e . �  � � � r     � � � l    ����� � n     � � � 1    ��
�� 
strq � l    ����� � b     � � � l    ����� � n     � � � 1    ��
�� 
psxp � l    ����� � I   �� ���
�� .earsffdralis        afdr � 5    �� ���
�� 
capp � m    	 � � � � � , c o m . c o d e u x . i r c . t e x t u a l
�� kfrmID  ��  ��  ��  ��  ��   � m     � � � � � 6 C o n t e n t s / R e s o u r c e s / S c r i p t s /��  ��  ��  ��   � o      ���� *0 internalscriptspath InternalScriptsPath �  � � � l   ��������  ��  ��   �  � � � l   �� � ���   � p j Defines the path for the Scripts folder inside the ~/Library/ folder according to the version of Textual.    � � � � �   D e f i n e s   t h e   p a t h   f o r   t h e   S c r i p t s   f o l d e r   i n s i d e   t h e   ~ / L i b r a r y /   f o l d e r   a c c o r d i n g   t o   t h e   v e r s i o n   o f   T e x t u a l . �  � � � Z    ? � ��� � � ?     � � � o    ����  0 textualversion TextualVersion � m     � � � � �  2 . 0 . 9 9 � r    - � � � l   + ����� � n    + � � � 1   ) +��
�� 
strq � l   ) ����� � b    ) � � � l   ' ����� � n    ' � � � 1   % '��
�� 
psxp � l   % ����� � I   %�� � �
�� .earsffdralis        afdr � m    ��
�� afdrasup � �� ���
�� 
from � l    ! ����� � m     !��
�� fldmfldu��  ��  ��  ��  ��  ��  ��   � m   ' ( � � � � � & T e x t u a l   I R C / S c r i p t s��  ��  ��  ��   � o      ���� *0 externalscriptspath ExternalScriptsPath��   � r   0 ? � � � l  0 = ����� � n   0 = � � � 1   ; =��
�� 
strq � l  0 ; ����� � b   0 ; � � � l  0 9 ����� � n   0 9 � � � 1   7 9��
�� 
psxp � l  0 7 ����� � I  0 7�� � �
�� .earsffdralis        afdr � m   0 1��
�� afdrasup � �� ���
�� 
from � l  2 3 ����� � m   2 3��
�� fldmfldu��  ��  ��  ��  ��  ��  ��   � m   9 : � � � � �  T e x t u a l / S c r i p t s��  ��  ��  ��   � o      ���� *0 externalscriptspath ExternalScriptsPath �  � � � l  @ @��������  ��  ��   �  � � � l  @ @�� � ���   � 4 . Defines the temporary working directory path.    � � � � \   D e f i n e s   t h e   t e m p o r a r y   w o r k i n g   d i r e c t o r y   p a t h . �  � � � r   @ M � � � l  @ K ����� � n   @ K � � � 1   I K��
�� 
strq � l  @ I ����� � l  @ I ����� � n   @ I � � � 1   G I��
�� 
psxp � l  @ G ����� � I  @ G�� � �
�� .earsffdralis        afdr � m   @ A��
�� afdrtemp � �� ���
�� 
from � l  B C ����� � m   B C�
� fldmfldu��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��   � o      �~�~ 0 tempdirpath TempDirPath �  � � � l  N N�}�|�{�}  �|  �{   �  � � � l  N N�z � ��z   � R L Defines the path where the files for the updates will be temporarily stored    � � � � �   D e f i n e s   t h e   p a t h   w h e r e   t h e   f i l e s   f o r   t h e   u p d a t e s   w i l l   b e   t e m p o r a r i l y   s t o r e d �  � � � r   N _ � � � l  N ] ��y�x � n   N ] � � � 1   [ ]�w
�w 
strq � l  N [ ��v�u � b   N [ � � � l  N W ��t�s � n   N W � � � 1   U W�r
�r 
psxp � l  N U ��q�p � I  N U�o � �
�o .earsffdralis        afdr � m   N O�n
�n afdrtemp � �m ��l
�m 
from � l  P Q ��k�j � m   P Q�i
�i fldmfldu�k  �j  �l  �q  �p  �t  �s   � m   W Z � � �    u p d a t e . z i p�v  �u  �y  �x   � o      �h�h 0 updatezippath UpdateZipPath �  l  ` `�g�f�e�g  �f  �e    l  ` `�d�d     Defines Text Formatting    � 0   D e f i n e s   T e x t   F o r m a t t i n g 	 l  ` `�c�b�a�c  �b  �a  	 

 l  ` `�`�`   ( "- Initializes the Simple variable.    � D -   I n i t i a l i z e s   t h e   S i m p l e   v a r i a b l e .  r   ` e m   ` c �   o      �_�_ 0 simple Simple  l  f f�^�]�\�^  �]  �\    l  f f�[�[    	-  Colors    �  -     C o l o r s  r   f q b   f o !  l  f k"�Z�Y" I  f k�X#�W
�X .sysontocTEXT       shor# m   f g�V�V �W  �Z  �Y  ! m   k n$$ �%%  0 1 o      �U�U 0 cblack CBlack &'& r   r }()( b   r {*+* l  r w,�T�S, I  r w�R-�Q
�R .sysontocTEXT       shor- m   r s�P�P �Q  �T  �S  + m   w z.. �//  0 2) o      �O�O 0 cnblue CNBlue' 010 r   ~ �232 b   ~ �454 l  ~ �6�N�M6 I  ~ ��L7�K
�L .sysontocTEXT       shor7 m   ~ �J�J �K  �N  �M  5 m   � �88 �99  0 33 o      �I�I 0 cgreen CGreen1 :;: r   � �<=< b   � �>?> l  � �@�H�G@ I  � ��FA�E
�F .sysontocTEXT       shorA m   � ��D�D �E  �H  �G  ? m   � �BB �CC  0 4= o      �C�C 0 cred CRed; DED r   � �FGF b   � �HIH l  � �J�B�AJ I  � ��@K�?
�@ .sysontocTEXT       shorK m   � ��>�> �?  �B  �A  I m   � �LL �MM  0 5G o      �=�= 0 cbrown CBrownE NON r   � �PQP b   � �RSR l  � �T�<�;T I  � ��:U�9
�: .sysontocTEXT       shorU m   � ��8�8 �9  �<  �;  S m   � �VV �WW  0 6Q o      �7�7 0 cpurple CPurpleO XYX r   � �Z[Z b   � �\]\ l  � �^�6�5^ I  � ��4_�3
�4 .sysontocTEXT       shor_ m   � ��2�2 �3  �6  �5  ] m   � �`` �aa  0 7[ o      �1�1 0 corange COrangeY bcb r   � �ded b   � �fgf l  � �h�0�/h I  � ��.i�-
�. .sysontocTEXT       shori m   � ��,�, �-  �0  �/  g m   � �jj �kk  0 8e o      �+�+ 0 cyellow CYellowc lml r   � �non b   � �pqp l  � �r�*�)r I  � ��(s�'
�( .sysontocTEXT       shors m   � ��&�& �'  �*  �)  q m   � �tt �uu  0 9o o      �%�% 0 clgreen CLGreenm vwv r   � �xyx b   � �z{z l  � �|�$�#| I  � ��"}�!
�" .sysontocTEXT       shor} m   � �� �  �!  �$  �#  { m   � �~~ �  1 0y o      �� 0 cteal CTealw ��� r   � ���� b   � ���� l  � ����� I  � ����
� .sysontocTEXT       shor� m   � ��� �  �  �  � m   � ��� ���  1 1� o      �� 0 ccyan CCyan� ��� r   � ���� b   � ���� l  � ����� I  � ����
� .sysontocTEXT       shor� m   � ��� �  �  �  � m   � ��� ���  1 2� o      �� 0 cblue CBlue� ��� r   �	��� b   ���� l  ����� I  ����
� .sysontocTEXT       shor� m   � ��� �  �  �  � m  �� ���  1 3� o      �� 0 cpink CPink� ��� r  
��� b  
��� l 
���� I 
�
��	
�
 .sysontocTEXT       shor� m  
�� �	  �  �  � m  �� ���  1 4� o      �� 0 cgrey CGrey� ��� r  %��� b  !��� l ���� I ���
� .sysontocTEXT       shor� m  �� �  �  �  � m   �� ���  1 5� o      �� 0 clgrey CLGrey� ��� r  &/��� l &+�� ��� I &+�����
�� .sysontocTEXT       shor� m  &'���� ��  �   ��  � o      ���� 0 cwhite CWhite� ��� r  09��� l 05������ I 05�����
�� .sysontocTEXT       shor� m  01����  ��  ��  ��  � o      ���� 0 nocolor NoColor� ��� l ::��������  ��  ��  � ��� l ::������  �  - Formatting   � ���  -   F o r m a t t i n g� ��� r  :C��� l :?������ I :?�����
�� .sysontocTEXT       shor� m  :;���� ��  ��  ��  � o      ���� 0 fbold FBold� ��� r  DM��� l DI������ I DI�����
�� .sysontocTEXT       shor� m  DE���� ��  ��  ��  � o      ���� 0 fitalic FItalic� ��� r  NY��� l NU������ I NU�����
�� .sysontocTEXT       shor� m  NQ���� 
��  ��  ��  � o      ���� 0 newline NewLine� ��� l ZZ��������  ��  ��  � ��� l ZZ������  �   Defines the Bars' Colors   � ��� 2   D e f i n e s   t h e   B a r s '   C o l o r s� ��� r  Z_��� o  Z[���� 0 cred CRed� o      ���� 0 	usedcolor 	UsedColor� ��� r  `e��� o  `a���� 0 cgreen CGreen� o      ���� 0 	freecolor 	FreeColor� ��� r  fm��� o  fi���� 0 clgrey CLGrey� o      ����  0 separatorcolor SeparatorColor� ��� l nn��������  ��  ��  � ��� l nn������  �  - User Options --   � ��� " -   U s e r   O p t i o n s   - -� ��� l nn������  � S M Defines if it uses all active mountpoints for disk space calculation or not.   � ��� �   D e f i n e s   i f   i t   u s e s   a l l   a c t i v e   m o u n t p o i n t s   f o r   d i s k   s p a c e   c a l c u l a t i o n   o r   n o t .� ��� Q  n����� r  q|��� I qx�����
�� .sysoexecTEXT���     TEXT� m  qt�� ��� R d e f a u l t s   r e a d   x e o n 3 d . s i   U s e A l l M o u n t p o i n t s��  � o      ���� &0 useallmountpoints UseAllMountpoints� R      ������
�� .ascrerr ****      � ****��  ��  � Q  ��   k  ��  I ������
�� .sysoexecTEXT���     TEXT l ������ m  �� �		 ` d e f a u l t s   w r i t e   x e o n 3 d . s i   U s e A l l M o u n t p o i n t s   F a l s e��  ��  ��   
��
 r  �� m  �� � 
 F a l s e o      ���� &0 useallmountpoints UseAllMountpoints��   R      ������
�� .ascrerr ****      � ****��  ��   k  ��  r  �� m  �� � ~ / e c h o   T h e r e   w a s   a n   e r r o r   s e t t i n g   t h e   U s e A l l M o u n t p o i n t s   v a r i a b l e o      ���� 0 msg   �� L  �� o  ������ 0 msg  ��  �  l ����������  ��  ��    l ������   ? 9 This regards if the script's output is formatted or not.    � r   T h i s   r e g a r d s   i f   t h e   s c r i p t ' s   o u t p u t   i s   f o r m a t t e d   o r   n o t .   Q  ��!"#! r  ��$%$ I ����&��
�� .sysoexecTEXT���     TEXT& m  ��'' �(( < d e f a u l t s   r e a d   x e o n 3 d . s i   S i m p l e��  % o      ���� 0 simple Simple" R      ������
�� .ascrerr ****      � ****��  ��  # Q  ��)*+) k  ��,, -.- I ����/��
�� .sysoexecTEXT���     TEXT/ l ��0����0 m  ��11 �22 J d e f a u l t s   w r i t e   x e o n 3 d . s i   S i m p l e   F a l s e��  ��  ��  . 3��3 r  ��454 m  ��66 �77 
 F a l s e5 o      ���� 0 simple Simple��  * R      ������
�� .ascrerr ****      � ****��  ��  + k  ��88 9:9 r  ��;<; m  ��== �>> b / e c h o   T h e r e   w a s   a n   e r r o r   w i t h   t h e   S i m p l e   v a r i a b l e< o      ���� 0 msg  : ?��? L  ��@@ o  ������ 0 msg  ��    ABA l ����������  ��  ��  B CDC l ����EF��  E j d This regards if the script should get the current CPU Speed for Overclocked SandyBridge Hackintoshs   F �GG �   T h i s   r e g a r d s   i f   t h e   s c r i p t   s h o u l d   g e t   t h e   c u r r e n t   C P U   S p e e d   f o r   O v e r c l o c k e d   S a n d y B r i d g e   H a c k i n t o s h sD HIH Q  � JKLJ r  ��MNM I ����O��
�� .sysoexecTEXT���     TEXTO m  ��PP �QQ > d e f a u l t s   r e a d   x e o n 3 d . s i   S B C l o c k��  N o      ���� 0 sbclock SBClockK R      ������
�� .ascrerr ****      � ****��  ��  L Q  � RSTR k  �UU VWV I ���X��
�� .sysoexecTEXT���     TEXTX l � Y����Y m  � ZZ �[[ L d e f a u l t s   w r i t e   x e o n 3 d . s i   S B C l o c k   F a l s e��  ��  ��  W \��\ r  ]^] m  __ �`` 
 F a l s e^ o      ���� 0 sbclock SBClock��  S R      ������
�� .ascrerr ****      � ****��  ��  T k   aa bcb r  ded m  ff �gg d / e c h o   T h e r e   w a s   a n   e r r o r   w i t h   t h e   S B C l o c k   v a r i a b l ee o      ���� 0 msg  c h��h L   ii o  ���� 0 msg  ��  I jkj l !!��������  ��  ��  k lml l !!��no��  n ' ! Defines default runtime options.   o �pp B   D e f i n e s   d e f a u l t   r u n t i m e   o p t i o n s .m qrq l !!��������  ��  ��  r sts Z  !uv��wu G  !2xyx = !&z{z o  !"���� 0 cmd  { m  "%|| �}}  y = ).~~ o  )*���� 0 cmd   m  *-�� ���  s i m p l ev k  5��� ��� l 55������  � P J-- Default output when no options or just "simple" is supplied at runtime.   � ��� � - -   D e f a u l t   o u t p u t   w h e n   n o   o p t i o n s   o r   j u s t   " s i m p l e "   i s   s u p p l i e d   a t   r u n t i m e .� ��� r  5:��� m  56��
�� boovtrue� o      ���� 0 viewmac ViewMac� ��� r  ;@��� m  ;<��
�� boovtrue� o      ���� 0 viewcpu ViewCPU� ��� r  AF��� m  AB��
�� boovtrue� o      ���� *0 viewcurrentcpuspeed ViewCurrentCPUSpeed� ��� r  GL��� m  GH��
�� boovfals� o      �� 0 viewcap ViewCap� ��� r  MR��� m  MN�~
�~ boovfals� o      �}�} 0 	viewcache 	ViewCache� ��� r  SX��� m  ST�|
�| boovfals� o      �{�{ 0 viewfsb ViewFSB� ��� r  Y^��� m  YZ�z
�z boovtrue� o      �y�y 0 viewram ViewRam� ��� r  _d��� m  _`�x
�x boovtrue� o      �w�w 0 viewbars ViewBars� ��� r  ej��� m  ef�v
�v boovtrue� o      �u�u 0 viewdisk ViewDisk� ��� r  kp��� m  kl�t
�t boovtrue� o      �s�s 0 viewdisplay ViewDisplay� ��� r  qv��� m  qr�r
�r boovfals� o      �q�q 0 
viewgfxbus 
ViewGFXBus� ��� r  w|��� m  wx�p
�p boovtrue� o      �o�o "0 viewresolutions ViewResolutions� ��� r  }���� m  }~�n
�n boovfals� o      �m�m 0 	viewaudio 	ViewAudio� ��� r  ����� m  ���l
�l boovtrue� o      �k�k 0 	viewpower 	ViewPower� ��� r  ����� m  ���j
�j boovtrue� o      �i�i  0 viewosxversion ViewOSXVersion� ��� r  ����� m  ���h
�h boovtrue� o      �g�g 0 viewosxarch ViewOSXArch� ��� r  ����� m  ���f
�f boovtrue� o      �e�e 0 viewosxbuild ViewOSXBuild� ��� r  ����� m  ���d
�d boovfals� o      �c�c 0 
viewkernel 
ViewKernel� ��� r  ����� m  ���b
�b boovfals� o      �a�a 0 viewkerneltag ViewKernelTag� ��� r  ����� m  ���`
�` boovtrue� o      �_�_ 0 
viewuptime 
ViewUptime� ��� r  ����� m  ���^
�^ boovtrue� o      �]�] 0 
viewclient 
ViewClient� ��\� r  ����� m  ���[
�[ boovtrue� o      �Z�Z (0 viewcurrentversion ViewCurrentVersion�\  ��  w k  ��� ��� l ���Y���Y  � P J-- Checks which options the user supplied at runtime and acts accordingly.   � ��� � - -   C h e c k s   w h i c h   o p t i o n s   t h e   u s e r   s u p p l i e d   a t   r u n t i m e   a n d   a c t s   a c c o r d i n g l y .� ��� r  ����� l ����X�W� E  ����� o  ���V�V 0 cmd  � m  ���� ���  m a c�X  �W  � o      �U�U 0 viewmac ViewMac� ��� r  ����� l ����T�S� E  ����� o  ���R�R 0 cmd  � m  ���� ���  c p u�T  �S  � o      �Q�Q 0 viewcpu ViewCPU� ��� Z  � ���P�O� o  ���N�N 0 viewcpu ViewCPU� k  ���� ��� r  ����� l �� �M�L  E  �� o  ���K�K 0 cmd   m  �� � 
 s p e e d�M  �L  � o      �J�J *0 viewcurrentcpuspeed ViewCurrentCPUSpeed�  r  �� l ��	�I�H	 E  ��

 o  ���G�G 0 cmd   m  �� �  c a p�I  �H   o      �F�F 0 viewcap ViewCap  r  �� l ���E�D E  �� o  ���C�C 0 cmd   m  �� � 
 c a c h e�E  �D   o      �B�B 0 	viewcache 	ViewCache �A r  �� l ���@�? E  �� o  ���>�> 0 cmd   m  �� �  f s b�@  �?   o      �=�= 0 viewfsb ViewFSB�A  �P  �O  �   r  
!"! l #�<�;# E  $%$ o  �:�: 0 cmd  % m  && �''  r a m�<  �;  " o      �9�9 0 viewram ViewRam  ()( r  *+* l ,�8�7, E  -.- o  �6�6 0 cmd  . m  // �00  b a r�8  �7  + o      �5�5 0 viewbars ViewBars) 121 r  343 l 5�4�35 E  676 o  �2�2 0 cmd  7 m  88 �99  d i s k�4  �3  4 o      �1�1 0 viewdisk ViewDisk2 :;: r  @<=< l <>�0�/> G  <?@? G  0ABA E  $CDC o   �.�. 0 cmd  D m   #EE �FF  g p uB E  ',GHG o  '(�-�- 0 cmd  H m  (+II �JJ  g r a p h i c s@ E  38KLK o  34�,�, 0 cmd  L m  47MM �NN 
 v i d e o�0  �/  = o      �+�+ 0 viewdisplay ViewDisplay; OPO r  AnQRQ l AjS�*�)S G  AjTUT G  ARVWV E  AFXYX o  AB�(�( 0 cmd  Y m  BEZZ �[[  g p uW E  IN\]\ o  IJ�'�' 0 cmd  ] m  JM^^ �__  g r a p h i c sU F  Uf`a` E  UZbcb o  UV�&�& 0 cmd  c m  VYdd �ee 
 v i d e oa E  ]bfgf o  ]^�%�% 0 cmd  g m  ^ahh �ii  b u s�*  �)  R o      �$�$ 0 
viewgfxbus 
ViewGFXBusP jkj r  o�lml l o�n�#�"n G  o�opo G  o�qrq E  otsts o  op�!�! 0 cmd  t m  psuu �vv  g p ur E  w|wxw o  wx� �  0 cmd  x m  x{yy �zz  g r a p h i c sp F  ��{|{ E  ��}~} o  ���� 0 cmd  ~ m  �� ��� 
 v i d e o| E  ����� o  ���� 0 cmd  � m  ���� ���  r e s�#  �"  m o      �� "0 viewresolutions ViewResolutionsk ��� r  ����� l ������ G  ����� E  ����� o  ���� 0 cmd  � m  ���� ��� 
 a u d i o� E  ����� o  ���� 0 cmd  � m  ���� ��� 
 s o u n d�  �  � o      �� 0 	viewaudio 	ViewAudio� ��� r  ����� l ������ E  ����� o  ���� 0 cmd  � m  ���� ��� 
 p o w e r�  �  � o      �� 0 	viewpower 	ViewPower� ��� r  ����� l ������ E  ����� o  ���� 0 cmd  � m  ���� ���  o s x�  �  � o      ��  0 viewosxversion ViewOSXVersion� ��� r  ����� l ������ E  ����� o  ���� 0 cmd  � m  ���� ���  o s x b u i l d�  �  � o      �� 0 viewosxbuild ViewOSXBuild� ��� r  ����� l �����
� E  ����� o  ���	�	 0 cmd  � m  ���� ���  o s x a r c h�  �
  � o      �� 0 viewosxarch ViewOSXArch� ��� r  ����� l ������ E  ����� o  ���� 0 cmd  � m  ���� ���  k e r n e l�  �  � o      �� 0 
viewkernel 
ViewKernel� ��� r  ����� l ������ E  ����� o  ���� 0 cmd  � m  ���� ���  k e r n e l t a g�  �  � o      � �  0 viewkerneltag ViewKernelTag� ��� r  ����� l �������� E  ����� o  ������ 0 cmd  � m  ���� ���  u p t i m e��  ��  � o      ���� 0 
viewuptime 
ViewUptime� ��� r  ���� l �������� E  ����� o  ������ 0 cmd  � m  ���� ���  c l i e n t��  ��  � o      ���� 0 
viewclient 
ViewClient� ���� r  ��� l ������ E  ��� o  ���� 0 cmd  � m  �� ���  s c r i p t��  ��  � o      ���� (0 viewcurrentversion ViewCurrentVersion��  t ��� l ��������  ��  ��  � ��� Z  I������� = ��� o  ���� 0 cmd  � m  �� ���  v e r s i o n� k  E�� ��� r  @��� b  <��� b  6��� b  2��� b  ,��� b  (��� b  "��� b  � � m   �   S c r i p t   V e r s i o n :    o  ���� 0 
scriptname 
ScriptName� 1  !��
�� 
spac� o  "'����  0 currentversion CurrentVersion� m  (+ �     f o r   T e x t u a l   b y  � o  ,1���� 0 scriptauthor ScriptAuthor� m  25 �  .   G e t   i t   @  � o  6;����  0 scripthomepage ScriptHomepage� o      ���� 0 msg  � �� L  AE o  AD���� 0 msg  ��  ��  ��  � 	
	 l JJ��������  ��  ��  
  Z  J���� = JO o  JK���� 0 cmd   m  KN �  o p t i o n s k  R  r  R� b  R� b  R� b  R� b  R� b  R� !  b  R�"#" b  R�$%$ b  R�&'& b  R�()( b  R�*+* b  R�,-, b  R�./. b  R�010 b  R�232 b  R�454 b  R�676 b  R�898 b  R�:;: b  R�<=< b  R}>?> b  Ry@A@ b  RuBCB b  RqDED b  RmFGF b  RgHIH b  RcJKJ b  R]LML b  RYNON m  RUPP �QQ . / e c h o   P o s s i b l e   O p t i o n s :O o  UX���� 0 newline NewLineM l 	Y\R����R m  Y\SS �TT B / e c h o   T o   c h a n g e   a n   o p t i o n   t y p e   ' /��  ��  K o  ]b���� 0 
scriptname 
ScriptNameI m  cfUU �VV D   < o p t i o n   n a m e >   t o g g l e ' .   E x a m p l e :   /G o  gl���� 0 
scriptname 
ScriptNameE m  mpWW �XX    s i m p l e   t o g g l e  C o  qt���� 0 newline NewLineA l 	uxY����Y m  uxZZ �[[ � / e c h o   "   U s e A l l M o u n t p o i n t s   -   D e f i n e s   i f   t h e   s c r i p t   c o n s i d e r s   e v e r y   m o u n t e d   d i s k   /   n e t   s h a r e   a s   a v a i l a b l e   d i s k   s p a c e   o r   n o t .��  ��  ? o  y|���� 0 fbold FBold= m  }�\\ �]] &   -   C u r r e n t   S t a t u s :  ; o  ������ 0 fbold FBold9 o  ������ 0 cred CRed7 o  ������ &0 useallmountpoints UseAllMountpoints5 o  ������ 0 newline NewLine3 l 	��^����^ m  ��__ �`` � / e c h o   "   S i m p l e   -   D e f i n e s   i f   t h e   f o r m a t t i n g   i s   r e m o v e d   f r o m   t h e   o u t p u t   o f   t h e   s c r i p t .��  ��  1 o  ������ 0 fbold FBold/ m  ��aa �bb &   -   C u r r e n t   S t a t u s :  - o  ������ 0 fbold FBold+ o  ������ 0 cred CRed) o  ������ 0 simple Simple' o  ������ 0 newline NewLine% l 	��c����c m  ��dd �ee � / e c h o   "   S B C l o c k   -   D e f i n e s   i f   t h e   s c r i p t   a t t e m p t s   t o   g e t   t h e   r e a l   C P U   c l o c k   s p e e d   f o r   O v e r c l o c k e d   S a n d y   B r i d g e   H a c k i n t o s h e s .��  ��  # o  ������ 0 fbold FBold! m  ��ff �gg &   -   C u r r e n t   S t a t u s :   o  ������ 0 fbold FBold o  ������ 0 cred CRed o  ������ 0 sbclock SBClock o  ������ 0 newline NewLine o      ���� 0 msg   hih r  ��jkj I ����l��
�� .corecnte****       ****l n  ��mnm 2 ����
�� 
cha n l ��o����o m  ��pp �qq " P o s s i b l e   O p t i o n s :��  ��  ��  k o      ���� 	0 chars  i rsr r  ��tut m  ��vv �ww  u o      ���� 0 	separator  s xyx U  ��z{z r  ��|}| b  ��~~ o  ������ 0 	separator   m  ���� ���  _} o      ���� 0 	separator  { o  ������ 	0 chars  y ��� r  ���� b  ���� b  ���� b  ����� m  ���� ���  / e c h o  � o  ������ 0 	separator  � o  ����� 0 newline NewLine� o  ���� 0 msg  � o      ���� 0 msg  � ��� L  �� o  ���� 0 msg  � ���� l ��������  ��  ��  ��  ��  ��   ��� l ��������  ��  ��  � ��� Z  �������� = ��� o  ���� 0 cmd  � m  �� ��� " U s e A l l M o u n t p o i n t s� Z  ������� = &��� o  "���� &0 useallmountpoints UseAllMountpoints� m  "%�� ���  T r u e� k  )O�� ��� r  )J��� b  )F��� b  )B��� b  )<��� b  )8��� b  )4��� b  )0��� m  ),�� ��� 4 / e c h o   T h e   s c r i p t   w i l l   u s e  � o  ,/���� 0 fbold FBold� m  03�� ��� " A l l   m o u n t e d   d i s k s� o  47���� 0 fbold FBold� m  8;�� ��� 0 .   T o   c h a n g e   t h i s   t y p e   ' /� o  <A���� 0 
scriptname 
ScriptName� m  BE�� ��� 4   U s e A l l M o u n t p o i n t s   t o g g l e '� o      ���� 0 msg  � ���� L  KO�� o  KN���� 0 msg  ��  � ��� = RY��� o  RU���� &0 useallmountpoints UseAllMountpoints� m  UX�� ��� 
 F a l s e� ���� k  \��� ��� r  \}��� b  \y��� b  \u��� b  \o��� b  \k��� b  \g��� b  \c��� m  \_�� ��� 4 / e c h o   T h e   s c r i p t   w i l l   u s e  � o  _b���� 0 fbold FBold� m  cf�� ��� * t h e   S t a r t u p   d i s k   o n l y� o  gj���� 0 fbold FBold� m  kn�� ��� 0 .   T o   c h a n g e   t h i s   t y p e   ' /� o  ot���� 0 
scriptname 
ScriptName� m  ux�� ��� 4   U s e A l l M o u n t p o i n t s   t o g g l e '� o      ���� 0 msg  � ���� L  ~��� o  ~����� 0 msg  ��  ��  ��  ��  ��  � ��� l ����������  ��  ��  � ��� Z  ��������� = ����� o  ������ 0 cmd  � m  ���� ��� 0 U s e A l l M o u n t p o i n t s   t o g g l e� Z  �������� = ����� o  ������ &0 useallmountpoints UseAllMountpoints� m  ���� ���  T r u e� k  ���� ��� I �������
�� .sysoexecTEXT���     TEXT� m  ���� ��� ` d e f a u l t s   w r i t e   x e o n 3 d . s i   U s e A l l M o u n t p o i n t s   F a l s e��  � ���� L  ���� m  ���� ��� � / e c h o   T h e   s c r i p t   w i l l   n o w   o n l y   u s e   t h e   S t a r t u p   d i s k   f o r   H D D   S p a c e   c a l c u l a t i o n !��  � ��� = ����� o  ������ &0 useallmountpoints UseAllMountpoints� m  ���� �   
 F a l s e� �� k  ��  I ������
�� .sysoexecTEXT���     TEXT m  �� � ^ d e f a u l t s   w r i t e   x e o n 3 d . s i   U s e A l l M o u n t p o i n t s   T r u e��   �� L  ��		 m  ��

 � � / e c h o   T h e   s c r i p t   w i l l   n o w   u s e   a l l   m o u n t p o i n t s   ( i n c l u d i n g   n e t w o r k   s h a r e s )   f o r   H D D   S p a c e   c a l c u l a t i o n !��  ��  ��  ��  ��  �  l ����������  ��  ��    Z  �&���� = �� o  ������ 0 cmd   m  �� �  S i m p l e   t o g g l e Z  �"�� = �� o  ������ 0 simple Simple m  �� �  T r u e k  ��  I ���� ��
�� .sysoexecTEXT���     TEXT  m  ��!! �"" J d e f a u l t s   w r i t e   x e o n 3 d . s i   S i m p l e   F a l s e��   #�# L  ��$$ b  ��%&% b  ��'(' b  ��)*) b  ��+,+ m  ��-- �.. " / e c h o   T h e   s c r i p t  , o  ���~�~ 0 fbold FBold* m  ��// �00  w o n ' t   r e m o v e( o  ���}�} 0 fbold FBold& m  ��11 �22 @   t h e   f o r m a t t i n g   f r o m   t h e   o u t p u t .�   343 = ��565 o  ���|�| 0 simple Simple6 m  ��77 �88 
 F a l s e4 9�{9 k  :: ;<; I 	�z=�y
�z .sysoexecTEXT���     TEXT= m  >> �?? H d e f a u l t s   w r i t e   x e o n 3 d . s i   S i m p l e   T r u e�y  < @�x@ L  
AA b  
BCB b  
DED b  
FGF b  
HIH m  
JJ �KK " / e c h o   T h e   s c r i p t  I o  �w�w 0 fbold FBoldG m  LL �MM  w i l l   r e m o v eE o  �v�v 0 fbold FBoldC m  NN �OO @   t h e   f o r m a t t i n g   f r o m   t h e   o u t p u t .�x  �{  ��  ��  ��   PQP l ''�u�t�s�u  �t  �s  Q RSR Z  '�TU�r�qT = ',VWV o  '(�p�p 0 cmd  W m  (+XX �YY  S B C l o c kU Z  /�Z[\�oZ = /6]^] o  /2�n�n 0 sbclock SBClock^ m  25__ �``  T r u e[ k  9_aa bcb r  9Zded b  9Vfgf b  9Rhih b  9Ljkj b  9Hlml b  9Dnon b  9@pqp m  9<rr �ss , / e c h o   T h e   s c r i p t   w i l l  q o  <?�m�m 0 fbold FBoldo m  @Ctt �uu  s h o wm o  DG�l�l 0 fbold FBoldk m  HKvv �ww �   t h e   r e a l   C P U   c l o c k   s p e e d   f o r   S a n d y   B r i d g e   O C ' e d   H a c k i n t o s h e s .   T o   c h a n g e   t h i s   t y p e   ' /i o  LQ�k�k 0 
scriptname 
ScriptNameg m  RUxx �yy     S B C l o c k   t o g g l e 'e o      �j�j 0 msg  c z�iz L  [_{{ o  [^�h�h 0 msg  �i  \ |}| = bi~~ o  be�g�g 0 sbclock SBClock m  eh�� ��� 
 F a l s e} ��f� k  l��� ��� r  l���� b  l���� b  l���� b  l��� b  l{��� b  lw��� b  ls��� m  lo�� ��� , / e c h o   T h e   s c r i p t   w i l l  � o  or�e�e 0 fbold FBold� m  sv�� ���  n o t   s h o w� o  wz�d�d 0 fbold FBold� m  {~�� ��� �     t h e   r e a l   C P U   c l o c k   s p e e d   f o r   S a n d y   B r i d g e   O C ' e d   H a c k i n t o s h e s .   T o   c h a n g e   t h i s   t y p e   ' /� o  ��c�c 0 
scriptname 
ScriptName� m  ���� ���     S B C l o c k   t o g g l e '� o      �b�b 0 msg  � ��a� L  ���� o  ���`�` 0 msg  �a  �f  �o  �r  �q  S ��� l ���_�^�]�_  �^  �]  � ��� Z  �����\�[� = ����� o  ���Z�Z 0 cmd  � m  ���� ���  S B C l o c k   t o g g l e� Z  ������Y� = ����� o  ���X�X 0 sbclock SBClock� m  ���� ���  T r u e� k  ���� ��� I ���W��V
�W .sysoexecTEXT���     TEXT� m  ���� ��� L d e f a u l t s   w r i t e   x e o n 3 d . s i   S B C l o c k   F a l s e�V  � ��U� L  ���� b  ����� b  ����� b  ����� b  ����� m  ���� ��� 4 / e c h o   T h e   s c r i p t   w i l l   n o w  � o  ���T�T 0 fbold FBold� m  ���� ���  n o t   s h o w� o  ���S�S 0 fbold FBold� m  ���� ��� |   t h e   r e a l   C P U   c l o c k   s p e e d   f o r   S a n d y   B r i d g e   O C ' e d   H a c k i n t o s h e s .�U  � ��� = ����� o  ���R�R 0 sbclock SBClock� m  ���� ��� 
 F a l s e� ��Q� k  ���� ��� I ���P��O
�P .sysoexecTEXT���     TEXT� m  ���� ��� J d e f a u l t s   w r i t e   x e o n 3 d . s i   S B C l o c k   T r u e�O  � ��N� L  ���� b  ����� b  ����� b  ����� b  ����� m  ���� ��� 4 / e c h o   T h e   s c r i p t   w i l l   n o w  � o  ���M�M 0 fbold FBold� m  ���� ���  s h o w� o  ���L�L 0 fbold FBold� m  ���� ��� |   t h e   r e a l   C P U   c l o c k   s p e e d   f o r   S a n d y   B r i d g e   O C ' e d   H a c k i n t o s h e s .�N  �Q  �Y  �\  �[  � ��� l ���K�J�I�K  �J  �I  � ��� l ���H���H  �   UpdaterNG 0.1   � ���    U p d a t e r N G   0 . 1� ��� Z  �	c���G�F� = � ��� o  ���E�E 0 cmd  � m  ���� ���  u p d a t e� k  	_�� ��� r  ��� b  ��� o  �D�D  0 scripthomepage ScriptHomepage� m  �� ���  d o w n l o a d /� o      �C�C 20 scriptdownloadfolderurl ScriptDownloadFolderURL� ��� l �B�A�@�B  �A  �@  � ��� I  �?��>
�? .sysoexecTEXT���     TEXT� b  � � b   m   � F d e f a u l t s   w r i t e   x e o n 3 d . s i   L a t e s t U R L   o  �=�= 20 scriptdownloadfolderurl ScriptDownloadFolderURL  m   �  l a t e s t�>  �  I !0�<	�;
�< .sysoexecTEXT���     TEXT	 b  !,

 b  !( m  !$ � L d e f a u l t s   w r i t e   x e o n 3 d . s i   L a t e s t M D 5 U R L   o  $'�:�: 20 scriptdownloadfolderurl ScriptDownloadFolderURL m  (+ �  l a t e s t m d 5�;    l 11�9�8�7�9  �8  �7    r  1< I 18�6�5
�6 .sysoexecTEXT���     TEXT m  14 � B d e f a u l t s   r e a d   x e o n 3 d . s i   L a t e s t U R L�5   o      �4�4 $0 latestversionurl LatestVersionURL  r  =H I =D�3�2
�3 .sysoexecTEXT���     TEXT m  =@   �!! H d e f a u l t s   r e a d   x e o n 3 d . s i   L a t e s t M D 5 U R L�2   o      �1�1  0 latestchecksum LatestChecksum "#" l II�0�/�.�0  �/  �.  # $%$ l II�-&'�-  & 3 -- Defines the latest available script version   ' �(( Z -   D e f i n e s   t h e   l a t e s t   a v a i l a b l e   s c r i p t   v e r s i o n% )*) r  IX+,+ I IT�,-�+
�, .sysoexecTEXT���     TEXT- b  IP./. m  IL00 �11 
 c u r l  / o  LO�*�* $0 latestversionurl LatestVersionURL�+  , o      �)�) 0 latestversion LatestVersion* 232 l YY�(�'�&�(  �'  �&  3 454 l YY�%67�%  6 G A- Defines the latest available script version's zip file checksum   7 �88 � -   D e f i n e s   t h e   l a t e s t   a v a i l a b l e   s c r i p t   v e r s i o n ' s   z i p   f i l e   c h e c k s u m5 9:9 r  Yh;<; I Yd�$=�#
�$ .sysoexecTEXT���     TEXT= b  Y`>?> m  Y\@@ �AA 
 c u r l  ? o  \_�"�"  0 latestchecksum LatestChecksum�#  < o      �!�!  0 latestchecksum LatestChecksum: BCB l ii� ���   �  �  C DED l ii�FG�  F 1 +- Defines the URL of the Script's Changelog   G �HH V -   D e f i n e s   t h e   U R L   o f   t h e   S c r i p t ' s   C h a n g e l o gE IJI r  itKLK b  ipMNM o  il�� 20 scriptdownloadfolderurl ScriptDownloadFolderURLN m  loOO �PP  c h a n g e l o gL o      �� 0 changelogurl ChangelogURLJ QRQ l uu����  �  �  R STS l uu�UV�  U 6 0- Defines the zip file URL of the latest version   V �WW ` -   D e f i n e s   t h e   z i p   f i l e   U R L   o f   t h e   l a t e s t   v e r s i o nT XYX r  u�Z[Z b  u�\]\ b  u�^_^ b  u�`a` b  u~bcb o  ux�� 20 scriptdownloadfolderurl ScriptDownloadFolderURLc o  x}�� 0 
scriptname 
ScriptNamea m  ~�dd �ee  -_ o  ���� 0 latestversion LatestVersion] m  ��ff �gg  . z i p[ o      �� 0 	latestzip 	LatestZipY hih l ������  �  �  i jkj l ���lm�  l ? 9 When the file isn't there, it'll get an error HTML page.   m �nn r   W h e n   t h e   f i l e   i s n ' t   t h e r e ,   i t ' l l   g e t   a n   e r r o r   H T M L   p a g e .k opo Z  ��qr��q E  ��sts o  ���� 0 latestversion LatestVersiont m  ��uu �vv  D O C T Y P Er L  ��ww b  ��xyx b  ��z{z b  ��|}| b  ��~~ m  ���� ��� J / d e b u g   e c h o   E r r o r   g e t t i n g   t h e   l a t e s t   o  ���� 0 
scriptname 
ScriptName} m  ���� ��� b   v e r s i o n   n u m b e r .   P l e a s e   t r y   a g a i n   l a t e r   o r   v i s i t  { o  ���
�
  0 scripthomepage ScriptHomepagey m  ���� ��� ,   f o r   m o r e   i n f o r m a t i o n .�  �  p ��	� Z  �	_����� ? ����� o  ���� 0 latestversion LatestVersion� o  ����  0 currentversion CurrentVersion� k  ���� ��� l ������  �  	return UpdateZipPath   � ��� * 	 r e t u r n   U p d a t e Z i p P a t h� ��� I �����
� .sysoexecTEXT���     TEXT� b  ����� m  ���� ���  r m   - f  � o  ���� 0 updatezippath UpdateZipPath�  � ��� I ����� 
� .sysoexecTEXT���     TEXT� b  ����� b  ����� b  ����� m  ���� ���  c u r l   - C   -  � o  ������ 0 	latestzip 	LatestZip� m  ���� ���    - o  � o  ������ 0 updatezippath UpdateZipPath�   � ��� Z  �=������� > ����� o  ������  0 latestchecksum LatestChecksum� l �������� I �������
�� .sysoexecTEXT���     TEXT� b  ����� m  ���� ���  m d 5   - q  � o  ������ 0 updatezippath UpdateZipPath��  ��  ��  � k  �9�� ��� Z  �
������� E  ����� o  ������  0 latestchecksum LatestChecksum� m  ���� ���  D O C T Y P E� L  ��� b  ���� b  ���� m  ���� ��� | / d e b u g   e c h o   E r r o r   g e t t i n g   t h e   o n l i n e   c h e c k s u m   f o r   t h e   l a t e s t    � o  � ���� 0 
scriptname 
ScriptName� m  �� ��� �   v e r s i o n .   P l e a s e   t r y   a g a i n   l a t e r   o r   d o w n l o a d   n e w e s t   v e r s i o n   h e r e :   h t t p : / / x s y s i n f o . x e o n 3 d . n e t  ��  ��  � ���� L  9�� b  8��� b  4��� b  .��� b  *��� b  &��� b  "��� b  ��� b  ��� m  �� ���   / d e b u g   e c h o   T h e  � o  ���� 0 
scriptname 
ScriptName� m  �� ��� H   d o w n l o a d   w a s   c o r r u p t e d .   L o c a l   M D 5 :  � l !������ I !�����
�� .sysoexecTEXT���     TEXT� b  ��� m  �� ���  m d 5   - q  � o  ���� 0 updatezippath UpdateZipPath��  ��  ��  � m  "%�� ���    -   O n l i n e   M D 5 :  � o  &)����  0 latestchecksum LatestChecksum� m  *-�� ��� F   .   P l e a s e   t r y   a g a i n   l a t e r   o r   v i s i t  � o  .3����  0 scripthomepage ScriptHomepage� m  47�� ���    f o r   m o r e   i n f o .��  ��  ��  � ��� r  >K��� I >G�����
�� .sysoexecTEXT���     TEXT� b  >C��� m  >A�� ���  u n z i p   - t  � o  AB���� 0 updatezippath UpdateZipPath��  � o      ���� .0 downloadedupdatecheck DownloadedUpdateCheck� ���� Z  L������� E  LS��� o  LO���� .0 downloadedupdatecheck DownloadedUpdateCheck� m  OR�� ��� $ N o   e r r o r s   d e t e c t e d� k  V��� ��� I Vc�����
�� .sysoexecTEXT���     TEXT� b  V_��� b  V[��� m  VY�� �    r m   - f  � o  YZ���� *0 externalscriptspath ExternalScriptsPath� m  [^ �  / s i * . s c p t��  �  I dq����
�� .sysoexecTEXT���     TEXT b  dm b  di	 m  dg

 �  r m   - f  	 o  gh���� *0 externalscriptspath ExternalScriptsPath m  il �  / x s y s * . s c p t��    I r�����
�� .sysoexecTEXT���     TEXT b  r} b  r{ b  rw m  ru �  u n z i p   - o   o  uv���� 0 updatezippath UpdateZipPath m  wz �    - d   o  {|���� *0 externalscriptspath ExternalScriptsPath��    I ������
�� .sysoexecTEXT���     TEXT b  �� m  ��   �!!  r m   - f   o  ������ 0 updatezippath UpdateZipPath��   "#" r  ��$%$ b  ��&'& b  ��()( b  ��*+* b  ��,-, b  ��./. b  ��010 b  ��232 b  ��454 b  ��676 m  ��88 �99 8 / e c h o   S u c c e s s e f u l l y   u p d a t e d  7 o  ������ 0 
scriptname 
ScriptName5 m  ��:: �;;    t o   v e r s i o n  3 o  ������ 0 latestversion LatestVersion1 m  ��<< �==    f r o m  / o  ������  0 currentversion CurrentVersion- m  ��>> �??  .+ o  ������ 0 newline NewLine) m  ��@@ �AA " / e c h o   C h a n g e l o g :  ' o  ������ 0 changelogurl ChangelogURL% o      ���� 0 resultmessage ResultMessage# B��B L  ��CC o  ������ 0 resultmessage ResultMessage��  � DED E  ��FGF o  ������ .0 downloadedupdatecheck DownloadedUpdateCheckG m  ��HH �II  c a n n o t   f i n dE J��J k  ��KK LML r  ��NON b  ��PQP b  ��RSR b  ��TUT m  ��VV �WW . / e c h o   E r r o r   e x t r a c t i n g  U o  ������ 0 
scriptname 
ScriptNameS m  ��XX �YY l .   T r y   a g a i n   l a t e r   o r   d o w n l o a d   a   p r e v i o u s   v e r s i o n   f r o m  Q o  ������  0 scripthomepage ScriptHomepageO o      ���� 0 resultmessage ResultMessageM Z��Z L  ��[[ o  ������ 0 resultmessage ResultMessage��  ��  ��  ��  � \]\ = ��^_^ o  ������ 0 latestversion LatestVersion_ o  ������  0 currentversion CurrentVersion] `a` k  �	$bb cdc r  �	efe b  �	ghg b  �	iji b  �	klk b  �	mnm b  �		opo b  �	qrq m  ��ss �tt  / e c h o  r o  �	���� 0 
scriptname 
ScriptNamep m  		uu �vv \   i s   a l r e a d y   u p   t o   d a t e .   ( Y o u r   s c r i p t   v e r s i o n :  n o  			����  0 currentversion CurrentVersionl m  		ww �xx D ;   L a t e s t   r e l e a s e d   s c r i p t   v e r s i o n :  j o  		���� 0 latestversion LatestVersionh m  		yy �zz  )f o      ���� 0 resultmessage ResultMessaged {��{ L  	 	$|| o  	 	#���� 0 resultmessage ResultMessage��  a }~} ? 	'	0� o  	'	,����  0 currentversion CurrentVersion� o  	,	/���� 0 latestversion LatestVersion~ ���� k  	3	[�� ��� r  	3	V��� b  	3	R��� b  	3	N��� b  	3	J��� b  	3	F��� b  	3	@��� b  	3	<��� m  	3	6�� ��� & / e c h o   Y o u r   c o p y   o f  � o  	6	;���� 0 
scriptname 
ScriptName� m  	<	?�� ��� �   i s   n e w e r   t h a n   t h e   l a s t   r e l e a s e d   v e r s i o n .   ( Y o u r   s c r i p t   v e r s i o n :  � o  	@	E����  0 currentversion CurrentVersion� m  	F	I�� ��� D ;   L a t e s t   r e l e a s e d   s c r i p t   v e r s i o n :  � o  	J	M���� 0 latestversion LatestVersion� m  	N	Q�� ���  )� o      ���� 0 resultmessage ResultMessage� ���� L  	W	[�� o  	W	Z���� 0 resultmessage ResultMessage��  ��  �  �	  �G  �F  � ��� l 	d	d��������  ��  ��  � ��� Z  	d	�������� = 	d	i��� o  	d	e���� 0 cmd  � m  	e	h�� ���  r e f r e s h� O  	l	���� k  	r	��� ��� Z  	r	�������� I 	r	~�����
�� .coredoexbool        obj � 4  	r	z���
�� 
psxf� m  	v	y�� ��� 6 / t m p / S P H a r d w a r e D a t a T y p e . t x t��  � I 	�	������
�� .sysoexecTEXT���     TEXT� m  	�	��� ��� D r m   - r f   / t m p / S P H a r d w a r e D a t a T y p e . t x t��  ��  ��  � ��� Z  	�	�������� I 	�	������
�� .coredoexbool        obj � 4  	�	����
�� 
psxf� m  	�	��� ��� 6 / t m p / S P D i s p l a y s D a t a T y p e . t x t��  � I 	�	������
�� .sysoexecTEXT���     TEXT� m  	�	��� ��� D r m   - r f   / t m p / S P D i s p l a y s D a t a T y p e . t x t��  ��  ��  � ���� Z  	�	�������� I 	�	������
�� .coredoexbool        obj � 4  	�	����
�� 
psxf� m  	�	��� ��� 0 / t m p / S P P o w e r D a t a T y p e . t x t��  � I 	�	������
�� .sysoexecTEXT���     TEXT� m  	�	��� ��� > r m   - r f   / t m p / S P P o w e r D a t a T y p e . t x t��  ��  ��  ��  � m  	l	o���                                                                                  MACS  alis    b  LionOS                     �07ZH+     8
Finder.app                                                       �~�z{        ����  	                CoreServices    �07Z      �zk       8   +   *  0LionOS:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    L i o n O S  &System/Library/CoreServices/Finder.app  / ��  ��  ��  � ��� l 	�	���������  ��  ��  � ��� Z  	�
�������� = 	�	���� o  	�	����� 0 cmd  � m  	�	��� ���  h e l p� k  	�
��� ��� r  	�
+��� b  	�
'��� b  	�
#��� b  	�
��� b  	�
��� b  	�
��� b  	�
��� b  	�
��� b  	�
��� b  	�
��� b  	�
��� b  	�	���� b  	�	���� b  	�	���� b  	�	���� b  	�	���� b  	�	���� b  	�	���� b  	�	���� b  	�	���� b  	�	�   l 		�	����� m  	�	� �  / e c h o  ��  ��   o  	�	����� 0 fbold FBold� m  	�	� �  U s a g e :� o  	�	����� 0 fbold FBold� m  	�	� �    /� o  	�	����� 0 
scriptname 
ScriptName� m  	�	�		 �

 $   [ l a b e l s ]   [ s i m p l e ]� o  	�	����� 0 newline NewLine� l 		�	����� m  	�	� � � / e c h o   I f   r u n   w i t h o u t   a r g u m e n t s ,   i t ' l l   s h o w   a   p r e d e f i n e d   s e t   o f   s y s t e m   d e t a i l s   t h a t   c a n   b e   c u s t o m i z e d   b y   t y p i n g   ' /��  ��  � o  	�	����� 0 
scriptname 
ScriptName� m  	�	� �    o p t i o n s '� o  	�
���� 0 newline NewLine� l 	

���� m  

 � , / e c h o   P o s s i b l e   l a b e l s :��  ��  � o  


���� 0 newline NewLine� m  

 �& / e c h o   m a c ,   c p u ,   s p e e d ,   c a p ,   c a c h e ,   f s b ,   t e m p ,   r a m ,   b a r ,   m e m ,   h d ,   g p u ,   r e s ,   a u d i o ,   p o w e r ,   o s x ,   o s x b u i l d ,   o s x a r c h ,   k e r n e l ,   k e r n e l t a g ,   u p t i m e ,   c l i e n t .� o  

���� 0 newline NewLine� l 	

���� m  

 � � / e c h o   T h e r e   a r e   a l s o   s o m e   s p e c i a l   l a b e l s :   ' a b o u t '   s h o w s   s o m e   i n f o   a b o u t   t h e   s c r i p t ;  ��  ��  � o  

���� 0 newline NewLine� l 	

���� m  

 � � / e c h o   T h e   ' s i m p l e '   l a b e l   m a k e s   t h e   s c r i p t   o u t p u t   w i t h o u t   a n y   f o r m a t t i n g   ( c o l o r s ,   b o l d ,   e t c . . . ) ;  ��  ��  � o  

"�� 0 newline NewLine� l 	
#
&�~�} m  
#
& � � / e c h o   T h e   ' u p d a t e '   l a b e l   u p d a t e s   t h e   s c r i p t   a n d   t h e   ' v e r s i o n '   l a b e l   d i s p l a y s   t h e   c u r r e n t   v e r s i o n .�~  �}  � o      �|�| 0 msg  �  r  
,
M !  I 
,
I�{"�z
�{ .corecnte****       ****" n  
,
E#$# 2 
A
E�y
�y 
cha $ l 
,
A%�x�w% b  
,
A&'& b  
,
=()( b  
,
9*+* b  
,
3,-, m  
,
/.. �//  U s a g e :- m  
/
200 �11    /+ o  
3
8�v�v 0 
scriptname 
ScriptName) m  
9
<22 �33 $   [ l a b e l s ]   [ s i m p l e ]' o  
=
@�u�u 0 newline NewLine�x  �w  �z  ! o      �t�t 	0 chars   454 r  
N
U676 m  
N
Q88 �99  7 o      �s�s 0 	separator  5 :;: U  
V
o<=< r  
_
j>?> b  
_
f@A@ o  
_
b�r�r 0 	separator  A m  
b
eBB �CC  _? o      �q�q 0 	separator  = o  
Y
\�p�p 	0 chars  ; DED r  
p
�FGF b  
p
HIH b  
p
{JKJ b  
p
wLML m  
p
sNN �OO  / e c h o  M o  
s
v�o�o 0 	separator  K o  
w
z�n�n 0 newline NewLineI o  
{
~�m�m 0 msg  G o      �l�l 0 msg  E P�kP L  
�
�QQ o  
�
��j�j 0 msg  �k  ��  ��  � RSR l 
�
��i�h�g�i  �h  �g  S TUT Z  
�QVW�f�eV = 
�
�XYX o  
�
��d�d 0 cmd  Y m  
�
�ZZ �[[ 
 a b o u tW k  
�M\\ ]^] r  
�
�_`_ b  
�
�aba b  
�
�cdc b  
�
�efe b  
�
�ghg b  
�
�iji b  
�
�klk b  
�
�mnm b  
�
�opo b  
�
�qrq b  
�
�sts b  
�
�uvu b  
�
�wxw b  
�
�yzy b  
�
�{|{ b  
�
�}~} b  
�
�� l 	
�
���c�b� m  
�
��� ���  / e c h o  �c  �b  � o  
�
��a�a 0 fbold FBold~ o  
�
��`�` 0 
scriptname 
ScriptName| m  
�
��� ���   z o  
�
��_�_  0 currentversion CurrentVersionx o  
�
��^�^ 0 fbold FBoldv m  
�
��� ���    -  t o  
�
��]�] &0 scriptdescription ScriptDescriptionr o  
�
��\�\ 0 newline NewLinep l 	
�
���[�Z� m  
�
��� ���   / e c h o   H o m e p a g e :  �[  �Z  n o  
�
��Y�Y  0 scripthomepage ScriptHomepagel o  
�
��X�X 0 newline NewLinej l 	
�
���W�V� m  
�
��� ���  / e c h o   C o d e d   b y  �W  �V  h o  
�
��U�U 0 scriptauthor ScriptAuthorf m  
�
��� ���    -  d o  
�
��T�T ,0 scriptauthorhomepage ScriptAuthorHomepageb o  
�
��S�S 0 newline NewLine` o      �R�R 0 msg  ^ ��� r  
���� I 
��Q��P
�Q .corecnte****       ****� n  
�
��� 2 
�O
�O 
cha � l 
���N�M� b  
���� b  
���� b  
�
���� b  
�
���� b  
�
���� b  
�
���� o  
�
��L�L 0 fbold FBold� m  
�
��� ���  U s a g e :� o  
�
��K�K 0 fbold FBold� m  
�
��� ���    /� o  
�
��J�J 0 
scriptname 
ScriptName� m  
��� ��� $   [ l a b e l s ]   [ s i m p l e ]� o  �I�I 0 newline NewLine�N  �M  �P  � o      �H�H 	0 chars  � ��� r  ��� m  �� ���  � o      �G�G 0 	separator  � ��� U  4��� r  $/��� b  $+��� o  $'�F�F 0 	separator  � m  '*�� ���  _� o      �E�E 0 	separator  � o  !�D�D 	0 chars  � ��� r  5H��� b  5D��� b  5@��� b  5<��� m  58�� ���  / e c h o  � o  8;�C�C 0 	separator  � o  <?�B�B 0 newline NewLine� o  @C�A�A 0 msg  � o      �@�@ 0 msg  � ��?� L  IM�� o  IL�>�> 0 msg  �?  �f  �e  U ��� l RR�=�<�;�=  �<  �;  � ��� O  Rs��� k  Xr�� ��� l XX�:�9�8�:  �9  �8  � ��� l XX�7�6�5�7  �6  �5  � ��� r  X_��� m  X[�� ���  � o      �4�4 0 msg  � ��� l ``�3�2�1�3  �2  �1  � ��� I `g�0��/
�0 .sysoexecTEXT���     TEXT� m  `c�� ��� � s y s t e m _ p r o f i l e r   S P H a r d w a r e D a t a T y p e   >   / t m p / S P H a r d w a r e D a t a T y p e . t x t�/  � ��� l hh�.�-�,�.  �-  �,  � ��� L  hp�� b  ho��� o  hk�+�+ 0 msg  � m  kn�� ���    y a d d a h !  � ��*� l qq�)�(�'�)  �(  �'  �*  � m  RU���                                                                                  MACS  alis    b  LionOS                     �07ZH+     8
Finder.app                                                       �~�z{        ����  	                CoreServices    �07Z      �zk       8   +   *  0LionOS:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    L i o n O S  &System/Library/CoreServices/Finder.app  / ��  � ��� l tt�&�%�$�&  �%  �$  � ��� l tt�#�"�!�#  �"  �!  � �� � l tt����  �  �  �    e ��� l     ����  �  �  �       
�� B G L Q V [ `��  � ��������� 0 
scriptname 
ScriptName� &0 scriptdescription ScriptDescription�  0 scripthomepage ScriptHomepage� 0 scriptauthor ScriptAuthor� ,0 scriptauthorhomepage ScriptAuthorHomepage�  0 currentversion CurrentVersion�  0 supportchannel SupportChannel� 0 
textualcmd  � � g������ 0 
textualcmd  � ��� �  �
�
 0 cmd  �  � A�	��������� ���������������������������������������������������������������������������������������������������������������	 0 cmd  �  0 textualversion TextualVersion� *0 internalscriptspath InternalScriptsPath� *0 externalscriptspath ExternalScriptsPath� 0 tempdirpath TempDirPath� 0 updatezippath UpdateZipPath� 0 simple Simple� 0 cblack CBlack� 0 cnblue CNBlue�  0 cgreen CGreen�� 0 cred CRed�� 0 cbrown CBrown�� 0 cpurple CPurple�� 0 corange COrange�� 0 cyellow CYellow�� 0 clgreen CLGreen�� 0 cteal CTeal�� 0 ccyan CCyan�� 0 cblue CBlue�� 0 cpink CPink�� 0 cgrey CGrey�� 0 clgrey CLGrey�� 0 cwhite CWhite�� 0 nocolor NoColor�� 0 fbold FBold�� 0 fitalic FItalic�� 0 newline NewLine�� 0 	usedcolor 	UsedColor�� 0 	freecolor 	FreeColor��  0 separatorcolor SeparatorColor�� &0 useallmountpoints UseAllMountpoints�� 0 msg  �� 0 sbclock SBClock�� 0 viewmac ViewMac�� 0 viewcpu ViewCPU�� *0 viewcurrentcpuspeed ViewCurrentCPUSpeed�� 0 viewcap ViewCap�� 0 	viewcache 	ViewCache�� 0 viewfsb ViewFSB�� 0 viewram ViewRam�� 0 viewbars ViewBars�� 0 viewdisk ViewDisk�� 0 viewdisplay ViewDisplay�� 0 
viewgfxbus 
ViewGFXBus�� "0 viewresolutions ViewResolutions�� 0 	viewaudio 	ViewAudio�� 0 	viewpower 	ViewPower��  0 viewosxversion ViewOSXVersion�� 0 viewosxarch ViewOSXArch�� 0 viewosxbuild ViewOSXBuild�� 0 
viewkernel 
ViewKernel�� 0 viewkerneltag ViewKernelTag�� 0 
viewuptime 
ViewUptime�� 0 
viewclient 
ViewClient�� (0 viewcurrentversion ViewCurrentVersion�� 	0 chars  �� 0 	separator  �� 20 scriptdownloadfolderurl ScriptDownloadFolderURL�� $0 latestversionurl LatestVersionURL��  0 latestchecksum LatestChecksum�� 0 latestversion LatestVersion�� 0 changelogurl ChangelogURL�� 0 	latestzip 	LatestZip�� .0 downloadedupdatecheck DownloadedUpdateCheck�� 0 resultmessage ResultMessage�  ���� ������� ��� ������� � ��� ���$.8BLV`jt~��������������'16=PZ_f|�����&/8EIMZ^dhuy���������������PSUWZ\_adfp����v������������������
!-/17>JLNX_rtvx������������������ 0@Odfu�������������������
 8:<>@HVXsuwy�����������������	.028BNZ���������������
�� 
vers
�� 
capp
�� kfrmID  
�� .earsffdralis        afdr
�� 
psxp
�� 
strq
�� afdrasup
�� 
from
�� fldmfldu
�� afdrtemp
�� .sysontocTEXT       shor�� 

�� .sysoexecTEXT���     TEXT��  ��  
�� 
bool
�� 
spac
�� 
cha 
�� .corecnte****       ****
�� 
psxf
�� .coredoexbool        obj �v��,E�O)���0j �,�%�,E�O�� ���l �,�%�,E�Y ���l �,�%�,E�O���l �,�,E�O���l �,a %�,E�Oa E�Omj a %E�Omj a %E�Omj a %E�Omj a %E�Omj a %E�Omj a %E�Omj a %E�Omj a %E�Omj a %E�Omj a %E^ Omj a %E^ Omj a %E^ Omj a %E^ Omj a  %E^ Omj a !%E^ Omj E^ Ojj E^ Olj E^ Okj E^ Oa "j E^ O�E^ O�E^ O] E^ O a #j $E^ W -X % & a 'j $Oa (E^ W X % &a )E^ O] O a *j $E�W +X % & a +j $Oa ,E�W X % &a -E^ O] O a .j $E^  W -X % & a /j $Oa 0E^  W X % &a 1E^ O] O�a 2 
 �a 3 a 4& �eE^ !OeE^ "OeE^ #OfE^ $OfE^ %OfE^ &OeE^ 'OeE^ (OeE^ )OeE^ *OfE^ +OeE^ ,OfE^ -OeE^ .OeE^ /OeE^ 0OeE^ 1OfE^ 2OfE^ 3OeE^ 4OeE^ 5OeE^ 6YS�a 5E^ !O�a 6E^ "O] " ,�a 7E^ #O�a 8E^ $O�a 9E^ %O�a :E^ &Y hO�a ;E^ 'O�a <E^ (O�a =E^ )O�a >
 �a ?a 4&
 �a @a 4&E^ *O�a A
 �a Ba 4&
 �a C	 �a Da 4&a 4&E^ +O�a E
 �a Fa 4&
 �a G	 �a Ha 4&a 4&E^ ,O�a I
 �a Ja 4&E^ -O�a KE^ .O�a LE^ /O�a ME^ 1O�a NE^ 0O�a OE^ 2O�a PE^ 3O�a QE^ 4O�a RE^ 5O�a SE^ 6O�a T  5a Ub   %_ V%b  %a W%b  %a X%b  %E^ O] Y hO�a Y  �a Z] %a [%b   %a \%b   %a ]%] %a ^%] %a _%] %�%] %] %a `%] %a a%] %�%�%] %a b%] %a c%] %�%]  %] %E^ Oa da e-j fE^ 7Oa gE^ 8O ] 7kh] 8a h%E^ 8[OY��Oa i] 8%] %] %E^ O] OPY hO�a j  l] a k  +a l] %a m%] %a n%b   %a o%E^ O] Y 6] a p  +a q] %a r%] %a s%b   %a t%E^ O] Y hY hO�a u  8] a v  a wj $Oa xY ] a y  a zj $Oa {Y hY hO�a |  T�a }  !a ~j $Oa ] %a �%] %a �%Y *�a �  !a �j $Oa �] %a �%] %a �%Y hY hO�a �  l]  a �  +a �] %a �%] %a �%b   %a �%E^ O] Y 6]  a �  +a �] %a �%] %a �%b   %a �%E^ O] Y hY hO�a �  X]  a �  !a �j $Oa �] %a �%] %a �%Y ,]  a �  !a �j $Oa �] %a �%] %a �%Y hY hO�a � ab  a �%E^ 9Oa �] 9%a �%j $Oa �] 9%a �%j $Oa �j $E^ :Oa �j $E^ ;Oa �] :%j $E^ <Oa �] ;%j $E^ ;O] 9a �%E^ =O] 9b   %a �%] <%a �%E^ >O] <a � a �b   %a �%b  %a �%Y hO] <b  0a ��%j $Oa �] >%a �%�%j $O] ;a ��%j $ P] ;a � a �b   %a �%Y hOa �b   %a �%a ��%j $%a �%] ;%a �%b  %a �%Y hOa ��%j $E^ ?O] ?a � oa ��%a �%j $Oa ��%a �%j $Oa ��%a �%�%j $Oa å%j $Oa �b   %a �%] <%a �%b  %a �%] %a �%] =%E^ @O] @Y ,] ?a � !a �b   %a �%b  %E^ @O] @Y hY q] <b    -a �b   %a �%b  %a �%] <%a �%E^ @O] @Y :b  ] < -a �b   %a �%b  %a �%] <%a �%E^ @O] @Y hY hO�a �  \a � R)a �a �/j � a �j $Y hO)a �a �/j � a �j $Y hO)a �a �/j � a �j $Y hUY hO�a �  �a �] %a �%] %a �%b   %a �%] %a �%b   %a �%] %a �%] %a �%] %a �%] %a �%] %a �%E^ Oa �a �%b   %a �%] %a e-j fE^ 7Oa �E^ 8O ] 7kh] 8a �%E^ 8[OY��Oa �] 8%] %] %E^ O] Y hO�a �  �a �] %b   %a �%b  %] %a �%b  %] %a �%b  %] %a �%b  %a �%b  %] %E^ O] a �%] %a �%b   %a �%] %a e-j fE^ 7Oa �E^ 8O ] 7kh] 8a �%E^ 8[OY��Oa �] 8%] %] %E^ O] Y hOa � a �E^ Oa �j $O] a �%OPUOPascr  ��ޭ