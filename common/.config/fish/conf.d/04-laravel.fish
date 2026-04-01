# ==============================================================================
# 🧱 LARAVEL / PHP
# ==============================================================================

# Artisan básico
alias art="php artisan"
alias serve="php artisan serve"
alias tinker="php artisan tinker"

abbr -a a 'php artisan'
abbr -a routes 'php artisan route:list'
abbr -a t 'php artisan test'
abbr -a tp 'php artisan test --parallel'
abbr -a tf 'php artisan test --filter'

# Make commands
abbr -a make:c 'php artisan make:controller'
abbr -a make:m 'php artisan make:model'
abbr -a make:mig 'php artisan make:migration'
abbr -a make:req 'php artisan make:request'
abbr -a make:s 'php artisan make:seeder'
abbr -a make:f 'php artisan make:factory'

# Migrations
abbr -a mig 'php artisan migrate'
abbr -a mfs 'php artisan migrate:fresh --seed'
abbr -a mrr 'php artisan migrate:rollback'
abbr -a mrs 'php artisan migrate:refresh --seed'

# Cache
abbr -a cc 'php artisan cache:clear'
abbr -a ccc 'php artisan config:clear && php artisan cache:clear && php artisan route:clear'

# Queue
abbr -a qw 'php artisan queue:work'
abbr -a ql 'php artisan queue:listen'
abbr -a qr 'php artisan queue:restart'

# Logs
abbr -a log 'tail -f storage/logs/laravel.log'

# Composer
abbr -a ci 'composer install'
abbr -a cu 'composer update'
abbr -a cr 'composer require'
abbr -a cda 'composer dump-autoload'

# NPM
abbr -a nd 'npm run dev'
abbr -a nb 'npm run build'
abbr -a nw 'npm run watch'
