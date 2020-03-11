abc_keys = ("A".."Z").to_a

reflector_values = "EJMZALYXVBWFCRQUONTSPIKHGD".split("")
REFLECTOR_HASH = abc_keys.zip(reflector_values).freeze

ROTOR1_VALUES = "EJMZALYXVBWFCRQUONTSPIKHGD".split("").freeze
ROTOR2_VALUES = "YRUHQSLDPXNGOKMIEBFZCWVJAT".split("").freeze
ROTOR3_VALUES = "FVPJIAOYEDRZXWGCTKUQSBNMHL".split("").freeze

rotor1_hash = Hash[abc_keys.zip(ROTOR1_VALUES)]
rotor2_hash = Hash[abc_keys.zip(ROTOR2_VALUES)]
rotor3_hash = Hash[abc_keys.zip(ROTOR3_VALUES)]


def input(r1, r2, r3)
    str = "str"
    str.upcase.each_char.with_index {|c, i| 
        c = r1[c]
        c = r2[c]
        c = r3[c]
        p c
    }

end

input(rotor1_hash, rotor2_hash, rotor3_hash)
