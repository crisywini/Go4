package repository

import "sync"

type Oracle struct {
	instance         *Oracle
	mu               sync.Mutex
	totalQuestions   int
	lastQuestion     string
	enlightenedCount int
	userQuestions    map[string]int
}

func (o *Oracle) GetInstance() *Oracle {
	return o.instance
}

func (o *Oracle) Ask(user, question string) {

}
