package main

import (
	"fmt"
	"github.com/dyxj/migrate-exp/pkg/dao"
	_ "github.com/go-sql-driver/mysql"
	"github.com/golang-migrate/migrate/v4"
	"github.com/golang-migrate/migrate/v4/database/mysql"
	_ "github.com/golang-migrate/migrate/v4/database/mysql"
	_ "github.com/golang-migrate/migrate/v4/source/file"
	"github.com/sirupsen/logrus"
)

const (
	dbName = "multiple"
)

func main() {
	mainDb, err := dao.NewDb(dao.BuildDsn(dbName, false))
	if err != nil {
		logrus.Fatalf("[initDb] %v", err)
	}
	defer mainDb.Close()

	err = runMigration()
	if err != nil {
		logrus.Fatalf("[runMigration] %v", err)
	}
}

func runMigration() error {
	migrationDb, err := dao.NewDb(dao.BuildDsn(dbName, true))
	if err != nil {
		return fmt.Errorf("[dao.NewDb] %w", err)
	}
	defer migrationDb.Close()

	db, err := mysql.WithInstance(migrationDb.DB, &mysql.Config{})
	if err != nil {
		return err
	}

	m, err := migrate.NewWithDatabaseInstance("file://migrations", dbName, db)
	if err != nil {
		return err
	}

	// Among Migrate, Up and Step
	// Up is most suitable for microservices, scripts are packed into
	// a docker image down migration files will not be present.
	//
	// However if scripts are obtained externally, Migrate would be better.
	err = m.Up()
	if err != nil {
		return err
	}

	return nil
}
