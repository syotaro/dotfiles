#!/bin/sh
## [aws-doc-pdf-download](https://github.com/fprg/aws-doc-pdf-download)
##
## curl -O http://aws.amazon.com/jp/aws-jp-introduction/index.html
## grep "pdf" ./index.html > index2.html
## sed -e "s/^.*pdf.+$//g" ./index2.html > index3.html
## sed -e "s/^.*href=\"//g" ./index3.html > index4.html
## sed -e "s/pdf\".*/pdf/g" ./index4.html > index5.html
## sed -e "s/^/curl -O /g" ./index5.html > index6.html



## ----------------------------------------------
## http://aws.amazon.com/jp/documentation/
## ----------------------------------------------


## ----------------------------------------------
## AWS 入門（日本語）
## ----------------------------------------------
mkdir -p awsgsg
cd awsgsg
curl -O http://awsdocs.s3.amazonaws.com/gettingstarted/latest/awsgsg-intro-ja_jp.pdf
curl -O http://awsdocs.s3.amazonaws.com/gettingstarted/latest/awsgsg-computebasics-linux-ja_jp.pdf
curl -O http://awsdocs.s3.amazonaws.com/gettingstarted/latest/awsgsg-computebasics-ja_jp.pdf
curl -O http://awsdocs.s3.amazonaws.com/gettingstarted/latest/awsgsg-wah-linux.pdf
curl -O http://awsdocs.s3.amazonaws.com/gettingstarted/latest/awsgsg-wah.pdf
curl -O http://awsdocs.s3.amazonaws.com/gettingstarted/latest/awsgsg-deploy.pdf
curl -O http://awsdocs.s3.amazonaws.com/gettingstarted/latest/awsgsg-emr.pdf
curl -O http://awsdocs.s3.amazonaws.com/gettingstarted/latest/awsgsg-swh.pdf

cd ..
mkdir -p awssdk
cd awssdk

## ----------------------------------------------
## AWS SDK for Android ドキュメント
## ----------------------------------------------
curl -O http://awsdocs.s3.amazonaws.com/mobile/sdkforandroid-gsg.pdf


## ----------------------------------------------
## AWS SDK for iOS ドキュメント
## ----------------------------------------------
curl -O http://awsdocs.s3.amazonaws.com/mobile/sdkforios-gsg.pdf

## ----------------------------------------------
## AWS SDK for Java ドキュメント
## ----------------------------------------------
curl -O http://awsdocs.s3.amazonaws.com/sdk-java/latest/aws-sdk-java-dg.pdf
curl -O http://awsdocs.s3.amazonaws.com/sdk-java/latest/aws-sdk-java-dg.pdf


## ----------------------------------------------
## AWS SDK for .NET ドキュメント
## ----------------------------------------------
curl -O http://awsdocs.s3.amazonaws.com/sdk-net/latest/aws-sdk-net-dg.pdf


## ----------------------------------------------
## AWS SDK for Node.js Documentation
## ----------------------------------------------
curl -O https://s3.amazonaws.com/awsdocs/sdk-nodejs/latest/aws-sdk-nodejs-dg.pdf


## ----------------------------------------------
## AWS SDK for PHP ドキュメント 
## ----------------------------------------------
curl -O http://docs.aws.amazon.com/aws-sdk-php/guide/latest/aws-sdk-php-guide.pdf


## ----------------------------------------------
## AWS SDK for Ruby
## ----------------------------------------------
curl -O http://awsdocs.s3.amazonaws.com/sdk-ruby/latest/aws-sdk-ruby-dg.pdf

cd ..
mkdir -p aws-toolkit
cd aws-toolkit


## ----------------------------------------------
## AWS Toolkit for Eclipse
## ----------------------------------------------
curl -O http://awsdocs.s3.amazonaws.com/toolkit-eclipse/latest/aws-tke-gsg.pdf


## ----------------------------------------------
## AWS Toolkit for Visual Studio Documentation
## ----------------------------------------------
curl -O http://awsdocs.s3.amazonaws.com/toolkit-visualstudio/latest/aws-tkv-ug.pdf


cd ..
mkdir -p aws-cli
cd aws-cli


## ----------------------------------------------
## AWS Command Line Interface Documentation
## ----------------------------------------------
curl -O http://awsdocs.s3.amazonaws.com/cli/latest/aws-cli.pdf


## ----------------------------------------------
## AWS Tools for Windows PowerShell Documentation
## ----------------------------------------------
curl -O http://awsdocs.s3.amazonaws.com/powershell/latest/aws-pst-ug.pdf


cd ..
mkdir -p aws-service
cd aws-service



## ----------------------------------------------
## Amazon Elastic Compute Cloud ドキュメント
## ----------------------------------------------
curl -O http://awsdocs.s3.amazonaws.com/EC2/latest/ec2-clt.pdf
curl -O http://awsdocs.s3.amazonaws.com/EC2/latest/ec2-gsg-ja_jp.pdf
curl -O http://awsdocs.s3.amazonaws.com/EC2/latest/ec2-wg-ja_jp.pdf
curl -O http://awsdocs.s3.amazonaws.com/EC2/latest/ec2-api.pdf
curl -O http://awsdocs.s3.amazonaws.com/EC2/latest/ec2-qrc.pdf


## ----------------------------------------------
## Auto Scaling ドキュメント
## ----------------------------------------------
curl -O http://awsdocs.s3.amazonaws.com/AutoScaling/latest/as-gsg-ja_jp.pdf
curl -O http://awsdocs.s3.amazonaws.com/AutoScaling/latest/as-dg.pdf
curl -O http://awsdocs.s3.amazonaws.com/AutoScaling/latest/as-api.pdf
curl -O http://awsdocs.s3.amazonaws.com/AutoScaling/latest/as-qrc.pdf


