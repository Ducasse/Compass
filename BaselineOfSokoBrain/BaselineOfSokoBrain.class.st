Class {
	#name : #BaselineOfSokoBrain,
	#superclass : #BaselineOf,
	#category : #BaselineOfSokoBrain
}

{ #category : #baselines }
BaselineOfSokoBrain >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec 
    		baseline: 'ContainersArray2D' 
    		with: [ spec repository: 'github://pharo-containers/Containers-Array2D/src' ].
		spec 
		   baseline: 'ContainersLinkedList' 
   			with: [ spec repository: 'github://Ducasse/Containers-LinkedList/src' ].
		spec 
			package: #'Compass';
			package: #'Robots-Board';
			package: #'Robots' with: [
				spec requires:  #( #'Robots-Board' #'ContainersLinkedList') ];
			package: #'Robots-Tests' with: [
				spec requires:  #( #'Robots') ];
			
			package: #'Robots-Optimize-Tests' with: [
				spec requires:  #( #'Robots')];
			package: #'Robots-BasicCommands-Tests' with: [
				spec requires:  #( #'Robots')];
			package: #'Robots-Replay-Tests' with: [
				spec requires:  #( #'Robots')];
			package: #'Robots-WayBack-Tests' with: [
				spec requires:  #( #'Robots')];
			
			package: #'SokoBrain'  with: [
				spec requires:  #( #'Compass' 'ContainersArray2D') ]
			]

]
