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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63F8DC43460
	for <linux-clk@archiver.kernel.org>; Fri, 23 Apr 2021 03:34:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 452646128D
	for <linux-clk@archiver.kernel.org>; Fri, 23 Apr 2021 03:34:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236141AbhDWDfW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Apr 2021 23:35:22 -0400
Received: from mail-eopbgr140054.outbound.protection.outlook.com ([40.107.14.54]:62689
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231261AbhDWDfW (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 22 Apr 2021 23:35:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iDkMvoTVSwvK6kdTtEPhtH27CrZGlR4rS2SxnvJhvyguGnRUFr5lUBiMLwOkCX6Oy9oiplRDPSVH725fuHNU7DMJFNA0Oc/cnDg+r3P3lJf8ej3gdZC5ESgJt99sICzfrbz2HSM7VtK4pFi0MoC8gTNrgf7G3Hnu4668Alcg8phzSjPTWYD9Z+D3zeUzrm6PLVmfwvX9I3YaL3Ay3+Td1Wxv4OSE40knu1zRsu0BL3tWekXUfwtVbRxIouG4p9lNhEKjAOZcczFCJD8uQTJSzfJ0mir8pbWxlpmCSkjxPpluAZyjt3DQewKp0Gb9SVatPzA9GngGja9rWnBcnrYjRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gYg0RiNQRkmwCazlZ43jXQfbmNqrDswceCa3c5gu1xQ=;
 b=SYB8U/y6299OgNW3egx1Y/4o7RT/aizkSkUNgoUuwZ8eUIESZrEf6qRuMcB0zuI3VCJH2IfVTOxrqUwI1qsjSY9GjUn9+J+Cu1sk3mc3OhqoIkAl5O8SRASajSZ8yPD6VpH4ah3BJ3Bwp3j0pjBYrC1jDLqMGQmjh/b1ZuWC3dhYoOy6J6ucT5BR2jp6DcLu0FJ9disQq1MbQQmQBwZXGgUNiiQF0i79jWXAGUUGgSnE8cf3jNRWlFSkTgcr8stvahXrJsNmbJV7HBrRDLee7JZdrPHayDt1lOWKZoE8dHNuYP97FJF5ftBirdQdOOTQLpXSbLu3VVewBEZgKu1v4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gYg0RiNQRkmwCazlZ43jXQfbmNqrDswceCa3c5gu1xQ=;
 b=GIVvwmezyvS9s2K8hzvPkPSpvDAOqcaQmE0tAxQVKvSqCymyaZ70XLQMpmGVTUItyzhFGAT5oE/7Tqe98/1gpzfd4xI6dIooy6xrVLGiSuHx5xh9/2NiASf7RYcFifIChmvEHzQxqLhU4iqaeDdnrwG6FREvQa4CDHDyeehbNzA=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB5079.eurprd04.prod.outlook.com (2603:10a6:20b:4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Fri, 23 Apr
 2021 03:34:44 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::b10a:ad0:a6f5:db9b]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::b10a:ad0:a6f5:db9b%2]) with mapi id 15.20.4065.023; Fri, 23 Apr 2021
 03:34:44 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     dongas86@gmail.com, kernel@pengutronix.de, shawnguo@kernel.org,
        linux-imx@nxp.com, abel.vesa@nxp.com, sboyd@kernel.org,
        Dong Aisheng <aisheng.dong@nxp.com>, devicetree@vger.kernel.org