## ----------------------------------------------
## Elastic Load Balancing ドキュメント
## ----------------------------------------------
curl -O http://awsdocs.s3.amazonaws.com/ElasticLoadBalancing/latest/elb-dg-ja_jp.pdf
curl -O http://awsdocs.s3.amazonaws.com/ElasticLoadBalancing/latest/elb-api.pdf
curl -O http://awsdocs.s3.amazonaws.com/ElasticLoadBalancing/latest/elb-qrc.pdf


## ----------------------------------------------
## Amazon WorkSpaces
## ----------------------------------------------
curl -O http://s3.amazonaws.com/awsdocs/AmazonWorkSpaces/latest/workspaces-ag.pdf


## ----------------------------------------------
## Amazon Virtual Private Cloud ドキュメント
## ----------------------------------------------
curl -O http://awsdocs.s3.amazonaws.com/VPC/latest/vpc-gsg-ja_jp.pdf
curl -O http://awsdocs.s3.amazonaws.com/VPC/latest/vpc-ug-ja_jp.pdf
curl -O http://awsdocs.s3.amazonaws.com/EC2/latest/ec2-clt.pdf
curl -O http://awsdocs.s3.amazonaws.com/VPC/latest/vpc-nag.pdf
curl -O http://awsdocs.s3.amazonaws.com/EC2/latest/ec2-api.pdf
curl -O http://awsdocs.s3.amazonaws.com/VPC/latest/vpc-qrc.pdf


## ----------------------------------------------
## Amazon Route 53 ドキュメント
## ----------------------------------------------
curl -O http://awsdocs.s3.amazonaws.com/Route53/latest/route53-dg.pdf
curl -O http://awsdocs.s3.amazonaws.com/Route53/latest/route53-api.pdf


## ----------------------------------------------
## AWS Direct Connect ドキュメント
## ----------------------------------------------
curl -O http://awsdocs.s3.amazonaws.com/directconnect/latest/dc-ug-ja_jp.pdf
curl -O http://awsdocs.s3.amazonaws.com/directconnect/latest/dc-api.pdf


## ----------------------------------------------
## AWS Identity and Access Management ドキュメント
## ----------------------------------------------
curl -O http://awsdocs.s3.amazonaws.com/IAM/latest/iam-ug-ja_jp.pdf
curl -O http://awsdocs.s3.amazonaws.com/STS/latest/sts-ug.pdf
curl -O http://awsdocs.s3.amazonaws.com/STS/latest/sts-api.pdf
curl -O http://awsdocs.s3.amazonaws.com/IAM/latest/iam-api.pdf


## ----------------------------------------------
## AWS CloudTrail Documentation
## ----------------------------------------------
curl -O http://awsdocs.s3.amazonaws.com/awscloudtrail/latest/awscloudtrail-ug.pdf
curl -O http://awsdocs.s3.amazonaws.com/awscloudtrail/latest/awscloudtrail-api.pdf


## ----------------------------------------------
## Amazon CloudWatch ドキュメント
## ----------------------------------------------
curl -O http://awsdocs.s3.amazonaws.com/AmazonCloudWatch/latest/acw-dev-ja_jp.pdf
curl -O http://awsdocs.s3.amazonaws.com/AmazonCloudWatch/latest/acw-api.pdf
curl -O http://awsdocs.s3.amazonaws.com/AmazonCloudWatch/latest/acw-qrc.pdf


## ----------------------------------------------
## AWS Elastic Beanstalk ドキュメント
## ----------------------------------------------
curl -O http://s3.amazonaws.com/awsdocs/ElasticBeanstalk/latest/awseb-dg-ja_jp.pdf
curl -O http://s3.amazonaws.com/awsdocs/ElasticBeanstalk/latest/awseb-api.pdf


## ----------------------------------------------
## AWS CloudFormation Documentation
## ----------------------------------------------
curl -O http://awsdocs.s3.amazonaws.com/AWSCloudFormation/latest/cfn-ug.pdf
curl -O http://awsdocs.s3.amazonaws.com/AWSCloudFormation/latest/cfn-api.pdf
curl -O http://awsdocs.s3.amazonaws.com/AWSCloudFormation/latest/qrc_cfn_api.pdf
curl -O http://awsdocs.s3.amazonaws.com/AWSCloudFormation/latest/qrc_cfn_cli.pdf


## ----------------------------------------------
## AWS OpsWorks Documentation 
## ----------------------------------------------
curl -O http://s3.amazonaws.com/awsdocs/opsworks/latest/opsworks-ug.pdf
curl -O http://awsdocs.s3.amazonaws.com/opsworks/latest/opsworks-api.pdf


## ----------------------------------------------
## AWS CloudHSM ドキュメント
## ----------------------------------------------
curl -O http://awsdocs.s3.amazonaws.com/cloudhsm/latest/hsm-gsg.pdf


## ----------------------------------------------
## Amazon Simple Storage Service ドキュメント
## ----------------------------------------------
curl -O http://s3.amazonaws.com/awsdocs/S3/latest/s3-gsg-ja_jp.pdf
curl -O http://awsdocs.s3.amazonaws.com/S3/latest/s3-dg-ja_jp.pdf
curl -O http://awsdocs.s3.amazonaws.com/S3/latest/s3-api.pdf
curl -O http://awsdocs.s3.amazonaws.com/S3/latest/s3-ug.pdf
curl -O http://awsdocs.s3.amazonaws.com/S3/latest/s3-qrc.pdf


## ----------------------------------------------
## Amazon Glacier ドキュメント
## ----------------------------------------------
curl -O http://awsdocs.s3.amazonaws.com/glacier/latest/glacier-dg.pdf


## ----------------------------------------------
## Amazon Elastic Block Store (Amazon EBS)
## ----------------------------------------------
curl -O http://awsdocs.s3.amazonaws.com/EC2/latest/ec2-ug.pdf


