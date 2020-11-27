FORMATTER_OPTIONS = --swiftversion 5.3\
	--self insert\
	--disable blankLinesAtStartOfScope,blankLinesAtEndOfScope,unusedArguments,andOperator,preferKeyPath,wrapMultilineStatementBraces,enumNamespaces\
	--ifdef no-indent

format:
	swiftformat $(FORMATTER_OPTIONS) .
