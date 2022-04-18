docker build -t adibhatk96/multi-client:latest -t adibhatk96/multi-client:$GIT_SHA -f ./client/Dockerfile ./client
docker build -t adibhatk96/multi-server:latest -t adibhatk96/multi-server:$GIT_SHA -f ./server/Dockerfile ./server
docker build -t adibhatk96/multi-worker:latest -t adibhatk96/multi-worker:$GIT_SHA -f ./worker/Dockerfile ./worker
docker push adibhatk96/multi-client:latest
docker push adibhatk96/multi-server:latest
docker push adibhatk96/multi-worker:latest
docker push adibhatk96/multi-client:$GIT_SHA
docker push adibhatk96/multi-server:$GIT_SHA
docker push adibhatk96/multi-worker:$GIT_SHA
kubectl apply -f k8s
kubectl set image deployments/client-deployment client=adibhatk96/multi-client:$GIT_SHA
kubectl set image deployments/server-deployment server=adibhatk96/multi-server:$GIT_SHA
kubectl set image deployments/worker-deployment worker=adibhatk96/multi-worker:$GIT_SHA