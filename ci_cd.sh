#!/bin/bash
set -e
echo "[CI] Pipeline triggered by merge to main"
echo "[CI] Step 1/3 - Running tests..."
python3 -c "from app import greet; assert greet(\"test\") == \"Welcome to LoopCart v1.0, test!\"; print(\"[CI] Tests passed\")"
echo "[CI] Step 2/3 - Building release artifact..."
python3 -c "import zipfile; f='release-v1.0.zip'; z=zipfile.ZipFile(f,'w'); z.write('app.py'); z.close()"
echo "[CI] Build complete: release-v1.0.zip"
echo "[CI] Step 3/3 - Deploying to production..."
mkdir -p production
cp release-v1.0.zip production/
echo "[CI] Deployed: production/release-v1.0.zip"
echo "[CI] Pipeline complete. LoopCart v1.0 is LIVE."