## ----------------------------------------------
## AWS Import/Export ドキュメント
## ----------------------------------------------
curl -O http://s3.amazonaws.com/awsdocs/ImportExport/latest/AWSImportExport-dg.pdf
curl -O http://awsdocs.s3.amazonaws.com/ImportExport/latest/IE-qrc.pdf


## ----------------------------------------------
## AWS Storage Gateway ドキュメント
## ----------------------------------------------
curl -O http://awsdocs.s3.amazonaws.com/storagegateway/latest/storagegateway-ug-ja_jp.pdf
curl -O http://awsdocs.s3.amazonaws.com/storagegateway/latest/storagegateway-api.pdf


## ----------------------------------------------
## Amazon CloudFront ドキュメント
## ----------------------------------------------
curl -O http://awsdocs.s3.amazonaws.com/CF/latest/cf-dg-ja_jp.pdf
curl -O http://s3.amazonaws.com/awsdocs/CF/latest/cf_api.pdf
curl -O http://s3.amazonaws.com/awsdocs/CF/latest/cf-qrc.pdf


## ----------------------------------------------
## Amazon AppStream Documentation
## ----------------------------------------------
curl -O http://awsdocs.s3.amazonaws.com/appstream/latest/appstream-dg.pdf


## ----------------------------------------------
## Amazon CloudSearch ドキュメント
## ----------------------------------------------
curl -O http://awsdocs.s3.amazonaws.com/cloudsearch/latest/cloudsearch-dg.pdf


## ----------------------------------------------
## Amazon Simple Workflow Service ドキュメント
## ----------------------------------------------
curl -O http://awsdocs.s3.amazonaws.com/swf/latest/swf-dg.pdf
curl -O http://awsdocs.s3.amazonaws.com/swf/latest/swf-api.pdf
curl -O http://awsdocs.s3.amazonaws.com/swf/latest/swf-aflow.pdf
curl -O http://awsdocs.s3.amazonaws.com/swf/latest/swf-rbflow.pdf


## ----------------------------------------------
## Amazon Simple Queue Service ドキュメント
## ----------------------------------------------
curl -O http://awsdocs.s3.amazonaws.com/SQS/latest/sqs-gsg.pdf
curl -O http://awsdocs.s3.amazonaws.com/SQS/latest/sqs-dg.pdf
curl -O http://awsdocs.s3.amazonaws.com/SQS/latest/sqs-api.pdf
curl -O http://awsdocs.s3.amazonaws.com/SQS/latest/sqs_qrc.pdf


## ----------------------------------------------
## Amazon Simple Email Service ドキュメント
## ----------------------------------------------
curl -O http://awsdocs.s3.amazonaws.com/ses/latest/ses-dg.pdf
curl -O http://s3.amazonaws.com/awsdocs/ses/latest/ses-api.pdf


## ----------------------------------------------
## Amazon Simple Notification Service ドキュメント
## ----------------------------------------------
curl -O http://awsdocs.s3.amazonaws.com/SNS/latest/sns-dg.pdf
curl -O http://awsdocs.s3.amazonaws.com/SNS/latest/sns-cli.pdf
curl -O http://awsdocs.s3.amazonaws.com/SNS/latest/sns-api.pdf
curl -O http://awsdocs.s3.amazonaws.com/SNS/latest/sns-qrc.pdf


## ----------------------------------------------
## Amazon Relational Database Service ドキュメント
## ----------------------------------------------
curl -O http://awsdocs.s3.amazonaws.com/RDS/latest/rds-gsg-ja_jp.pdf
curl -O http://awsdocs.s3.amazonaws.com/RDS/latest/rds-cli.pdf
curl -O http://awsdocs.s3.amazonaws.com/RDS/latest/rds-ug.pdf
curl -O http://awsdocs.s3.amazonaws.com/RDS/latest/rds-qrc.pdf
curl -O http://awsdocs.s3.amazonaws.com/RDS/latest/rds-api.pdf


## ----------------------------------------------
## Amazon DynamoDB ドキュメント
## ----------------------------------------------
curl -O http://awsdocs.s3.amazonaws.com/dynamodb/latest/dynamodb-dg-ja_jp.pdf
curl -O http://awsdocs.s3.amazonaws.com/dynamodb/latest/dynamodb-api.pdf


## ----------------------------------------------
## Amazon ElastiCache Documentation
## ----------------------------------------------
curl -O http://awsdocs.s3.amazonaws.com/ElastiCache/latest/elasticache-ug.pdf
curl -O http://awsdocs.s3.amazonaws.com/ElastiCache/latest/elasticache-cli.pdf
curl -O http://awsdocs.s3.amazonaws.com/ElastiCache/latest/elasticache-api.pdf


## ----------------------------------------------
## Amazon Redshift ドキュメント
## ----------------------------------------------
curl -O http://s3.amazonaws.com/awsdocs/redshift/latest/redshift-gsg-ja_jp.pdf
curl -O http://awsdocs.s3.amazonaws.com/redshift/latest/redshift-dg-ja-jp.pdf
curl -O http://s3.amazonaws.com/awsdocs/redshift/latest/redshift-mgmt-ja-jp.pdf
curl -O http://awsdocs.s3.amazonaws.com/redshift/latest/redshift-cli.pdf
curl -O http://awsdocs.s3.amazonaws.com/redshift/latest/redshift-api.pdf


## ----------------------------------------------
## Amazon SimpleDB ドキュメント
## ----------------------------------------------
curl -O http://awsdocs.s3.amazonaws.com/SDB/latest/sdb-gsg.pdf
curl -O http://awsdocs.s3.amazonaws.com/SDB/latest/sdb-dg.pdf
curl -O http://awsdocs.s3.amazonaws.com/SDB/latest/sdb-qrc.pdf


