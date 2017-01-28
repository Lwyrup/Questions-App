require 'pry'
ARGV << "--help" if ARGV == ""


class Fileq

	def initFile #Sets up variable for array of questions, functions kinda like a clipboard?
		@questions = []
	end

	def see #Displays questions (numbering by element number needed)
		return @questions
	end
	
	def getQuestions
		File.open("questions.txt", "r") do |f|
				loadFile(f)
			f.close
		end	#Loads each line from .txt and stores each line as an array element #Loads question.txt and puts each row into @questions
	end

	def loadFile(part)
		while line = part.gets
				@questions.push(line.split("\n").join())
		end
	end

	def removeQuestion(listPos)	#Takes a number corresponding to display list number and deletes it
		@questions -= [@questions[listPos.to_i]]
	end
	
	def addQuestion(newQuestion) #Pushes new questions to question array
		@questions.push(newQuestion)
	end

	def saveFile
		#emptys .txt and fills back up with @question.join('\n')
	end

end



class Commands

def initAndExe
	@argument = ARGV

	if show
	elsif add 
	elsif rm
	end
end

def show
end

def add(string)
end

def rm(position)
end


end



















questionList = Fileq.new
questionList.initFile
questionList.getQuestions


questionList.addQuestion("Where am I?")
puts questionList.see, "\n"
questionList.removeQuestion(1)
puts questionList.see
puts "\n\n"

if ARGV[0] == "show"
	puts questionList.see
end

if ARGV[0] == "add"
	questionList.addQuestion(ARGV[1])
	puts questionList.see
end

if ARGV[0] == "rm"
	questionList.removeQuestion(ARGV[1])
	puts questionList.see
end
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





puts "Input argument #{ARGV}"
puts "- show            :Displays questions.\n- add (\"string\")  :Adds the string to questions.\n- rm (num)        :Removes the question in that list position." if ARGV[0] == "--help"







