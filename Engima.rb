require "tty-prompt"
require "pastel"

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
        
        if c != " "
            c = r1[c]
            c = r2[c]
            c = r3[c]

            c = REFLECTOR_HASH[c]
            
            c = r3.invert[c]
            c = r2.invert[c]
            c = r1.invert[c]
        else
        end

    }.join

end

def rotor_setting(rotor, i)
    Hash[ABC_KEYS.zip(rotor.rotate(i))]
end

def get_setting
    setter = TTY::Prompt.new
    setting = setter.ask("What is your code?", convert: :int) do |q|
        q.required true
        q.validate(/\b[0-9]{6}\b/, "Invalid code, please enter a 6 digit number")
    end

    s1 = setting[0..1]
    s2 = setting[2..3]
    s3 = setting[4..5]

    $default_rotor1 = rotor_setting(ROTOR1_VALUES, s1)
    $default_rotor2 = rotor_setting(ROTOR2_VALUES, s2)
    $default_rotor3 = rotor_setting(ROTOR3_VALUES, s3)
end

def get_string
    stringer = TTY::Prompt.new
    str = stringer.ask("Enter your message to be encoded") do |q|
        q.required true
        q.validate(/^[a-zA-Z ]/, "Messages must only be include letters and spaces")
    end
    str = str.delete(' ')
    output_string(input(str))
end

def output_string(str)
   p output = str.gsub(/.{1,4}(?=.)/, '\0 ')
end

prompt = TTY::Prompt.new
prompt.keypress("Press any key to continue")

get_setting()
get_string()
