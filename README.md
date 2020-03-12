# Terminal Application - Term 1 Assignment 2
## **Statement of Purpose and Scope**
The intention of this program is to emulate and replicate the infamous Enigma Machine which gained its notoriety from World War 2. Originally developed by Arthur Scherbius at the end of World War 1, it was extensively deployed by the Germans during the second World War to provide cryptographic security for civilian and military purposes.

This program, named 'Enigma' in kind, will provide a way for users to encrypt and decrypt messages effectively using the same method as the original Enigma Machine. By using a (s$$ecret) starting code or key the user will be able to input a plain-text message and receive an encrypted message. Likewise, this message can then be decrypted by using the same starting key and inputting the encrypted message, receiving the original message. 

The encryption and decryption was accomplished by a series of polyalphabetic substitution ciphers. In more laymans terms, every character in any message that was input was replaced/substituted with another multiple times. However, due to a series of rotating rotors changing the character substitions there was no discernable pattern to the substitutions (leading many to think it was unbreakable).

Whilst not an exact replica of the original Enigma Machines, given the time constraints the increased complexities that were implemented for the German military were omitted as well as out-of-the-box customisability in civilian implementations, Enigma provides a great opportunity to expand my knowledgebase and further my interest in cryptology, mathematics, and algorithms. 

As the catalyst for what many call the "first" computer, the Enigma Machine, and the subsequent Bombe developed by Alan Turing to decipher its codes, is undoubtedly a hallmark achievement in computing and as a precursor to programming as we know it today makes it a captivating first project. 

Anyone with a passing interest in cryptology, history (especially World War 2), or anyone just wanting to hide their messages from others will find Enigma an interesting program. 

## **Features**
### Encryption
One half of the primary purpose of this cryptographic tool is to encrypt messages using a polyalphabetic substitution cipher. By being able to go through each character of a word, sentence, or more and replacing each one with different letter via multiple key pairings, dictated by the rotor's and reflector's setup, the user is able to convert their message into what is effectively gobbledygook to any prying eyes. This encrypted message can be effectively stolen and will be ultimately worthless to a thief (even if they had a copy of the Enigma program) without the user's secret 6 digit cipher code. 
### Decryption
The other half of Enigma's primary purpose is to be able to decrypt encoded messages with the user's secret 6 digit cipher code back to their original message. This is in effect a primitive version of symmetric key cryptography. By having the user being able to set or receive a key and message they are able to retrieve their secret messages at a later time and date when required. This implementation of symmetric key cryptography using rotors and a reflector means the complete reverse operation of cycling through each character and substituting each with character key pairings translates the prior gibberish back into the original plain-text.
### Export
For ease of use, record keeping, and transportability the user is able to export their encrypted or decrypted messages to a text file. This serves a potentially valuable option for any user that wishes to transmit their messages (particularly lengthy ones) to another recipient via another means with the knowledge that their message can be read, having been decrypted, or is secure (once encrypted). The file itself is saved under a random name using a cryptographically strong random number generator; meaning it meets US Government's Federal Information Processing Standard for cryptographic modules. This is to ensure that no contextual clues can be gleamed from the file's name, maintaning its security.

# User Interaction

## Interaction Outline
The user's sole point of interaction will be the terminal/command-line. As the inputs are solely text based no other method of user input is necessary.

Be it that the user interacts with only the command line Enigma will prompt the user in the terminal when they are required to enter data and what kind of data the program is expecting. It is then expected that the user will then enter said data into the terminal.

As Enigma only requires specific forms of data (e.g. 6 digits for the cipher code) we can constrain the possible types of data the user can input, which pre-emptively stops user error when using the program.

When said users are entering data, should they enter the incorrect data types, Enigma (through the implementation of various Ruby Gems) will provide feedback to the user via the terminal, notifying them of what is required. 

Due to the export feature the user will be able to generate text files filled with their messages, however, these are outputs from Enigma saved to their PC. They do not act as inputs from the user. The process and experience of saving said files is nearly seemless and they are notified of the save location on completion. 

