
# Speaking alarm clock using Raspberry Pi
#Connect 3.5" LCD and speaker though AUX and run the program with PyQt4 and espeak packages
# Program by: B.Aswinth Raj
# Website: circuitdigest.com
#
# GUI code was created using Qt Designer 
import sys
import time
from PyQt4 import QtCore, QtGui #PyQt4 is used for designing the GUI
from espeak import espeak #text to speech sonversion
from time import strftime # To get time from Raspberry pi
#Code from Qt Designer
try:
    _fromUtf8 = QtCore.QString.fromUtf8
except AttributeError:
    def _fromUtf8(s):
        return s
try:
    _encoding = QtGui.QApplication.UnicodeUTF8
    def _translate(context, text, disambig):
        return QtGui.QApplication.translate(context, text, disambig, _encoding)
except AttributeError:
    def _translate(context, text, disambig):
        return QtGui.QApplication.translate(context, text, disambig)
class Ui_MainWindow(object):
    def setupUi(self, MainWindow):
        self.alarm_h = 0
        self.alarm_m = 0
        
        MainWindow.setObjectName(_fromUtf8("MainWindow"))
        MainWindow.resize(676, 439)
        
        self.centralwidget = QtGui.QWidget(MainWindow)
        self.centralwidget.setObjectName(_fromUtf8("centralwidget"))
        self.gridLayout = QtGui.QGridLayout(self.centralwidget)
        self.gridLayout.setObjectName(_fromUtf8("gridLayout"))
        self.label = QtGui.QLabel(self.centralwidget)
        
        font = QtGui.QFont()
        font.setPointSize(14)
        self.label.setFont(font)
        self.label.setObjectName(_fromUtf8("label"))
        self.gridLayout.addWidget(self.label, 3, 0, 1, 1)
        
        self.Time_LCD = QtGui.QLCDNumber(self.centralwidget)
        self.Time_LCD.setObjectName(_fromUtf8("Time_LCD"))
        self.Time_LCD.setDigitCount(8)
        self.Time_LCD.display(strftime("%H"+":"+"%M"+":"+"%S")) #get time from Pi and display it 
        self.gridLayout.addWidget(self.Time_LCD, 1, 0, 1, 3)
        self.timer = QtCore.QTimer(MainWindow)
        self.timer.timeout.connect(self.Time)
        self.timer.start(1000)
        
        current_time = QtCore.QTime()
        self.Set_Time = QtGui.QTimeEdit(self.centralwidget)
        self.Set_Time.setObjectName(_fromUtf8("Set_Time"))
        self.Set_Time.setTime(current_time.currentTime())
        self.gridLayout.addWidget(self.Set_Time, 2, 0, 1, 1)
        
        self.pushButton = QtGui.QPushButton(self.centralwidget)
        self.pushButton.setObjectName(_fromUtf8("pushButton"))
        self.pushButton.clicked.connect(self.button_pressed)
        self.gridLayout.addWidget(self.pushButton, 2, 1, 1, 1)
        MainWindow.setCentralWidget(self.centralwidget)
        
        self.menubar = QtGui.QMenuBar(MainWindow)
        self.menubar.setGeometry(QtCore.QRect(0, 0, 676, 21))
        self.menubar.setObjectName(_fromUtf8("menubar"))
        MainWindow.setMenuBar(self.menubar)
        
        self.statusbar = QtGui.QStatusBar(MainWindow)
        self.statusbar.setObjectName(_fromUtf8("statusbar"))
        MainWindow.setStatusBar(self.statusbar)
        self.retranslateUi(MainWindow)
        QtCore.QMetaObject.connectSlotsByName(MainWindow)
#End of code from Qt Designer
        
    def retranslateUi(self, MainWindow): #update the GUI window 
        print("Dispay Re-translated")
        MainWindow.setWindowTitle(_translate("MainWindow", "MainWindow", None))
        self.label.setText(_translate("MainWindow", "Alarm curretly Turned off", None))
        self.pushButton.setText(_translate("MainWindow", "Set Alarm", None))
    
    def Time(self): #Function to compare current time with set time 
        self.Time_LCD.display(strftime("%H"+":"+"%M"+":"+"%S"))
        self.current_h = int (strftime("%H"))
        self.current_m = int (strftime("%M"))
        if (self.current_h == self.alarm_h) and (self.current_m == self.alarm_m) and ((int(strftime("%S"))%15) == 0): #if the both time match 
            print("ALARM ON!!!!!")
            
            message1 = " The time is " + str(self.alarm_h) + " : " + str(self.alarm_m) + " on " + strftime("%A")
            message = "Sir, Good morning.. This is your wake up Alarm." + message1
  
            self.label.setText(_translate("MainWindow",message1, None)) #display the message on GUI screen  
            espeak.synth (message) #speak the message through audio jack 
            time.sleep(1)
            
            
    def button_pressed(self): #when set alarm button is pressed 
        print("Button Pressed")
        alarm_time = str(self.Set_Time.time())
        
        self.alarm_h = int(alarm_time[19:21]) #value of hour is sotred in index value 19 and 20
        self.alarm_m = int (alarm_time[23:25]) #value of minute is sotred in index value 23 and 24
        message = "Alarm is set at " + str(self.alarm_h) + " hours " + str(self.alarm_m) + " minutes"
        self.label.setText(_translate("MainWindow", message, None)) #display the message on GUI screen  
        espeak.synth (message) #speak the message through audio jack 
        
if __name__ == "__main__": #main function 
    
    app = QtGui.QApplication(sys.argv)
    MainWindow = QtGui.QMainWindow()
    ui = Ui_MainWindow()
    ui.setupUi(MainWindow)
    MainWindow.show()
    sys.exit(app.exec_())
