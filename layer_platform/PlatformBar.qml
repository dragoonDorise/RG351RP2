import QtQuick 2.8
import "../global"
import "../utils.js" as Utils
import "qrc:/qmlutils" as PegasusUtils


ListView {
    id: platformLayout
    //anchors.fill: parent
    spacing: vpx(14)
    orientation: ListView.Horizontal

    displayMarginBeginning: vpx(107)
    displayMarginEnd: vpx(107)

    preferredHighlightBegin: vpx(0)
    preferredHighlightEnd: vpx(1077)
    highlightRangeMode: ListView.StrictlyEnforceRange // Highlight never moves outside the range
    snapMode: ListView.SnapToItem
    highlightMoveDuration: 200
    highlightMoveVelocity: -1
    keyNavigationWraps: true

    onCurrentIndexChanged: {
      //navSound.play()
      return;
    }

    Keys.onLeftPressed: {  decrementCurrentIndex(); navSound.play(); }
    Keys.onRightPressed: {  incrementCurrentIndex(); navSound.play();  }

    function gotoSoftware()
    {
            jumpToCollection(currentIndex);
            showSoftwareScreen();
    }

    Keys.onPressed: {
         if (api.keys.isAccept(event) && !event.isAutoRepeat) {
            event.accepted = true;
            gotoSoftware();
        }

    }

    model: allCollections
    delegate: platformBarDelegate

    Component {
        id: platformBarDelegate
        Rectangle {
            id: wrapper
            property bool selected: ListView.isCurrentItem

            width: platformLayout.width//vpx(256)
            height: platformLayout.height//vpx(256)
            color: "red"



            Image {
                id: eslogo
                width: 640
                height: 480
                smooth: true
                fillMode: Image.PreserveAspectFit
                source: "../assets/images/logos-es/" + Utils.processPlatformName(modelData.shortName) + ".jpg"
                asynchronous: true
                sourceSize { width: 640; height: 480 }
            }


            Canvas {
                id: leftGradient
                // canvas size
                width: 640; height: 480;
                opacity:0.8
                // handler to override for drawing
                onPaint: {
                    // get context to draw with
                    var ctx = getContext("2d")
                    var gradient = ctx.createLinearGradient(100,0,100,200)
                    gradient.addColorStop(0, "black")
                    gradient.addColorStop(0.5, "black") 
                    // setup the fill
                    ctx.fillStyle = gradient
                    ctx.fillRect(50,50,100,100)
                    // begin a new path to draw
                    ctx.beginPath()
                    // top-left start point
                    ctx.moveTo(0,0)
                    // upper line
                    ctx.lineTo(285,0)
                    // right line
                    ctx.lineTo(85,480)
                    // bottom line
                    ctx.lineTo(0,480)
                    // left line through path closing
                    ctx.closePath()
                    // fill using fill style
                    ctx.fill()
                }
            }
            
            Canvas {
                id: rightGradient
                // canvas size
                width: 640; height: 480
                // handler to override for drawing
                opacity:0.8
                onPaint: {
                    // get context to draw with
                    var ctx = getContext("2d")
                    var gradient = ctx.createLinearGradient(100,0,100,200)
                    gradient.addColorStop(0, "black")
                    gradient.addColorStop(0.5, "black") 
                    // setup the fill
                    ctx.fillStyle = gradient
                    ctx.fillRect(50,50,100,100)
                    // begin a new path to draw
                    ctx.beginPath()
                    // top-left start point
                    ctx.moveTo(515,0)
                    // upper line
                    ctx.lineTo(640,0)
                    // right line
                    ctx.lineTo(640,480)
                    // bottom line
                    ctx.lineTo(315,480)
                    // left line through path closing
                    ctx.closePath()
                    // fill using fill style
                    ctx.fill()
                }
            }            
            

            Image {
                id: logo
                width: 240
                        
                smooth: true
                fillMode: Image.PreserveAspectFit
                source: "../assets/images/logos/" + Utils.processPlatformName(modelData.shortName) + ".png"
                asynchronous: true
                // anchors.centerIn: parent
                  anchors {
                    top: parent.verticalCenter
                    right: vpx(15)
                    rightMargin: vpx(5)
                  }
                antialiasing: true
                sourceSize { width: 100; height:100}
            }
            

            MouseArea {
                anchors.fill: wrapper
                hoverEnabled: true
                onEntered: {}
                onExited: {}
                onClicked: {
                    if (selected)
                    {
                        gotoSoftware();
                    }
                    else
                        platformLayout.currentIndex = index
                }
            }

//             Text {
//                 id: platformTitle
//                 text: modelData.name
//                 color: theme.accent
//                 font.family: titleFont.name
//                 font.pixelSize: Math.round(selectedPlatformTitle)
//                 elide: Text.ElideRight
// 
//                 anchors {
//                     horizontalCenter: eslogo.horizontalCenter
//                     bottom: eslogo.top; bottomMargin: Math.round(platformBubbleBottom)
//                 }
// 
//                 opacity: wrapper.ListView.isCurrentItem ? 1 : 0
//                 Behavior on opacity { NumberAnimation { duration: 75 } }
//             }

//             HighlightBorder
//             {
//                 id: highlightBorder
//                 width: parent.width + vpx(18)//vpx(274)
//                 height: width//vpx(274)
// 
//                 x: vpx(-9)
//                 y: vpx(-9)
//                 z: -1
// 
//                 selected: wrapper.ListView.isCurrentItem
//             }

        }
    }


}

