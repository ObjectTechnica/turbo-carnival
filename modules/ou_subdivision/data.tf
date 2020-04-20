data "aws_caller_identity" "identity" {}

data "aws_iam_policy_document" "managed_ou_scp" {
  statement {
    sid = "StopCloudTrailChanges"

    actions = [
      "cloudtrail:Delete*",
      "cloudtrail:Remove*",
      "cloudtrail:Stop*",
    ]

    resources = [
      "*",
    ]

    effect = "Deny"
  }

  statement {
    sid = "StopGuardDutyChanges"

    actions = [
      "guardduty:ArchiveFindings",
      "guardduty:Delete*",
      "guardduty:UntagResource",
    ]

    resources = [
      "*",
    ]

    effect = "Deny"
  }

   statement {
     sid = "StopSecurityHubChanges"

    actions = [
      "securityhub:BatchDisableStandards",
      "securityhub:DeclineInvitations",
      "securityhub:Delete*",
      "securityhub:UntagResource",
    ]

    resources = [
      "*",
    ]

    effect = "Deny"
  }

    statement {
      sid = "StopConfigChanges"

    actions = [
      "config:Delete*",
      "config:Stop*",
      "config:UntagResource",
    ]

    resources = [
      "*",
    ]

    effect = "Deny"
  }

  statement {
    sid = "StopAccountOrgChanges"

    actions = [
      "organizations:DeclineHandshake",
      "organizations:Delete*",
      "organizations:Disable*",
      "organizations:LeaveOrganization",
      "organizations:UntagResource",
    ]

    resources = [
      "*",
    ]

    effect = "Deny"
  }

   statement {
     sid = "DenyChangestoFlowlogs"

    actions = [
      "ec2:DeleteFlowLogs",
      "logs:DeleteLogGroup",
      "logs:DeleteLogStream",
    ]

    resources = [
      "*",
    ]

    effect = "Deny"
  }

    statement {
      sid = "StopInternetAccessFromVPC"

    actions = [
      "ec2:AttachInternetGateway",
      "ec2:CreateInternetGateway",
      "ec2:CreateEgressOnlyInternetGateway",
      "ec2:CreateVpcPeeringConnection",
      "ec2:AcceptVpcPeeringConnection",
      "globalaccelerator:Create*",
      "globalaccelerator:Update*",
    ]

    resources = [
      "*",
    ]

    effect = "Deny"
  }

  statement {
    sid = "DenyAccessWithException"

    actions = [
      "iam:AttachRolePolicy",
      "iam:DeleteRole",
      "iam:DeleteRolePermissionsBoundary",
      "iam:DeleteRolePolicy",
      "iam:DetachRolePolicy",
      "iam:PutRolePermissionsBoundary",
      "iam:PutRolePolicy",
      "iam:UpdateAssumeRolePolicy",
      "iam:UpdateRole",
      "iam:UpdateRoleDescription"
    ]

    resources = [
      "*",
    ]

    effect = "Deny"
  }
    

    statement {

    not_actions = [
               "iam:*",
               "organizations:*",
               "route53:*",
               "budgets:*",
               "waf:*",
               "cloudfront:*",
               "globalaccelerator:*",
               "importexport:*",
               "support:*"
    ]

    resources = [
      "*",
    ]

    effect = "Deny"

    condition {
      test     = "StringNotEquals"
      variable = "aws:RequestedRegion"

      values = [
                "us-gov-west-1",
                "us-gov-east-1"
      ]
    }
  } 

}