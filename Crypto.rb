require 'openssl'
def encrypt()
        # file = gets.chomp
        while file == ""
            print "Enter the filename you want to Encrypt: "
            file = gets.chomp
            if File.file?(file)
                system("openssl aes-128-cbc -a -salt -in #{file} -out #{file}.enc")
                puts "Encrypted file succesfully generated"
            elsif file == "exit"
                abort
            else
                puts "Invalid file name"
                file = ""
            end
        end
end

def decrypt()
    file = ""

    while file == ""
        print "Enter the filename you want to Decrypt: "
        file = gets.chomp
        if File.file?(file)
            system("openssl aes-128-cbc -d -a -in #{file} -out #{file.delete_suffix(".enc")}")
            puts "Decryption complete"
        elsif file == "exit"
            abort
        else
            puts "Invalid file name"
            file = ""
        end
    end
end
# def run_crypto()

#     cipher = OpenSSL::Cipher.new('aes-256-cbc')
#     cipher.encrypt
#     # key = cipher.random_key
#     # iv = cipher.random_iv
#     key = "ThisPasswordIsReallyHardToGuess!"
#     iv = "0"*16

#     encrypt2(cipher, key, iv)
#     decrypt2(key, iv)
# end

# def encrypt2(cipher,key,iv)

#     buf = ""
#     File.open("file.enc", "wb") do |outf|
#     File.open("msg1.txt", "rb") do |inf|
#         while inf.read(4096, buf)
#             outf << cipher.update(buf)
#         end
#         outf << cipher.final
#         p "encrypt"
#     end
#     end
# end

# def decrypt2(key, iv)
#      cipher = OpenSSL::Cipher.new('aes-256-cbc')
#      cipher.decrypt
#      cipher.key = key
#      cipher.iv = iv # key and iv are the ones from above

#    buf = ""
#     File.open("file.txt", "wb") do |outf|
#     File.open("file.enc", "rb") do |inf|
#         while inf.read(4096, buf)
#             outf << cipher.update(buf)
#         end
#         outf << cipher.final
#     end
#     end
# end
# run_crypto