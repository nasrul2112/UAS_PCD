clc; clear; close all; warning off all;

%memmangil menu "browse file"
[nama_file,nama_folder] = uigetfile('*.jpg');

%jika ada nama file yg dipilih maka akan mengeksekusi perintahh di bawah

if ~isequal(nama_file,0)
    %membaca file citra rgb
    img =im2double(imread(fullfile(nama_folder,nama_file)));
    %mengkonversi citra rgb menjadi citra grayscale
    img_gray= rgb2gray(img);
   % figure, imshow(img)
    %figure, imshow(img_gray)
    %mengkonversi citra grayscale menjadi citra biner
    bw = imbinarize(img_gray);
    %figure, imshow(bw)
    %melakukan oprasi komplemen
    bw = imcomplement(bw);
    figure,imshow(bw)
    %melakukan operasi morfologi untuk menyempurnakan hasil segmentasi
    %1. filling holse
    bw = imfill(bw,'holes');
    %figure, imshow(bw)
    % 2. Area opening
    bw = bwareaopen(bw,100);
    %figure, imshow(bw)
    %eksraksi ciri warna rgb
    R = img(:,:,1);
    G = img(:,:,2);
    B = img(:,:,3);
    R(~bw) = 0;
    G(~bw) = 0;
    B(~bw) = 0;
%    RGB = cat(3,R,G,B);
%    figure,imshow(RGB)
    Red = sum(sum(R))/sum(sum(bw));
    Green = sum(sum(G))/sum(sum(bw));
    Blue = sum(sum(B))/sum(sum(bw));
   
    %penyusunan varibel ciri_uji
    ciri_uji = [Red,Green,Blue];
    
    %memanggil model k-nn hasil pelatihan
    load Mdl

    %membaca kelas keluaran hasil pengujian
    hasil_uji = predict(Mdl,ciri_uji);
    
    %menampilkan citra asli dan kelas keluaran hasil pengujian
    figure, imshow(img)
    title({['Nama File: ',nama_file],['kelas keluaran; ',hasil_uji{1}]})
else
    %jika tidak ada nama file yg di pilih maka akan kembali
    return
end
