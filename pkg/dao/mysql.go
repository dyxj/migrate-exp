package dao

import (
	"fmt"
	"github.com/jmoiron/sqlx"
)

// NewDb Simple database initialization
func NewDb(dsn string) (*sqlx.DB, error) {
	db, err := sqlx.Open("mysql", dsn)
	if err != nil {
		return nil, fmt.Errorf("[sqlx.Open] %w", err)
	}
	err = db.Ping()
	if err != nil {
		return nil, fmt.Errorf("[db.Ping] %w", err)
	}
	return db, nil
}

// BuildDsn with option to enable multiStatement
func BuildDsn(dbName string, isMulti bool) string {
	opt := "&parseTime=true"
	if isMulti {
		opt += "&multiStatements=true"
	}
	return fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?tls=%s",
		"mysqluser", "abc123", "localhost", "3301", dbName, "false") + opt
}
