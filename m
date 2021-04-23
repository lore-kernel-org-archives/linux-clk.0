Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C05BDC433ED
	for <linux-clk@archiver.kernel.org>; Fri, 23 Apr 2021 03:34:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 89634613B8
	for <linux-clk@archiver.kernel.org>; Fri, 23 Apr 2021 03:34:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231639AbhDWDfU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Apr 2021 23:35:20 -0400
Received: from mail-eopbgr140042.outbound.protection.outlook.com ([40.107.14.42]:28856
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231261AbhDWDfU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 22 Apr 2021 23:35:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cfC1CZSjQqSHbZtNCTUbOVKJJznYGr6+8bmDCwBA80CJ8EQ34idIy1ByW90a9T1arYOinYCmyeJtpFEQzN9Z29MDnawNHiAX0PbzwrHzcQWLY+WsRlxIljtzlA/cP0BrsiT8RG3CedzwcTjPWjcGi94kCZUMuk7zRid+Vl/yyxBJRwGDOlGsRsM2ADhtNV2grcvvDKvTiVLgsjnGl1QGhB1+m9AGEbC6GhgpjxF2q97z+m+/2e8EE//bokhsd1jV8igad8iXDwxrMo93aUZIEuMtdCq3I8LMweePp0hneuAbZe8VC7ffnNZgNB16jAZXTkgJoapJzuc3H39kBOzfzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nteAchaYpm1H/MPgQlQ6J9zj6eqDjOuAItGP9fQAt4=;
 b=hCMeqPvigQW3amXaiPnhjknOX70Y7dnsG0NrFkYAOtbiwmyzoU6lBA/r+VUdoMbuyiZQk6+dWV9WZ6D/uQ9XIjPJU7nIoJoeFgK3Oc5yElieteAIjHo+h02qIsPlZNK3sMrykyQ3SayOMgS7zkOURv+qHnNoQrs9nKaATx8LozH7QDGhMAZYegGwz8FC0Q3l3qqU2zyhaDSNT6AtIzrh1Mbv6e9bhd0i5W93EKKn1GowxLbdrNK1AK+x8IYeS1WLT10EHtUZv3cEwDSM9CJr1n/gJyV7EloQeCLQz46YLQXB3ZIFkX+DQzm6XXkkqipAG1kmWSAwT6E7Ne2MPwwVCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nteAchaYpm1H/MPgQlQ6J9zj6eqDjOuAItGP9fQAt4=;
 b=iKxnYngWk+o+irqnQf6+yUFDJmiRlSCRqnoNpdUVGAD0qTmi3NvfQtFEmY8YHa4wVvs1tFuEK05H74q7BullEhocr7KurwjuP9icGWRx9OzLpnWJk2kfHOQFkgkQms7S8MfHWqLKruNo3geDqmx56II8WJIHbFw5FLyRr/vAKNM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB5079.eurprd04.prod.outlook.com (2603:10a6:20b:4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Fri, 23 Apr
 2021 03:34:40 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::b10a:ad0:a6f5:db9b]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::b10a:ad0:a6f5:db9b%2]) with mapi id 15.20.4065.023; Fri, 23 Apr 2021
 03:34:40 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     dongas86@gmail.com, kernel@pengutronix.de, shawnguo@kernel.org,
        linux-imx@nxp.com, abel.vesa@nxp.com, sboyd@kernel.org,
        Dong Aisheng <aisheng.dong@nxp.com>, devicetree@vger.kernel.org
