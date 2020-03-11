ABC_KEYS = ("A".."Z").to_a

reflector_values = "EJMZALYXVBWFCRQUONTSPIKHGD".split("")
REFLECTOR_HASH = Hash[ABC_KEYS.zip(reflector_values)]

ROTOR1_VALUES = "EJMZALYXVBWFCRQUONTSPIKHGD".split("")
ROTOR2_VALUES = "YRUHQSLDPXNGOKMIEBFZCWVJAT".split("")
ROTOR3_VALUES = "FVPJIAOYEDRZXWGCTKUQSBNMHL".split("")

DEFAULT_ROTOR1 = Hash[ABC_KEYS.zip(ROTOR1_VALUES)]
DEFAULT_ROTOR2 = Hash[ABC_KEYS.zip(ROTOR2_VALUES)]
DEFAULT_ROTOR3 = Hash[ABC_KEYS.zip(ROTOR3_VALUES)]


def input()
    str = "abcdefghihjk"

    r1 = DEFAULT_ROTOR1.dup
    r2 = DEFAULT_ROTOR2.dup
    r3 = DEFAULT_ROTOR3.dup

    str.upcase.each_char.with_index.map {|c, i| 

        r1 = rotate_rotor(ROTOR1_VALUES, i)
        if i % 26 == 25
            r2 = rotate_rotor(ROTOR2_VALUES, (i % 25))
        end
        if i % 676 == 0
            r3 = rotate_rotor(ROTOR3_VALUES, (i % 675))
        end
        c = r1[c]
        c = r2[c]
        c = r3[c]
        
        c = REFLECTOR_HASH[c]
        
        c = r3.invert[c]
        c = r2.invert[c]
        c = r1.invert[c]

        
    }.join

end

def rotor_setting(rotor)
    
end

def rotate_rotor(rotor, i)
    Hash[ABC_KEYS.zip(rotor.rotate(i))]
end

p input()
