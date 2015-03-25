=begin
Name will be hangman football managers
Steps for hangman footballers
1. Create a word bank that has the player names
2. Present user with the opportunity to enter a letter
3. If letter is correct then display a new pane with the correctly guessed letters
4. If not, reduce the user's life
5. If user has 0 lives then game over. Otherwise keep
playing the game.
6. If a user guesses the word correctly with lives to spare then he wins the game
=end

def set_Word(word)
  @chosenWord = word
end

def get_Word
  @chosenWord
end

def set_Letter(letter)
  @chosenLetter = letter
end

def get_Letter
  @chosenLetter
end

def set_List(list)
  @list = list
end

def get_List
  print @list
end

def show_List
  @list
end

def get_Length(word)
  word.length
end

def set_ListLetter(letter,index)
  @list[index] = letter
end

def set_Life(life)
  @life = life
end

def get_Life
  @life
end

def set_GameOver(status)
  @status = status
end

def get_GameOver
  @status
end

def set_Winner(win)
  @win = win
end

def get_Winner
  @win
end

def show_Life
  puts "You have #{@life} live(s) remaining!"
end

def initialStick
  print "         _O_      \n"
  print "          |       \n"
  print "         _|_      \n"
  print "        |   |     \n"
  print "                  \n"
end

def displayStick(life)
  if life == 8 then
    print "         _O_      \n"
    print "          |       \n"
    print "         _|_      \n"
    print "        |         \n"
    print "                  \n"
  elsif life == 7 then
    print "         _O_      \n"
    print "          |       \n"
    print "         _|_      \n"
    print "                  \n"
    print "                  \n"
  elsif life == 6 then
    print "         _O_      \n"
    print "          |       \n"
    print "         _|       \n"
    print "                  \n"
  elsif life == 5 then
    print "         _O_      \n"
    print "          |       \n"
    print "          |       \n"
    print "                  \n"
    print "                  \n"

  elsif life == 4 then
    print "         _O_      \n"
    print "          |       \n"
    print "                  \n"
    print "                  \n"
    print "                  \n"
  elsif life == 3 then
    print "         _O_      \n"
    print "                  \n"
    print "                  \n"
    print "                  \n"
    print "                  \n"


  elsif life == 2 then
    print "         _O       \n"
    print "                  \n"
    print "                  \n"
    print "                  \n"
    print "                  \n"

  elsif life == 1 then
    print "          O       \n"
    print "                  \n"
    print "                  \n"
    print "                  \n"
    print "                  \n"
  end
end


def initialSetup
  print "Welcome to Hangman Football Managers \n"
  initialStick
  playernames = ["ANCELOTTI","BENITEZ","WENGER","PELLEGRINI","GUARDIOLA","MOURINHO","KLOPP","MANCINI","POCHETTINO","ENRIQUE","KOEMAN","SABELLA","LVG","REDKNAPP","MARTINO","DESCHAMPS","SIMEONE","MOYES","CAPELLO","CONTE"]
  v = rand(0..19)
  set_Word(playernames[v])
  set_Life(9)
  set_GameOver(0)
  x = playernames[v].length
  set_List(Array.new(x,"-"))
  get_List
end



def guessLetter
  puts "Please select a letter?"
  set_Letter(gets.chomp.upcase)
end

def letterCheck
  x = get_Word
  l = x.length - 1
  current = get_Life
  setting = false
  for i in 0..l
    if get_Letter == get_Word[i] then
      set_ListLetter(get_Letter,i)
      setting = true
      end
    end
  if setting == false then
    set_Life(current - 1)
  end
  displayStick(get_Life)
    get_List
    show_Life

end

def gameOver
  if compare(get_Word,show_List) == true then
    set_GameOver(1)
    set_Winner(1)
  else
    set_GameOver(0)
    set_Winner(0)
  end
end

def compare(word1,word2)
  l = word1.length - 1
  x = 0
  for i in 0..l
    if word1[i] == word2[i] then
      x+=1
    else
      x+=0
    end
  end
  if x == word1.length then
    true
  else
    false
  end
end

def printGameOver
  print "You Lose! Better luck next time. \n"
end

def printWinner
  print "Congratulations You Won! \n"
end

initialSetup
while get_Life > 0 && get_GameOver == 0 do
  guessLetter
  letterCheck
  gameOver
end
if get_Winner == 1 then
  printWinner

else
printGameOver
end