Subject: [PATCH 1/6] dt-bindings: arm: imx: scu: fix naming typo of clk compatible string
Date:   Fri, 23 Apr 2021 11:33:29 +0800
Message-Id: <20210423033334.3317992-1-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2P15301CA0017.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::27) To AM6PR04MB4966.eurprd04.prod.outlook.com
 (2603:10a6:20b:2::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2P15301CA0017.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.10 via Frontend Transport; Fri, 23 Apr 2021 03:34:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9415a7e2-c6bb-478c-3344-08d90608ba2b
X-MS-TrafficTypeDiagnostic: AM6PR04MB5079:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB5079675A55A783FBBDA519A280459@AM6PR04MB5079.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RpzNYjZO+phtzONyPh+Xh//y3sIMgx98dmpG4cW+mXrIjWsLxI71hlviAUFNFwyrnkFPyS9vWJnQvn8FjnvWwoWxFWt9kUZaqkPexjvRxWu01rCcHRMPspw0KK0iOaBRK8eWHLsB559BzIbf1Q6UiyDHY6esYQqtymdKhfAPsy6OGD3eLB1+2n2ZPFXNAQXq5L93GgmLOfeXr8nTdmMd3g38EHZ1PpJM1334PxXkz0DR4BwODquxlbkn9zxHTDHk8dDSlwhMFuRR8PtsrqKRjymjc+1ooi6Tr1ikYMTnsT2P8jBooZ6Ke7vnJ0EqOJlA90l1Q4oX6MveCYsSSOxx0RD1RTtt7FQRyar614MLnqSclXixn1BHfEb8prqfFuHgtXesv6b4TGqAq5EZ/yVJ5RWxrjflkOd7pcp/Q6TQKwTC7mLCRJChCT+1BGjisnAbx2WERxGTaeI4ScBnkz+ZPC/JF8kPD1x5eSR+ig9UwTKwFC9QpWboknu2Wbqs4gG7tGaQvKlUyst4KyUO/oZZjBJGt+WTP1SS3l2QaCrlItswXc1Nf96bqvNRz9MxPNwFJYtNwYT1E6y4al7ruCVC82pB7gcMf1Yp3kd54cB9VSIouWwBk7faTvw7yY97EezYSlYihwnrZFmUoV9X/dvUHQwcVVEBr7ITqTzSifnfcy6v+He6GpMVHiY6FOraAWSWAYWbgTfIrXp3VXscO8iBcQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(366004)(376002)(39860400002)(16526019)(2906002)(8936002)(6512007)(316002)(38350700002)(8676002)(52116002)(38100700002)(4326008)(66556008)(26005)(86362001)(66946007)(478600001)(36756003)(1076003)(2616005)(956004)(6666004)(5660300002)(6486002)(6506007)(186003)(66476007)(83380400001)(69590400013)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?1sWxzdrWf+le9CZSaDkbyNZBSoeepjNvQGA5DUh99SzIWKlJ+JWxZmVgulXb?=
 =?us-ascii?Q?0omQNapbi4D35kGnPfOvm4w7N+fjIOXhd0mIOfsPrGk2uUlqJl5pBPbLvwFJ?=
 =?us-ascii?Q?GGiGZOBHLZ4VUfX9FqiVuwc8VMSp0G7DvJxpomKbxEQoSgsWt9D8EJQEvucH?=
 =?us-ascii?Q?/1Do9/d/EmAGzNZoWTGhN9Z+Xph3K4zkI2BOCZEb2Co0G6bAGnUkeWTOBR3x?=
 =?us-ascii?Q?5lYWZ9GnmjBSLhBcfETb8tYFkXgirAC/02zfEGQ7MxfHIPdCXuUlbdk7aPaD?=
 =?us-ascii?Q?mq8Ko3UPcZBw/VuGvLqlvP5UTGdD4HmO0bfAxDBCNBxdmwjA6LpIYzn3pStu?=
 =?us-ascii?Q?WHhmsAHbk6j0y25TOZHJ+RMEYMqo38Q3aSSMXjF/onSJLrkepBzllzyUtsHP?=
 =?us-ascii?Q?FMNE2oQ/OBzY5Qe2+gyYIYbzI9ksDMyou1ZclrtiSROG7xb1Qn1kqW29z29C?=
 =?us-ascii?Q?FopkWWi7f6ZEA+pSwoFQUBxy8T0aYy+yUBX+e/m9FSTYaYWhTRUDfC/jKIqC?=
 =?us-ascii?Q?gMiKv3h9DYSgnICIgaFyKjkRAl36kvpdYY7PIxKn+yj7dNgBoRhTdEhezpb3?=
 =?us-ascii?Q?gDZba8LtsKuR5f0E7nBnvG9zsiMzzegVvIIirNn6zuwy+p/2MkTbzyUKCozO?=
 =?us-ascii?Q?7OVgGTsK53hFnKSesf3LdR/8JCkLROnq8B0TwaKrqzpmJ5LTOSyeetJ3jAam?=
 =?us-ascii?Q?HIBbJRcm+7vmAPn4hpD9tpkEvWOEC+l5NhMM5VQnaF6NtNVCqqKPvNw8zhp4?=
 =?us-ascii?Q?zwIuJi2+h7MMJGQixwYG4vnVVu0oIa6DZwqhl4LRFM8+4tVIFfh9qf6ZCgTc?=
 =?us-ascii?Q?+Ft8qZuH+wTxFjggriUEgdwjDTBMobTW/si1ttpfQzffCkY1/+IEwLc44RYT?=
 =?us-ascii?Q?tHaWWeiw7ym6RCiNh4MtRDDDbCRn5NZmk1WYgHznciNzI0ptfWvf3Krgrgyg?=
 =?us-ascii?Q?xDJENLOLt88qUcAv3vInP+VXyztBCoAmrfMQSuZvZLJiSwQ9w+0nqQfnwOCe?=
 =?us-ascii?Q?AtT/tPrOwJPx0rzAC57rm8vgvx4geNPgmnNHiyhGPiIgbDTJBYW6PVVYAIkY?=
 =?us-ascii?Q?grf3LyiyXkmwD8Y8TkMZMx+nY0IiaFXRZTHFaP8ADS/vlw4Xq4p55hKBQ0TG?=
 =?us-ascii?Q?P90TsckMdUenbVUsyZbv+mF1XkiqNqjBNGNtj0WZz7CIUxsz7uiB9VaFjwTK?=
 =?us-ascii?Q?baA1vMsVSd/IoHNmOAxtsU5wudGDsnfwT36O3gt3cpBSbiIE5xyhExvZ2d7T?=
 =?us-ascii?Q?aoXL7iZV8XTkf9x10YhEC2s0hFP3gXcyFfSXd/l6eIpc5T0+i8s3ef2+6uEi?=
 =?us-ascii?Q?XJSMN8eR24o8rN8q4S8I17U3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9415a7e2-c6bb-478c-3344-08d90608ba2b
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 03:34:40.6871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f3cW2fmHJpsmS1VGZl6unyaAMeg2lS2Bp3l7UQoZSgsPfsIyOh4PTvulaCunSSQsf4DQCJByr4DWrR+APeY7tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5079
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

There is a typo in binding doc that the name of compatible string of
scu clock should be "fsl,xxx-clk" rather than "fsl,xxx-clock".
In reality, both example and dts using "fsl,xxx-clk", so fixing the doc
is enough.

Cc: devicetree@vger.kernel.org
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
index 395359dc94fd..3adf3f6f2beb 100644
--- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
+++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
@@ -86,8 +86,8 @@ This binding uses the common clock binding[1].
 
 Required properties:
 - compatible:		Should be one of:
-			  "fsl,imx8qm-clock"
-			  "fsl,imx8qxp-clock"
+			  "fsl,imx8qm-clk"
+			  "fsl,imx8qxp-clk"
 			followed by "fsl,scu-clk"
 - #clock-cells:		Should be either
 			2: Contains the Resource and Clock ID value.
-- 
2.25.1

