name        'base'
description 'base_machine'

run_list(
  'recipe[accounts::default]'
)
