export DISABLE_SPRING=true

alias migrar="rake db:migrate db:test:prepare"

function rake {
  if [ -e Gemfile ]; then
    time bundle exec rake $@
  else
    time `which rake` $@
  fi
}

function sidekiq {
  if [ -e Gemfile ]; then
    time bundle exec sidekiq $@
  else
    time `which sidekiq` $@
  fi
}

function cap {
  if [ -e Gemfile ]; then
    time bundle exec cap $@
  else
    time `which cap` $@
  fi
}

function rspec {
  if [ -e Gemfile ]; then
    time bundle exec rspec $@
  else
    time `which rspec` $@
  fi
}

function fs {
  if [ -e Procfile.puma ]; then
    bundle exec foreman start -f Procfile.puma $@
	elif [ -e Procfile.development ]; then
		bundle exec foreman start -f Procfile.development $@
  else
		bundle exec foreman start -f Procfile $@
  fi
}

function s {
  if [ -e script/rails ]; then
    script/rails server $@
  elif [ -e script/server ]; then
    script/server $@
  else
    rails server $@
  fi
}

function c {
  if [ -e script/rails ]; then
    script/rails console $@
  elif [ -e script/console ]; then
    script/console $@
  else
    rails console $@
  fi
}

function g {
  if [ -e script/rails ]; then
    script/rails generate $@
  elif [ -e script/generate ]; then
    script/generate $@
  else
    rails generate $@
  fi
}
