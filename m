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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8056DC433F5
	for <linux-clk@archiver.kernel.org>; Fri, 17 Sep 2021 06:05:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5CE12611C0
	for <linux-clk@archiver.kernel.org>; Fri, 17 Sep 2021 06:05:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243225AbhIQGGz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Sep 2021 02:06:55 -0400
Received: from mail-vi1eur05on2051.outbound.protection.outlook.com ([40.107.21.51]:33376
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232726AbhIQGGy (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 17 Sep 2021 02:06:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Toiq1gWPhLgdqdENCIqxmQUVpbxedsYaAd5Nr/40t5T8tIYIWS57BBVju3rNrh0dV4xCZIo2nHLqkTN384oBwdk4WOlNRLfQDtPbqP+3abiPsxSaznm1La2mDwzlAyEN1eMFz79SkdCSQCCHsV2oyliffEwj6Za4z4oWcy03So3IMJAjsDzeMOl7+OJ4MjaEcR8XehmYeTG3IMf+/V4AiCNPhJwhMiFvPhh8IGZq6ZWuliBkf69YqGWRAFdhbkPsmsUDAWSn8Hwg6P3Gl8RRfFgt/zy9nkIObd68rmBkfsvirKC+I/m4Kwjk+eBt59NzPboixV4cR2KeJyDUE4ocjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=CZ/5rDXfDKqo4nIUE1ytYig0LzjcJmc5tyN5Dmo0wjE=;
 b=TIAy/hvwmV7wIbY7AOeybt6zP3jOZo5pergxkOjDW6UcW0y2lPejaDAf0/36bQdm75r5ObmvUm5lf841CvDdJ3vP3HBkNmxYZ13CKiJmaXmoVLmO95ZeV+4SD/S+zLNZAk3auTsXxZZRccT6redyCV61Mk+e96qIlu9/2+yIBLKSKBwGBCEWPUwdsMhKhLNun3nge7dM9TV++0SiYCRPMq7PSu2Mtcpdf4Yl2del+OmWkW3eSynb78ZvldLGpIRl6kHXcNuyHnTK0uX/Z2rN24PxE7X2IijxVyeMrqzzKDu3HEnGQScn4FTxbxjYQ0cyu6+Ehyj45DIlAyilISy+cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CZ/5rDXfDKqo4nIUE1ytYig0LzjcJmc5tyN5Dmo0wjE=;
 b=aqQuIsbzsgISPvkRIfyPpJps+M4e652hroiGslztkA5ANFv2mS+2o50aIQSqx6SmjnVWUSzRtemN0/3m+hj5Pd5neOQqzM0SwW0FbG/WLbBVbLzNNqRhKYKorVO0QGHQ3XMTAa69gilNID5fXtAl+oUfqwCAhsfmMf6eoRhuGS0=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB7928.eurprd04.prod.outlook.com (2603:10a6:20b:2af::11)
 by AM6PR04MB4486.eurprd04.prod.outlook.com (2603:10a6:20b:21::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Fri, 17 Sep
 2021 06:05:31 +0000
Received: from AS8PR04MB7928.eurprd04.prod.outlook.com
 ([fe80::2989:ee3d:974d:658]) by AS8PR04MB7928.eurprd04.prod.outlook.com
 ([fe80::2989:ee3d:974d:658%8]) with mapi id 15.20.4523.017; Fri, 17 Sep 2021
 06:05:31 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     abel.vesa@nxp.com, sfr@canb.auug.org.au, shawnguo@kernel.org,
        sboyd@kernel.org, s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: imx: Fix the build break when clk-imx8ulp build as module
Date:   Fri, 17 Sep 2021 14:16:29 +0800
Message-Id: <20210917061629.3798360-1-ping.bai@nxp.com>
X-Mailer: git-send-email 2.26.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0001.APCP153.PROD.OUTLOOK.COM (2603:1096::11) To
 AS8PR04MB7928.eurprd04.prod.outlook.com (2603:10a6:20b:2af::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by SG2P153CA0001.APCP153.PROD.OUTLOOK.COM (2603:1096::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.0 via Frontend Transport; Fri, 17 Sep 2021 06:05:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7fdbcb9-5c23-4f1a-5610-08d979a12760
X-MS-TrafficTypeDiagnostic: AM6PR04MB4486:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB4486D563D34DB252082DA73387DD9@AM6PR04MB4486.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zKFaruJySeG5bLBcK93bWQGRPpbUqY8ZCkJfgarUqf9mofL0RhINZPg1J72gGHSJ/x/NR/YIgJx46a5+U80Jtl8qSgquXplOhGCRU3/UaJXFTeLrC6a87pwQGt2H1tf/2a4vRbNG3AEZZkCShumnuAtV7zc6+DjKM4NeGca3vFlFlaCzXrq8aFtd0AMRxRMC6SWUFYfaW9UpKKla/59JiWJngs7PXc/8Ty5kFFQUcQMEf6cRTXvXa7pVjAuzyJRyBf0QqUE44w1jEq4eDVYwvYvmleHbk6mjBX/y8ZIHqFXylMXxY0Kj+ScKCvDZquHkeXpIwNvuncvR8a5HHb8/3jIhzuXv2FdN+zsBcJkqo1cBz66W9eJmQqEPN6GNipAkdtWJq+I/uVmMTbli/TeCYItq9fZmyjkl7pJMlAsHpBdV6v5TI99/taVx/dtBhrLPrIBrSu9hy0yjMTBmcbpU5xGh6qqdIOWvPPz9nfXxuaHtiuAF8MO0ky5lghDp6t/vlwfs6K0OrLAtZREqRjvkj6stpFZ7+8bAq/kNfl377GMjAlYOa3Y+Qxby49b08YYnrbsczzv71JZ9nGYYQMWRTZtecT3sh36K09qRMA2r/qM9UQ7cYJCGwx3bOeyTU6tlqQhHMh8HnC+1uWlZc2FfGqPv3GD83XPrUTWxazqVX1RtAqOvaKVWr4C47eZO27x7+9t1tH6+d/u/2znPPNS0GQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB7928.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39860400002)(346002)(376002)(366004)(6486002)(66476007)(66946007)(66556008)(6506007)(5660300002)(38350700002)(52116002)(36756003)(956004)(1076003)(186003)(2616005)(86362001)(26005)(8936002)(478600001)(6512007)(4326008)(2906002)(316002)(8676002)(83380400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EjAiCDKTqYZtsxnwwPfbRfonlIOo+ahj6xMC0EZLzjzsVL5cSn0TV4U7+9sB?=
 =?us-ascii?Q?j4C1kdnWuLc+p6kFRQfNXU4QrmEh5uNqvGLw77dIQG/UcGvG5fe0kpJZwIWl?=
 =?us-ascii?Q?Idooem7gGHhyNA4PLjZn1mNEGt6tvXNMO3I+ntdROsNeXjPEnTvWkKd1VEQE?=
 =?us-ascii?Q?3dwww+euLtE3Ektl8zj/TMOllhmg4l96tPeViy6drRMOa9miNSlnrMrARyiH?=
 =?us-ascii?Q?L28iQ4bcLO9oCvOvyhg+3Isd8ccqY5kBdRM/5DyhsascNXBC6XcenaDwTIyg?=
 =?us-ascii?Q?9mjY8yLCSj0gFGAGEJnvj0VGDlzTeoQnKUt1KRQ4PD4Y9lSxsj3NKhQwzq4X?=
 =?us-ascii?Q?iqK3LLEiKR17wnnVQr2TMGp7dz7b8IVI8y73cLmtq7tRthllpD7f+zPo6Jyx?=
 =?us-ascii?Q?gn8qAlPY9kJ348ngBNVdGJsVxjS6SO4XlFSxTCXwZWSt//BHQ8Y76shfUE2z?=
 =?us-ascii?Q?nJ3LeUULba1tvEa9sk/eobXLWbPe5VGti0PkYlJvP4KguQetG74j+j5IXn7p?=
 =?us-ascii?Q?UEkrrifiwm4eZgcS/xTo5VkowAhKEEKn/gHmbwzLR7Ea4kk85dEfsg6L7Fxo?=
 =?us-ascii?Q?x4spJJ54OlfyObAZorWbWUXQnOIdg654VzyW45wJCaAwb8DOQZ92N9QtA2L/?=
 =?us-ascii?Q?Ue01LT/TOhFA1a99VAx9+rYYkN7KfrvhIOFpz4Bm6AFiD58fdjPWq+e++usI?=
 =?us-ascii?Q?qiHBFHqIELq0mF63/NkWf5JBUUVo9Odl6j2FxJ09VbyzrYYwwC2cRRP5MIWD?=
 =?us-ascii?Q?zUfI3WfFjeJdwndg0VLKIf7ser5bV8YUkwT8tH85Xme7ef0cEPhccig/sgPz?=
 =?us-ascii?Q?xNU+FLkvYVeF3AlvA7b+VOyo+zy7/Y/Kq8sIVaBPvuid9ycWkB+Zhs4hEPDF?=
 =?us-ascii?Q?tYl3/Z8OmpzdcuZ5wcSM5C7WnGRvzK6vq2lu5ZFeLiDwPBzkHiIv6ebQNOlr?=
 =?us-ascii?Q?dAFE8UpviEkYauc5XjqOzQX2RaYbtpl7q72ojRlMUDsxzpx8lA7CK8O+xovb?=
 =?us-ascii?Q?xeLDZK+CVxrxeg2tGhir0z9rF+TsAbiwI1zVgdB/Wy2msg4uyHNEE+9kvx9L?=
 =?us-ascii?Q?Y8oJ090YVgByE6zfPbLoguatuwHO3ypiCP4r3Vy0utX/is7cw9QjkYw1atXR?=
 =?us-ascii?Q?ZNCh0oYv7cM5kiAvw+3KSFAVwrFvF3CDkA47IzTSyR6aCExKXkHP/ssEp7Xb?=
 =?us-ascii?Q?HmDpfSTpOsdlQWqUFDh2ThrcnzZe5qOF+IVSbN6WgGWNXewK18k/VUiUB/ph?=
 =?us-ascii?Q?ykK9o7HzwiA6acXylLEKYpIBi4gbSFN8BOYNQzYZlDqX/rF7Kw1xcPCBoI+C?=
 =?us-ascii?Q?FQuFsSTzgiZ3bE1lL5XP9Lnn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7fdbcb9-5c23-4f1a-5610-08d979a12760
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB7928.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 06:05:30.9813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: seqJJnKhKZYzvlNpLe2Z6urrVr0g0UwjATVPP5EabwwpYbrKubU/2E4kFzigJ3L4RlkqN+BzXOLILlA7Ofl+3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4486
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Export the necessary symbols to fix the build break when clk-imx8ulp
build as module

Fixes: 86ce2d393ff7 ("clk: imx: Add clock driver for imx8ulp")
Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 drivers/clk/imx/clk-composite-7ulp.c | 1 +
 drivers/clk/imx/clk-pfdv2.c          | 1 +
 drivers/clk/imx/clk-pllv4.c          | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/clk/imx/clk-composite-7ulp.c b/drivers/clk/imx/clk-composite-7ulp.c
index 89106de16a3f..4eedd45dbaa8 100644
--- a/drivers/clk/imx/clk-composite-7ulp.c
+++ b/drivers/clk/imx/clk-composite-7ulp.c
@@ -166,3 +166,4 @@ struct clk_hw *imx8ulp_clk_hw_composite(const char *name, const char * const *pa
 	return imx_ulp_clk_hw_composite(name, parent_names, num_parents, mux_present, rate_present,
 					gate_present, reg, has_swrst);
 }
+EXPORT_SYMBOL_GPL(imx8ulp_clk_hw_composite);
diff --git a/drivers/clk/imx/clk-pfdv2.c b/drivers/clk/imx/clk-pfdv2.c
index 42505669cdfb..6ca53a960eb7 100644
--- a/drivers/clk/imx/clk-pfdv2.c
+++ b/drivers/clk/imx/clk-pfdv2.c
@@ -239,3 +239,4 @@ struct clk_hw *imx_clk_hw_pfdv2(enum imx_pfdv2_type type, const char *name,
 
 	return hw;
 }
+EXPORT_SYMBOL_GPL(imx_clk_hw_pfdv2);
diff --git a/drivers/clk/imx/clk-pllv4.c b/drivers/clk/imx/clk-pllv4.c
index 3c750ccbee25..6e7e34571fc8 100644
--- a/drivers/clk/imx/clk-pllv4.c
+++ b/drivers/clk/imx/clk-pllv4.c
@@ -254,3 +254,4 @@ struct clk_hw *imx_clk_hw_pllv4(enum imx_pllv4_type type, const char *name,
 
 	return hw;
 }
+EXPORT_SYMBOL_GPL(imx_clk_hw_pllv4);
-- 
2.26.2

