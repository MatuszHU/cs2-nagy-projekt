math.randomseed(os.time())
inUse = {}

return {
    names = {
        orc = {
        male = {
            "Gromkar", "Thragnok", "Urdak", "Mokgar", "Brakthar", "Drogash", "Krogath", "Vorguk", "Thokmar", "Rukhar",
            "Zargoth", "Grumak", "Horgath", "Drokul", "Kragash", "Urthok", "Morkul", "Tharok", "Vargul", "Brumok",
            "Zorgrak", "Gorthak", "Khurmak", "Drogath", "Rukmog"
        },
        female = {
            "Shagra", "Morgra", "Thurka", "Uzgara", "Branka", "Drogna", "Krasha", "Vorga", "Thokara", "Rukara",
            "Zagra", "Grumira", "Horga", "Drokira", "Kragha", "Urgana", "Morka", "Thargha", "Vargra", "Brumira",
            "Zorgha", "Gorthira", "Khurga", "Draga", "Rukmira"
        }
        },
        elf = {
        male = {
            "Aelion", "Faelar", "Theron", "Eldrin", "Sylvar", "Caelith", "Arannis", "Letharion", "Vaelor", "Rhiannon",
            "Thalion", "Eryndor", "Galanor", "Quarion", "Mythran", "Altharion", "Varion", "Selarion", "Finariel", "Lorathil",
            "Naelor", "Cyradis", "Elandor", "Thalior", "Vaeril"
        },
        female = {
            "Aelara", "Luthien", "Elyndra", "Faelira", "Shalana", "Araleth", "Thalira", "Vaelora", "Myrrhiel", "Selwyn",
            "Calithra", "Elaniel", "Ilyana", "Loriel", "Thessalia", "Vaelith", "Nymeria", "Feylira", "Althaea", "Sylvara",
            "Rhiara", "Quenara", "Elyria", "Yllara", "Maraleth"
        }
        },
        goblin = {
        male = {
            "Gribnuk", "Snark", "Zibbit", "Krunk", "Blizg", "Frenk", "Tazzik", "Ribbitz", "Vogg", "Snizzle",
            "Kobb", "Zarn", "Gibnuk", "Trizzik", "Bogguk", "Rikkit", "Venzik", "Gnib", "Skarn", "Plibbit",
            "Drizzik", "Klibb", "Snork", "Grizzle", "Zubb"
        },
        female = {
            "Snaga", "Zibba", "Krinka", "Blitza", "Frenka", "Tazza", "Ribbita", "Vogga", "Snizzla", "Kobba",
            "Zarna", "Gibba", "Trizzika", "Boggula", "Rikkita", "Venzika", "Gniba", "Skarna", "Plibbita", "Drizzika",
            "Klibba", "Snorka", "Grizzla", "Zubba", "Nibba"
        }
        },
        human = {
        male = {
            "Aric", "Brennan", "Cedric", "Dorian", "Edric", "Farlan", "Gideon", "Hadrian", "Jareth", "Kieran",
            "Lucan", "Marcus", "Nolan", "Orin", "Percival", "Quentin", "Roland", "Sebastian", "Theron", "Ulric",
            "Victor", "Wesley", "Xander", "Yorick", "Zane"
        },
        female = {
            "Alyssa", "Brienne", "Cassandra", "Dahlia", "Elara", "Fiona", "Gwendolyn", "Helena", "Isolde", "Jocelyn",
            "Katrina", "Lydia", "Miranda", "Nerissa", "Ophelia", "Rosalind", "Selene", "Theresa", "Ursula", "Vivian",
            "Wilhelmina", "Xanthe", "Ysolde", "Zara", "Arden"
        }
        },
        dwarf = {
        male = {
            "Thorin", "Balin", "Dwalin", "Gloin", "Oin", "Farin", "Borin", "Korin", "Durin", "Grorin",
            "Mardin", "Rurik", "Thrain", "Fundin", "Bruni", "Hargin", "Dorin", "Garrik", "Kargan", "Morin",
            "Rognar", "Thaldin", "Urin", "Varrik", "Zorin"
        },
        female = {
            "Disna", "Hilda", "Brynna", "Kelda", "Thora", "Freya", "Gilda", "Ragna", "Sigrid", "Vigga",
            "Ylva", "Astrid", "Bruna", "Eira", "Freyja", "Gunnora", "Hildra", "Inga", "Kara", "Lifa",
            "Myrna", "Othilda", "Runa", "Solveig", "Thyra"
        }
        }
    },
     contains = function(self, tbl, value)
        for _, v in ipairs(tbl) do
            if v == value then return true end
        end
        return false
    end,

    getRandomName = function(self, race, gender)
        local names = self.names[race][gender]
        local length = #names

        local name = names[math.random(1, length)]
        while self:contains(inUse, name) do
            name = names[math.random(1, length)]
        end
        table.insert(inUse, name)
        return name
    end,

    removeName = function(self, name)
        for i, v in ipairs(inUse) do
            if v == name then
                table.remove(inUse, i)
                break
            end
        end
    end
}


