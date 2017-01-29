#!/usr/bin/env ruby
require 'pry'



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
		if @argument[0].to_s == "" 
			show
		elsif @argument[0] == "add" and @argument[1].to_s != ""
			add(@argument[1])
		elsif @argument[0] == "rm" and @argument[1].to_i > 0
			rm(@argument[1])
		elsif @argument[0] == ("help")
			help
		else
			puts "error: (invalid argument)\nenter 'help' for a list of valid arguments"
		end
		
	end

	def help
		puts "Valid arguments for 'questions'\n------------------------------\n"
		puts "- add ('question')    => Adds a question with the questions in quotes after it.\n\n"
		puts "- rm (list number)    => Removes a questions from the list with that number.\n\n"
		puts "-                     => No argument will print the list."
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

















if ARGV.length > 2
	puts "error: (invalid number of arguments)\nonly a max of two arguments are allowed"

else
	commandArg = Commands.new
	commandArg.initAndExe
end





#Use hashes when doing same things to different data
#Use classes when doing different things to same data
#Where is the new keyword when creating a string like ( x= "hi" )
#If i have a class with @count is @count different for each object in class

puts "\n"



