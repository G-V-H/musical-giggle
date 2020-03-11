def run_crypto(crypto)
    file = ""
    while file == ""
        print "Enter the filename you want to #{crypto}\n(or type 'quit' to return to the main menu): "
        file = gets.chomp
        if File.file?(file)
            begin
                crypto == "Encrypt" ? system("openssl aes-128-cbc -a -salt -in #{file} -out #{file}.enc") : system("openssl aes-128-cbc -d -a -in #{file} -out 1#{file.delete_suffix(".enc")}", :err => File::NULL)
                puts "#{crypto}ion complete"
            rescue 
               puts "Invalid Password"
            end
        elsif file == "quit"
            file = nil 
        else
            puts "Invalid file name"
            file = ""
        end
    end
end

def menu()
    quit = false
    p quit
    puts "Welcome to Cryptor"
    while quit == false
        puts "Select from the following options\n 1: Encrypt a file\n 2: Decrypt a file\n 3: Quit"
        choice = gets.chomp

        if choice == "1"
            run_crypto("Encrypt")
        elsif choice == "2"
            run_crypto("Decrypt")
        elsif choice == "3"
            quit = true
        else
            puts "Invalid Selection. Please enter '1', '2', or '3'"
        end
    end
end

menu