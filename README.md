# signalProcessing
# Discrete Fourier Transform

This Project was completed for signl processing class. 

What we did in the project?
1. Used the audioread() MATLAB command to provide the sampling frequency Fs of the file and read the contents of ‘noisyaudio.wav’ into an array.
2. Used MATLAB fft() command to find the DFT of the audio sample. 
3. Formed a frequency axis for plotting the DFT.  It was the same number of elements as the input audio sample and span from -Fs/2 to Fs/2. 
4. Plotted the magnitude (abs) of the DFT vs frequency with 𝜔=0 at the center of the plot.  This was accomplished using the fftshift() command.  The plot  showed energy in the speech frequencies from about 100 Hz to 2 kHz.  The plot also showed significant high-frequency noise from about 2.5 kHz to 5.5 kHz.  Next, the goal was to design a filter that will remove this high-frequency noise occurring above 2.5 kHz, while having minimal impact on the speech frequencies up to around 2 KHz.
5. Plotted the normalized log plot of the DFT, where the max value of the DFT was 0 dB. 


Tools Used:
Matlab

How to read through the project?
1. Download Matlab
2. Download noisyaudio.wav
3. Keep them in the same folder.
4. Run projectSignal.m file.

