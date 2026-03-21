package main

import "github.com/crisywini/Go4/MindVault/internal/model/composite"

func main() {

	// Neural Networks subfolder
	neuralNetworks := composite.NewFolder("Neural Networks")
	neuralNetworks.Add(composite.NewFile("backprop.md", 120))
	neuralNetworks.Add(composite.NewFile("transformers.md", 340))
	neuralNetworks.Add(composite.NewFile("attention.md", 280))

	// AI Research folder
	aiResearch := composite.NewFolder("AI Research")
	aiResearch.Add(neuralNetworks)
	aiResearch.Add(composite.NewFile("reinforcement_learning.pdf", 500))
	aiResearch.Add(composite.NewFile("overview.txt", 80))

	// Mathematics subfolder
	mathematics := composite.NewFolder("Mathematics")
	mathematics.Add(composite.NewFile("linear_algebra.pdf", 220))
	mathematics.Add(composite.NewFile("calculus.md", 180))

	// Computer Science subfolder
	computerScience := composite.NewFolder("Computer Science")
	computerScience.Add(composite.NewFile("algorithms.pdf", 410))
	computerScience.Add(composite.NewFile("data_structures.md", 195))

	// Knowledge Base folder
	knowledgeBase := composite.NewFolder("Knowledge Base")
	knowledgeBase.Add(mathematics)
	knowledgeBase.Add(computerScience)
	knowledgeBase.Add(composite.NewFile("index.txt", 40))

	// Archives subfolders
	archives2023 := composite.NewFolder("2023")
	archives2023.Add(composite.NewFile("report_q1.pdf", 300))
	archives2023.Add(composite.NewFile("report_q2.pdf", 310))

	archives := composite.NewFolder("Archives")
	archives.Add(archives2023)
	archives.Add(composite.NewFile("summary_2023.txt", 95))

	// Root
	root := composite.NewFolder("MindVault")
	root.Add(aiResearch)
	root.Add(knowledgeBase)
	root.Add(archives)

	root.Display(0)

}
