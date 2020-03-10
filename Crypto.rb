# require 'openssl'
# def encrypt()
#         # file = gets.chomp
#         while file == ""
#             print "Enter the filename you want to Encrypt: "
#             file = gets.chomp
#             if File.file?(file)
#                 system("openssl aes-128-cbc -a -salt -in #{file} -out #{file}.enc")
#                 puts "Encrypted file succesfully generated"
#             elsif file == "exit"
#                 abort
#             else
#                 puts "Invalid file name"
#                 file = ""
#             end
#         end
# end

# def decrypt()
#     file = ""

#     while file == ""
#         print "Enter the filename you want to Decrypt: "
#         file = gets.chomp
#         if File.file?(file)
#             system("openssl aes-128-cbc -d -a -in #{file} -out #{file.delete_suffix(".enc")}")
#             puts "Decryption complete"
#         elsif file == "exit"
#             abort
#         else
#             puts "Invalid file name"
#             file = ""
#         end
#     end
# end
def run_crypto(crypto)
    file = ""
    while file == ""
        print "Enter the filename you want to #{crypto}: "
        file = gets.chomp
        if File.file?(file)
            crypto == "Encrypt" ? system("openssl aes-128-cbc -a -salt -in #{file} -out #{file}.enc") : system("openssl aes-128-cbc -d -a -in #{file} -out #{file.delete_suffix(".enc")}")
            puts "#{crypto}ion complete"
        elsif file == "exit"
            abort
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
            puts "Invalid Selection"
        end
    end
end

menu