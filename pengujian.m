clc; clear; close all; warning off all;

%%% Mangga matang
% membaca file citra
nama_folder = 'dataset/data uji/mangga matang';
nama_file = dir(fullfile(nama_folder,'*.jpg'));
jumlah_file = numel(nama_file);

%menginisialisasi variabel ciri_matang dan target matang
ciri_matang = zeros(jumlah_file,3);
target_matang = cell(jumlah_file,1);

%melakukan pengolahan citra terhadap seluruh file
for n = 1:jumlah_file
    %membaca file citra rgb
    img =im2double(imread(fullfile(nama_folder,nama_file(n).name)));
    %mengkonversi citra rgb menjadi citra grayscale
    img_gray= rgb2gray(img);
    %figure, imshow(img)
    %figure, imshow(img_gray)
    %mengkonversi citra grayscale menjadi citra biner
    bw = imbinarize(img_gray);
%    figure, imshow(bw)
    %melakukan oprasi komplemen
    bw = imcomplement(bw);
%    figure,imshow(bw)
    %melakukan operasi morfologi untuk menyempurnakan hasil segmentasi
    %1. filling holse
    bw = imfill(bw,'holes');
%    figure, imshow(bw)
    % 2. Area opening
    bw = bwareaopen(bw,100);
%   figure, imshow(bw)
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
    %mengisi ciri_matang dengan ciri hasil ekstralsi
    ciri_matang(n,1) = Red;
    ciri_matang(n,2) = Green;
    ciri_matang(n,3) = Blue;
    %mengisi variabel target matang dengan nama kelas mangga matang
    target_matang{n} = 'mangga matang';
    
end


%%% Mangga cukup cukupmatang
% membaca file citra
nama_folder = 'dataset/data uji/mangga cukup matang';
nama_file = dir(fullfile(nama_folder,'*.jpg'));
jumlah_file = numel(nama_file);

%menginisialisasi variabel ciri_cukup matang dan target cukupmatang
ciri_cukupmatang = zeros(jumlah_file,3);
target_cukupmatang = cell(jumlah_file,1);

%melakukan pengolahan citra terhadap seluruh file
for n = 1:jumlah_file
    %membaca file citra rgb
    img =im2double(imread(fullfile(nama_folder,nama_file(n).name)));
    %mengkonversi citra rgb menjadi citra grayscale
    img_gray= rgb2gray(img);
    %figure, imshow(img)
    %figure, imshow(img_gray)
    %mengkonversi citra grayscale menjadi citra biner
    bw = imbinarize(img_gray);
%    figure, imshow(bw)
    %melakukan oprasi komplemen
    bw = imcomplement(bw);
%    figure,imshow(bw)
    %melakukan operasi morfologi untuk menyempurnakan hasil segmentasi
    %1. filling holse
    bw = imfill(bw,'holes');
%    figure, imshow(bw)
    % 2. Area opening
    bw = bwareaopen(bw,100);
%   figure, imshow(bw)
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
    %mengisi ciri_cukup matang dengan ciri hasil ekstralsi
    ciri_cukupmatang(n,1) = Red;
    ciri_cukupmatang(n,2) = Green;
    ciri_cukupmatang(n,3) = Blue;
    %mengisi variabel target cukup matang dengan nama kelas mangga cukupmatang
    target_cukupmatang{n} = 'mangga cukup matang';
    
end


%%% Mangga mentah
% membaca file citra
nama_folder = 'dataset/data uji/mangga mentah';
nama_file = dir(fullfile(nama_folder,'*.jpg'));
jumlah_file = numel(nama_file);

%menginisialisasi variabel ciri_mentah dan target mentah
ciri_mentah = zeros(jumlah_file,3);
target_mentah = cell(jumlah_file,1);

%melakukan pengolahan citra terhadap seluruh file
for n = 1:jumlah_file
    %membaca file citra rgb
    img =im2double(imread(fullfile(nama_folder,nama_file(n).name)));
    %mengkonversi citra rgb menjadi citra grayscale
    img_gray= rgb2gray(img);
    %figure, imshow(img)
    %figure, imshow(img_gray)
    %mengkonversi citra grayscale menjadi citra biner
    bw = imbinarize(img_gray);
%    figure, imshow(bw)
    %melakukan oprasi komplemen
    bw = imcomplement(bw);
%    figure,imshow(bw)
    %melakukan operasi morfologi untuk menyempurnakan hasil segmentasi
    %1. filling holse
    bw = imfill(bw,'holes');
%    figure, imshow(bw)
    % 2. Area opening
    bw = bwareaopen(bw,100);
%   figure, imshow(bw)
    %eksraksi ciri warna rgb
    R = img(:,:,1);
    G = img(:,:,2);
    B = img(:,:,3);
    R(~bw) = 0;
    G(~bw) = 0;
    B(~bw) = 0;
%    RGB = cat(3,R,G,B);
 %   figure,imshow(RGB)
    Red = sum(sum(R))/sum(sum(bw));
    Green = sum(sum(G))/sum(sum(bw));
    Blue = sum(sum(B))/sum(sum(bw));
    %mengisi ciri_mentah dengan ciri hasil ekstralsi
    ciri_mentah(n,1) = Red;
    ciri_mentah(n,2) = Green;
    ciri_mentah(n,3) = Blue;
    %mengisi variabel target mentah dengan nama kelas mangga mentah
    target_mentah{n} = 'mangga mentah';
    
end

%menyususn variabel ciri_latih dan target_latih
ciri_uji = [ciri_matang;ciri_cukupmatang;ciri_mentah];
target_uji = [target_matang;target_cukupmatang;target_mentah];

%memanggil model k-nn hasil pelatihan
load Mdl

%membaca kelas keluaran hasil pengujian
hasil_uji = predict(Mdl,ciri_uji);

%menghitung akurasi pelatihan
jumlah_benar = 0;
jumlah_data = size(ciri_uji,1);
for k = 1:jumlah_data
    if isequal(hasil_uji{k},target_uji{k})
        jumlah_benar = jumlah_benar+1;
    end
end

akurasi_pelatihan = jumlah_benar/jumlah_data*100;


