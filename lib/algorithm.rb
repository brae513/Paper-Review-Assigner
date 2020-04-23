require 'student'
require 'paper'

def printMat(mat)
	print mat
	#mat.each do |n|
	#	n.each do |x|
	#		puts x
	#	end
	#end
=begin
for i in 0..mat.length-1
		print i
		print ":\t"
		#print mat[i]
		mat2 = mat[i]
		for j in 0..mat2.length-1
			print mat2[j]
			print "\t"
		end
		print "\n"
	end
=end
	for i in 0..mat.length-1
		print i
		print mat[i]
		print ":"
		print "\t"
		mat2 = mat[i]
		for j in 0..mat2.length-1
			print mat2[j]
			print "\t"
		end
		print "\n"
	end
	print "\n"
end

def generateStudents()
	stuMat = Array.new(@studentCnt,Array.new(@amtOfPrefs,-1))
	for i in (0..@studentCnt-1)
		used = Array.new()
		stuArr = Array.new(@amtOfPrefs,-1);
		spotsToAdd = @amtOfPrefs
		if @amtOfPrefs > @paperCnt
			spotsToAdd = @paperCnt
		end
		for j in (0..spotsToAdd-1)
			spot = rand(@paperCnt)
			while used.include?(spot)
				spot = rand(@paperCnt)
			end
			stuArr[j]=spot
			used.push(spot)
			#print stuMat
			#print "\n"
		end
		stuMat[i]=stuArr
	end
	stuMat
end

def generateStudents2(students)
    stuMat = Array.new(@studentCnt){Array.new(@amtOfPrefs){-1}}
    for i in 0..@studentCnt-1
        arr = students[i].paper_preference
        for j in 0..arr.length-1
        	if @paperMap.include?(arr[j])
            	stuMat[i][j]=@paperMap.index(arr[j])
        	end
        end
    end
    stuMat
end

def generateSeniors()
	isSenior = Array.new(@studentCnt){false}
	for i in 0..@studentCnt/2-1
		spot = rand(@studentCnt)
		while isSenior[spot]
			spot = rand(@studentCnt)
		end
		isSenior[spot] = true
	end
	isSenior
end

def generateSeniors2(students)
    isSenior = Array.new(students.length){false}
    for i in 0..students.length-1
        isSenior[i]=students[i].classification=="Senior"
    end
    isSenior
end

def generateMatrix(stuMat)
	mat = Array.new(@paperCnt){Array.new(@studentCnt){0}}	
	#print stuMat
	print @studentCnt
	for i in 0..@studentCnt-1
		#print stuMat[0]
		for j in 0..stuMat[i].size-1
			if stuMat[i][j] != -1
				mat[stuMat[i][j]][i] = @amtOfPrefs-j
			end
			#printMat(mat)
		end
	end
	mat
end


