; SoundSetMute_Mic_01.ahk

Setting := -1 ; -1 = Toggle ; 0 = Mute ; 1 = UnMute
Component := ""
Device := "Microphone (2- HP Webcam HD 2300)" ; See Device Manager Or SoundDevices_01.ahk For Name Of Device.

SoundSetMute Setting , Component, Device