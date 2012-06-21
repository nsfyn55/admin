name        'java'
description 'Builds Java Development Environment'

run_list(
  'recipe[java::default]'
)
