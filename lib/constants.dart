 import 'package:flutter/material.dart';
import 'package:gozel_islam/screens/menu_pages/books/book_screen.dart';
import 'package:gozel_islam/screens/menu_pages/books/book_tile.dart';
import 'package:gozel_islam/screens/menu_pages/filmler_screen/movie_tile.dart';
import 'package:gozel_islam/screens/menu_pages/ilahiler_screen/ilahiler_tile.dart';
import 'package:gozel_islam/screens/menu_pages/links/link_tile.dart';

const appBarColor = Colors.red;

const daylyTopic = """Sual: Peyğəmbərlərin, övliyanın və ya kafirlərin, yaxud heyvanların rəsmlərini çəkmək haramdır?

CAVAB

İstər hörmət etmək, istər təhqir etmək üçün olsun, istər böyük olsun, istər kiçik olsun, istər insan, istər heyvan rəsmi olsun, canlı rəsm çəkmək və heykəl düzəltmək haramdır,  böyük günahdır. Hədisi-şəriflərdə buyurulur ki:

“Canlı rəsmi çəkənə, qiyamətdə “çəkdiyin rəsmə can ver” deyə əzab olunar.” (Müslim)

“Dünyada (zərurətsiz) canlı rəsmi çəkənə, qiyamətdə bu rəsmə can verməsi  söylənərək əzab edilər. Halbuki o, rəsmə can verə bilməz.” (Nəsai)

“Canlı rəsmi çəkən, qiyamətdə ən şiddətli əzab görəcəkdir.” (Buxari)

“Canlı rəsmi çəkərək Allahu təalanın yaratdıqlarına bənzətməyə çalışanlar, qiyamətdə ən şiddətli əzaba uğrayarlar.” (Buxari, Müslim)

“Ya Əli, bütləri, rəsmləri məhv et.” (Müslim)

“Əlinizə keçən canlı rəsmlərini cırıb, pozun.”  (Müslim)

“Rəsm, cünub və it olan otağa rəhmət mələkləri girməz.” (Əbu Davud, Nəsai, İbni Hibban)

“Köpək və heykəl olan otağa rəhmət mələkləri girməz.” (Müslim)

“Cəbrayıl əleyhissəlam “Biz, köpək və rəsm olan otağa girmərik” dedi.” (Buxari, Tabərani)

“Məni aləmlərə rəhmət olaraq göndərən Allahu təala çalğıları, cahiliyyət işlərini və bütləri yox etməyimi əmr etdi.” (Əbu Nuaym)

“(Zərurətsiz) canlı rəsmi çəkənlərin yeri cəhənnəmdir. Axirətdə çəkilən rəsmlərə can veriləcək, o rəsmi çəkənlərə Cəhənnəmdə əzab verəcəkdir.” (Buxari, Müslim)

Rəsulullah, canlı rəsmi çəkənləri lənətlədi. (Buxari)

İsəvi dinində Əflatun fəlsəfəsi və Romalıların bütpərəstliyi qarışaraq, rəsmlərdə, heykəllərdə, ilahlıq sifətləri (Əbədi var olmaq, hər istədiyini edə bilmək, öldürmək, diriltmək, şəfa vermək, qeybləri bilmək xüsusiyyəti) olduğuna inandılar. Belə olduqlarına inanılan rəsmlərə, heykəllərə büt deyilir. Bunlar Allahu təalaya ortaq edilmiş olur. Bunlara hörmət etməyə tapınmaq deyilir. Tapınma işinə də şirk deyilir.""";

 var esmaTileListe = [
   "ALLAH cəllə cəlalühü.", "Ər-Rahmən","Ər-Rahim ", "Əl-Məlik","Əl-Quddus ","Əs-Səlam ","Əl-Mümin ","Əl-Mühəymin ","Əl-Aziz ","Əl-Cəbbar ","Əl-Mütəkəbbir ",
   "Əl-Xaliq ","Əl-Bari ","Əl-Musəvvir ","Əl-Qaffar ","Əl-Kahhar ","Əl-Vəhhab ","Ər-Rəzzak ","Əl-Fəttah ","Əl-Alim ","Əl-Kabıd ","Əl-Basıt ",
   "Əl-Hafıd ","Ər-Rafi","Əl-Muiz","Əl-Muzil ","Es-Səmi ","Əl-Bəsir ","Əl-Hakəm ","Əl-Adl",
   "Əl-Lətif ",
   "Əl-Həbir ","Əl-Həlim ","Əl-Azim ","Əl-Qafur ","Əş-Şəkur ","Əl-Əliyy ","Əl-Kəbir ","Əl-Hafiz","Əl-Mukit ","Əl-Hasib ","Əl-Cəlil ","Əl-Kərim ","Ər-Rakib ",
   "Əl-Mücib","Əl-Vasi ","Əl-Hakim ","Əl-Vədud ","Əl-Məcid ","Əl-Bais ","Əş-Şəhid ","Əl-Haqq ","Əl-Vəkil ","Əl-Kaviyy ","Əl-Mətin ","Əl-Vəliyy ","Əl-Həmid ",
   "Əl-Muhsi","Əl-Mübdi","Əl-Muid","Əl-Muhyi","Əl-Mümit","Əl-Hayy" ,
   "Əl-Qayyum ","Əl-Vaacid ","Əl-Macid ","Əl-Vahid ","Əs-Saməd ","Əl-Qadir ","Əl-Müqtədir ","Əl-Müqəddim ","Əl-Muahhir ","Əl-Əvvəl ","Əl-Axir ","Əz-Zahir ","Əl-Batın ",
   "Əl-Vali ","Əl-Mütəali ","Əl-Bərr ","Ət-Təvvab ","Əl-Müntakim","Əl-Afüvv ","Ər-Rauf","Malikül-Mülk  ","Zül- Cəlal-i vəl-İkram","Əl-Muksıt ","Əl-Cami ","Əl-Qaniyy ",
   "Əl-Muğni","Əl-Mani","Əd-Dar ","Ən-Nafi ","Ən-Nur ",
   "Əl-Hadi", "Əl-Bədi", "Əl-Baki", "Əl-Varis", "Ər-Rəşid", "Əs-Sabur",
 ];

 var ilahiTileWidget = [
   IlahiTile(name: "Özler Dururum Mekkeyi!", subtitle: "Müziksiz İlahi", path: "https://www.youtube.com/watch?v=gyg5y492-bo", ),
   IlahiTile(name: "Sevdalıyım!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/x3lRu-lKcnM", ),
   IlahiTile(name: "Kervan!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/izlL5fDHH0c", ),
   IlahiTile(name: "Sevdim Seni Mabuduma", subtitle: "Müziksiz İlahi", path: "https://www.youtube.com/watch?v=V26oh-bAAQg&t=84s", ),
   IlahiTile(name: "Sevgi Baht Olmuş! ", subtitle: "Müziksiz İlahi", path: "https://youtu.be/B8EUCSYrWr4", ),
   IlahiTile(name: "Hâlimiz N’ola Mahşerde!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/8BUWDWTBu7g", ),
   IlahiTile(name: "Derman Arardım Derdime!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/RDNptEyg42I", ),
   IlahiTile(name: "Mevlam Sana Geliyorum!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/r47KxAYKK60", ),
   IlahiTile(name: "Elvedâ Ya Şehr-i Ramazân", subtitle: "Müziksiz İlahi", path: "https://youtu.be/s0dK5vDC79Y", ),
   IlahiTile(name: "Yalan Dünya!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/7fKmpvUa-Mg", ),
   IlahiTile(name: "Allah’ım Bizi Affet!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/WW3LtkpxVKE", ),
   IlahiTile(name: "Efendime! “Aleyhisselâm”", subtitle: "Müziksiz İlahi", path: "https://youtu.be/DxpqcRDC2ng", ),
   IlahiTile(name: "Açılsın da Yollar Sana Geleyim! ", subtitle: "Müziksiz İlahi", path: "https://youtu.be/5RGQnp99Dt0", ),
   IlahiTile(name: "O Güzel Medine’yi Bir Kez Göreyim! ", subtitle: "Müziksiz İlahi", path: "https://youtu.be/Uh1s-FCpHWM", ),
   IlahiTile(name: "Çaren Var Mı?", subtitle: "Müziksiz İlahi", path: "https://youtu.be/FP2VabCBtKY", ),
   IlahiTile(name: "Anlat Durma Efendimi! “Aleyhisselam”", subtitle: "Müziksiz İlahi", path: "https://youtu.be/N71g8gMawDk", ),
   IlahiTile(name: "Tende Canım Canda Cananımdır!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/2sE95u2jojw", ),
   IlahiTile(name: "Nice Ağlamayım", subtitle: "Müziksiz İlahi", path: "https://youtu.be/rRYJm_VX5TQ", ),
   IlahiTile(name: "Aşıkız Muhammed’e “Aleyhisselam”", subtitle: "Müziksiz İlahi", path: "https://youtu.be/fa5QxT-eKdc", ),
   IlahiTile(name: "Ağlaya Ağlaya Yollara Düştüm!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/IoPvePdUeAc", ),
   IlahiTile(name: "On Bir Aylık Yoldan Geldin!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/i2cQr6Yj6oo", ),
   IlahiTile(name: "İstiğfar Eyle!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/g9Ze9IHke8M", ),
   IlahiTile(name: "Hayâlin Önümde Parlak Ay Gibi!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/XadpuJAVYYs", ),
   IlahiTile(name: "Sana Geleyim!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/pi7w5i9oxGg", ),
   IlahiTile(name: "Ya İlahi", subtitle: "Müziksiz İlahi", path: "https://youtu.be/5A2l8T-Dhzk", ),
   IlahiTile(name: "A Sultanım Sen Var İken!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/Rz7e2mBMBiI", ),
   IlahiTile(name: "Nurundan Yâ Resulallah!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/Wjn5dzsWAAU", ),
   IlahiTile(name: "Ağlayı Ağlayı", subtitle: "Müziksiz İlahi", path: "https://youtu.be/v0pUxgZasJ8", ),
   IlahiTile(name: "A Sultanım Sen Var İken!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/Rz7e2mBMBiI", ),
   IlahiTile(name: "Enver Abimsin Benim!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/QsiS1lrHd2I", ),
   IlahiTile(name: "Deli Gönül!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/MD3en72uAwc", ),
   IlahiTile(name: "Peygamber Efendimiz “Aleyhisselâm” 3", subtitle: "Müziksiz İlahi", path: "https://youtu.be/RQbU2ClYSUE", ),
   IlahiTile(name: "Peygamber Efendimiz “Aleyhisselâm” 2", subtitle: "Müziksiz İlahi", path: "https://youtu.be/pNAqjcrT7Jg", ),
   IlahiTile(name: "Peygamber Efendimiz “Aleyhisselâm” 1", subtitle: "Müziksiz İlahi", path: "https://youtu.be/mZ_QUyNoCyo", ),
   IlahiTile(name: "Kimi Dosta Varır!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/Ijv6957wae8", ),
   IlahiTile(name: "Yakma Yâ Rabbî", subtitle: "Müziksiz İlahi", path: "https://youtu.be/fJG5AlFtQng", ),
   IlahiTile(name: "Kıl Beş Vakit Namâzı!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/4FanLht6bDo", ),
   IlahiTile(name: "Gönüller Yapmaya Geldim", subtitle: "Müziksiz İlahi", path: "https://youtu.be/RNYWxeapPYk", ),
   IlahiTile(name: "Yemen İllerinde Veysel Karâni", subtitle: "Müziksiz İlahi", path: "https://youtu.be/ZX9q1m8R2IA", ),
   IlahiTile(name: "Habibimiz Muhammed’in “aleyhisselam”", subtitle: "Müziksiz İlahi", path: "https://youtu.be/yHNQzJc02Lg", ),
   IlahiTile(name: "Yürü Gönlüm", subtitle: "Müziksiz İlahi", path: "https://youtu.be/PHS6onM-Gjg", ),
   IlahiTile(name: "26 Ekim’de Güneşimiz Batmıştı!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/3BfRjtjfS-0", ),
   IlahiTile(name: "Ya Rabbena “Celle Celâlühü”", subtitle: "Müziksiz İlahi", path: "https://youtu.be/OWrwsEyGkVA", ),
   IlahiTile(name: "Mevlid-i Şerif", subtitle: "Müziksiz İlahi", path: "https://youtu.be/ulKejYF0mzw", ),
   IlahiTile(name: "Şol Kâinat Olmadan", subtitle: "Müziksiz İlahi", path: "https://youtu.be/cXXNiaT8Uo04", ),
   IlahiTile(name: "Ey Gönül Tefekkür Eyle! ", subtitle: "Müziksiz İlahi", path: "https://youtu.be/cEW0KlG6a24", ),
   IlahiTile(name: "Bir Garipsin Şu Dünyada", subtitle: "Müziksiz İlahi", path: "https://youtu.be/bIUi08Y4aVY", ),
   IlahiTile(name: "Sordum Sarı Çiğdeme!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/_RZqeh6ueyk", ),
   IlahiTile(name: "Hayâlin Önümde Parlak Ay Gibi!", subtitle: "Müziksiz İlahi", path: "https://youtu.be/ZgvYz0Z5jmo", ),
   IlahiTile(name: "Allah Yolu Tektir Tek", subtitle: "Müziksiz İlahi", path: "https://youtu.be/cR-0WR7icXk", ),
   IlahiTile(name: "Ey Gönül Tefekkür Eyle! ", subtitle: "Müziksiz İlahi", path: "https://youtu.be/cEW0KlG6a24", ),



 ];

 List<String> arabItem = [
   "الله",
   "الرَّحْمَنُ",
   "الرَّحِيمُ",
   "الْمَلِكُ",
   "الْقُدُّوسُ",
   "السَّلاَمُ",
   "الْمُؤْمِنُ",
   "الْمُهَيْمِنُ",
   "الْعَزِيزُ",
   "الْجَبَّارُ",
   "الْمُتَكَبِّرُ",
   "الْخَالِقُ",
   "الْبَارِئُ",
   "الْمُصَوِّرُ",
   "الْغَفَّارُ",
   "الْقَهَّارُ",
   "الْوَهَّابُ",
   "الرَّزَّاقُ",
   "الْفَتَّاحُ",
   "اَلْعَلِيْمُ",
   "الْقَابِضُ",
   "الْبَاسِطُ",
   "الْخَافِضُ",
   "الرَّافِعُ",
   "الْمُعِزُّ",
   "المُذِلُّ",
   "السَّمِيعُ",
   "الْبَصِيرُ",
   "الْحَكَمُ",
   "الْعَدْلُ",
   "اللَّطِيفُ",
   "الْخَبِيرُ",
   "الْحَلِيمُ",
   "الْعَظِيمُ",
   "الْغَفُورُ",
   "الشَّكُورُ",
   "الْعَلِيُّ",
   "الْكَبِيرُ",
   "الْحَفِيظُ",
   "المُقيِت",
   "الْحسِيبُ",
   "الْجَلِيلُ",
   "الْكَرِيمُ",
   "الرَّقِيبُ",
   "الْمُجِيبُ",
   "الْوَاسِعُ",
   "الْحَكِيمُ",
   "الْوَدُودُ",
   "الْمَجِيدُ",
   "الْبَاعِثُ",
   "الشَّهِيدُ",
   "الْحَقُّ",
   "الْوَكِيلُ",
   "الْقَوِيُّ",
   "الْمَتِينُ",
   "الْوَلِيُّ",
   "الْحَمِيدُ",
   "الْمُحْصِي",
   "الْمُبْدِئُ",
   "الْمُعِيدُ",
   "الْمُحْيِي",
   "اَلْمُمِيتُ",
   "الْحَيُّ",
   "الْقَيُّومُ",
   "الْوَاجِدُ",
   "الْمَاجِدُ",
   "الْواحِدُ",
   "اَلاَحَدُ",
   "الصَّمَدُ",
   "الْقَادِرُ",
   "الْمُقْتَدِرُ",
   "الْمُقَدِّمُ",
   "الْمُؤَخِّرُ",
   "الأوَّلُ",
   "الآخِرُ",
   "الظَّاهِرُ",
   "الْبَاطِنُ",
   "الْوَالِي",
   "الْمُتَعَالِي",
   "الْبَرُّ",
   "التَّوَابُ",
   "الْمُنْتَقِمُ",
   "العَفُوُّ",
   "الرَّؤُوفُ",
   "مَالِكُ الْمُلْكِ",
   "ذُوالْجَلاَلِ وَالإكْرَام",
   "الْمُقْسِطُ",
   "الْجَامِعُ",
   "الْغَنِيُّ",
   "الْمُغْنِي",
   "اَلْمَانِعُ",
   "الضَّارَّ",
   "النَّافِعُ",
   "النُّورُ",
   "الْهَادِي",
   "الْبَدِيعُ",
   "اَلْبَاقِي",
   "الْوَارِثُ",
   "الرَّشِيدُ",
   "الصَّبُورُ"
 ];

 var mena = [
   "Bütün isim və sifətləri özündə toplayan",
   "Rəhmətiylə davranan",
   "Mərhəmət edən, bağışlayan",
   "Mülkün həqiqi sahibi, mülk və səltənəti davamlı olan. ",
   "Hər cür əksiklik və ayıblardan uzaq olan",
   "Qullarını salamatlığa çıxaran",
   "Könüllərdə iman işığı oyandıran",
   "Mühafizə edən və qoruyan",
   "Məğlub edilməsi əsla mümkün olmayan",
   "İstədiyini mütləq edən, dilədiyinə müqtədir olan",
   "Hər şeydə böyüklüyünü göstərən",
   "Hər şeyi yoxdan var edən",
   "Hər şeyi uyğun bir tərzdə və bir-birinə uyğun yaradan",
   "Hər şeyə bir forma və xüsusiyyət verib təsvir edən",
   "Qullarının günahlarını örtən, günahlarını bağışlayan",
   "Hər şeyə, hər istədiyini edəcək sürətdə qalib və hakim olan",
   "Ehsanı bol olan",
   "Bütün məxluqatın ruzisini verən və ehtiyacını qarşılayan",
   "Hər cür çətinlikləri asanlaşdıran, sıxıntıdan qurtaran",
   "Hər şeyi ən incə nöqtəsinə qədər bilən, elmi əbədi və əzəli olan",
   "Dilədiyinə sıxıntı verən, sıxan",
   "Dilədiyinə bolluq verən, açan, genişlədən",
   "Yuxarıdan aşağıya endirən, alçaldan",
   "Yuxarı qaldıran, yüksəldən",
   "İzzət verib qarşılayan",
   "Zillətə düşürən",
   "Hər şeyi eşidən",
   "Hər şeyi görən",
   "Hər işdə hikmət və ədalətlə hökm edən",
   "Son dərəcə ədalətli olan",
   "İşlərin bütün incəliklərini bilən",
   "Hər şeyin iç üzündən, gizli tərəfindən xəbərdar olan",
   "Yumşaq davranan, hilmi çox olan",
   "Çox əzəmətli və böyük olan",
   "Çox bağışlayan, məğfirəti çox olan",
   "Öz rizası üçün edilən yaxşı işləri, artıqlamasıyla mükafatlandıran",
   "Çox uca, çox yüksək olan",
   "Böyüklüyünün həddi-hüdudu olmayan",
   "Edilən işləri bütün təfsilatıyla, təfərruatıyla tutan",
   "Yaradılmış hər şeyin azuqəsini verən",
   "Hər kəsin həyatı boyu etdiklərinin hesabını soruşan",
   "Əzəmət sahibi olan, ulu olan",
   "Çox ikram edən. Kərəmi və məğfirəti bol olan",
   "Bütün varlıqlar üzərində mühafizəçi olan",
   "Dua edənlərin dualarını qəbul edən, istəklərini verən",
   "Lütfü bol olan",
   "Əmrləri, kəlamı və bütün işləri hikmətli olan",
   "Yaxşı qullarını sevən, sevilməyə və dostluğa haqqıyla layiq olan",
   "Şanı çox böyük və çox yüksək olan",
   "Ölüləri dirildib qəbirlərindən çıxaran",
   "Hər zaman və hər yerdə hazır və nazir olan",
   "Vacibül-vücud olan, varlığı heç dəyişmədən duran",
   "İşlərini Ona həvalə edənlərin işini düzəldən və hər şeyin yaxşısını təmin edən",
   "Çox qüvvətli, çox güclü olan",
   "Çok sağlam olan",
   "Yaxşı qullarına, həqiqi möminlərə dost olan",
   "Hər cür həmd və tərifə layiq olan",
   "İstisnasız hər şeyin tək-tək sayını bilən",
   "Bütün məxluqatı maddəsiz və bənzərsiz olaraq ilk başdan yaradan",
   "Yaradılmışları yox etdikdən sonra təkrar yaradan",
   "Əhya edən, dirildən, can bağışlayan, sağlıq verən",
   "Ölümü yaradan, öldürən",
   "Diri, tam və mükəmməl mənasıyla həyat sahibi",
   "Göyləri, yeri və hər şeyi tutan",
   "İstədiyini, istədiyi vaxt tapan",
   "Kərəmi bol olan",
   "Tək olan",
   "Sığınacaq tək dayaq olan",
   "Hər şeyə gücü yetən, hər istədiyini etməyə qadir olan",
   "Qüvvət və qüdrət sahibləri üzərində istədiyi kimi təsərrüf edən",
   "İstədiyini irəli çəkib, önə alan",
   "İstədiyini geridə qoyan, arxada saxlayan",
   "Başlanğıcı olmayan, ilk olan",
   "Sonu olmayan, son olan",
   "Açıq bilinən, aşkar olan",
   "Gizli olan",
   "Hər şeyi tək başına idarə edən",
   "Ağlın mümkün gördüyü hər şeydən, hər hal və hərəkətdən münəzzəh olan",
   "Qullarına yaxşılığı və ehsanı, nemətləri bol olan",
   "Tövbələri qəbul edən",
   "Günahkarları ədalətiylə cəzalandırıb intiqam alan",
   "Əfvi və rəhməti çox olan, bağışlayan",
   "Çox mərhəmət göstərən, lütf və mərhəmətlə çox hifz edən",
   "Mülkün əbədi sahibi olan",
   "Hər cür böyüklüyün, hər cür kərəmin sahibi olan",
   "Bütün işləri bir-birinə uyğun və səviyyədə edən",
   "İstədiyini istədiyi zaman istədiyi yerdə toplayan",
   "Çox zəngin olan",
   "İstədiyini zəngin edən",
   "Bəzi şeylərin meydana gəlməsinə icazə verməyən, mane olan",
   "Ələm və ziyan verəcək şeyləri yaradan, hüsrana uğradan",
   "Xeyir və mənfəət verəcək şeyləri yaradan",
   "Aləmləri nurlandıran",
   "Hidayətə və doğru yola yönəldən",
   "Əmsalsız, misilsiz, heyrətverici neçə-neçə aləmlər icad edən",
   "Varlığının sonu mövcud olmayan, əbədi olan",
   "Sərvətlərin həqiqi sahibi olan",
   "Bütün işləri əzəli təqdirinə uyğun bir nizam və hikmət üzrə sonuna çatdıran",
   "Çox səbirli olan",


 ];

 var MovieTileList = [
   MoviesTile("Aziz Mahmud Hüdayi - Hüdayi Yolu", "https://www.youtube.com/watch?v=z4MvA-syR2k&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=67" ),
   MoviesTile("Mehmed Emin Tokadi Hz - Beyaz Gece", "https://www.youtube.com/watch?v=8tgxwRkOld0&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=66" ),
   MoviesTile("Abdülfettah-i Akri Hz - İki Damla Gözyaşı", "https://www.youtube.com/watch?v=zTFIj5COJIY&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=65" ),
   MoviesTile("Abdulkadir-i Geylani Hz. - Batmayan Güneş", "https://www.youtube.com/watch?v=wbmI2KPpr3Q&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=64" ),
   MoviesTile("Abdullah-ı Tercüman Hz. - Arayış", "https://www.youtube.com/watch?v=foaWHCZBGKA&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=63" ),
   MoviesTile("Akşemseddin Hz.", "https://www.youtube.com/watch?v=xhduYmnsVCU&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=61" ),
   MoviesTile("Ahmedi-i Bedevi Hz. - Can Perdesi", "https://www.youtube.com/watch?v=dIbCJGkn9pQ&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=62" ),
   MoviesTile("Ali Semerkandi Hz.", "https://www.youtube.com/watch?v=KFzn6prFKmM&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=59" ),
   MoviesTile("Behlül-i Dana Hazretleri", "https://www.youtube.com/watch?v=tFjL5nxtcUg&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=58" ),
   MoviesTile("Beşiktaşlı Yahya Efendi - Yeşeren Asma", "https://www.youtube.com/watch?v=DPnUswuFMTU&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=57" ),
   MoviesTile("Bişr-i Hafi Hz. - Bir Zamanlar Sarhoştu", "https://www.youtube.com/watch?v=BMGeJg21Z5U&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=56" ),
   MoviesTile("Davud-i Tai", "https://www.youtube.com/watch?v=AdAcrlCQfMI&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=54" ),
   MoviesTile("Ebu Turab-ı Nahşebi Hz.- Toprağın Oğlu", "https://www.youtube.com/watch?v=gknNerqAxWA&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=53" ),
   MoviesTile("Ebül Vefa Hz. - Gayret", "https://www.youtube.com/watch?v=8tgxwRkOld0&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=52" ),
   MoviesTile("Erzurumlu İbrahim Hakkı Hz.", "https://www.youtube.com/watch?v=RYyX68j3dSM&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=51" ),
   MoviesTile("Fudayl Bin Iyad Hz.", "https://www.youtube.com/watch?v=UjmC3qRsUtg&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=50" ),
   MoviesTile("Hababe Hatun Hz. - Issız Kule", "https://www.youtube.com/watch?v=HNZdK80ROUY&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=49" ),
   MoviesTile("Hacı Bayram-ı Veli - Hasat", "https://www.youtube.com/watch?v=D1MPpefrCDg&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=48" ),
   MoviesTile("Hasan Sezai Hz. - İftira", "https://www.youtube.com/watch?v=Dcfp946A7hY&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=47" ),
   MoviesTile("Hasan-i Basri Hz.", "https://www.youtube.com/watch?v=aiHN72aEfXo&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=46" ),
   MoviesTile("Hayat Bin Kays El Harrani Hz. - Suikast", "https://www.youtube.com/watch?v=MSkhveCo7lA&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=45" ),
   MoviesTile("İbrahim Bin Ethem Hz. - İlahi Aşk", "https://www.youtube.com/watch?v=amwFFMDw0ME&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=44" ),
   MoviesTile("İbrahim Gülşeni Hz.", "https://www.youtube.com/watch?v=3k8BDqfdgpk&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=43" ),
   MoviesTile("Eshab-ı Keyf 1 - Uzun Gece", "https://www.youtube.com/watch?v=d08AXmp_ifg&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=34" ),
   MoviesTile("Eshab-ı Keyf 2 - Uzun Gece", "https://www.youtube.com/watch?v=x26lhQcw2fo&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=35" ),
   MoviesTile("Terzi Baba Hz.", "https://www.youtube.com/watch?v=WbK31CrGdCE&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=33" ),
   MoviesTile("İbrahim-i Havvas Hz - Kalbe Düşen Nur", "https://www.youtube.com/watch?v=0Ep9ueOK_BE&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=32" ),
   MoviesTile("İsmail Fakirullah Hz.1 - Öpülecek Eller", "https://www.youtube.com/watch?v=W9JgJJYpdP8&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=31" ),
   MoviesTile("Kab Bin Züheyr - Kaside-i Bürde Şairi", "https://www.youtube.com/watch?v=kXK7Qd6iMWg&list=PLJEAYskzCbgW0NYqj8ZMthH5psKQSovna&index=30" ),
 ];

 var linkTileWidget = [
   LinkTile(name: "www.namazvaxti.org", path: "www.namazvaxti.org", subtitle: "Azərbaycan üçün Namaz Vaxtları"),
   LinkTile(name: "www.huzurpinari.com", subtitle: "Dini mövzular", path: "www.huzurpinari.com", ),
   LinkTile(name: "www.bizimislam.com", path:"www.bizimislam.com", subtitle: "Dini Kitablar"),
   LinkTile(name:"www.veraislam.ru", path:"www.veraislam.ru", subtitle:"Rusca - Dini Mövzular və Sual-Cavab"),
   LinkTile(name:"www.namazvakti.com", path:"www.namazvakti.com",subtitle: "Bütün ölkələrin namaz vaxtları"),
   LinkTile(name:"www.islamicbooksforfree.com",path: "www.islamicbooksforfree.com", subtitle:"Fərqli Dillərdə  Dini Kitablar"),
   LinkTile(name:"www.booksonhook.com", path:"www.booksonhook.com", subtitle:"Fərqli Dillərdə  Dini Kitablar"),
   LinkTile(name:"www.askidakitap.net", path:"www.askidakitap.net", subtitle:"Fərqli Dillərdə  Dini Kitablar")


 ];

 var bookTileList = [
   BookTile(
       "https://www.gozelislam.com/uploads/posts/2019-06/1559858460_tam-lmihal-seadet-i-ebediyye-kinci-ksm.jpg",
       "https://form.jotform.com/200363853004445",
       "https://www.gozelislam.com/uploads/files/2019-06/1559852577_tam_ilmihal.pdf",
       "Tam Elmihal Səadəti-Əbədiyyə",
       "Hüseyin Hilmi İşıq",
       tamElmihal,
       "1",
       "15"
   ),
   BookTile(
       "https://www.gozelislam.com/uploads/posts/2019-06/1559855709_index.jpg",
       "https://form.jotform.com/200363853004445",
       "https://www.gozelislam.com/uploads/files/2019-06/1559852933_mektubat_tercemesi.pdf",
       "MƏKTUBAT - I Cild",
       "Hüseyin Hilmi İşıq",
       mektubat,
       "2",
       "12"

   ),
   BookTile(
       "https://www.gozelislam.com/uploads/posts/2020-02/1582732544_20200225_190554.jpg",
       "https://form.jotform.com/200363853004445",
       "https://www.gozelislam.com/uploads/files/2019-06/1559852577_tam_ilmihal.pdf",
       "Qurani Kərim Təcvid üçün Əlifba",
       "",
       elifba,
       "3",
       "3"

   ),
   BookTile(
       "https://www.gozelislam.com/uploads/posts/2019-05/1558894510_sevgili.jpg",
       "https://form.jotform.com/200363853004445",
       "https://www.gozelislam.com/uploads/files/2019-06/1559852577_tam_ilmihal.pdf",
       "Sevgili Peyğəmbərim (Sallallahu Əleyhi və Səlləm)",
       "Hüseyin Hilmi İşıq",
       sevgiliPey,
       "4",
       "6"

   ),
   BookTile(
       "https://www.gozelislam.com/uploads/posts/2020-02/1580658707_1.png",
       "https://form.jotform.com/200363853004445",
       "https://www.gozelislam.com/uploads/files/2021-02/1613040685_namaz-yeni2020-144x214.pdf",
       "Namaz Kitabı",
       "Hüseyin Hilmi İşıq",
       namazKitabiAz, "5", "4"),
   BookTile(
       "https://www.gozelislam.com/uploads/posts/2019-09/1568213187_33742147-288-k659551.jpg",
       "https://form.jotform.com/200363853004445",
       "https://www.gozelislam.com/uploads/files/2019-09/1568294123_10_namaz_kitabi.pdf",
       "Namaz Kitabı",
       "Hasan Yavaş",
       namazKitabiTr, "6", "3"),
   BookTile(
       "https://www.gozelislam.com/uploads/posts/2019-06/1559858014_whatsapp-image-2019-06-07-at-01_52_32.jpeg",
       "https://form.jotform.com/200363853004445",
       "https://www.gozelislam.com/uploads/files/2021-02/1613040685_namaz-yeni2020-144x214.pdf",
       "İki Cihan Günəşi Həzrəti Məhəmməd - in Həyatı (Sallallahu Əleyhi və Səlləm)",
       "Prof.Dr. Ramazan Ayvallı",
       hayatiTr, "7", "6"),
   BookTile(
       "https://www.gozelislam.com/uploads/posts/2019-06/1559857564_sevahid-un-nubuvve-peygamberlik-mujdeleri.jpg",
       "https://form.jotform.com/200363853004445",
       "https://www.gozelislam.com/uploads/files/2019-06/1559857537_11_sevahidun_nubuvve.pdf",
       "Şəvâhid-ün Nübüvvə",
       "Hüseyin Hilmi İşıq",
       shevahid, "8", "4"),
   BookTile(
       "https://www.gozelislam.com/uploads/posts/2019-06/1559858242_004.png",
       "https://form.jotform.com/200363853004445",
       "https://www.gozelislam.com/uploads/files/2019-06/1559856949_06_kiyamet_ve_ahiret.pdf",
       "Qiyamət və Axirət",
       "Hüseyin Hilmi İşıq",
       kiyametveahirettr, "9", "4"
   ),
   BookTile(
       "https://www.gozelislam.com/uploads/posts/2019-06/1559856706_menakb-cihar-yar-i-guzin.jpg",
       "https://form.jotform.com/200363853004445",
       "https://www.gozelislam.com/uploads/files/2019-06/1559856759_12_menakibi_cihar_yari_guzin.pdf",
       "Menaqıb-ı Çihar Yar-i Güzin",
       "Hüseyin Hilmi İşıq",
       menakib, "10", "5"),
   BookTile(
       "https://www.gozelislam.com/uploads/posts/2019-06/1559856039_kymetsiz-yazlar-kymeti-bulunamyan-yazlar.jpg",
       "https://form.jotform.com/200363853004445",
       "https://www.gozelislam.com/uploads/files/2019-06/1559856031_09_kiymetsiz_yazilar.pdf",
       "Qiymətsiz Yazılar",
       "Hüseyin Hilmi İşıq",
       kiymetsiz, "11", "4"),
   BookTile(
       "https://www.gozelislam.com/uploads/posts/2019-05/1558894612_slam.jpg",
       "https://form.jotform.com/200363853004445",
       "https://www.gozelislam.com/uploads/files/2019-05/1558977793_islam-exlaqi.pdf",
       "İslam Əxlaqı",
       "Muhamməd Xadimi",
       islamExlaqi, "12", "4"),
   BookTile(
       "https://www.gozelislam.com/uploads/posts/2020-02/1580658771_2.png",
       "https://form.jotform.com/200363853004445",
       "https://www.gozelislam.com/uploads/files/2019-05/1559235651_c_elmihali.pdf",
       "Cənnət Yolu Elmihalı",
       "Hüseyin Hilmi İşıq",
       cennetYolu, "13", "4"),
   BookTile(
       "https://www.gozelislam.com/uploads/posts/2019-05/1558890145_menkibe1.jpg",
       "https://form.jotform.com/200363853004445",
       "https://www.gozelislam.com/uploads/files/2019-05/1559235919_kitab-2016.pdf",
       "Azərbaycan övliyaları və mənkibələr",
       "Hüseyin Hilmi İşıq",
       ovliyalar, "14", "3"),
   BookTile(
       "https://www.gozelislam.com/uploads/posts/2019-09/1568381351_whatsapp-image-2019-09-13-at-12_13_13.jpeg",
       "https://form.jotform.com/200363853004445",
       "https://www.gozelislam.com/uploads/files/2019-09/1568381377_mybelovedprophet-ru.pdf",
       "Жизнь Пророка Мухаммеда",
       "Prof.Dr. Ramazan Ayvallı",
       sebgiliPeygRus, "15", "5"),
   BookTile(
       "https://www.gozelislam.com/uploads/posts/2021-03/1614829513_herkese_lazim_olan_iman_az.jpg",
       "https://form.jotform.com/200363853004445",
       "https://www.gozelislam.com/uploads/files/2021-03/herkese_lazim_olan_iman.pdf",
       "Hərkəsə Lazım Olan İman",
       "Hüseyin Hilmi İşıq",
       herkeseLazimOlan, "16", "3"),
   BookTile(
       "https://www.gozelislam.com/uploads/posts/2019-09/1568293907_whatsapp-image-2019-09-12-at-17_10_31.jpeg",
       "https://form.jotform.com/200363853004445",
       "https://www.gozelislam.com/uploads/files/2019-09/1568294041_04_islam_ahlaki.pdf",
       "İslam Əxlaqı (Türkcə)",
       "Hüseyin Hilmi İşıq",
       islamAhlakiTr, "17", "5"),
   BookTile(
       "https://www.gozelislam.com/uploads/posts/2021-12/1639303694_qiyamet_aixret_kitab_dini.jpeg",
       "https://form.jotform.com/200363853004445",
       "https://www.gozelislam.com/uploads/files/2019-05/qiyamet_ve_axiret.pdf",
       "Qiyamət və Axirət (Azərbaycan dilində)",
       "Hüseyin Hilmi İşıq",
       kiyamet, "18", "3"),
   BookTile(
       "https://www.gozelislam.com/uploads/posts/2021-08/1628617345_main365.jpg",
       "https://form.jotform.com/200363853004445",
       "https://www.gozelislam.com/uploads/files/2019-06/1560018481_dua.pdf",
       "365 Dua",
       "Hüseyin Hilmi İşıq",
       gundua, "19", "8"),
   BookTile(
       "https://www.gozelislam.com/uploads/posts/2019-09/1568380886_b042.png",
       "https://form.jotform.com/200363853004445",
       "https://www.gozelislam.com/uploads/files/2019-09/1568380990_kniga-o-namaze.pdf",
       "Молитвенник (Книга о намазе)",
       "Hüseyin Hilmi İşıq",
       molitvennik, "20", "3"),
   BookTile(
       "https://www.gozelislam.com/uploads/posts/2019-09/1568379821_b040.png",
       "https://form.jotform.com/200363853004445",
       "https://www.gozelislam.com/uploads/files/2019-09/1568380799_islam.pdf",
       "Религия Ислам",
       "Hüseyin Hilmi İşıq",
       religiyaIslam, "21", "3"),
   BookTile(
       "https://www.gozelislam.com/uploads/posts/2019-09/1568212110_thumbnail_ey-2.jpg",
       "https://form.jotform.com/200363853004445",
       "https://www.gozelislam.com/uploads/files/2019-09/1568294071_ey-oul-elmihal-son.pdf",
       "Ey Oğul Elmihalı",
       "Hüseyin Hilmi İşıq",
       eyOgul, "22", "4"),
   BookTile(
       "https://www.gozelislam.com/uploads/posts/2019-06/1559994324_27823_ryvgh_1495274476.jpg",
       "https://form.jotform.com/200363853004445",
       "https://www.gozelislam.com/uploads/files/2019-06/1560017598_rehberlmihali.pdf",
       "Rəhbər Elmihal",
       "Hüseyin Hilmi İşıq",
       rehberIlmihal, "23", "6"),
   BookTile(
       "https://www.gozelislam.com/uploads/posts/2020-10/1602397050_o-sin-moy-dini-kitab-rusca.png",
       "https://form.jotform.com/200363853004445",
       "https://www.gozelislam.com/uploads/files/2019-05/o_sin_moi.pdf",
       "О Сын Мой",
       "Hüseyin Hilmi İşıq",
       osinMoy, "24", "3"),
   BookTile(
       "https://www.gozelislam.com/uploads/posts/2019-06/1559994859_whatsapp-image-2019-06-08-at-13_55_49.jpeg",
       "https://form.jotform.com/200363853004445",
       "https://www.gozelislam.com/uploads/files/2019-05/o_sin_moi.pdf",
       "Səadətin Mənbəyi - Ailə",
       "Mehmet Oruç",
       aile, "25", "8"),
 ];
 var aile = "İslama görə : Ailə və Qadının önəmi,Evlilik və Həyatı,Uşaq təhsili mövzularının qələmə alındığı,qadın,kişi,uşaq və ailənin hər fərdinin oxuması lazım olan bir kitab!";
 var osinMoy = "Это сборник книг великих исламских ученых мазхаба Ханафи, собранных хазрата Сулейман бин Джеза’, являющегося ученым при Османском государстве. В основе этой книги лежит Положение о поклонении, о вере, о правах отца и матери, о посещении родственников, о правилах приличия во время употреблении пищи, о том, как быть истинным мусульманином, а также, в конце книги, вы сможете увидеть перевод одиннадцати писем хазрата Мухаммед Масум Фаруки, которые являются «Пищей для души».";
 var rehberIlmihal = "Bu kitabda İman,İslam bilgiləri,əxlaq,namaz,oruc,zəkat və həcc haqqında qısa və dolğun məlumat verilmişdir.Bu kitab hər yaşda olan insanlarımız üçün nəzərdə tutulmuşdur.";
 var eyOgul = "İslam alimi Süleyman ibn Cəzanın Hənəfi məzhəbindəki böyük islam alimlərinin kitablarından seçmiş olduğu və “Ey Oğul” adını verdiyi bu elmihalda fiqh, əxlaq və digər mövzular qələmə alınmışdır.";
 var religiyaIslam = "В этой книге объясняется об исламийете, о вере, о пути Эхл-и суннета, об условиях веры и ислама, о деяниях, о кюфре (неверии), об эф’ал-и мюкеллефин (о действиях совершеннолетнего), о мезхебах и об имамaх мезхебов, о видах поклонения, о харамах (о запретах), а также дана широкая информация о святых ночах Ислама. Объясняется вера в той форме, какой о ней сообщил Мухаммед алейхисселям. Кроме этого, объясняется о религиях, которые были испорченны со временем и о после появившихся извращенных течениях в Исламе. В последней части этой книги даны биографии некоторых ученых Ислама выросших в Тюркистане.";
 var molitvennik = "Эта книга состоит из девяти частей.В этой книге объясняются: путь Эхл-и суннета, намаз, абдест, гусль, тейеммюм, орудж,хадж и зекят. В конце книги написанны молитвы, которые читаются при совершении молитвы и в других обрядах. А также эти суры и молитвы Вы можете прослушать вслух.";
 var gundua = "Günlük dualar və üç aylar,mübarək gün və gecələr,surələrin fəzilətlərini ehtiva edən və son bölümündə duaların ərəbcə əsillərinin verildiyi kitab.";
 var kiyametveahirettr = "Qiyamət və Axirət kitâbında insanın ölümü, rûhun bədəndən ayrılması, qəbr həyâtı, qəbr sualları, qiyamət günü insanların hesaba çəkilməsi, Cənnət və Cəhənnəmə necə gediləcəyi böyük İslam alimi, İmâm-ı Gazâlî həzrətlərinin kitâblarından tərcümə edilərək geniş olaraq açıklanmaqdadır.";
 var islamAhlakiTr = """ Bu kitabımızın 1-ci qismində pis əxlaqdan mühüm olan qırx ədədini və bunların çarələri açıqlanacaqdır. Aşağıdakı yazıların hamısı Əbu Said Muhamməd Hadiminin (rahimə-hullahü təala) “Bəriqa” kitabının birinci cildindən tərcümə edilmişdir.
     2-ci qismində Əsl adı “Miftah-ul Cənnət”, yəni Cənnət qapısının açarı olan Cənnət Yolu Elmihalı kitabının müəllifi Hicri qəməri 885 (miladi 1480) ilində Ədirnədə vəfat etmiş Muhamməd ibn Qutbüddini İznikidir (rahimə-hullahü təala). Hər kəsin bilməsi və yerinə yetirilməsi lazım olan iman, əxlaq və fiqh bilgilərini qısaca və açıqca anladan bu kitab, hər kəsin oxuması üçün tövsiyə olunur.
     3-cü qismində İslam alimi Süleyman ibn Cəzanın Hənəfi məzhəbindəki böyük islam alimlərinin kitablarından seçmiş olduğu və “Ey Oğul” adını verdiyi bu elmihalda fiqh, əxlaq və digər mövzular qələmə alınmışdır.""";
 var hanimaRehber = "Bu kitabda dinimiz haqqında qısa məlumat verildikdən sonra dinimizin əmr və qadağaları,ibadətlər,gözəl və pis əxlaqın nələr olduğu və çarələri,xüsusilə xanımlarla bağlı məlumatlar bildirilmişdir.";
 var herkeseLazimOlan = "Böyük alim Mövlanə Xalidi Bağdadinin, İslamın beş şərtini və imanın altı şərtini izah edən, 'Hədisi Cəbrayıl' adlanan bir hədisin izahı olan və 'Etiqadnamə' adlanan kitabın tərcüməsidir.";
 var sebgiliPeygRus = "а также членам его семьи, всем Сподвижникам (Асхабам), и всем, кто следует по их пути! Мухаммед (алейхисселям), является Посланником и любимцем Аллаха. Он – лучший из людей всего человечества и господин. Поэтому верующие в него и следующие за ним будут членами самой лучшей из всех общин. Аллах предначертал нам испытать счастье быть общиной Пророка Мухаммеда, и велел нам следовать его дорогой. Наши бесконечные благодарения и восхваления Аллаха за эту Его милость будут бесконечно недостаточны.";
 var ovliyalar = "Bu kitabımızın birinci bölməsində Azərbaycan ərazisində yaşayan alim və vəlilərdən on böyük Övliyanın həyatları, mənqibələri yer almış, kitabımızın ikinci bölməsində isə digər islam məmləkətlərində yaşayan peyğəmbər, alim və vəlilərin həyatlarında yaşanan ibrətli mənqibələri, kəramətləri haqqında bilgilər, məlumatlar öz əksini tapmışdır.";
 var cennetYolu = "Əsl adı “Miftah-ul Cənnət”, yəni Cənnət qapısının açarı olan Cənnət Yolu Elmihalı kitabının müəllifi Hicri qəməri 885 (miladi 1480) ilində Ədirnədə vəfat etmiş Muhamməd ibn Qutbüddini İznikidir (rahimə-hullahü təala). Hər kəsin bilməsi və yerinə yetirilməsi lazım olan iman, əxlaq və fiqh bilgilərini qısaca və açıqca anladan bu kitab, hər kəsin oxuması üçün tövsiyə olunur.";
 var islamExlaqi = "Bu kitabımızda pis əxlaqdan mühüm olan qırx ədədini və bunların çarələri açıqlanacaqdır. Aşağıdakı yazıların hamısı Əbu Said Muhamməd Hadiminin (rahimə-hullahü təala) “Bəriqa” kitabının birinci cildindən tərcümə edilmişdir.";
 var kiymetsiz = "Qiymətsiz yazılar kitabında, İmam Rəbbani həzrətlərinin üç cild Məktubat kitabından və oğlu Muhamməd Məsum Faruqi həzrətlərinin də üç cild Məktubat kitabından çıxarılan qiymətli cümlələr əlifba sırasına görə qeyd edilmişdir.";
 var menakib = "Bu kitabda, Seyid Eyyub həzrətləri dörd xəlifənin və Əshabi-kiramın böyüklüklərini, qiymətlərini mənqibələrlə çox uzun və çox gözəl qələmə almışdır.";
 var kiyamet = "Qiyamət və Axirət kitâbında insanın ölümü, rûhun bədəndən ayrılması, qəbr həyâtı, qəbr sualları, qiyamət günü insanların hesaba çəkilməsi, Cənnət və Cəhənnəmə necə gediləcəyi böyük İslam alimi, İmâm-ı Gazâlî həzrətlərinin kitâblarından tərcümə edilərək geniş olaraq açıklanmaqda və vəhhâbîliyə cavab verərək övliyalığın ne olduğu, qiyamət günü hərkəsin sevdiyinin yanında olacağı məsələlər açıqlanmaqdadır.";
 var shevahid = "Bu kitab Muhamməd əleyhisəlləmin peyğəmbərliyinə dəlil olan əlamətlər və möcüzələrinin bəyanı haqqındadır.Kitabda bir müqəddimə,yeddi bölüm,bir xəttimə vardır.";
 var hayatiTr = "Mərmərə Universiteti İlahiyyat fakültəsinin Professoru, Doktor Ramazan Ayvallının qələmə aldığı bu kitabımızda gəlmiş-keçmiş bütün insanların hər baxımdan ən üstünü, Allahu-Təalanın sevgili Peyğəmbəri, aləmlərin əfəndisi Muhamməd Mustafanın (sallallahu aleyhi və səlləm) doğumundan vəfatına qədər keçdiyi həyat yolu, islam tarixi haqqında məlumatlar toplanmışdır. Bu kitab oxuyucuların Peyğəmbər Əfəndimizə olan sevgisinin artmasına səbəb olacaqdır.";
 var namazKitabiTr = "  Kiçik bir elmihal şəklində olan bu kitabda hər müsəlmanın bilməsi lazım olan Əhli sünnə etiqadı, namaz, dəstəmaz, qüsl, təyəmmüm, oruc, həcc və zəkat bilgiləri haqqında məlumat verilir. Namaz kitabının sonunda, namaz içində və xaricində oxunan dualar vardır. Bu kitab namaz və namazla əlaqədar olan bilgiləri təfərrüatı ilə izah edən doqquz qismi özündə ehtiva edir.";
 var namazKitabiAz = "Kiçik bir elmihal şəklində olan bu kitabda hər müsəlmanın bilməsi lazım olan Əhli sünnə etiqadı, namaz, dəstəmaz, qüsl, təyəmmüm, oruc, həcc və zəkat bilgiləri haqqında məlumat verilir. Namaz kitabının sonunda, namaz içində və xaricində oxunan dualar vardır. Bu kitab namaz və namazla əlaqədar olan bilgiləri təfərrüatı ilə izah edən doqquz qismi özündə ehtiva edir.";
 var sevgiliPey = "Mərmərə Universiteti İlahiyyat fakültəsinin Professoru, Doktor Ramazan Ayvallının qələmə aldığı bu kitabımızda gəlmiş-keçmiş bütün insanların hər baxımdan ən üstünü, Allahu-Təalanın sevgili Peyğəmbəri, aləmlərin əfəndisi Muhamməd Mustafanın (sallallahu aleyhi və səlləm) doğumundan vəfatına qədər keçdiyi həyat yolu, islam tarixi haqqında məlumatlar toplanmışdır. Bu kitab oxuyucuların Peyğəmbər Əfəndimizə olan sevgisinin artmasına səbəb olacaqdır.";
 var elifba = "Qurani Kərim Təcvid üçün Əlifba Kitabı";
 var tamElmihal = "“Tam Elmihal Səadəti-Əbədiyyə” kitabının qiymət və əhəmiyyətini ikinci səhifəsində böyük islam alimi Seyyid Abdulhakim Arvasi həzrətlərinin qiymətli oğlu, İstanbulda Qadıköy müftisi Əhməd Məkki Əfəndi qısa və aydın sözləri ilə bir başa açıqlamış və “Əsrimizin fazillərindən, dövrümüzün bir dənəsinin yazmış olduğu “Səadət-Əbədiyyə” kitabına göz gəzdirdim. Bu kitabda kəlam, fiqh və təsəvvüf bilgilərinə rast gəldim. Bu bilgilərin hamısını nübüvvət qaynağından almış olanların kitablarından toplanmış olduğunu gördüm. Bu kitabda Əhli-sünnət vəl camaat etiqadına uyğun olmayan heç bir məlumat, heç bir söz yoxdur” buyurmuşdur. Minə yaxın əsər əsasında və uzun bir müddətdə hazırlanan bu misilsiz kitab üç qisimdən ibarətdir.";
 var mektubat   = "971-ci [miladi 1563] ildə doğulan və 1034-cü [miladi 1624] ildə vəfat edən ikinci min ilin mücəddidi İmam Rabbani Əhməd Faruqi Sərhəndi həzrətləri Qurani-kərim və Hədisi-şəriflərdən sonra ən qiymətli üçüncü kitab olan “MƏKTUBAT” kitabını yazmışdır. İnsanoğlunun ruhi xəstəliklərinin müalicə yollarını göstərmiş, islam dininə necə inanmaq lazım olduğunu, ibadətlərin əhəmiyyətini, Övliyalıq, Rəsulullahın gözəl əxlaqını, islamiyyət, təriqət və həqiqətin ayrı-ayrı şeylər olmadıqlarını izah etmişdir. Üç cild və əsli farsca olan Məktubat kitabında 536 məktub vardır.";


 var itemsName =
 ['Ağdam' , "Əli Bayramlı", "Bakı", "Bərdə", "Fizuli", "Gəncə", "Lənkəran", "Mingəçevir", "Sabirabad", "Səlyan", "Şəki", "Sumqayıt", "Zaqatala", "Şuşa", "Naxçıvan", "Culfa",
   "Tovuz", "Ağdaş" , "İmişli" , "Gədəbəy" , "Ağdərə" , "Saatlı" , "Kəngərli" , "Daşkəsən" , "Göyçay" , "Lerik" , "Qubadlı" , "Siyəzən" , "Biləsuvar" , "Yardımlı" , "Xankəndi" ,
   "Ağsu" , "Neftçala" , "Quba" , "Ucar" , "Xaçmaz" , "Tərtər" , "Astara" , "Beyləqan" , "İsmayıllı" , "Qusar" , "Ordubad" , "Şamaxı" , "Goranboy" , "Balakən" , "Qax" , "Şəmkir" ,
   "Yevlax" , "Laçın" , "Cəlilabad" , "Oğuz" , "Qəbələ" , "Ağcabədi" , "Göygöl" , "Zəngilan" , "Qazax" ,];

 var itemCodes = [
     '1423', '1424', '1425', '1426', '1427', '1428', '1432', '1435', '1437', '1438', '1439', '1440', '1441', '1443', '1445', '1447', '21319', '38073',
     '38172', '38174', '38179', '38193', '38290', '38356', '38457', '38654', '38788', '38875', '38904', '38944', '38985', '43363', '43392', '43395', '43397',
     '43398', '43611', '43649', '43873', '60075', '62280', '62281', '62282', '62642', '65728', '65729', '65732', '65737', '65739', '65744', '67957', '70928',
     '82092', '92768', '92807', '21320',
   ];

 var hikmetFakeData = "Dünya malı üçün çalışmaq asan, lakin hesabından qurtulmaq çətindir. (Fudayl bin İyad “rahmətullahi aleyh)";
 var textShareText = "https://play.google.com/store/apps/details?id=com.whatsapp";

 var maraqliMetin = "Hənəfi məzhəbində dişlərin arası və diş çuxurları islanmazsa, qüsl olmaz. Bunun üçün dişə diş qapağı qoyulduqda və dolğu "
 "qoyulduqda qüsl səhih olmaz. İnsan cənabətlikdən qurtula bilməz. Qızıl, gümüş və nəcs olmayan başqa maddələrdən hazırlanan diş qapağı və"
 " dolğu altına su girmədikdə, Hənəfi məzhəbi alimlərinin hamısına görə, qüsl dəstəmazı caiz olmaz. Tahtavi, “Mərakıl-fəlah” haşiyəsi, 96-cı səhifəsində və həmçinin bunun tərcüməsi olan “Neməti-İslam” kitabında belə yazır: Bir Hənəfinin öz məzhəbinə görə edə bilmədiyi bir "
 "işi edə bilməsi üçün Şafii məzhəbini təqlid etməsində bir maneə yoxdur. “Bahr-ür-raik” və “Nehr-ül-faik” kitablarında da belə yazılmışdır. Lakin bu işi edərkən, o məzhəbin "
 "şərtlərini də yerinə yetirmək lazımdır. Məcburiyyət, zərurət olmadan və şərtlərinə riayət etmədən təqlid edərsə, buna “müləffiq” deyilir ki, asanları toplayan deməkdir. Bu,"
 " caiz deyildir.Öz məzhəbindəki bir fərzi edə bilməyən kimsənin yalnız bu fərzi etməsi üçün başqa məzhəbi təqlid etməsi lazımdır. Amma bu işi edərkən təqlid etdiyi məzhəbin "
 "şərtlərini də yerinə yetirməlidir. Diş qapağı və dolğu qoyduran Hənəfi məzhəbindəki bir müsəlmanın Maliki [və ya Şafii] məzhəbini təqlid etməsi üçün qüsldə, dəstəmaz almaqda və "
 "namazda niyyət edərkən İmam Malikə [və ya İmam Şafi-yə] tabe olduğunu xatırlaması kifayət edər. Yəni qüsl dəstəmazı almağa başlayarkən,  “Niyyət etdim qüsl almağa və Maliki [və ya "
 "Şafii] məzhəbinə tabe olmağa” sözünü qəlbindən keçirən bir kimsənin qüslü səhih olar. Ağzında diş qapağı və ya dolğulu dişi olan Hənəfi məzhəbindəki bir kimsə belə niyyət edincə qüslü, yəni boy dəstəmazı səhih olar. Cünubluqdan qurtular, təmiz olar. Ma"
 "liki [və ya Şafii] məzhəbini təqlid edincə, dəstəmazı və namazları səhih olar. Diş qapağı və dolğu dişi olmayanlara da imam ola bilər.Şafii məzhəbini təqlid edənin imam arxasında Fatihə "
 "surəsini oxuması, özünün və ya başqasının səvətəyninə, yəni iki dəstəmaz pozma üzvlərinə əlin ovucunun (içi) ilə toxunarsa və nikah ilə alması haram olan 18 qadından başqa qadının dərisinə dərisi dəyərsə dəstəmaz alması, dəstəmaza niyyət etməsi və az nəcasətdən də çəkinməsi lazımdır. Qurani-Kərimi tutacağı zaman da Şafii məzhəbinə görə dəstəmazlı olmalıdır. Hənəfi məzhəbində olan bir yolçunun Şafii məzhəbini təqlid edə"
 "rək, zöhr ilə əsr, şam ilə işa namazlarını cəm edərək birlikdə qıla bilməsi üçün Şafii məzhəbinə görə dəstəmazlı olması lazımdır.";

 var compass = "Cihazınızı kalibrləmək üçün onu sürətlə və rəqəmdə göstərildiyi kimi ən azı 3 dəfə hərəkət etdirin. Bu hərəkəti şaquli, üfüqi və diaqonal şəkildə edin. Kompasdan istifadə edərkən kalibrləməni istənilən nöqtədə edə bilərsiniz";