## ----------------------------------------------
## Amazon Elastic MapReduce ドキュメント
## ----------------------------------------------
curl -O http://s3.amazonaws.com/awsdocs/ElasticMapReduce/latest/emr-gsg-jp.pdf
curl -O http://s3.amazonaws.com/awsdocs/ElasticMapReduce/latest/emr-dg-ja_jp.pdf
curl -O http://s3.amazonaws.com/awsdocs/ElasticMapReduce/latest/emr-api.pdf
curl -O http://s3.amazonaws.com/awsdocs/ElasticMapReduce/latest/emr-qrc.pdf


## ----------------------------------------------
## Amazon Kinesis Documentation
## ----------------------------------------------
curl -O http://awsdocs.s3.amazonaws.com/kinesis/latest/kinesis-dg.pdf
curl -O http://awsdocs.s3.amazonaws.com/kinesis/latest/kinesis-api.pdf


## ----------------------------------------------
## AWS Data Pipeline ドキュメント
## ----------------------------------------------
curl -O http://s3.amazonaws.com/awsdocs/datapipeline/latest/datapipeline-dg.pdf
curl -O http://s3.amazonaws.com/awsdocs/datapipeline/latest/datapipeline-api.pdf


## ----------------------------------------------
## Alexa Top Sites Documentation
## ----------------------------------------------
curl -O http://docs.aws.amazon.com/AlexaWebInfoService/latest/awis-dg-20050711.pdf


## ----------------------------------------------
## Alexa Web Information Service Documentation
## ----------------------------------------------
curl -O http://docs.aws.amazon.com/AlexaWebInfoService/latest/awis-dg-20050711.pdf


## ----------------------------------------------
## Amazon DevPay ドキュメント
## ----------------------------------------------
curl -O http://awsdocs.s3.amazonaws.com/DevPay/latest/devpay-gsg.pdf
curl -O http://awsdocs.s3.amazonaws.com/DevPay/latest/devpay-dg.pdf
curl -O http://awsdocs.s3.amazonaws.com/DevPay/latest/devpay_qrc.pdf


## ----------------------------------------------
## Amazon Mechanical Turk ドキュメント
## ----------------------------------------------
curl -O http://s3.amazonaws.com/awsdocs/MechTurk/latest/amt-gsg.pdf
curl -O http://s3.amazonaws.com/awsdocs/MechTurk/latest/amt-ui.pdf
curl -O http://awsdocs.s3.amazonaws.com/MechTurk/latest/amt-clt.pdf
curl -O http://awsdocs.s3.amazonaws.com/MechTurk/latest/amt-dg.pdf
curl -O http://awsdocs.s3.amazonaws.com/MechTurk/latest/amt-API.pdf
curl -O http://awsdocs.s3.amazonaws.com/MechTurk/latest/QRC-MTurk.pdf


## ----------------------------------------------
## Amazon Silk Documentation
## ----------------------------------------------
curl -O https://s3.amazonaws.com/awsdocs/AmazonSilk/latest/silk-dg.pdf


## ----------------------------------------------
## AWS GovCloud (US)
## ----------------------------------------------
curl -O http://docs.aws.amazon.com/govcloud-us/latest/UserGuide/govcloud-us-ug.pdf


## ----------------------------------------------
## AWS Account Billing ドキュメント
## ----------------------------------------------
curl -O http://awsdocs.s3.amazonaws.com/awsaccountbilling/latest/awsaccountbilling-aboutv2-ja_jp.pdf
curl -O http://awsdocs.s3.amazonaws.com/awsaccountbilling/latest/awsaccountbilling-about-ja_jp.pdf


## ----------------------------------------------
## AWS Marketplace Documentation
## ----------------------------------------------


## ----------------------------------------------
## AWS Support Documentation
## ----------------------------------------------
curl -O http://awsdocs.s3.amazonaws.com/awssupport/latest/support-ug.pdf
curl -O http://awsdocs.s3.amazonaws.com/awssupport/latest/support-api.pdf


## ----------------------------------------------
## http://aws.amazon.com/jp/aws-jp-introduction/
## ----------------------------------------------



## ----------------------------------------------
## http://aws.amazon.com/jp/whitepapers/
## ----------------------------------------------
cd ..
mkdir -p whitepapers
cd whitepapers

