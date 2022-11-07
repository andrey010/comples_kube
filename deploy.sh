docker build -t andr095/multi-client:latest -t andr095/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t andr095/multi-server:latest -t andr095/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t andr095/multi-worker:latest -t andr095/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push andr095/multi-client:latest
docker push andr095/multi-server:latest
docker push andr095/multi-worker:latest

docker push andr095/multi-client:$SHA
docker push andr095/multi-server:$SHA
docker push andr095/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployment/client-deployment client=stephengrider/multi-client:$SHA
kubectl set image deployment/server-deployment server=stephengrider/multi-server:$SHA
kubectl set image deployment/worker-deployment worker=stephengrider/multi-worker:$SHA