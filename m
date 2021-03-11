Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20508C433E0
	for <linux-clk@archiver.kernel.org>; Thu, 11 Mar 2021 22:47:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC02364F88
	for <linux-clk@archiver.kernel.org>; Thu, 11 Mar 2021 22:47:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbhCKWrE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Mar 2021 17:47:04 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:54610 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229505AbhCKWqu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Mar 2021 17:46:50 -0500
X-Greylist: delayed 1294 seconds by postgrey-1.27 at vger.kernel.org; Thu, 11 Mar 2021 17:46:50 EST
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12BML6JM021367;
        Thu, 11 Mar 2021 17:25:09 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2053.outbound.protection.outlook.com [104.47.61.53])
        by mx0c-0054df01.pphosted.com with ESMTP id 375yymh9d5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 Mar 2021 17:25:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QL3lXWvzNEdswJFasWVQWooFgMBQRHiopxqKFTzmBqJ36P1CY3otiIuOo892OuthahOO2/rBsEUnGVEjKa5AeOR87zNVpg/hMVng3h32lyr/arVtsMkk8wBVbt5/xWbA5AGC64O+eNdUNXxaAFAOew7d2XZDceUKCEbhfgGTZ9jBrKOYETmp2vFGovpObay8kvN/ASST8qpxkzj2zO4uTZiGczFJ19kRj4l+PyaD8oQAc/4uPCBhZ0XypdlEP1AG/p3L+OkCK/l0+CBFe2Xtprk9NExpeCD0c5XSo80m1Bi7sLF0eXOA32gebk/ZaZfxoR4u0hAMlF21rkc3NyuHlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s24JIqatmFlV0ILrWDHQoxTqgnDc7dpnIJ5ApLJYYUI=;
 b=MKwJWFNEAZhZNd0z/0frZ94LqxyWTV5a3qg4CCzOO3D8RRSQ/cT4uWId9Tvbf0XN07j+jUk/PK1GbG6JYF9oxpk2SLpuQ1kWwRMeGeWMzizCQuEi20/5HvxGCSNG4EliIepfoatk/OcbGYwFoI6DobEOs/jDT52THBCcf/RvD8Eq3j2RDwEDqEPb+azPHyfHdzZGNBBNQpbur5Q/Gsaht1Qd8lHPVWeQBqouZXMgNDKXXoCnqBf7b4U4zVcaR+6jQXaFuGgQUVw4IeR0d8ObaHQxQeptaJstdCbGF8eXC0DFqjHBVNX7EzgtWL/9TkaRkTAvPYp7ZRHy+d5yLMeslA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s24JIqatmFlV0ILrWDHQoxTqgnDc7dpnIJ5ApLJYYUI=;
 b=Ciey1vbQEuwxOnaWIIu/2CsrP9Ro+bdz16LL5ffauJSDbQxtoq0BnOoTA7CUG5z/aRtgpQ/VqfiCH6QDnDpAvKp3xO0UBOjvWkjrxC/uKJposYBej+buF/M023HZ04BuGnsPRFITp4cneMsStfEp9OWwmpETV4pORKU56esPvGw=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=calian.com;
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f::20)
 by YTXPR0101MB0960.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:b::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Thu, 11 Mar
 2021 22:25:08 +0000
Received: from YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb]) by YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::90d4:4d5b:b4c2:fdeb%7]) with mapi id 15.20.3912.027; Thu, 11 Mar 2021
 22:25:08 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     mike.looijmans@topic.nl, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Robert Hancock <robert.hancock@calian.com>