## AWS ホワイトペーパー
curl -O https://s3.amazonaws.com/awsmedia/jp/wp/AWS_Overview.pdf
curl -O https://s3.amazonaws.com/awsmedia/jp/wp/AWS+Risk+and+Compliance+Whitepaper.pdf
curl -O http://media.amazonwebservices.com/AWS_Security_at_Scale_Governance_in_AWS.pdf
curl -O http://media.amazonwebservices.com/AWS_Security_at_Scale_Logging_in_AWS.pdf
curl -O http://media.amazonwebservices.com/AWS_Securing_Data_at_Rest_with_Encryption.pdf
curl -O https://s3.amazonaws.com/awsmedia/jp/wp/AWS+Security+Whitepaper+-+May+2011.pdf
curl -O http://media.amazonwebservices.com/AWS_Security_Best_Practices.pdf
curl -O https://s3.amazonaws.com/awsmedia/jp/wp/AWS_Storage_Options_01052011.pdf
curl -O http://media.amazonwebservices.com/AWS_Setting_Up_Multiuser_Environments_Education.pdf
curl -O https://s3.amazonaws.com/awsmedia/jp/wp/AWS_Amazon_EMR_Best_Practices.pdf
curl -O http://media.amazonwebservices.com/AWS_Auditing_Security_Checklist.pdf
curl -O http://media.amazonwebservices.com/AWS_Operational_Checklists.pdf
curl -O https://s3.amazonaws.com/awsmedia/jp/wp/AWS_Overview.pdf
curl -O http://media.amazonwebservices.com/AWS_Financial_Services_Grid_Computing.pdf
curl -O https://s3.amazonaws.com/awsmedia/jp/wp/AWS_Migrate_Resources_To_New_Region.pdf
curl -O http://media.amazonwebservices.com/AWS_Backup_Recovery.pdf
curl -O http://media.amazonwebservices.com/AWS_Development_Test_Environments.pdf
curl -O http://media.amazonwebservices.com/AWS_Amazon_VPC_Connectivity_Options.pdf
curl -O http://media.amazonwebservices.com/AWS_Web_Hosting_Best_Practices.pdf
curl -O http://media.amazonwebservices.com/AWS_TCO_Web_Applications.pdf
curl -O http://media.amazonwebservices.com/AWS_HIPAA_Whitepaper_Final.pdf
curl -O https://s3.amazonaws.com/awsmedia/jp/wp/AWS_Amazon_SES_Best_Practices.pdf
curl -O http://media.amazonwebservices.com/AWS_Pricing_Overview.pdf
curl -O http://media.amazonwebservices.com/AWS_TCO_DynamoDB.pdf
curl -O https://s3.amazonaws.com/awsmedia/jp/wp/AWS_Disaster_Recovery_01242012.pdf
curl -O http://media.amazonwebservices.com/CloudMigration-main.pdf
curl -O http://d36cz9buwru1tt.cloudfront.net/CloudMigration-scenario-wep-app.pdf
curl -O http://d36cz9buwru1tt.cloudfront.net/CloudMigration-scenario-batch-apps.pdf
curl -O http://d36cz9buwru1tt.cloudfront.net/CloudMigration-scenario-backend-processing.pdf
curl -O https://s3.amazonaws.com/awsmedia/jp/wp/Extend_your_IT_infrastructure_with_Amazon_VPC.pdf
curl -O https://s3.amazonaws.com/awsmedia/jp/wp/AWS_WP_Fault_Tolerant_JP_v20110517.pdf
curl -O https://s3.amazonaws.com/awsmedia/jp/wp/AWS_WP_Cloud_BestPractices_JP_v20110531.pdf
curl -O http://media.amazonwebservices.com/EC2_ADFS_howto_2.0.pdf
curl -O http://media.amazonwebservices.com/The_Economics_of_the_AWS_Cloud_vs_Owned_IT_Infrastructure.pdf
curl -O http://media.amazonwebservices.com/AWS_Cloud_Architectures.pdf
## パートナーホワイトペーパー
curl -O http://media.amazonwebservices.com/AWS_RDBMS_Oracle.pdf
curl -O http://media.amazonwebservices.com/AWS_Alfresco_Enterprise_Reference_Architecture.pdf
curl -O http://media.amazonwebservices.com/AWS_NoSQL_Couchbase.pdf
curl -O http://media.amazonwebservices.com/AWS_Exchange_Planning_Implementation_Guide.pdf
curl -O http://media.amazonwebservices.com/AWS_NoSQL_Riak.pdf
curl -O http://media.amazonwebservices.com/AWS_RDBMS_PostgreSQL.pdf
# http://deepsecurity.trendmicro.com/resources/
curl -O http://www.trendmicro.com/cloud-content/us/pdfs/business/white-papers/wp_best-practices-security-compliance-with-amazon-web-services.pdf
curl -O http://www.trendmicro.com/cloud-content/us/pdfs/business/datasheets/ds_deep-security-as-a-service.pdf
curl -O http://media.amazonwebservices.com/AWS_NoSQL_MongoDB.pdf
curl -O http://media.amazonwebservices.com/AWS_WSFC_SQL_Server_AlwaysOn.pdf
curl -O http://media.amazonwebservices.com/AWS_ESRI_Mapping_GeoSpatial_Analysis_Using_ArcGIS.pdf
curl -O http://media.amazonwebservices.com/AWS_Microsoft_Platform_Security.pdf
curl -O http://awsmedia.s3.amazonaws.com/SharePoint_on_AWS_Reference_Architecture_White_Paper.pdf
curl -O http://media.amazonwebservices.com/AWS_SharePoint_Reference_Implementation_Guide.pdf
curl -O http://media.amazonwebservices.com/AWS_RDBMS_MS_SQLServer.pdf
curl -O http://download.microsoft.com/download/6/C/2/6C2DBA25-C4D3-474B-8977-E7D296FBFE71/EC2-Windows%20SSO%20v1%200--Chappell.pdf
## カスタマーホワイトペーパー
curl -O http://media.amazonwebservices.com/AWS_Amazon_Oracle_Backups.pdf
curl -O http://media.amazonwebservices.com/AWS_Amazon_SharePoint_Deployment.pdf
curl -O http://media.amazonwebservices.com/AWS_Amazon_BPM_Migration.pdf

# 英語のリンク
http://media.amazonwebservices.com/AWS_Overview_Whitepaper_120809.pdf
cd ..