def assignPapers(mat,isSenior)
	paperAssignments = Array.new(@paperCnt){Array.new(@studentsPerPaper){-1}}
	studentsAssigned = Array.new(@paperCnt){0}
	papersAssigned = Array.new(@studentCnt){0}
	
	#Assign a senior to every paper first to guarentee each paper gets a senior
	
	#First find all available seniors
	eligibleSeniors = Array.new();
	for i in 0..isSenior.length-1
		if(isSenior[i])
			eligibleSeniors.push(i)
		end
	end

	for i in 0..@paperCnt-1
		max = -1
		maxStud = -1
		#If there are no more eligible seniors, regenerate the list
		if eligibleSeniors.length<1
			for j in 0..isSenior.length-1
				if isSenior[j]
					eligibleSeniors.push(j)
				end
			end
		end
		#Find best fit senior for the current paper
		for j in 0..eligibleSeniors.length-1
			curSen = eligibleSeniors[j]
			if(mat[i][curSen]>max)
				max = mat[i][curSen]
				maxStud=j
			end
		end
		#Assign the senior to the paper
		if maxStud == -1
			print "ERROR\n"
			print eligibleSeniors.size
		end
		sen = eligibleSeniors[maxStud]
		paperAssignments[i][0]=sen
		papersAssigned[sen]+=1
		studentsAssigned[i]+=1
		#If senior is working as much as they should, remove them from the available seniors
		if((papersAssigned[sen]==@papersPerStudent && @extras<1) || papersAssigned[sen]>@papersPerStudent)
			if(papersAssigned[sen]>@papersPerStudent)
				@extras-=1
			end
			eligibleSeniors.delete_at(maxStud)
		end
	end
	#Fill the rest of assignments based on best available students
	for x in 0..@amtOfPrefs
		i = @amtOfPrefs-x
		for j in 0..mat.size-1
			#Check to see what students are already on current paper
			onPaper =  Array.new();
			for k in 0..studentsAssigned[j]-1
				onPaper.push(paperAssignments[j][k]);
			end
			for k in 0..mat[j].size-1
				#If the spot is at the rating being looked for and the current paper needs a student, and the student is available and is not already on this paper, perform the assignment
				if(mat[j][k]==i && studentsAssigned[j]<@studentsPerPaper && (papersAssigned[k]<@papersPerStudent || papersAssigned[k]==@papersPerStudent && @extras>0) && !onPaper.include?(k))
					#If this student would be using an extra slot, reduce amount of extras remaining
					if(papersAssigned[k]==@papersPerStudent) 
						@extras -=1 
					end
					#print "#{j},#{studentsAssigned[j]} \n"
					paperAssignments[j][studentsAssigned[j]]=k;
					studentsAssigned[j]+=1;
					papersAssigned[k]+=1;
				end
			end
		end
	end
	#Find what students and papers can still be assigned
	remainingStudents = Array.new()
	remainingPapers = Array.new()
	for i in 0..papersAssigned.length-1
		if(papersAssigned[i]<@papersPerStudent || papersAssigned[i]==@papersPerStudent && @extras>0)
			remainingStudents.push(i)
		end
	end
	for i in 0..studentsAssigned.length-1
		if studentsAssigned[i]<@studentsPerPaper
			remainingPapers.push(i)
		end
	end
	#Fill in remaining assignments
	for i in 0..remainingPapers.length-1
		if i<remainingPapers.length
			paper = remainingPapers[i]
			for j in 0..remainingStudents.length-1
				if j<remainingStudents.length
					stud = remainingStudents[j]
					if(!paperAssignments[paper].include?(stud))
						#print "#{paper},#{studentsAssigned[paper]} \n"
						paperAssignments[paper][studentsAssigned[paper]] = stud
						studentsAssigned[paper]+=1
						papersAssigned[stud]+=1
						if((papersAssigned[stud]>=@papersPerStudent && @extras<1) || papersAssigned[stud]>@papersPerStudent)
							if(papersAssigned[stud]>@papersPerStudent)
								@extras-=1
							end
							remainingStudents.delete_at(j)
							j-=1
						end
						if(studentsAssigned[paper]>=@studentsPerPaper)
							remainingPapers.delete_at(i)
							i-=1
							if i>=0
								i-=1
							end
							break
						end
					end
				end
			end
		end
	end
	#Trade off where assignments are still needed, but minimize penalty for these trades
	for i in 0..remainingPapers.length-1
		if(i<remainingPapers.length)
			paper = remainingPapers[i]
			studsReq = @studentsPerPaper-studentsAssigned[paper]
			for j in 0..studsReq-1
				minCost = 100
				paperToTrade = -1
				studentToTrade = -1
				oldStudToTrade = -1
				#Find all student candidates for each remaining paper
				for k in 0..@paperCnt-1
					if(!remainingPapers.include?(k))
						posCandidates = Array.new()
						for l in 0..remainingStudents.length-1
							b = true
							for s in 0..paperAssignments[k].length-1
								if(paperAssignments[k][s]==remainingStudents[l])
									b=false
								end
							end
							if(b)
								posCandidates.push(remainingStudents[l])
							end
						end
						if(posCandidates.length>0)
							for l in 1..paperAssignments[k].length-1
								curStud = paperAssignments[k][l]
								if(curStud!=paperAssignments[paper][0] && curStud!=paperAssignments[paper][1])
									curCost = mat[k][curStud]
									#if current candidate is better, make it the active candidate to trade
									if(curCost<minCost)
										minCost=curCost
										paperToTrade = k
										studentToTrade = l
										oldStudToTrade = posCandidates[0]
									end
								end
							end
						end
					end
				end
				if studentToTrade==-1
					#Something went wrong and the algorithm was unable to assign the paper to enough students
					print("ISSUE")
					printMat(mat)
					print(isSenior)
					print @amtOfPrefs
					print "\n"
					print @studentsPerPaper
					print "\n"
				else
					#Performs the trade
					paperAssignments[paper][@studentsPerPaper-studsReq+j] = paperAssignments[paperToTrade][studentToTrade]
					paperAssignments[paperToTrade][studentToTrade] = oldStudToTrade
					papersAssigned[oldStudToTrade]+=1
					studentsAssigned[paper]+=1
					#checks if any remaining students are now satisfied
					for k in 0..remainingStudents.length-1
						if k < remainingStudents.length
							cnt = papersAssigned[remainingStudents[k]]
							if((cnt==@papersPerStudent && @extras<1) || cnt==@papersPerStudent+1)
								if(remainingStudents[k]==@papersPerStudent+1)
									@extras-=1
									remainingStudents.delete_at(k)
									k = -1
								else
									remainingStudents.delete_at(k)
									k-=1
								end
							end
						end
					end
					#checks if any remaining papers are now satisfied
					for k in 0..remainingPapers.length-1
						if k <remainingPapers.length
							#print "\n paper = #{remainingPapers[k]}, total papers = #{@paperCnt}, k= #{k}, remainingPapers = #{remainingPapers.length}.\n"
							if(studentsAssigned[remainingPapers[k]]==@studentsPerPaper)
								remainingPapers.delete_at(k)
								k-=1
								i-=1
							end
						end
					end
				end
			end
		end
	end
				
	paperAssignments
