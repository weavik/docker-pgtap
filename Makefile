build:
	docker build -t pgtap .

deploy: build
	docker run --rm -it -v ~/.aws:/root/.aws amazon/aws-cli ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/s5h0f9n4
	docker tag pgtap:latest public.ecr.aws/s5h0f9n4/pgtap:latest
	docker push public.ecr.aws/s5h0f9n4/pgtap:latest

run:
	docker run --rm -it -e "POSTGRES_PASSWORD=tap" -e "POSTGRES_USER=tap" -e "POSTGRES_DB=tap" pgtap
