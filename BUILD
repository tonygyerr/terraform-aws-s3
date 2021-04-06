project_name = "s3"
# Terraform init Build Targets
filegroup(
    labels = [
        "s3",
        "deploy",
        "plan",
    ],
    name = "s3_pkg",
    srcs = glob([
        "*.tf",
        "commands/*.sh",
        "env-config/*.tfvars",
        "examples/*.tf",
    ]),
)

genrule(
    cmd =[
        f"aws s3api create-bucket --bucket ${CONFIG.s3_backend_bucket} --region ${CONFIG.aws_region}",
        f"aws s3api put-bucket-policy --bucket ${CONFIG.s3_backend_bucket} --region ${CONFIG.aws_region} --policy $(location policy/s3-policy/s3_bucket_backend_policy.json",
        f"aws s3api put-public-access-block --bucket ${CONFIG.s3_backend_bucket} --public-access-block-configuration 'BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true'",
        f"aws dynamodb create-table --region ${CONFIG.aws_region} --table-name ${CONFIG.dynamodb_table} --attribute-definitions AttributeName=LockID,AttributeType=S --key-schema AttributeName=LockID,KeyType=HASH --provisioned-throughput ReadCapacityUnits=20,WriteCapacityUnits=20", 
    ],
    labels = ["deploy"],
    name = f"deploy-{project_name}",
    # tools = ["//third_party/terraform:terraform"],
    visibility = ["PUBLIC"],
)

# commands
sh_binary(
    labels = [
        "s3",
    ],
    deps = [
        ":s3_pkg",
    ],
    main = "commands/destroy.sh",
    name = "destroy_exe",
)

sh_binary(
    labels = [
        "s3",
    ],
    deps = [
        ":s3_pkg",
    ],
    main = "commands/plan.sh",
    name = "plan_exe",
)

sh_binary(
    labels = [
        "s3",
    ],
    deps = [
        ":s3_pkg",
    ],
    main = "commands/apply.sh",
    name = "apply_exe",
)