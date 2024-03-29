Extension { #name : #RbsRobotTest }

{ #category : #'*Robots-Optimize' }
RbsRobotTest >> testMergeDirectionCommandsReturnTheLastOne [

	| cmdList |
	cmdList := (RbsDirectionCommand new direction: #east; yourself)
		mergeWith: (RbsDirectionCommand new direction: #north ; yourself).
	self assert: cmdList size equals: 1.
	self assert: cmdList first direction equals: #north.
]

{ #category : #'*Robots-Optimize' }
RbsRobotTest >> testMergeMoveCommandsProducesTheSum [

	| cmdList |
	cmdList := (RbsMoveCommand new distance: 10; yourself)
		mergeWith: (RbsMoveCommand new distance: 10; yourself).
	self assert: cmdList size equals: 1.
	self assert: cmdList first distance equals: 20.
]

{ #category : #'*Robots-Optimize' }
RbsRobotTest >> testMergeUNmergeableCommandsBecauseDifferent2 [

	| cmdList |
	cmdList := (RbsDirectionCommand new direction: #east; yourself)
		mergeWith: (RbsMoveCommand new distance: 10; yourself).
	self assert: cmdList size equals: 2.
	self assert: cmdList first direction equals: #east
]

{ #category : #'*Robots-Optimize' }
RbsRobotTest >> testMergeUnmergeableCommandsBecauseDifferent [

	| cmdList |
	cmdList := (RbsMoveCommand new distance: 10; yourself)
		mergeWith: (RbsDirectionCommand new direction: #east; yourself).
	self assert: cmdList size equals: 2.
	self assert: cmdList first distance equals: 10.
	
	
	
]

{ #category : #'*Robots-Optimize' }
RbsRobotTest >> testOptimizeMergeThreeMoves [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
	rb optimizePath: 
'mov 2
mov 3
mov 4'.
	self 
		assert: (rb path collect: [ :each | each printString ]) asOrderedCollection
		equals: #( 'mov 9') asOrderedCollection
]

{ #category : #'*Robots-Optimize' }
RbsRobotTest >> testOptimizeMergeThreeMoves2 [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
	rb optimizePath2: 
'mov 2
mov 3
mov 4'.
	self 
		assert: (rb path collect: [ :each | each printString ]) 
		equals: #( 'mov 9') asOrderedCollection
]

{ #category : #'*Robots-Optimize' }
RbsRobotTest >> testOptimizeMergeThreeMovesAndOthers [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
	rb optimizePath: 
'mov 2
mov 3
mov 4
dir #east'.
	self 
		assert: (rb path collect: [ :each | each printString ]) 
		equals: #( 'mov 9' 'dir #east')
]

{ #category : #'*Robots-Optimize' }
RbsRobotTest >> testOptimizeMergeThreeMovesAndOthers2 [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
	rb optimizePath2: 
'mov 2
mov 3
mov 4
dir #east'.
	self 
		assert: (rb path collect: [ :each | each printString ]) 
		equals: #( 'mov 9' 'dir #east') asOrderedCollection
]

{ #category : #'*Robots-Optimize' }
RbsRobotTest >> testOptimizeMergeTwoMoves [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
	rb optimizePath: 
'mov 2
mov 3'.
	self 
		assert: (rb path collect: [ :each | each printString ]) asOrderedCollection
		equals: #( 'mov 5') asOrderedCollection
]

{ #category : #'*Robots-Optimize' }
RbsRobotTest >> testOptimizeMergeTwoMoves2 [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
	rb optimizePath2: 
'mov 2
mov 3'.
	self 
		assert: (rb path collect: [ :each | each printString ]) 
		equals: #( 'mov 5') asOrderedCollection
]

{ #category : #'*Robots-Optimize' }
RbsRobotTest >> testOptimizeMergeTwoMovesAndOthers [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
	rb optimizePath: 
'mov 2
mov 3
dir #east'.
	self 
		assert: (rb path collect: [ :each | each printString ]) 
		equals: #( 'mov 5' 'dir #east')
]

{ #category : #'*Robots-Optimize' }
RbsRobotTest >> testOptimizeMergeTwoMovesAndOthers2 [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
	rb optimizePath2: 
'mov 2
mov 3
dir #east'.
	self 
		assert: (rb path collect: [ :each | each printString ]) 
		equals: #( 'mov 5' 'dir #east') asOrderedCollection
]

{ #category : #'*Robots-Optimize' }
RbsRobotTest >> testOptimizeNoMergeThenMergeThreeMovesAndOthers [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
	rb optimizePath: 
'dir #north
mov 2
mov 3
mov 4
dir #east'.
	self 
		assert: (rb path collect: [ :each | each printString ]) asOrderedCollection
		equals: #( 'dir #north' 'mov 9' 'dir #east') asOrderedCollection 
]

{ #category : #'*Robots-Optimize' }
RbsRobotTest >> testOptimizeNoMergeThenMergeThreeMovesAndOthers2 [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
	rb optimizePath2: 
'dir #north
mov 2
mov 3
mov 4
dir #east'.
	self 
		assert: (rb path collect: [ :each | each printString ]) 
		equals: #( 'dir #north' 'mov 9' 'dir #east') asOrderedCollection 
]

{ #category : #'*Robots-Optimize' }
RbsRobotTest >> testOptimizeTwoDirections [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
	rb optimizePath: 
'dir #north
dir #east'.
	self 
		assert: (rb path collect: [ :each | each printString ]) 
		equals: #( 'dir #east')
]

{ #category : #'*Robots-Optimize' }
RbsRobotTest >> testOptimizeTwoDirections2 [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
	rb optimizePath2: 
'dir #north
dir #east'.
	self 
		assert: (rb path collect: [ :each | each printString ]) 
		equals: #( 'dir #east') asOrderedCollection
]

{ #category : #'*Robots-Optimize' }
RbsRobotTest >> testToOptimizeAPathWeNeedAtLeastTwoElements [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
	rb optimizePath: 
'dir #east'.
	self 
		assert: rb path first printString 
		equals: 'dir #east'
]

{ #category : #'*Robots-Optimize' }
RbsRobotTest >> testToOptimizeAPathWeNeedAtLeastTwoElements2 [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
	rb optimizePath2: 
'dir #east'.
	self 
		assert: rb path first printString 
		equals: 'dir #east'
]
