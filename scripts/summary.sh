
gcloud beta builds connections list --project=dole-dole --region=us-central1
  NAME: github-connection
  INSTALLATION_STATE: COMPLETE
  DISABLED: Enabled

gcloud beta builds repositories list --project=dole-dole --region=us-central1 --connection=github-connection
  NAME: monad-infra
  REMOTE_URI: https://github.com/Mon8Cats/monad-infra.git



 $ gcloud iam workload-identity-pools list --project=dole-dole --location=global
projects/dole-dole/locations/us-central1/connections/github-connection 


 log-846737158627-infra

gcloud config set project dole-dole

gcloud auth activate-service-account --key-file=/path/to/your/service_account_key.json
gcloud auth list



gcloud iam test-iam-permissions "//iam.googleapis.com/projects/dole-dole/locations/global" \
  --member="serviceAccount:sa-terraform@dole-dole.iam.gserviceaccount.com" \
  --permissions=iam.workloadIdentityPools.create

terraform state list | grep google_project_iam_member
terraform plan -refresh=true

# list roles
gcloud projects get-iam-policy dole-dole \
  --flatten="bindings[].members" \
  --format="table(bindings.role)" \
  --filter="bindings.members:serviceAccount:sa-terraform@dole-dole.iam.gserviceaccount.com"

gcloud projects get-iam-policy dole-dole \
  --flatten="bindings[].members" \
  --format="table(bindings.role)" \
  --filter="bindings.members:serviceAccount:service-846737158627@gcp-sa-cloudbuild.iam.gserviceaccount.com"


# create a service account key file
gcloud iam service-accounts keys create ~/credentials/sa-terraform.json \
  --iam-account=sa-terraform@YOUR_PROJECT_ID.iam.gserviceaccount.com

gcloud iam service-accounts keys create ~/credentials/sa-terraform.json \
  --iam-account=sa-terraform@dole-dole.iam.gserviceaccount.com


# check wip
gcloud iam workload-identity-pools list --project=cata-morph --location=global




# step 1: enable workload identity on gke cluster
gcloud container clusters update my-cluster \
    --workload-pool=my-project.svc.id.goog
gcloud container clusters create my-cluster \
    --workload-pool=my-project.svc.id.goog

# enable workload identity on older node pools (may be not needed)
gcloud container node-pool update [node-pool-name] \
    --cluster=[cluster-name] \
    --workload-metadata=GKE_METADATA 

# step 2: create a kubernetes service account (KSA), default namespace
kubectl create serviceaccount my-k8s-sa --namespace default

# step 3: create  a google cloud IAM service account (GSA)
gcloud iam service-accounts create my-gsa \
    --project=my-project

# step 4: allow KSA to use GSA
gcloud iam service-accounts add-iam-policy-binding my-gsa@my-project.iam.gserviceaccount.com \
    --role roles/iam.workloadIdentityUser \
    --member "serviceAccount:my-project.svc.id.goog[default/my-k8s-sa]"

# step 5: annotate the k8s service account 
# This links the Kubernetes service account (KSA) to the Google IAM service account (GSA).
# Kubernetes needs a way to map the Kubernetes Service Account (KSA) to the Google Cloud IAM Service Account (GSA).

kubectl annotate serviceaccount my-k8s-sa \
    --namespace default \
    iam.gke.io/gcp-service-account=my-gsa@my-project.iam.gserviceaccount.com

# step 6: update the deployment to use the k8s service account
# The Kubernetes Service Account (my-k8s-sa) automatically authenticates as the Google IAM Service Account (my-gsa).
# No need for secrets or service account key files.
# Google SDKs inside the pod will automatically authenticate using Workload Identity.

apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-microservice
spec:
  template:
    metadata:
      annotations:
        iam.gke.io/gcp-service-account: my-gsa@my-project.iam.gserviceaccount.com
    spec:
      serviceAccountName: my-k8s-sa  # Use the Kubernetes service account
      containers:
        - name: my-microservice
          image: 'gcr.io/my-project/my-microservice:version'
          env:
            - name: GOOGLE_APPLICATION_CREDENTIALS
              value: ""  # No key file needed!

# step 7: verify workload identity 
kubectl exec -it my-pod -- curl -H "Metadata-Flavor: Google" \
    http://metadata.google.internal/computeMetadata/v1/instance/service-accounts/default/email
# -> return my-gsa@my-project.iam.gserviceaccount.com
