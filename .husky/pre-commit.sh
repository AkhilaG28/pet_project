#!/usr/bin/env sh
. "$(dirname -- "$0")/_/husky.sh"

echo 'Styling, testing and building project before commiting'

# Check tsconfig standards
npm run check-types ||
(
    echo 'Failed type check'
    false;
)

# Check Prettier standards
npm run check-format ||
(
    echo 'Prettier check failed. Run npm add format, add changes and try commit again.'
    false;
)

# Check ESLint standards
npm run check-lint ||
(
    echo 'ESLint check failed. Make the required changes listed above, add changes and commit again.'
    false;
)

# If everything passes.... run a build
echo 'Alright.... Code looks good to me.... Trying to build now'

npm run build || 
(
    echo 'Better call BoB.... Because your build failed.
    Next build failed: View the errors above to see why'
    false; 
)

# If it builds, we can commit now
echo 'You win this time ..... I am committing this now'