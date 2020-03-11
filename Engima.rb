abc_keys = ("A".."Z").to_a

reflector_values = "EJMZALYXVBWFCRQUONTSPIKHGD".split("")
reflector_hash = abc_keys.zip(reflector_values)

ROTOR1_VALUES = "EJMZALYXVBWFCRQUONTSPIKHGD".split("")
ROTOR2_VALUES = "YRUHQSLDPXNGOKMIEBFZCWVJAT".split("")
ROTOR3_VALUES = "FVPJIAOYEDRZXWGCTKUQSBNMHL".split("")

rotor1_hash = Hash[abc_keys.zip(ROTOR1_VALUES)]
rotor2_hash = Hash[abc_keys.zip(ROTOR2_VALUES)]
rotor3_hash = Hash[abc_keys.zip(rotor3_values)]


def input(r1, r2, r3)
    str = "str"
    str.upcase.each_char.with_index {|c, i| 
        c = r1[c]
        c = r2[c]
        c = r3[c]
        # p c
    }

end

# input(rotor1_hash, rotor2_hash, rotor3_hash)

p 26 % 25 * 25