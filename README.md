# Prak2_Probstat2023_C_5025211159
Victor Gustinova

5025211159

# Soal1
## 1a

``` R
data1 = data.frame(Responden=c(1:9),
                  x =c(78,75,67,77,70,72,78,70,77),
                  y = c(100,95,70,90,90,90,89,100,100))
print(data1)
dif= data1$y - data1$x
print(dif)
sd(dif)
```
Pertama data disimpan menggunakan data.frame(). Untuk mendapatkan dif maka data y dikurangi oleh data x dan diassign ke suatu variabel dif. Menggunakan sd() maka dapat dicari standar deviasi dari dif. Didapatkan standar deviasi bernilai 7.838651

![image](https://github.com/VictorGstn/Prak2_Probstat2023_C_5025211159/assets/125529445/c19f8ec5-333f-42bc-93e8-3a7df1e9a759)

## 1b

```R
library(BSDA)
t.test(dif, alternative = "two.sided")
```
Menggunakan library BSDA maka pada nilai dif akan dilakukan uji t. Didapatkan hasil berikut:

![image](https://github.com/VictorGstn/Prak2_Probstat2023_C_5025211159/assets/125529445/2021e603-3f66-4ca8-adf7-87c87cdb0adb)

Didapatkan p-value = 0.0001373

## 1c
p-value yang didapatkan lebih kecil dari 𝛼 (0.05) sehingga H0 ditolak dan dapat dikatakan bahwa "ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen sebelum dan sesudah
melakukan aktivitas 𝐴”.

# Soal2
## 2a
Saya tidak setuju dengan klaim tersebut. Walaupun mean populasi lebih dari 25000 masih termasuk dalam rentang sampel, mengingat bahwa mean sampel adalah 23500 dan memiliki standar deviasi 3000, perbedaan dari 23500 ke 25000 cukup banyak. Jika hipotesis ini dibandingkan dengan rentang hipotesis alternatifnya maka kemungkinan benar hipotesis alternatif lebih besar.

## 2b
H0 : mean >= 25.000
H1 : mean < 25.000
```R
zsum.test(mean.x=23500, sigma.x = 3000, n.x = 100,  
          alternative = "less", mu = 25000,
          conf.level = 0.05)
```
Menggunakan uji z maka didapatkan p-value bernilai 2.867e-07 atau 0.0000002687. Berdasarkan hasil tersebut maka dapat dikatakan bahwa H0 ditolak dan H1 dapat diterima. Sehingga mobil dikemudikan rata-rata kurang dari 25.000 kilometer per tahun. 

![image](https://github.com/VictorGstn/Prak2_Probstat2023_C_5025211159/assets/125529445/533cf06a-67b4-4db0-8903-a552a4f8012a)

# Soal3

## 3a

H0 : mean Badung = mean Bali

H1 : mean Badung != mean Bali

## 3b
Sampel statistik telah diberikan yakni

| Nama Kota/Atribut  | Badung | Bali |
| ------------- | ------------- | -------------
| Jumlah Saham  | 20  | 27 |
| Sampel Mean  | 3.64 | 2.79 |
| Sampel Standar Deviasi  | 1.67 | 1.5 |

## 3c
Perhitungan menggunakan uji t karena n = 20 (<30). 
```R
tsum.test(mean.x=3.64, s.x = 1.67, n.x =20 , 
          mean.y =2.79 , s.y = 1.5,
          n.y = 27, alternative =  "two.sided", 
           var.equal = TRUE,
          conf.level = 0.95)
```

![image](https://github.com/VictorGstn/Prak2_Probstat2023_C_5025211159/assets/125529445/859d4e57-c7fe-43cf-99ba-21b3155e2fe7)

Didapatkan p-value = 0.07381 dan t = 1.8304

## 3d
Nilai kritikal dihitung dengan qt(). 
```R
qt(p=.05/2, df=2, lower.tail=FALSE)
```
P dibagi dua karena merupakan two tailed sehingga nilai yang didapatkan ada dua yakni -4.302653 dan 4.302653.

## 3e
Berdasarkan nilai t yang berada pada area terima nilai kritikal dan p-value > 𝛼 maka H0 diterima.

## 3f
Kesimpulan yang diambil adalah tidak ada perbedaan rata-rata saham di Badung dengan saham di Bali


# Soal4

## 4a

```R
data <- read.csv("D:\\Downloads\\GTL.csv", header=TRUE, stringsAsFactors=FALSE)

library(ggpubr)

ggplot(data, aes(x = Glass, y = Temp, color = Light)) +
  geom_jitter(width = .02)
```
Data dibaca menggunakan read.csv() lalu menggunakan ggplot dari library ggpubr dibuat plot sehingga menghasilkan plot berikut.

![image](https://github.com/VictorGstn/Prak2_Probstat2023_C_5025211159/assets/125529445/a15d0814-c2d7-4503-b971-1b5e593cae97)

## 4b
```R
res <- aov(Light ~ Glass * Temp , data = data)

summary(res)
```
Uji anova dua arah dilakukan dengan fungsi aov() dan didapatkan summary nya menggunakan fungsi summary()

![image](https://github.com/VictorGstn/Prak2_Probstat2023_C_5025211159/assets/125529445/43837408-9528-40e9-88ec-693d6c4ed382)

## 4c
```R
library(dplyr)

data %>%
  group_by(Glass, Temp) %>%
  summarize(
    mean = mean(Light),
    sd = sd(Light)
  )
```
Untuk menghitung mean dan standar deviasi dari sebuah tabel dan dikelompokkan berdasarkan dua kolom maka dapat digunakan library(dplyr). Nilai yang dicari adalah Light dan akan di group berdasarkan Glass dan Temp. Hasil tabel adalah sebagai berikut:
![image](https://github.com/VictorGstn/Prak2_Probstat2023_C_5025211159/assets/125529445/d5108d7e-5965-4a28-9603-39e0100de16f)
