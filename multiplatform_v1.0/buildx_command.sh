# docker buildx create --platform "linux/amd64,linux/arm64" --name buildermulti --use
docker buildx build \
--label org.opencontainers.image.title=vscode-docker \
--label org.opencontainers.image.description='container running VScode Server on multiplatform to be used with UniPV course' \
--label org.opencontainers.image.url=https://github.com/lescai-teaching/vscode-docker \
--label org.opencontainers.image.source=https://github.com/lescai-teaching/vscode-docker --label org.opencontainers.image.version=4.0.0 \
--label org.opencontainers.image.created=2023-07-19T12:39:11.393Z \
--label org.opencontainers.image.licenses=MIT \
--platform linux/amd64,linux/arm64 \
--tag ghcr.io/lescai-teaching/vscode-docker:4.0.0 \
--tag ghcr.io/lescai-teaching/vscode-docker:latest \
--push .