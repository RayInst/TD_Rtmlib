# TD_Rtmlib
Rtmlib Det/Pose model in Touchdeisgner

<img width="1617" height="758" alt="081d193f-4f07-45ad-8c04-e9726ca223c6" src="https://github.com/user-attachments/assets/278ab320-70f8-4e82-8015-deb816e19d1f" />

Quick Start

1. Get Model Files
Download the pre-trained ONNX models:
Google Drive Model Package
Extract the downloaded ZIP file
Place all model files into the models/ folder in your project directory

2. Windows Setup (CUDA & cuDNN)
For NVIDIA GPU acceleration:
Install CUDA 12.2 (use Express Install)
Install cuDNN 9.21.1
Download cuDNN 9.21.1 ZIP from NVIDIA Developer
Copy bin, include, lib folders into your CUDA 12.2 install directory
Default path: C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.2

3. Install Python Dependencies

Double-click to run the installation script:
install_rtmlib.bat

4. Launch the Project
Open rtmlib-Demo.toe in TouchDesigner 2025.

Requirements
TouchDesigner 2025.32460+
Windows: NVIDIA GPU + CUDA 12.2 + cuDNN 9.21.1
Python 3.11 (built into TouchDesigner)