Subject: [PATCH 2/6] dt-bindings: arm: imx: scu: drop deprecated legacy clock binding
Date:   Fri, 23 Apr 2021 11:33:30 +0800
Message-Id: <20210423033334.3317992-2-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210423033334.3317992-1-aisheng.dong@nxp.com>
References: <20210423033334.3317992-1-aisheng.dong@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2P15301CA0017.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::27) To AM6PR04MB4966.eurprd04.prod.outlook.com
 (2603:10a6:20b:2::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2P15301CA0017.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.10 via Frontend Transport; Fri, 23 Apr 2021 03:34:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1cd393a-be29-48db-40f5-08d90608bc41
X-MS-TrafficTypeDiagnostic: AM6PR04MB5079:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB5079AF616FA444EFE16243BF80459@AM6PR04MB5079.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tgDxnGF4dU1CyVbYTkFtT2A4qQaUwR2ktR8axGiwUmxm4GgY2+WABIaPCn1XmXUTe/lsPL/AMPrh0M2MOM7HjvQ6UXMhis7eHH0TqCP9xl4/KPDp0iMXm3Pq2x1HOOIC3vOBChkzqFwa5vP3RE7iF9TnHKnYEpiDcds789t87cOGHEnCtni4ptNmY2o0iwj5OeUrgIfHgdNxkGF2foGcKiJDscCqzoccJcNqK0mDHKs7mbbao8Kh7O7OC/6+R4051WGvQC4BD8YmOHTSZE1ksbyEpv68RunO/wozdEWP9dTfZ4Mz4iSr6s8O1BkwwRpiXNjizLLfdb2i0xQza7Cu5wYFZm2h2hZiz5dm2tvmb95Y9nnLkMUlHE3UPEIDa0pEHP5aFNXB4fYOR+TU8dQKei5bF7PEREBR5Gd4na9dqDo4Vos+O7Efohhec2M/Wg5FM/QdIiKyiFWEN5/YE/kW5nPnJfx/htRKFDBCFX9VqPT5IdcRqUlhLR3Jdv1Zm7lYJssRzQGchGEBk/o67qdc/TVetLoazURjzc91ptaQD2tlf3g9dOggF7DWZLr5xeXPfaT9FoRCUfAMhcaMlEYNDlEJ0/6xJpNBmqm2btz+1Zl9RAgsI5Pc69JbDcX+ZS7wGaSIeuH9i9PN3BZNaHpc7DWcIxbu6wAIYAobnleFejXO2jQoyhMGhMjeGk2oVvhS
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(366004)(376002)(39860400002)(16526019)(2906002)(8936002)(6512007)(316002)(38350700002)(8676002)(52116002)(38100700002)(4326008)(66556008)(26005)(86362001)(66946007)(478600001)(36756003)(1076003)(2616005)(956004)(6666004)(5660300002)(6486002)(6506007)(186003)(66476007)(83380400001)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?lEjxeRzhK32JSAQVGV9qPjIUf2ePpL7irKoiZOjq5FC7awRzYYs3OxtjEff3?=
 =?us-ascii?Q?iv7uIx09F9GDRS+UeG2f96Fy2KBC0sCFPvVjcSUk9A4qvFjAoq/NnJCCcvw/?=
 =?us-ascii?Q?oA9P3Bho+HBghMRY7X2AKmpdsHuZI4yfi6zAQC7ll5ob+lADYvE0vKtU1ckn?=
 =?us-ascii?Q?wEnLuwmyrAGKpHXFjLMHY9qDxgbZsrAa32MJN0Ud94wj3peVBtde7gAHzf1A?=
 =?us-ascii?Q?3tY6dfnYcFNUjRSwbLOUIrIlL9d6vBzGs/sEQLGH54cdE1gP0Tssb8bjYtxK?=
 =?us-ascii?Q?dm6/sNy+q/Cz1SbKqtxJ/+KUd3aFM8MkyTpN/uXE0k9Uu1F5sDV5Vb9GUD8Y?=
 =?us-ascii?Q?zzw+CrYqH3CbxWyqfRPKhKZIQrN7c87iVvAgKPYIijRRfl7SwXUQylMNHQ+a?=
 =?us-ascii?Q?nyfyJCyOg2L8UEvK0KDPZl5JDUg9Vv+QvXHGaKHGyzil0D5E3d7trLPeD1oD?=
 =?us-ascii?Q?7XpXAG+s05FpGuWwgfAss6kuz2e4sDJoqUX/gnMRAAsLfEDjnW0T6dOwP+39?=
 =?us-ascii?Q?qUtb2DYqBk0IeXxon6tcSYNWDjjjNR65nAULNOmjTOe0REntrTdSlhefZWwa?=
 =?us-ascii?Q?rot3A2TVzYuvq2CHcvQdfrojcF2cTTJZOl5KbNSSWRWfKDkurcaEDnKFs4mS?=
 =?us-ascii?Q?BMCBHIqFT7RKjuKTFJWp//pLOF6adLITbLYJU8xYwu17M8+9PpXrQLg6e+rL?=
 =?us-ascii?Q?kY2wGBISaTCHx4yoox7HfxWtr7/6YsAlh8easHFUb9Y6UlCyVRu48AtM8Kuv?=
 =?us-ascii?Q?0T8uUic+1cdQ5jc2QX7fZjYz6RPoreWQ8Su/PeB02kDbXnG+YFNVo4CuahwR?=
 =?us-ascii?Q?zCX4+Vfv43ZvZoJxQVVr+Q5Qi0V2QPWbu7/Xrho+x46QDVxlTASVzp+D9hXw?=
 =?us-ascii?Q?PIuK2sOwT92fC+JnC4UtLs5/Oa4tTD7lvh7S5i4AWBfkJiga5PRJ06uW84VN?=
 =?us-ascii?Q?6GVB96l1jW076Rs65hDfgN2aOc6gwxxYN+ZoXUF8tXUp37XbuvSHj6gEx4Pd?=
 =?us-ascii?Q?pPel4sFudSujGid681ydd3C7QQ1YGVVz9xMDhFqIHbtt7v9q1NDOXnqoqxa5?=
 =?us-ascii?Q?sbIgTIzlwyb3rZK/WBiTa8kSQ+g7pMFrVkaYQNZ1z95PHgFpgSqvGM9WPJPS?=
 =?us-ascii?Q?YT3hFOD1In/Y2aAzoCzzxZ4tbPtt+vDohvFqGu6+IgrOM2ioINHIGSkotl4x?=
 =?us-ascii?Q?ZO7p8reuhzjw7UvXj+5M5XtoWi9v7y8at4qm/tPvNONK2V2lllK7WjIY3+1x?=
 =?us-ascii?Q?AVpYEOD6OQk9hQ8CtkUqDNeBTbnL6UH1cZtVszQ781DoAH3LWgV9nT/Lx4Dx?=
 =?us-ascii?Q?2n2C7s7vpPV2docAfiZUuf7m?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1cd393a-be29-48db-40f5-08d90608bc41
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 03:34:44.0842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yVe+3bT5XjoxcEiZ97mNcjZsQ2i2TgyEvDwoQIJGEYrQ+DgC3Qudl/1OQHrxfkylE7PuYCTFnzNU6fkM8b3Ndg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5079
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The legacy clock binding are not maintained anymore. It has only
a very preliminary supported clocks during initial upstream and
meaningless for users. So drop it from binding doc now.

Cc: devicetree@vger.kernel.org
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
index 3adf3f6f2beb..fd0061712443 100644
--- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
+++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
@@ -89,10 +89,8 @@ Required properties:
 			  "fsl,imx8qm-clk"
 			  "fsl,imx8qxp-clk"
 			followed by "fsl,scu-clk"
-- #clock-cells:		Should be either
-			2: Contains the Resource and Clock ID value.
-			or
-			1: Contains the Clock ID value. (DEPRECATED)
+- #clock-cells:		Should be 2.
+			Contains the Resource and Clock ID value.
 - clocks:		List of clock specifiers, must contain an entry for
 			each required entry in clock-names
 - clock-names:		Should include entries "xtal_32KHz", "xtal_24MHz"
-- 
2.25.1

