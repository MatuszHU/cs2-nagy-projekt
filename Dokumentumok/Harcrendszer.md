# Harcrendszer

A harcrendszser körökre osztott. Minden csatát a játékos kezd, tehát az első kör az mindig az egyik játékos irányított karakteré. A játékos kiválaszt egy karaktert aki ebben a körben még nem volt aktív. Miután az a karakter végzett a körével az ellenfél jön. Ő is szintén választ egy karaktert aki még nem volt aktív az ő oldaláról, és ugyan azokat a műveletek választhatja. Azután megint a játékos jön.

## Egy karakter kör menete

1. Az aktív játékos választ egy nem fáradt karaktert.
2. A karakter a saját mozgás értékének megfelelő számú mezőt léphet legfeljebb
3. A játékos a válastott karakterrel az alábbi akciók közül választhat egyet (kivéve ha egy tárgy vagy felszerelés mást ír elő):
    - támadás
    - tárgy használata
    - tárgy átadása más karakternek
    - Őködés (ha egy ellenség belép az támadási zónájában akkor megtámadja.)

4. A karakter elfárad. Kör vége. Játékos váltás.

## Alap harc mechanikák

- Támadó ATK = karakter ATK + fegyver ATK
- Védekező DEF = karakter DEF + item DEf a karakteren
- Sebzés számolás: Támadó ATK - Védekező DEF
- Kritikus sebzés számolása: (Támadó ATK - Védekező DEF) X 2
- MAG sebzés esetén a képletek ugyan azok, csak a támadó MAG és a védekező RES-ét használva
- Kritikus esély számolás: Támadó LCK + egyéb módosítók (például tárgyak hatása). Ez % érték.
- Találati esély számolása: (Támadó ACC + 100) - Védekező EVA

## Kiegészítések

- A karakterek annyi mezőt látnak, amennyi a fow statjuk.
- A karakterek nem támadhatnak olyan ellenfelet akit nem látnak.
- A karakterek mozgás után újra megvilágítják maguk körül a területet a fow statnak megfelelően.
- Ha a mozgás során ellenfélbe ütköznek a mozgás végét ér, és a karakter köre is, mert meglepődött.
- A karakter csak olyan ellenfelet támadhat, aki a használt fegyverének a támadási zónájában van.
- Tárgyak használatára ugyan ezek a szabályok vonatkoznak.
