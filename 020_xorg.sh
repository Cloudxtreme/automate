# trackpoint
echo > /etc/X11/xorg.conf.d/trackpoint.conf << 'EOF'
Section "InputClass"
        Identifier      "TrackPoint Clone Acceleration and Middle Click Emulation"
        MatchProduct    "DualPoint Stick"
        MatchDevicePath "/dev/input/event*"
#       Option          "EmulateWheel"          "true"
#       Option          "EmulateWheelButton"    "2"
        Option          "Emulate3Buttons"       "true"
        Option          "AccelerationProfile"   "7"
        Option          "AdaptiveDeceleration"  "1.3"
        Option          "ConstantDeceleration"  "1"
        Option          "ExpectedRate"          "10"
#       Option          "XAxisMapping"          "6 7"
#       Option          "YAxisMapping"          "4 5"
EndSection
EOF

# trackpad
echo > /etc/X11/xorg.conf.d/trackpad.conf << 'EOF'
Section "InputDevice"
    Identifier "SynapticsMouse1"
    Driver "synaptics"
    Option "EdgeMotionMinSpeed" "200"
    Option "MaxTapTime" "0"  # do not use taping, i.e. touching/tapping will not be taken as a mouse click
    Option "MaxSpeed" "1.50"
    Option "MinSpeed" "0.7"
    Option "BottomEdge" "650"
    Option "EdgeMotionMaxSpeed" "200"
    Option "CircScrollTrigger" "2"
    Option "UpDownScrolling" "0"
    Option "SHMConfig" "on"
    Option "LeftEdge" "120"
    Option "FingerLow" "14"
    Option "HorizScrollDelta" "20"
    Option "MaxTapMove" "110"
    Option "FingerHigh" "15"
    Option "VertScrollDelta" "20"
    Option "CircularScrolling" "1"
    Option "RightEdge" "830"
    Option "AccelFactor" "0.3"
    Option "TopEdge" "120"
EndSection
EOF
