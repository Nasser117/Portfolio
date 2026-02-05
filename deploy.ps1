# ===============================
# Flutter GitHub Pages Deploy Script
# ===============================

# Step 0: Make sure you’re on the main branch
Write-Host "Checking out main branch..."
git checkout main

# Step 1: Clean up old builds
Write-Host "Removing old docs and build/web..."
git rm -r --cached docs -q
Remove-Item -Recurse -Force docs -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force build\web -ErrorAction SilentlyContinue

# Step 2: Build the Flutter web app with the correct base-href
Write-Host "Building Flutter web with base-href /Portfolio/ ..."
flutter build web --base-href /Portfolio/

# Step 3: Copy the new build into docs
Write-Host "Copying new build into docs folder..."
mkdir docs
Copy-Item -Recurse build\web\* docs\

# Step 4: Commit the updated docs folder
Write-Host "Adding docs folder to git and committing..."
git add docs
git commit -m "Update Flutter web build for GitHub Pages"

# Step 5: Push to GitHub
Write-Host "Pushing changes to GitHub..."
git push origin main

Write-Host "Deployment complete! 🚀"

# Step 5: Use
# .\deploy.ps1