Class {
	#name : #SkPlayer,
	#superclass : #SkMovable,
	#category : #'SokoBrain-Model'
}

{ #category : #'default encoding' }
SkPlayer class >> textualMapCharacter [ 
	^ $@
]

{ #category : #move }
SkPlayer >> isPlayer [ 
	^ true
]

{ #category : #move }
SkPlayer >> postCreationAction [ 

	board setPlayer: self.
	self background: (SkGround new basicPosition: self position; yourself).
]
