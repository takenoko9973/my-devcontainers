#!/bin/bash
mamba init -q           # mambaを初期化
mamba create -n CreatedEnv --file ./.devcontainer/requirements.txt -qy
mamba clean -qafy       # キャッシュ等を削除
