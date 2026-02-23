package service

import "github.com/crisywini/Go4/oracle-of-delphi/internal/repository"

type OracleService struct {
	oracle *repository.Oracle
}

func NewOracleService() *OracleService {
	return &OracleService{
		oracle: repository.GetInstance(),
	}
}

func (s *OracleService) AskQuestion(user, question string) string {
	return s.oracle.Ask(user, question)
}
