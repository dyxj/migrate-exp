.PHONY: create-migration
create-migration:
	migrate create -ext sql -dir _dev/db/migrations -seq -digits 1 ${name}
