repl:
	docker run -it --rm -w=/coding_stones --mount src=`pwd`/exercises,target=/coding_stones,type=bind swipl
