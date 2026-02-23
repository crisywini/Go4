package repository

import (
	"fmt"
	"sync"
)

type Oracle struct {
	mu               sync.Mutex
	totalQuestions   int
	lastQuestion     string
	enlightenedCount int
	userQuestions    map[string]int
}

var (
	instance *Oracle
	once     sync.Once
)

func newOracle() *Oracle {
	return &Oracle{
		totalQuestions:   0,
		lastQuestion:     "",
		enlightenedCount: 0,
		userQuestions:    make(map[string]int),
	}
}

type UniverseState struct {
	totalQuestions   int
	lastQuestion     string
	enlightenedCount int
	userQuestions    map[string]int
}

func GetInstance() *Oracle {
	once.Do(func() {
		instance = newOracle()
	})
	return instance
}

func (o *Oracle) Ask(user, question string) string {
	o.mu.Lock()
	defer o.mu.Unlock()
	o.userQuestions[user] = o.userQuestions[user] + 1
	o.lastQuestion = question
	o.totalQuestions = o.totalQuestions + 1

	o.increateEnlightenedCount()
	return fmt.Sprintf("thinking... for %s this question %s", user, question)
}

func (o *Oracle) increateEnlightenedCount() {

	count := 0

	for _, v := range o.userQuestions {
		if v > 10 {
			count = count + 1
		}
	}
	o.enlightenedCount = count
}

func (o *Oracle) GetUniverseState() UniverseState {
	o.mu.Lock()
	defer o.mu.Unlock()

	snapshot := make(map[string]int, len(o.userQuestions))
	for k, v := range o.userQuestions {
		snapshot[k] = v
	}

	return UniverseState{
		totalQuestions:   o.totalQuestions,
		lastQuestion:     o.lastQuestion,
		enlightenedCount: o.enlightenedCount,
		userQuestions:    snapshot,
	}
}
