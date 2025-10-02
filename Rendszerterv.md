# Rendszerterv

1. __A rendszer célja__
   * A rendszer célja, hogy a felhasználók egy nehéz nap után el tudják ütni az időt egy játékkal, mely elől úgy állnak fel, hogy egy jót szórakoztak és máskor is szívesen leülnek játszani vele.

2. __Projektterv__
    * Projektszerepkörök, felelősségek:
    * __Fő Designer:__ Majoros Máté
    * __Fő tesztelő:__ Zsibók Bence
    * __Főtervező:__ Szabó Balázs
    * Projekt munkások és felelősségek:
    * __Backend munkálatok:__
    * __Frontend munkálatok:__
    * Ütemterv:
      * |Funkció/Story|Feladat/Task|Prioritás|Becslés|Aktuális becslés Eltelt idő|Hátralévő idő|
        |-------------|-----------|---------|-------|----------------|----------|-------------|
        |Követelmény specifikáció||0|4|3|4|0|
        |Funkcionális specifikáció||0|5|5|0|5|
        |Rendszerterv||0|8|6|1|5|
        |Adattárolás|Aktuális játékállás mentésének lehetősége|1|8|8|0|8|
        ||Korábbi játékállapot visszatöltése|1|8|8|0|8|
        |Frontend|Főmenü elkészítése|1|2|2|0|2|
        ||Pályák elkészítése|1|12|12|0|12|
        ||Karakterek elkészítése|1|12|12|0|12|
        ||Felszerelések elkészítése|1|12|12|0|12|
        ||Életerőcsík elkészítése|1|4|5|0|5|
        ||Támadási animáció elkészítése|1|4|5|0|5|
        ||Beállítások oldal elkészítése|1|4|3|0|3|
        ||Beállítások oldal elkészítése|1|4|3|0|3|
        ||Csaták utááni eredményoldal elkészítése|1|5|5|0|5|
        ||Fejlődési szintet jelző csík elkészítése|1|5|5|0|5|
        ||Fejlődési szintet jelző csík elkészítése|1|5|5|0|5|
        |Backend|Mozgás megvalósítás|10|10|0|10|
        ||Támadás megvalósítása|1|10|10|0|10|
        ||Nehézségi szintenk megfelelő játékmenet megvalósítása|1|8|8|0|8|
        ||Gyógyítás megvalósítása|1|10|10|0|10|
        ||Körök megvalósítása|1|10|10|0|10|
        ||Életerő változásának megvalósítása|1|10|10|0|10|
        ||Képességek megvalósítása|1|10|13|0|13|
        ||Felszerelések hatásainak megvalósítása|1|10|10|0|10|
        ||Fejlődés megvalósítása|1|10|10|0|10|

3. Üzleti folyamatok modellje

4. __Követelmények__
    * Funkcionális követelmények:
      * Aktuális játék állapot mentése
      * Korábbi játék állapot visszatöltése
      * Nehézségi szint változtatása
      * Csaták játszása
      * Fejlődés
      * Felszerelések szerzése
      * Felszerelések felhasználása
      * Játék végigjátszása
    * Nem funkcionális követelmények:
      * A felhasználó ne legyen irreálisan erős a képességpontjaihoz képest
      * A felhasználó nem tud egyszerre kettő különböző páncélt felvenni
    * Törvényi előírások, szabványok:
      * GDPR-nak való megfelelés

5. __Funkcionális terv__
   * Rendszerszereplők:
     * Játékos
   * Rendszerhasználati esetek és lefutásaik:
     * Játékos:
       * Csatákat indíthat
       * Fejlesztheti karakterét
       * Nehézségi szintet választhat
       * Kijátszhatja a játékot
       * Szintet léphet
       * Tud támadni
       * Tud gyógyítani
   * Menü-hierarchiák:
     * Főmenü
       * Beállítások
       * Játék
     * Beállítások
       * Főmenü
     * Játék
       * Főmenü

6. __Fizikai környezet__
   * Az alkalmazás számítógépekre készül
   * Fejlesztői eszközök:
     * Visual studio code
     * Löve 2D
     * Lua

7. __Felülettervek__
8. __Architektúrális terv__
9. __Implementációs terv__
10. __Tesztterv__
     * A tesztelések célja a rendszer és komponensei funkcionalitásának vizsgálata, ellenőrzése, a rendszer megfelelő működésének biztosítása.
        * Tesztelési módok:
          * Unit tesztelés:
            A metódusok megfelelő müködésének vizsgálata érdekében teszteket kell írni, amelyek tesztelik az elvárt működést.
          * TDD (Test Driven Development):
            A Test Driven Development (TDD), magyarul tesztvezérelt fejlesztés, egy szoftverfejlesztési módszer, ahol a tényleges kód írását megelőzi a hozzá tartozó tesztek létrehozása.
          * Alfa teszt:
            A teszt elsődleges célja a rendszer funkcióinak és megjelenésének tesztelése külöböző böngészőkben, illetve mobilos böngészőkben. A teszt sikeres ha az oldal megjelenése és fő funkciói elfogadhatóak különböző böngészőkben. A tesztelést a fejlesztők végzik.
        Manuális tesztelés: Az oldal UI elemeit manuálisan is teszteljük.
        * Tesztelendő funkciók:

11. __Telepítési terv__
12. __Karbantartási terv__
    A weboldal üzemelése során szükséges annak karbantartása. Alkalmazkodni kell a felhasználók változó igényeihez, esetlegesen új funkciók hozzáadásával fenn tartani az felhasználók érdeklődését, illetve az oldal relevanciáját.
    * Karbantartás
      * Corrective Maintenance: A felhasználók által felfedezett és bejelentett hibák kijavítása.
      * Adaptive Maintenance: A program naprakészen tartása és finomhangolása.
      * Perfective Maintenance: A szoftver hosszútávú használata érdekében végzett módosítások, új funkciók, a szoftver teljesítményének és megbízhatóságának fejlesztése.
      * Preventive Maintenance: Olyan problémák feltárása és javítása, amelyek később gondot okozhatnak.