end

def assignPaper(student,paper)

    print paper.students_assigned
    x = paper.students_assigned
    x.push(student.id)
    print x
    student.current_papers+=1
    paper.students_assigned = x

end

def setPaperCnt(cnt)
    @paperCnt = cnt
end

def setStudentCnt(cnt)
    @studentCnt = cnt
end

def createPaperMap(papers)
    @paperMap = Array.new()
    for i in 0..papers.length-1
        paper = papers[i]
        arr = Array.new()
        arr.push(i)
        arr.push(paper.id)
        @paperMap.push(paper.id)
    end
end

def createStudentMap(students)
    @studentMap = Array.new()
    for i in 0..students.length-1  
        student = students[i]
        arr = Array.new()
        arr.push(i)
        arr.push(student)
        @studentMap.push(arr)
    end
end

def paperAssignment(students,papers)
	@paperCnt = papers.length
	@studentCnt = students.length
	@amtOfPrefs = 5
	@studentsPerPaper = 3
	if(@studentCnt>0)
	    @papersPerStudent = @paperCnt*@studentsPerPaper/@studentCnt
		@extras=(@paperCnt*@studentsPerPaper)%@studentCnt
	    createPaperMap(papers)
	    createStudentMap(students)
	    stuMat = generateStudents2(students)
	    mat = generateMatrix(stuMat)
	    print "\n"
	    printMat(stuMat)
	    printMat(mat)
	    seniors = generateSeniors2(students)
	    print seniors
	    paperAssignments = assignPapers(mat,seniors)
	    for i in 0..@paperCnt-1
	    	paper = papers.find(@paperMap[i])
	    	paper.students_assigned = Array.new()
	        for j in 0..@studentsPerPaper-1
	            assignPaper(students[paperAssignments[i][j]],paper)
	        end
	        paper.update_attribute(:students_assigned,paper.students_assigned)
	    end
	    students.each do |s|
	    	s.update_attribute(:current_papers,s.current_papers)
	    end
	    printMat(paperAssignments)
	end
end
@paperCnt = 0
@studentCnt = 0
@studentMap = Array.new()
@paperMap = Array.new()

=begin
#Variables
for i in 0..1
	print(i)
	print("\n")
	@paperCnt = 3+rand(12)
	@studentCnt = 3+rand(12)
	@amtOfPrefs = 3+rand(7)
	@studentsPerPaper = 2+rand(2)
	
	@papersPerStudent = @paperCnt*@studentsPerPaper/@studentCnt
	@extras=(@paperCnt*@studentsPerPaper)%@studentCnt
	
	#Generating randomized data (this should be an input later)
	stuMat = generateStudents()
	#stuMat = Array.new(@studentCnt){Array.new(@amtOfPrefs,-1)}
	seniors = generateSeniors()
	#Constructing matix from data
	mat = generateMatrix(stuMat)
	
	#Assignment 
	#seniors = [false, true, false, false,false]
	
	
	#Printing
	#printMat(stuMat)
	#printMat(mat)
	#print("!")
	#print(seniors)
	#print ("\nAssignments:\n")
	papAssign = assignPapers(mat,seniors)
	
	#printMat(papAssign)
end
=end