require 'pry'
ARGV << "--help" if ARGV == ""


class Fileq

	def initFile #Sets up variable for array of questions, functions kinda like a clipboard?
		@questions = []
		@listNum = 1
	end

	def see #Displays questions numbering by element number
		puts "\n"
		@questions.each do |question|
			puts "#{@listNum}.#{question}"
			@listNum += 1
		end
	end
	
	def getQuestions #Opens the file line by line and calls on loadFile
		File.open("questions.txt", "r") do |f|
				loadFile(f)
			f.close
		end	
	end

	def loadFile(part) #Takes current line and saves it as an item in the question array
		while line = part.gets
				@questions.push(line.split("\n").join())
		end
	end

	def removeQuestion(listPos)	#Takes a number corresponding to display list number and deletes it
		@questions -= [@questions[listPos.to_i - 1]]
	end
	
	def addQuestion(newQuestion) #Pushes new questions to question array
		@questions.push(newQuestion)
	end

	def saveFile #emptys .txt and fills back up with the question array
		File.open("questions.txt", "w") do |f|
			f.puts @questions
			f.close
		end
	end

end



class Commands

	def initAndExe
		@argument = ARGV
		@questionList
		initQuestionClass
		argumentReader
	end

	def initQuestionClass
		@questionList = Fileq.new
		@questionList.initFile
		@questionList.getQuestions
	end

	def argumentReader
		if @argument[0] == "show" 
			show
		elsif @argument[0] == "add"
			add(@argument[1])
		elsif @argument[0] == "rm"
			rm(@argument[1])
		end
	end






	def show
		@questionList.see
	end

	def add(string)
		@questionList.addQuestion(string)
		@questionList.see
		@questionList.saveFile
	end

	def rm(position)
		@questionList.removeQuestion(position)
		@questionList.see
		@questionList.saveFile
	end


end


















commandArg = Commands.new
commandArg.initAndExe

# questions = Fileq.new
# questions.initFile
# questions.getQuestions
# questions.addQuestion("WHERE IS THE THE LAMB SAUCE!!?!?!?!")

# binding.pry



#Use hashes when doing same things to different data
#Use classes when doing different things to same data
#Where is the new keyword when creating a string like ( x= "hi" )
#If i have a class with @count is @count different for each object in class


#List of ARGV commands to implement

#show
	#.initFile
	#.getQuestions
	#.see
#add ("string")
	#.initFile
	#.getQuestions
	#.addQuestion("string")
	#.see
	#.saveFile
#rm (num)
	#.initFile
	#.getQuestions
	#.removeQuestion("num")
	#.see
	#.saveFile




puts "\n\n"
puts "Input argument #{ARGV}"
puts "- show            :Displays questions.\n- add (\"string\")  :Adds the string to questions.\n- rm (num)        :Removes the question in that list position." if ARGV[0] == "--help"







