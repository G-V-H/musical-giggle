ABC_KEYS = ("A".."Z").to_a.freeze

reflector_values = "EJMZALYXVBWFCRQUONTSPIKHGD".split("")
REFLECTOR_HASH = Hash[ABC_KEYS.zip(reflector_values)].freeze

ROTOR1_VALUES = "EJMZALYXVBWFCRQUONTSPIKHGD".split("").freeze
ROTOR2_VALUES = "YRUHQSLDPXNGOKMIEBFZCWVJAT".split("").freeze
ROTOR3_VALUES = "FVPJIAOYEDRZXWGCTKUQSBNMHL".split("").freeze


# rotor2_hash = Hash[ABC_KEYS.zip(ROTOR2_VALUES)]
# rotor3_hash = Hash[ABC_KEYS.zip(ROTOR3_VALUES)]


def input()

    str = "str"
    r1 = ROTOR1_VALUES
    r2 = ROTOR2_VALUES
    r3 = ROTOR3_VALUES
    str.upcase.each_char.with_index {|c, i| 
        r1 = rotate_rotor(ROTOR1_VALUES, i)
        if i % 26 == 25
            r2 = rotate_rotor(ROTOR2_VALUES, (i % 25))
        end
        if i % 676 == 0
            r3 = rotate_rotor(ROTOR3_VALUES, (i % 675))
        end
        p c
        c = r1[c]
        c = r2[c]
        c = r3[c]
        
        c = REFLECTOR_HASH[c]
        
        c = r3.invert[c]
        c = r2.invert[c]
        c = r1.invert[c]

        p c
    }

end

def rotate_rotor(rotor, i)
    rotor = Hash[ABC_KEYS.rotate(i).zip(ROTOR1_VALUES.rotate(i))]
end

input()
