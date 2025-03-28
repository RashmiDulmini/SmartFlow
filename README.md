# SmartFlow - IoT-Enabled Smart Water Faucet System

SmartFlow is an IoT-enabled smart water monitoring system that integrates a **water flow sensor** with a **Flutter-based mobile application**. This system tracks water consumption in real-time, providing insights into daily usage and allowing users to monitor consumption trends.

## 🚀 Features

- 📊 **Real-time Water Flow Monitoring** - Displays the water flow rate and volume.
- 🔍 **Daily & Historical Data Tracking** - Logs daily water usage and trends over time.
- 📈 **Graphical Visualization** - View water consumption in a user-friendly chart.
- 🌐 **IoT Integration** - Uses NodeMCU (ESP8266) for data transmission.
- 📱 **Flutter-based Mobile App** - User-friendly UI to track water usage.


## 🛠️ Tech Stack

### **Frontend (Mobile App)**
- **Flutter** - For building the UI and data visualization.
- **Dart** - Primary programming language for the mobile app.

### **Backend & IoT**
- **NodeMCU ESP8266** - Microcontroller to process water flow data.
- **Firebase** - Cloud-based storage for real-time data syncing.
- **C++ (Arduino IDE)** - For programming the ESP8266.

### **Hardware Components**
- **Water Flow Sensor (YF-S201/YF-S401)** - Measures flow rate and total consumption.
- **NodeMCU ESP8266** - Handles Wi-Fi communication and processing.
- **Pipes & Valves** - Water supply integration.

## 🔧 Installation Guide

### 1️⃣ **Setup NodeMCU with Water Flow Sensor**
- Connect the flow sensor’s **VCC** to **3.3V**, **GND** to **GND**, and **Signal** to **D2 (GPIO4)** on NodeMCU.
- Install **Arduino IDE** and add the **ESP8266 Board Manager**.
- Flash the firmware to NodeMCU with appropriate sensor handling code.

### 2️⃣ **Deploy Firebase for Data Storage**
- Set up a Firebase project.
- Enable **Realtime Database** and configure read/write permissions.
- Add Firebase dependencies to the Flutter project.

### 3️⃣ **Run the Flutter App**
```sh
# Clone the repository
git clone https://github.com/RashmiDulmini/SmartFlow
cd SmartFlow

# Install dependencies
flutter pub get

# Run the app on an emulator or physical device
flutter run
```

---
### 👨‍💻 Developed by [Rashmi Dulmini]

