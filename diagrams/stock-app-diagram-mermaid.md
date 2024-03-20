```mermaid

%% looked up for svg icons for the respective icons on google

%%linkStyle 3 stroke:#ff3,stroke-width:4px,color:red;

%% It is also possible to add style to multiple links in a single statement, by  eparating link numbers with commas:
%% linkStyle 1,2,7 color:blue;



flowchart LR

  %% gitcheckin ---- DOCTYPE("<img src='icons/jenkins.svg'/>"):::white 
  
	%% Icons %%
  Icon-git("<img src='icons/git.svg'; width='40' />"):::white-->
  Icon-github("<img src='icons/github.png'; width='40' />"):::white-->
  Icon-Jenkins("<img src='icons/jenkins.svg'; width='40' />"):::white-->
  Icon-Docker("<img src='icons/docker.svg'; width='40' />"):::white

  Icon-Jenkins("<img src='icons/jenkins.svg'; width='40' />"):::white-->
  Icon-ArgoCD("<img src='icons/argocd.svg'; width='40' />"):::white-->
  Icon-Kubernetes("<img src='icons/kubernetes.svg'; width='40' />"):::white

  Icon-Prometheus("<img src='icons/prometheus.svg'; width='40' />"):::white<-->
  Icon-Kubernetes("<img src='icons/kubernetes.svg'; width='40' />"):::white 
  Icon-Grafana("<img src='icons/grafana.svg'; width='40' />"):::white<-->
  Icon-Kubernetes("<img src='icons/kubernetes.svg'; width='40' />"):::white 

  Icon-Helm("<img src='icons/helm.svg'; width='40' />"):::white 
  Icon-Nginx("<img src='icons/nginx.jpg'; width='40' />"):::white 

  ALB-ApplicationLoadBalancer:::someclass-->B
  Ingress-LoadLoadBalancerResourceForK8:::someclass-->B
  B:::c_ArgoCD1-->C
  C:::c_ArgoCD2-->D

%%  click A callback "Tooltip for a callback"
%%  click B "https://www.github.com" "This is a tooltip for a link"
%%  click C call callback() "Tooltip for a callback"
%%  click href "https://www.github.com" "This is a tooltip for a link"

  Icon-SonarQube("<img src='icons/sonarqube.png'; width='40' />"):::white 

  %% Monitoring Layer/Compoments
  Promtail_OR_LokiAgent_for_Logs-->Grafana
  Prometheus_for_Metrics-->Grafana
  Prometheus_for_Metrics-->AlertManager

  %% Notifications Layer/Compoments
  AlertManager-->PagerDuty-->SMS_or_Phone
  AlertManager-->Email_or_MSTeams_or_Slack


  classDef someclass fill:#f96,color:black;
  classDef c_ArgoCD1 fill:#f9f,color:black;
  classDef c_ArgoCD2 img icons/argocd.svg

  Icon-ArgoCD("<img src='icons/argocd.svg'; width='40' />"):::white

%% Jenkins
%%  SonarQube Code Analyis
%%  Trivy File Scan
%%  OWASP 
%%  Dockerhub build and push
%%  Trivy Image Scan
%%Terraform
%%Ansible


%% https://mrcloudbook.com/ansible-devsecops-petshop-project-jenkins-ci-cd/

%% ArgoCD or HELM 
%% deploy to k8s
%% slack/email




  %%---  DOCTYPE("<img src='icons/docker.svg'/>"):::white