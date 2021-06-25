clc;clear; %untuk membersihkan jendela command windows

data = xlsread('Real estate valuation data set.xlsx','C2:E51'); %mengambil data dari kolom 3 sampai 5
%number of convenience stores
data1 = xlsread('Real estate valuation data set.xlsx','H2:H51'); %mengambil data kolom 8

x = [data data1];%rating kecocokan dari masing-masing alternatif
k = [0,0,1,0];%Atribut tiap-tiap kriteria, dimana nilai 1=atrribut keuntungan, dan 0= atribut biaya
w = [3,5,4,1];%Nilai bobot tiap kriteria (1= sangat buruk, 2=buruk, 3=cukup, 4= tinggi, 5= sangat tinggi)

%tahapan pertama, perbaikan bobot
[m,n]=size (x); %inisialisasi ukuran x
w=w./sum(w); %membagi bobot per kriteria dengan jumlah total seluruh bobot
%tahapan kedua, melakukan perhitungan vektor(S) per baris (alternatif)
for j=1:n
if k(j)==0, w(j)=-1*w(j);
end
end
for i=1:m
S(i)=prod(x(i,:).^w);
end
%tahapan ketiga, proses perangkingan
V= S/sum(S)

Vtranspose=V.';
x2 = xlsread('Real estate valuation data set.xlsx','A2:A51');
x2=x2(1:50,:);
x2=[x2 Vtranspose];
x2=sortrows(x2,-2);
x2 = x2(1:5,1);

disp ('Nomor Real Estate yang menjadi alternatif terbaik untuk investasi jangka panjang adalah =')
disp (x2)