#!/usr/bin/env python3
#
# PyQML. Created on 27.02.2016
# Copyright (c) 2015 Andreas Schulz
#
# The MIT License (MIT)
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import sys

from PyQt5.QtCore import QObject, QUrl, pyqtSlot
from PyQt5.QtWidgets import QApplication
from PyQt5.QtQml import qmlRegisterType, QQmlApplicationEngine


# This is the type that will be registered with QML.
# It must be a sub-class of QObject.
class QmlController(QObject):
    def __init__(self, parent=None):
        super(QObject, self).__init__(parent)
        self.lastSwitchedState = False
    @pyqtSlot()
    def logButton(self):
        print('Pressed')

    @pyqtSlot()
    def logFileDialog(self):
        print('File selected')

    @pyqtSlot('bool')
    def logSwitch(self, state):
        if self.lastSwitchedState is state:
            return
        self.lastSwitchedState = state
        if state:
            print('Switch on')
        else:
            print('Switch off')


def main(argv=None):
    if not argv:
        argv = sys.argv

    app = QApplication(argv)

    # register own type
    qmlRegisterType(QmlController, 'QmlController', 1, 0, 'QmlController')

    engine = QQmlApplicationEngine(app)
    engine.load(QUrl('main.qml'))

    return app.exec_()


if __name__ == '__main__':
    sys.exit(main())
