require "tty-prompt"

ABC_KEYS = ("A".."Z").to_a

reflector_values = "EJMZALYXVBWFCRQUONTSPIKHGD".split("")
REFLECTOR_HASH = Hash[ABC_KEYS.zip(reflector_values)]

ROTOR1_VALUES = "EJMZALYXVBWFCRQUONTSPIKHGD".split("")
ROTOR2_VALUES = "YRUHQSLDPXNGOKMIEBFZCWVJAT".split("")
ROTOR3_VALUES = "FVPJIAOYEDRZXWGCTKUQSBNMHL".split("")

def rotate_rotor(rotor, i)
    Hash[ABC_KEYS.zip(rotor.rotate(i))]
end

def input(str)

    r1 = $default_rotor1.dup
    r2 = $default_rotor2.dup
    r3 = $default_rotor3.dup

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

def rotor_setting(rotor, i)
    Hash[ABC_KEYS.zip(rotor.rotate(i))]
end

def get_setting
    prompt = TTY::Prompt.new
    setting = prompt.ask("What is your code?", convert: :int) do |q|
        q.required true
        q.validate(/\b[0-9]{6}\b/, "Invalid code")
        ans = q
    end

    s1 = setting[0..1]
    s2 = setting[2..3]
    s3 = setting[4..5]

    $default_rotor1 = rotor_setting(ROTOR1_VALUES, s1)
    $default_rotor2 = rotor_setting(ROTOR2_VALUES, s2)
    $default_rotor3 = rotor_setting(ROTOR3_VALUES, s3)
end


get_setting()
print "\nEnter your message: "
str = gets.chomp
p input(str)