## ----------------------------------------------
## Amazon Data Service Japan Contents
## http://aws.amazon.com/jp/aws-jp-introduction/
## ----------------------------------------------
mkdir -p adsj-contents
cd adsj-contents
curl -O http://adsj-contents.s3.amazonaws.com/training/aws-basic/0_AWS_Basic_Prepare_20120629.pdf
curl -O http://adsj-contents.s3.amazonaws.com/training/aws-basic/1_AWS_Basic_SignUp_20120629.pdf
curl -O http://adsj-contents.s3.amazonaws.com/training/aws-basic/AWS_Basic_20120629.pdf
curl -O http://adsj-contents.s3.amazonaws.com/training/aws-basic/AWS%20Basic%20Windows_20121030.pdf
curl -O http://adsj-contents.s3.amazonaws.com/training/vpc-training/VPC_Presentation_ver3.pdf
curl -O http://adsj-contents.s3.amazonaws.com/training/vpc-training/Partner_Training_VPC-%E9%85%8D%E5%B8%83%E7%94%A8_ver4.0.pdf
curl -O http://adsj-contents.s3.amazonaws.com/training/vpc-training/NAT%E3%82%A4%E3%83%B3%E3%82%B9%E3%82%BF%E3%83%B3%E3%82%B9%E3%81%AE%E4%BD%9C%E6%88%90%E6%96%B9%E6%B3%95_20120719.pdf
curl -O http://adsj-contents.s3.amazonaws.com/solution-casestudy/SharePoint%20on%20AWS_20120524%20.pdf
curl -O http://adsj-contents.s3.amazonaws.com/solution-casestudy/SAP%20on%20AWS%E6%83%85%E5%A0%B1_v2_201207.pdf
curl -O http://adsj-contents.s3.amazonaws.com/solution-casestudy/%E3%82%A8%E3%83%B3%E3%82%BF%E3%83%BC%E3%83%86%E3%82%A4%E3%83%A1%E3%83%B3%E3%83%88%E6%A5%AD%E7%95%8C%E3%81%AB%E3%81%8A%E3%81%91%E3%82%8BAWS%E6%B4%BB%E7%94%A8%E4%BA%8B%E4%BE%8B_20120725.pdf
curl -O http://adsj-contents.s3.amazonaws.com/solution-casestudy/AWS%E3%82%AF%E3%83%A9%E3%82%A6%E3%83%89%E3%81%A7%E3%81%AECDN%E6%B4%BB%E7%94%A8-%E5%8B%95%E7%94%BB%E9%85%8D%E4%BF%A1%E7%B7%A8-_20121029.pdf
curl -O http://adsj-contents.s3.amazonaws.com/solution-casestudy/%E3%83%A1%E3%83%87%E3%82%A3%E3%82%A2%E7%95%8C%E9%9A%88%E3%81%A7%E6%B4%BB%E7%94%A8%E3%81%95%E3%82%8C%E3%82%8BAWS_20130927.pdf
curl -O http://adsj-contents.s3.amazonaws.com/solution-casestudy/AWS%E3%81%A7%E5%AE%9F%E7%8F%BE%E3%81%99%E3%82%8B%E3%83%90%E3%83%83%E3%82%AF%E3%82%A2%E3%83%83%E3%83%97%E3%81%A8%E3%83%87%E3%82%A3%E3%82%B6%E3%82%B9%E3%82%BF%E3%83%AA%E3%82%AB%E3%83%90%E3%83%AA_20130220.pdf
curl -O http://adsj-contents.s3.amazonaws.com/solution-casestudy/%E3%82%A8%E3%83%B3%E3%82%BF%E3%83%BC%E3%83%95%E3%82%9A%E3%83%A9%E3%82%A4%E3%82%B9%E3%82%99%E3%81%AB%E3%81%8A%E3%81%91%E3%82%8BAWS%E5%88%A9%E7%94%A8%E4%BA%8B%E4%BE%8B_20121116.pdf
curl -O http://adsj-contents.s3.amazonaws.com/solution-casestudy/aws_for_startup_20130712public.pdf
curl -O http://adsj-contents.s3.amazonaws.com/solution-casestudy/%E3%82%B2%E3%83%BC%E3%83%A0%E3%83%97%E3%83%A9%E3%83%83%E3%83%88%E3%83%95%E3%82%A9%E3%83%BC%E3%83%A0%20on%20AWS_20130927.pdf
curl -O https://adsj-contents.s3.amazonaws.com/meister-re%3AGenerate/20140312_AWS-Meister-reGenerated-BigData%2BDataPipeline-public.pdf
curl -O http://adsj-contents.s3.amazonaws.com/meister-re%3AGenerate/20140226_AWS-Meister-reGenerate-Billing-Public.pdf
curl -O http://adsj-contents.s3.amazonaws.com/misc/aws-131008213240-phpapp02.pdf
curl -O http://media.amazonwebservices.com/jp/cost/AWS-Simple-C_JP_Guiede_20131017.pdf
curl -O http://adsj-contents.s3.amazonaws.com/meister-re%3AGenerate/20130327_AWS-Meister-reGenerate-S3_public.pdf
curl -O http://adsj-contents.s3.amazonaws.com/meister-reloaded/20121112_AWS-Meister-Reloaded-Glacier-public.pdf
curl -O http://adsj-contents.s3.amazonaws.com/product/Amazon%20Glacier%E3%81%AE%E3%81%94%E7%B4%B9%E4%BB%8B%28%E6%A9%9F%E8%83%BD%E7%B7%A8%29_20120828.pdf
curl -O http://adsj-contents.s3.amazonaws.com/meister-re%3AGenerate/20130821-AWS-Meister-reGenerate-Route53-public.pdf
curl -O http://adsj-contents.s3.amazonaws.com/meister-re%3AGenerate/20130313_AWS-Meister-reGenerate-EC2_public.pdf
curl -O http://adsj-contents.s3.amazonaws.com/meister-re%3AGenerate/20130529_AWS-Meister-reGenerate-EC2-Windows_public.pdf
curl -O http://adsj-contents.s3.amazonaws.com/meister-re%3AGenerate/20130731_AWS-Meister-reGenerate-EC2-HPC-public.pdf
curl -O https://adsj-contents.s3.amazonaws.com/meister-re:Generate/20131023_AWS-Meister-reGenerate-RISpot_public.pdf
curl -O https://adsj-contents.s3.amazonaws.com/meister-re:Generate/20140129_AWS-Meister-Reloaded-ephemeral-ebs-public.pdf
curl -O http://adsj-contents.s3.amazonaws.com/meister-reloaded/20130123_AWS-Meister-Reloaded-ElasticBlockStore-public.pdf
curl -O http://adsj-contents.s3.amazonaws.com/meister-re%3AGenerate/20130626_AWS-Meister-reGenerate-CloudWatch_AutoScaling_public.pdf
curl -O http://adsj-contents.s3.amazonaws.com/meister-re%3AGenerate/20130626_AWS-Meister-reGenerate-CloudWatch_AutoScaling_public.pdf
curl -O https://adsj-contents.s3.amazonaws.com/meister-re:Generate/20140115_AWS-Meister-regenerate-AWS_CLI_PowerShell.pdf
curl -O https://adsj-contents.s3.amazonaws.com/meister-re:Generate/20131127_AWS-Meister-regenerate-CloudFormation.pdf
curl -O https://adsj-contents.s3.amazonaws.com/meister-re:Generate/20131120AWS-Medister-reGenerate-CloudFront&ETS_public.pdf
curl -O http://adsj-contents.s3.amazonaws.com/product/CloudFront%E3%81%AEinvaliadtion%E6%96%B9%E6%B3%95_20120704.pdf
curl -O http://adsj-contents.s3.amazonaws.com/meister-reloaded/20120423_AWS-Meister-Reloaded-FMSonAWS-public.pdf
curl -O http://adsj-contents.s3.amazonaws.com/meister-re%3AGenerate/20130410_AWS-Meister-reGenerate-RDS_public.pdf
curl -O http://adsj-contents.s3.amazonaws.com/meister-reloaded/20120508_AWS-Meister-Reloaded-RDS-public.pdf
curl -O http://adsj-contents.s3.amazonaws.com/meister-reloaded/20120508_AWS-Meister-Reloaded-RDS-public.pdf
curl -O http://adsj-contents.s3.amazonaws.com/meister-re%3AGenerate/20131002_AWS-Meister-reGenerate-DynamoDB-public.pdf
curl -O http://adsj-contents.s3.amazonaws.com/meister-re%3AGenerate/20130716_AWS-Meister-reGenerate-Redshift_public.pdf
curl -O http://adsj-contents.s3.amazonaws.com/meister-re%3AGenerate/20130612_AWS-Meister-reGenerate-ELB-public.pdf
curl -O http://adsj-contents.s3.amazonaws.com/product/%E3%83%AD%E3%83%BC%E3%83%89%E3%83%90%E3%83%A9%E3%83%B3%E3%82%B5%E3%81%A8Socket%E6%8E%A5%E7%B6%9A%E3%82%92%E4%BD%BF%E7%94%A8%E3%81%97%E3%81%9F%E3%82%A4%E3%83%99%E3%83%B3%E3%83%88%E9%80%9A%E7%9F%A5%E3%82%B5%E3%83%BC%E3%83%90%E3%81%AE%E8%B2%A0%E8%8D%B7%E5%88%86%E6%95%A3_20120921.pdf
curl -O http://d36cz9buwru1tt.cloudfront.net/jp/documentation/BestPracticesInEvaluatingELB-ja-final.pdf
curl -O http://adsj-contents.s3.amazonaws.com/meister-re%3AGenerate/20130925_AWS-Meister-reGenerate-EMR_public.pdf
curl -O https://adsj-contents.s3.amazonaws.com/meister-re%3AGenerate/20140312_AWS-Meister-reGenerated-BigData%2BDataPipeline-public.pdf
curl -O http://adsj-contents.s3.amazonaws.com/product/AmazonElasticTranscoder%E7%B4%B9%E4%BB%8B_20130522.pdf
curl -O https://adsj-contents.s3.amazonaws.com/meister-re:Generate/20131120AWS-Medister-reGenerate-CloudFront&ETS_public.pdf
curl -O http://adsj-contents.s3.amazonaws.com/product/GettingStartedWithBeanstalk_20130111.pdf
curl -O http://adsj-contents.s3.amazonaws.com/meister-re%3AGenerate/20131009_AWS-Meister-reGenerate-ElasticBeanstalk-public.pdf
curl -O http://adsj-contents.s3.amazonaws.com/meister-reloaded/20120416_AWS-Meister-Reloaded-AWSElasticBeanstalk-public.pdf
curl -O http://adsj-contents.s3.amazonaws.com/meister-reloaded/20120416_AWS-Meister-Reloaded-AWSElasticBeanstalk-public.pdf
curl -O http://adsj-contents.s3.amazonaws.com/meister-reloaded/20121217_AWS-Meister-Reloaded-AWSElasticBeanstalk-python_public.pdf
curl -O http://adsj-contents.s3.amazonaws.com/meister-re%3AGenerate/20130904_AWS-Meister-reGenerate-VPC-DXVPN.pdf
curl -O https://adsj-contents.s3.amazonaws.com/meister-re:Generate/20131030_AWS-Meister-reGenerate-ElastiCache.pdf
curl -O https://adsj-contents.s3.amazonaws.com/product/20131107_ElastiCache-for-Redis-QA.pdf
curl -O http://adsj-contents.s3.amazonaws.com/meister-re%3AGenerate/20130716_AWS-Meister-reGenerate-IAM-public.pdf
curl -O https://adsj-contents.s3.amazonaws.com/meister-re:Generate/20131210_AWS-Meister-reGenerate-AWS%20SDK%20for%20Java%20and%20dotNET-public.pdf
curl -O https://adsj-contents.s3.amazonaws.com/meister-re:Generate/20131218_AWS-Meister-regenerate-AWSSDKforRuby-PHP-Python-Node-public_20131218.pdf
curl -O https://adsj-contents.s3.amazonaws.com/meister-re:Generate/20131218_AWS-Meister-regenerate-AWSSDKforRuby-PHP-Python-Node-public_20131218.pdf
curl -O https://adsj-contents.s3.amazonaws.com/meister-re:Generate/20131218_AWS-Meister-regenerate-AWSSDKforRuby-PHP-Python-Node-public_20131218.pdf
curl -O https://adsj-contents.s3.amazonaws.com/meister-re:Generate/20140205_AWS-Meister-reGenerated-AWSSDKforClients_public.pdf
curl -O https://adsj-contents.s3.amazonaws.com/meister-re:Generate/20131210_AWS-Meister-reGenerate-AWS%20SDK%20for%20Java%20and%20dotNET-public.pdf
curl -O https://adsj-contents.s3.amazonaws.com/meister-re:Generate/20131210_AWS-Meister-reGenerate-AWS%20SDK%20for%20Java%20and%20dotNET-public.pdf
curl -O http://adsj-contents.s3.amazonaws.com/meister-re%3AGenerate/20130424_AWS-Meister-reGenerate-SWF_public.pdf
curl -O https://adsj-contents.s3.amazonaws.com/meister-re%3AGenerate/20140305_AWS-Meister-reGenerated-AmazonSES-public.pdf
curl -O http://adsj-contents.s3.amazonaws.com/product/Amazon%20SES-Easy%20DKIM%E8%A8%AD%E5%AE%9A%E3%82%B5%E3%83%9D%E3%83%BC%E3%83%88%E8%B3%87%E6%96%99_20120906.pdf
curl -O https://adsj-contents.s3.amazonaws.com/meister-re:Generate/20140212_AWS-Meister-reGenerate-SQS-SNS.pdf
curl -O http://adsj-contents.s3.amazonaws.com/meister-re%3AGenerate/20130917_AWS-Meister-reGenerate-extra-SNSMobilePush_public.pdf
curl -O https://adsj-contents.s3.amazonaws.com/meister-re:Generate/20140212_AWS-Meister-reGenerate-SQS-SNS.pdf
curl -O http://adsj-contents.s3.amazonaws.com/meister-re%3AGenerate/20130515_AWS-Meister-reGenerate-StorageGW_public.pdf
curl -O http://adsj-contents.s3.amazonaws.com/meister-reloaded/20120625_AWS-Meister-Reloaded-SG-VMIE-public.pdf
curl -O http://adsj-contents.s3.amazonaws.com/meister-re%3AGenerate/20130828_AWS-Meister-reGenerate-VPC.pdf
curl -O http://adsj-contents.s3.amazonaws.com/meister-reloaded/20130220_AWS-Meister-Reloaded-VPC_public.pdf
curl -O http://adsj-contents.s3.amazonaws.com/product/OpsWorksIntroduction_20130625.pdf
curl -O https://adsj-contents.s3.amazonaws.com/meister-re:Generate/20131016_AWS-Meister-reGenerate-OpsWorks.pdf
curl -O http://adsj-contents.s3.amazonaws.com/meister/20111215_12_AWS-Meister-SQS_SNS_SDB-public.pdf
curl -O http://d36cz9buwru1tt.cloudfront.net/jp/wp/AWS%20Security%20Whitepaper%20-%20May%202011.pdf
curl -O http://adsj-contents.s3.amazonaws.com/misc/AWS%E3%82%BB%E3%82%AD%E3%83%A5%E3%83%AA%E3%83%86%E3%82%A3%E3%81%A8%E3%82%B3%E3%83%B3%E3%83%97%E3%83%A9%E3%82%A4%E3%82%A2%E3%83%B3%E3%82%B920121119.pdf
curl -O https://adsj-contents.s3.amazonaws.com/security-compliance/Securing%20Microsoft%20Platform%20on%20Amazon%20Web%20Services_20131219.pdf
curl -O http://d36cz9buwru1tt.cloudfront.net/jp/wp/AWS%20Risk%20and%20Compliance%20Whitepaper%20-%20July%202012%20FINAL.pdf
curl -O http://adsj-contents.s3.amazonaws.com/misc/MFA%E3%83%87%E3%83%90%E3%82%A4%E3%82%B9%E8%B3%BC%E5%85%A5%E3%82%AC%E3%82%A4%E3%83%89_20110222.pdf
curl -O http://adsj-contents.s3.amazonaws.com/misc/%E3%83%9E%E3%82%A4%E3%82%AF%E3%83%AD%E3%82%BD%E3%83%95%E3%83%88%E3%83%A9%E3%82%A4%E3%82%BB%E3%83%B3%E3%82%B9%E3%82%AC%E3%82%A4%E3%83%89forAWS_20120405.pdf
curl -O http://adsj-contents.s3.amazonaws.com/misc/RD%20Gateway%E3%81%AB%E3%82%88%E3%82%8BWindows%E3%82%A4%E3%83%B3%E3%82%B9%E3%82%BF%E3%83%B3%E3%82%B9%E3%81%B8%E3%81%AE%E6%8E%A5%E7%B6%9A.pdf
curl -O http://adsj-contents.s3.amazonaws.com/misc/%E3%82%A2%E3%83%97%E3%83%AA%E3%83%87%E3%83%97%E3%83%AD%E3%82%A4_20130506.pdf
curl -O https://adsj-contents.s3.amazonaws.com/misc/20130205_AWS%E3%81%8B%E3%82%89%E3%81%AE%E3%83%A1%E3%83%BC%E3%83%AB%E9%80%81%E4%BF%A1.pdf
curl -O //media.amazonwebservices.com/AWS_Overview_Whitepaper_120809.pdf


cd ..


## ----------------------------------------------
## convert encode
## ----------------------------------------------
dirs=("awsgsg" "awssdk" "aws-toolkit" "aws-service" "whitepapers" "aws-cli" "adsj-contents")

for dir in ${dirs[@]}
do
  filelist=`ls ./${dir}/*.pdf | grep "%"`
  for file in ${filelist[@]}
  do
    new_file=`echo ${file} | nkf --url-input`
    new_file=`echo ${new_file/%%20/\ }`
    mv "${file}" "${new_file}"
  done
done
