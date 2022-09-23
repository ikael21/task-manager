RAILS_CONTAINER = web

.PHONY: app

app-build:
	@docker-compose build

app-init:
	@docker-compose run --rm $(RAILS_CONTAINER) bash -c \
      "bundle install && \
       yarn install --frozen-lockfile && \
       rails db:create db:migrate db:seed"

app:
	@docker-compose up

app-detach:
	@docker-compose up -d

app-bash:
	@docker-compose run --rm $(RAILS_CONTAINER) bash

app-running-bash:
	@docker-compose exec $(RAILS_CONTAINER) bash
