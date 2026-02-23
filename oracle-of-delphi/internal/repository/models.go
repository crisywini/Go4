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
	GetInstance().mu.Lock()
	defer GetInstance().mu.Unlock()
	GetInstance().userQuestions[user] = GetInstance().userQuestions[user] + 1
	return fmt.Sprintf("thinking... for %s this question %s", user, question)
}

func (o *Oracle) GetUniverseState() UniverseState {
	return UniverseState{
		totalQuestions:   GetInstance().totalQuestions,
		lastQuestion:     GetInstance().lastQuestion,
		enlightenedCount: GetInstance().enlightenedCount,
		userQuestions:    GetInstance().userQuestions,
	}
}
