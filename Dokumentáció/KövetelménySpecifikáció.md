# Szoftverfejlesztési Módszertanok

## Követelmény Specifikáció

### CSK2

#### *Zsibók Bence, Kiss Álmos, Szabó Balázs, Majoros Máté*

### Áttekintés

Az alkalmazás célja egy olyan felülnézetes körökre osztott 2D stratégiai szerepjáték, ahol a játékosok egy nehéz nap után, egy jót tudnak játszani, egy izgalmas játékkal, és úgy tudjanak felállni a számítógépük elől, hogy egy jót szórakoztak játék közben.

### Jelenlegi helyzet

Jelenleg kevés 2D-s stratégiai játék található a piacon

### Vágyálom rendszer

Egy olyan játék elkészítése a célunk, melyben a felhasználó képes egy megadott nehézségi szinten, egy a megadott szerepkörök egyikébe bújva felvenni a harcot az ellenséges fajokkal. A játékot lehet egyedül, botok ellen, illetve egy szerverre felcsatlakozva egymás ellen is játszani. A játékban a karakter tud fejlődni, új eszközöket/fegyvereket/felszereléseket szerezni ezzel megkönnyítve az előrehaladást. Egyszerre több karaktert is létre tud hozni melyekkel különböző módokon végig tudja játszani a játékot. Minden fajnak van egy szuperképessége.

### Követelménylista

|Modul|ID|Név|Verzió|Kifejtés|
|-----|--|---|------|--------|
|Felület|K1|Főmenü|v1.0|Új játék kezdése és a beállítások módosítása|
|Felület|K2|Pálya|v1.0|A felhasználó különböző kinézetű és különböző elemekből álló pályákon tud játszani|
|Felület|K3|Karakter|v1.0|A felhasználó képes különböző típusú és kinézetű karaktereket választani|
|játékmenet|K4|Felszerelések|v1.0|A felhasználó képes különböző felszereléseket találni|
|Játékmenet|K5|Nehézségi szint|v1.0|A felhasználó több különböző nehézségi szintből tud választani|
|Játékmenet|K6|Támadás|v1.0|A felhasználó minden körben tud bizonyos erősségű támadás intézni az ellenség felé|
|Játékmenet|K7|Gyógyítás|v1.0|A felhasználó minden körben tud gyógyítani magán, ha van nála gyógyító|
|Játékmenet|K8|Fejlődés|v1.0|A felhasználó minden csata után tapasztalati pontokat kap melyekből fejlődni tud|
|Modifikáció|K9|Felszerelésváltás|v1.0|A felhasználó csaták közben tudja módosítani/fejleszteni karakterét|
|Felület|K10|Csata vége|v1.0|Minden csata után egy kijelzés, hogy győztes vagy vesztes volt az adott csata|
|Felület|K11|Játék vége|v1.0|A teljes játék végeztével bejön egy gratuláció és köszönetnyilvánítás, hogy végigvitte és játszott a játékkal|
|Mentés|K12|Játék mentése|v1.0|Az aktuális játékállás elmentése|
|Mentés|K13|Játék betöltése|v1.0|Egy korábban elmentett játékállás betöltése|
|Játékmenet|K14|Csata kiválasztása|v1.0|A térképen/listában megjelenő csaták egyikének kiválasztása|
|Játékmenet|K15|Lootolás|v1.0|A csaták végén a felhasználó lootot kap|

### Igényelt üzleti folyamatok

A felhasználó a játékba lépést követően ki tudja választani a nehézségi szintet, majd kiválasztani a karakterét. Ezek után ki tudja választani, hogy hol szeretne csatázni, és csata közben a lépéseket is. A csata végeztével láthatja a csata eredményét. Csaták között tudja fejleszteni karakterét.

### Riportok

#### Hogyan lehet új játékot kezdeni?

    * A felhasználó belép a játékba, kiválasztja a hozzá passzoló nehézségi szintet, kiválasztja a karakterét majd elkezdődik a tényleges játék.

#### Hogyan lehet csatát kezdeni?

    * A felhasználó kiválasztja egy listából/térképről a kívánt harcot amiben részt szeretne venni.

#### Hogyan lehet csatázni?

    * A felhasználó minden körben eldönthet, hogy mit szeretne csinálni.#### Hogyan lehet a karakterünket fejleszteni?

    * A csaták között lehetőség lesz új felszereléseket felvenni, illetve fejleszteni a karakterünket.

#### Hogyan lehet végigjátszani a játékot?

    * Az összes csatát végigcsinálva győztesen.

### Fogalomtár

    * Stratégiai játék: A stratégiai játék egy videojáték-műfaj, ami gondolkodást és megfontolt tervezést igényel a győzelem eléréséhez.
    * Szerepjáték: A szerepjáték olyan tevékenységek megnevezése, amelyben a résztvevők egyénként vagy csoportban különböző szerepeket játszanak el, a tevékenység időtartama alatt a játékok lényegét jelentő szerepvállalásoknak megfelelően viselkednek.
    * Nehézségi szint: A játék nehézségi szintje egy olyan, a játékos képességeitől és tapasztalatától függő paraméter, amely a játék kihívásának mértékét határozza meg, például a ellenségek erőssége, az erőforrások mennyisége vagy az összetett feladatok gyakorisága befolyásolásával.
    * Loot: Gyűjtögetés, fosztogatás vagy fosztogatás révén szerzett zsákmány, hadizsákmány 
