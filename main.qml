// PyQML. Created on 27.02.2016
// Copyright (c) 2015 Andreas Schulz
//
// The MIT License (MIT)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Window 2.1
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.2
import QmlController 1.0

//main window
ApplicationWindow {
    id: mainWindow
    visible: true
    width: 200
    height: 150
    title: "Python/Qml test"

    menuBar: MenuBar {
        Menu {
            title: "File"
            MenuItem {
                text: "Open"
                action: fileOpenAction
            }
        }
    }

    Button {
        id: pushButton
        text: "Push Me"
        anchors.verticalCenterOffset: -20
        anchors.centerIn: gridLayout
        onClicked: controller.logButton()
    }

    Switch {
        id: switchButton
        anchors.verticalCenterOffset: 20
        anchors.centerIn: gridLayout
        onPressedChanged: controller.logSwitch(checked)
    }

    Action {
        id: fileOpenAction
        text: "Open"
        shortcut: StandardKey.Open
    }

    FileDialog {
        id: fileOpenDialog
        title: "Please choose a file to open"
        nameFilters: ["Text files (*.txt)"]
        onAccepted: controller.logFileDialog()
    }

    GridLayout {
        id: gridLayout
        x: 0
        y: 0
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
    }

    QmlController {
        id: controller
    }
}
