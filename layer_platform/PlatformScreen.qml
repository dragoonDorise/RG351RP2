import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.11
import "../utils.js" as Utils
import "qrc:/qmlutils" as PegasusUtils
//import QtQml 2.0

FocusScope
{
    id: root

    Item
    {
        id: platformScreenContainer
        width: parent.width
        height: parent.height
        

        /*onVisibleChanged: {
            platformSwitcher.focus = true;
        }*/

        Item {
        id: topbar
            opacity:0
            
            height: Math.round(platformMarginTop)
            anchors {
                left: parent.left; leftMargin: vpx(60)
                right: parent.right; rightMargin: vpx(60)
                top: parent.top; topMargin: Math.round(headerMarginTop)
            }

            // Top bar
            Image
            {
                id: profileIcon
                anchors
                {
                    top: parent.top;
                    left: parent.left;
                }
                width: Math.round(headerLogo)
                height: width
                source: "../assets/images/profile_icon.png"
                sourceSize { width: 128; height:128 }
                smooth: true
                antialiasing: true
            }

            DropShadow {
                id: profileIconShadow
                anchors.fill: profileIcon
                horizontalOffset: 0
                verticalOffset: 0
                radius: 6.0
                samples: 6
                color: "#1F000000"
                source: profileIcon
            }

            Text
            {
                id: sysTime

                function set() {
                    sysTime.text = Qt.formatTime(new Date(), "hh:mm")
                }

                Timer {
                    id: textTimer
                    interval: 60000 // Run the timer every minute
                    repeat: true
                    running: true
                    triggeredOnStart: true
                    onTriggered: sysTime.set()
                }

                anchors {
                    verticalCenter: profileIcon.verticalCenter;
                    right: parent.right
                }
                color: theme.text
                font.pixelSize: Math.round(headerTime)
                horizontalAlignment: Text.Right
            }
        }

        

        // Platform menu
        PlatformBar
        {
            id: platformSwitcher
            anchors 
            {
                left: parent.left;
                right: parent.right
                top: topbar.bottom;
            }
            height: Math.round(platformBox)
            width: 640
            focus: true
            
        }

        // Button menu
        /*RowLayout {
            id: buttonMenu
            spacing: vpx(22)

            anchors { 
                top: platformSwitcher.bottom;
                bottom: parent.bottom
            }
            
            x: parent.width/2 - buttonMenu.width/2

            MenuButton {
                id: themeButton
                width: vpx(86); height: vpx(86)

                onClicked: { 
                    focus = true;
                    platformSwitcher.focus = false;
                }
            }

            MenuButton {
                id: systemButton
                width: vpx(86); height: vpx(86)

                onClicked: { 
                    focus = true;
                    platformSwitcher.focus = false;
                }
            }
        }//*/
    }    
}
