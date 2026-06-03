#!/bin/bash
set -e

DEPLOY_BRANCH="deploy"
SOURCE_BRANCH=$(git rev-parse --abbrev-ref HEAD)
TEMP_DIR=$(mktemp -d)
STASHED=false

# Cleanup: always return to source branch
cleanup() {
  rm -rf "$TEMP_DIR"
  git checkout "$SOURCE_BRANCH" > /dev/null 2>&1 || true
  if [ "$STASHED" = true ]; then
    git stash pop > /dev/null 2>&1 || true
  fi
}
trap cleanup EXIT

echo "Building project..."
npx astro build

echo "Saving build output to temp..."
cp -r dist/* "$TEMP_DIR"/

# Stash uncommitted changes before switching branches
if ! git diff --quiet || ! git diff --cached --quiet || [ -n "$(git ls-files --others --exclude-standard)" ]; then
  git stash push --include-untracked -m "deploy-script-auto-stash" > /dev/null 2>&1
  STASHED=true
fi

echo "Switching to $DEPLOY_BRANCH branch..."
git checkout "$DEPLOY_BRANCH"

echo "Cleaning old files..."
git rm -rf . > /dev/null 2>&1 || true
git clean -fd > /dev/null 2>&1

echo "Copying build output..."
cp -r "$TEMP_DIR"/* .

echo "Committing..."
git add .
if git diff --cached --quiet; then
  echo "No changes to deploy."
else
  git commit -m "Deploy: $(date '+%Y-%m-%d %H:%M:%S')"
  echo "Pushing to $DEPLOY_BRANCH..."
  git push origin "$DEPLOY_BRANCH"
  echo "Deploy pushed successfully."
fi

echo "Done."