Subject: [PATCH 0/9] Si5341 driver updates
Date:   Thu, 11 Mar 2021 16:24:27 -0600
Message-Id: <20210311222436.3826800-1-robert.hancock@calian.com>
X-Mailer: git-send-email 2.27.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [204.83.154.189]
X-ClientProxiedBy: MWHPR12CA0055.namprd12.prod.outlook.com
 (2603:10b6:300:103::17) To YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:f::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (204.83.154.189) by MWHPR12CA0055.namprd12.prod.outlook.com (2603:10b6:300:103::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Thu, 11 Mar 2021 22:25:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6aac2db5-cb79-43a6-4ec2-08d8e4dc86fa
X-MS-TrafficTypeDiagnostic: YTXPR0101MB0960:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <YTXPR0101MB0960D3318456594A18287F51EC909@YTXPR0101MB0960.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4EzihIJNrC5VQXTR/ZEnQwspzwdW5zL4kw441yJ2DzfB+iKHPsanhn9yUEMFNyitGWXEKMHafZ/t8BR/IiYrIniUL8BqEyoKkTi5wSABX2+iEn1FHNYA/HV+I39FZwGRA3ZQGaEaMzFLskK5AJG+PyLGVOYZVtN4EQexKMsKOe3KV9SBkOCyj1k7wnf15rPspK1X73UkTCItv1ZgDujolVsjLxUav6jOtnmDFcrz6IY9z0zyyoeBVSQ2gpRpsnpRhY3XPk05sHZusB3ZV3wo8TUJ9OcTe9GePRN5+dyRetXWFREiFoQwrepRiHuKLQc9m1APF/6E6SeITDz8M3q1hk9OapReL4DZwVYkilpXffLTv80A/e/Hv3YivF0jvj+tXWErAOwWhu8WgD5/H77NMhJhUysyX0YP18crfUYFY1iJo/O1akzM/tZAPRpWmFh3Md3DgF9+Bi0SxIPjUJSrc7UnCRhsdjS5aUFSks5WbmHnR246bMk9Ys1OyxsvBPeLdw3s2kqIC63MjDOoc+3ph/uP6PqxuZC4aLJo/5M5V5TJxsGt09htzgka+6BqKm1XcfRvuI4kvUl0QyggudPQQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(366004)(136003)(346002)(396003)(69590400012)(6666004)(6506007)(26005)(66946007)(66556008)(16526019)(44832011)(2616005)(956004)(478600001)(107886003)(6512007)(83380400001)(8676002)(4326008)(36756003)(8936002)(6486002)(186003)(1076003)(52116002)(66476007)(4744005)(2906002)(5660300002)(316002)(15650500001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?DYYkydMFf/XhJAzpffJkk0pDuz/bbpX4MwqaqNX1uO3TZRmHd1/JHlLJvD+Z?=
 =?us-ascii?Q?9QaiQCzjs5Td0o5q7fUZKf1f7ZwY5/6hN294gEBdA6rJbDCJt5qV2hAUIMeS?=
 =?us-ascii?Q?UsX7xxc17tJKgw9kmIj+Zvj4qKq51vrAhV+oyM/H8MGbGfWNL76Q/0lihJYo?=
 =?us-ascii?Q?jRQxyd7WOref2xnOnrn+iqK8aqDie4l3v48quaGak/DmJTICrxvLs5OBqEDF?=
 =?us-ascii?Q?MxFZ9mM/sjBBwGzf0eHUkzYRfNVaiy1Vs73PlP/cE8dNxrccYXzBxt6ZtDMW?=
 =?us-ascii?Q?svto9n8E6qGq3A0kY91KR1f5T+F7XDOeQC6c8qtZXcjQ3YiBhjcZqE0QwGQp?=
 =?us-ascii?Q?LwPYM79DkYDHFKpPKutQvS5E0fMuquNUcEyVDL30/jaHgXEA2nFfQ7hFCg7X?=
 =?us-ascii?Q?mjETfIKft9xXQ0YAeOAqIsmRj8iPnkBUODyjX4asEbmo6NqetH5Q4cg3DFdq?=
 =?us-ascii?Q?38iVUloQ2u+HVkANcfx7gA/hKAbN5dCUbbWev3/qN3Eo3ydA/3Rhf5aARiZm?=
 =?us-ascii?Q?h1F3xvBpuKdj4agBygYMTJjxvFXxQ5oj7x2JiOcYJFeXe/UQRd6K985GNTRP?=
 =?us-ascii?Q?ND8CEz/1YLWFRpBQk8D5Amz2jj6OtsQcbV2EohjAXC51NIK1UkGT73RNWcCG?=
 =?us-ascii?Q?ZqWhCpBPJkqLr95YLoBIgl5QX/InKo7E8/MrJDgH7bmvKXoMrCMm9iKxbujs?=
 =?us-ascii?Q?KVJWgd5pWEBMf/BOoIEiFl3GvfmfeZLm3LLrq4zvsgXj6Z/KYhfjxJQoj7R2?=
 =?us-ascii?Q?QCRSqwUWhDXX1tceL7d7m0HUbrmZecIXSwEPhbMa3AdZJcZwhiQZDwmjdn/s?=
 =?us-ascii?Q?Px106yvqfSzqe1L/KuksRa6WHgp1aXZ5/w8lpNOaEI71TQuoAE2mlDkWN9mL?=
 =?us-ascii?Q?8f2YEmB3XDZxqvF6K4yE6zE5GGM3vuO4TanOiCwLAl6XGR2xF37UdfYiWYTb?=
 =?us-ascii?Q?EMfCpKEas92v65ACf81cZx9qh1n/pWeUu4FnAYM8DiqbvSyCmHx8siOSdGqg?=
 =?us-ascii?Q?umxncYCQUIUyziq38khsKovfvVkvvIMHIiPOPWEX03tuzwtyrojKD6UkWLuD?=
 =?us-ascii?Q?vT7skeSaBeqGdZpAp+jIerTPKrQWiCTALw9TF7xHfPf9epXoprKgAKOTFqrf?=
 =?us-ascii?Q?eXe7grx5qhkHfgkp3GJBelb8Xls0MtWQcHR/CVYXGlxRpV7tzGg1LYCGFQYn?=
 =?us-ascii?Q?aoaFJOIyyru/gucHdRbWNtlMZVePxPpPcHRvebBOAoI40+iN4PLcMgODlj8m?=
 =?us-ascii?Q?HRs+cId4f6ubMCIBPpQuTm/ph5S+o/yD+94uXCSXPUrnAGatHR6MnJWUnIQS?=
 =?us-ascii?Q?6eZa+9f8Q7PU2APZ/zRkqc8m?=
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aac2db5-cb79-43a6-4ec2-08d8e4dc86fa
X-MS-Exchange-CrossTenant-AuthSource: YT1PR01MB3546.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 22:25:08.3513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: olteXjuGbiPbW54tG5ech0AyxpJWqhpwH0gho4aq4p7Wo/5OVVE4fv4FsHQ20N0AVkJAJQpdVyQMyzItbVdF78XNH/nCaEblkedAD4fAEl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YTXPR0101MB0960
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-11_12:2021-03-10,2021-03-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1011
 spamscore=0 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=948 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103110117
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Various fixes and enhancements to the Si5341 driver.

Robert Hancock (9):
  dt-bindings: clock: clk-si5341: Add new attributes
  clk: si5341: Wait for DEVICE_READY on startup
  clk: si5341: Avoid divide errors due to bogus register contents
  clk: si5341: Check for input clock presence and PLL lock on startup
  clk: si5341: Update initialization magic
  clk: si5341: Allow different output VDD_SEL values
  clk: si5341: Add silabs,xaxb-ext-clk property
  clk: si5341: Add silabs,iovdd-33 property
  clk: si5341: Add sysfs properties to allow checking/resetting device
    faults

 .../bindings/clock/silabs,si5341.txt          |  16 +-
 drivers/clk/clk-si5341.c                      | 343 ++++++++++++++++--
 2 files changed, 323 insertions(+), 36 deletions(-)

-- 
2.27.0

