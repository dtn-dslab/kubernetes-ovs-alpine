# Image URL to use all building/pushing image targets
IMG ?= harbor.sail.se.sjtu.edu.cn/kubedtn
OVS_IMG = $(IMG)/ovs
TAG := latest

.PHONY: ovs-docker
ovs-docker:
	docker build . -t $(OVS_IMG):$(TAG)

.PHONY: ovs-push
ovs-push:
	docker push $(OVS_IMG):$(TAG)

.PHONY: ovs-all
ovs-all: ovs-docker ovs-push

.PHONY: deploy
deploy:
	kubectl apply -f manifests/pod_test.yaml

.PHONY: undeploy
undeploy:
	kubectl delete -f manifests/pod_test.yaml