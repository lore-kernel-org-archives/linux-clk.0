Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92160C71155
	for <linux-clk@archiver.kernel.org>; Mon, 30 Nov 2020 09:04:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 359BB2076E
	for <linux-clk@archiver.kernel.org>; Mon, 30 Nov 2020 09:04:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="SvyPmWEB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727451AbgK3JEe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 30 Nov 2020 04:04:34 -0500
Received: from mail-eopbgr80043.outbound.protection.outlook.com ([40.107.8.43]:26284
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726629AbgK3JEa (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 30 Nov 2020 04:04:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WeNXsJAgsmiYcvyyQqxy50PvUYiIegEw+q6Bv3yZsCZtsAhROG7QLV3fv885RET3eIF2DmWbB7rfVz/b2z5gr7DUcx2gmfX3+wJWWo0373GgZSdxahfdd7te8MyB6HnPXbQufUnSQxhYPJZZFENWIxZiV4H79M9hWMo1blS/zLmrZyCGm6QYNWf27hNSzBF5rB38icFvW/+Ti9QZ5j1ZP5M/c0wLH1JkhT85rTzK82iw6Tzw+WJG3ZXeJ0kU9eKByq5KaRfLVo/LWgKoeLZny2fF4RKg+tBzSp5AMzTll0pMIfSkW3cyUjWRhPrZKlTgHhbIrYF3bMOOJcZnJgH9Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+aZGR757hwkojv/nQED3CcyVWQ41DBUygRtRXTYamCU=;
 b=GyYVcZNihUot4TY1FwcSvpQTBNuzNJl61WTUZn34CjtmxOPyFPJxMFpNJBXRsAmcX4Pza3TVUytIx2R8z7/XySYd2GgZLxmfBu/+n7Pbq3p/mWSRYxi5Kgx0kqEdl3ohrkATkeSfmwjqU88QnNdl1G00g5bB69Cbb1/IyGBJ3LN+FsYtRdwm1grjnwlxu/WzoC1vE8rsw9fgto5cx1P2kc+1Dxka5VoyADm7D16ujQo6PLPmG4+2q/qjlPA5FTNKJpHuV2cs7AU4RWTZWTco/hd2fpk7KjzYTJSk4O5I2Urjgnmj9fc0gXs1aqQjbmemuNX8Q7XADh/M/zbit6Y3bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+aZGR757hwkojv/nQED3CcyVWQ41DBUygRtRXTYamCU=;
 b=SvyPmWEBcJt/BhxnC6Rk4glH/8A/38mVE7LGpLzzEgV/3AJidj9cZLGnoNn5SijJ+aoBojyee/RBSVHv/hrJWD9K/kBBk070ZUAtANHCeOEuy4UqDTjsNJhso3VPfdWhe8QwxPDhmAg97BOrQBGextIMDKJo/xCiZEHXZVFGIYs=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR0402MB3784.eurprd04.prod.outlook.com (2603:10a6:209:23::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Mon, 30 Nov
 2020 09:03:41 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3cfc:a92e:75ad:ce4a]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3cfc:a92e:75ad:ce4a%3]) with mapi id 15.20.3611.031; Mon, 30 Nov 2020
 09:03:41 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        sudipm.mukherjee@gmail.com, sboyd@kernel.org, shawnguo@kernel.org,
        dongas86@gmail.com, Dong Aisheng <aisheng.dong@nxp.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH v2 1/1] clk: imx: scu: fix MXC_CLK_SCU module build break
Date:   Mon, 30 Nov 2020 16:46:24 +0800
Message-Id: <20201130084624.21113-1-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.23.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0090.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::16) To AM6PR04MB4966.eurprd04.prod.outlook.com
 (2603:10a6:20b:2::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29396-OptiPlex-7040.ap.freescale.net (119.31.174.66) by SG2PR01CA0090.apcprd01.prod.exchangelabs.com (2603:1096:3:15::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3611.20 via Frontend Transport; Mon, 30 Nov 2020 09:03:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7283589d-027e-4f79-368a-08d8950ed536
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3784:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR0402MB3784C8A5A14B6D22FCA18C4B80F50@AM6PR0402MB3784.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GXLMDVxiOD6bj+vJrpL31j3nsUsMctIlvQG6JWhjwbHRxnErrnHkgrsRXguZ5NMDgV/Ff1T7Z4j2hNzaz+XsubgOo2OfZ55yfDlJGyThCEzgshctKudYeGy9r9Np8/0gde0fU6/wsnfr7auAHphJGn0ycf6Am/RKmy9pVRDCTD5Whq+9XvtOogen4UjxzGHXii0tHZSnWQTOZWCImCL1LM1G9m8p1jts7ZtQww9ZVyQvnf9FkuSqe0fk1z03ryJoYXWo2iJTmiTdsQhvG/sE0lGY2PeMsxdmzmnonsEsdzkzu4D68R3XI87GTxbEuyfhBMvzQqkGsQaQlsRh12J1Tw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(366004)(346002)(136003)(6916009)(6512007)(52116002)(54906003)(316002)(6486002)(83380400001)(186003)(16526019)(1076003)(5660300002)(26005)(6506007)(478600001)(2616005)(36756003)(2906002)(8676002)(66476007)(8936002)(6666004)(4326008)(66946007)(66556008)(86362001)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?hCXAxFpxtDSp4dSKAIqeNjh11IJ5OFBE1x7dA6qbYpTqOGwL0MGj8bIh5d7/?=
 =?us-ascii?Q?jUeZTeq2idKa2SMPD7ViDNSlFeS3vF4sGtDkelNAauAgDNqJf0+Uf/FQDyYP?=
 =?us-ascii?Q?ELXYNFkM2k0cp2QjWLt3NpL1u7YS2pdsED99qW+IK5NfbJ7mujhIQLn/aAwV?=
 =?us-ascii?Q?sNkKrWZop2F+wBtUWdSZ1FGOwwPWiVYTaAnAqhQo78j8L/vqAZP34JbCXPfB?=
 =?us-ascii?Q?NgyuT5wKJZRBP50dq2FTA0DBhn6BmcS4Q0/BLTYqtpJAicV/bwhqNypeqQ/w?=
 =?us-ascii?Q?NDUmVJB2+bN26SyKHzJK0HODCWKR1ci0zmX9BFv9R4wvzU9UPt0d0DhnCT5A?=
 =?us-ascii?Q?yi94kZa+na98KPVhNqebCcMcVkhe8/K6V6GYkl8m5BS0D0w1PTocqcICL+Vy?=
 =?us-ascii?Q?p3RPRSYwcHzQMF/wnf3r4ss9TnJJoKkaldpM4eYyfQ9rNomdLfFzf04GjDcc?=
 =?us-ascii?Q?BehvapliKSflCR28pPrIWsYQyx/A9KH2t/UJlV9Gf17VLe6qzTV7BDaCrfex?=
 =?us-ascii?Q?b6SB8kSFWgJlXozaXrIu8aNRM6ImVGYq8FG/Cwf2QqUq5qutgDxCbL/Kt3Er?=
 =?us-ascii?Q?JVM/TBrgcY1j8TOUToNjUcdjZX3xb42JxjlEiyMgKtW2CE9Ik1qeb6FDxJqf?=
 =?us-ascii?Q?im394PMnSpsYdk5SZweP3hehXADGJcTwb7V3noHhnBYLPMJmh4zJY0dnZZa/?=
 =?us-ascii?Q?Y1VWSpgVYrGuhcJ+XR874B4C6n2tQ3Jc6zf28b8EF4+tbNvMVUzwBRavyarh?=
 =?us-ascii?Q?6ducrYIMNVtiVT626+98qkFkFK2DeBgquLILpIyyEQlEnYZrX7VRlm4eI3pr?=
 =?us-ascii?Q?PWEGVIkoEmEHv/a6xDslN8J1q5HkbHMHkjZZyJqYz6sWu+5aNeV9nghvS21/?=
 =?us-ascii?Q?liCoahyNJU5DWESaeda/RR+3zAZJJPcz0PMi0XkVoC357w2s0ZTqdq20KxDD?=
 =?us-ascii?Q?Mze7nJa3LoNNJ0kTfbhjgrQWriyi1xB/E09K8yvlPNW9629OX2bk9UAF9U3L?=
 =?us-ascii?Q?IDVq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7283589d-027e-4f79-368a-08d8950ed536
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 09:03:41.5244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lMx90eU3srZdGYQ2x90FnF7jO6BVMd783ewS9N2ow3zKOUhV0XS4lkyFAvrB1JpXdrRRR9qFSO6bEBewulZZiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3784
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This issue can be reproduced by CONFIG_IMX_MBOX=m and CONFIG_MXC_CLK_SCU=m.
It's caused by current Makefile writing can't support build clk-scu.o and
clk-imx8qxp.o independently. (e.g. MXC_CLK_SCU = y while CLK_IMX8QXP = n)

"obj-$(CONFIG_MXC_CLK_SCU) += clk-imx-scu.o clk-imx-lpcg-scu.o
clk-imx-scu-$(CONFIG_CLK_IMX8QXP) += clk-scu.o clk-imx8qxp.o"

Only enable MXC_CLK_SCU while CLK_IMX8QXP not will cause unable to locate
the input files during linking.

Error log:
  LD [M]  drivers/clk/imx/clk-imx-scu.o
arm-poky-linux-gnueabi-ld: no input files
../scripts/Makefile.build:434: recipe for target 'drivers/clk/imx/clk-imx-scu.o' failed
make[4]: *** [drivers/clk/imx/clk-imx-scu.o] Error 1

This patch makes MXC_CLK_SCU to be invisible to users and can only be
selected by CLK_IMX8QXP option to ensure they're built together.

And COMPILE_TEST on an option that isn't selectable is meaningless.
We can remove it from MXC_CLK_SCU because CLK_IMX8QXP selecting MXC_CLK_SCU
already has COMPILE_TEST.

Fixes: e0d0d4d86c766 ("clk: imx8qxp: Support building i.MX8QXP clock driver as module")
Acked-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v1->v2:
 * remove COMPILE_TEST
---
 drivers/clk/imx/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/Kconfig b/drivers/clk/imx/Kconfig
index 3b393cb07295..3061896503f3 100644
--- a/drivers/clk/imx/Kconfig
+++ b/drivers/clk/imx/Kconfig
@@ -5,8 +5,8 @@ config MXC_CLK
 	depends on ARCH_MXC || COMPILE_TEST
 
 config MXC_CLK_SCU
-	tristate "IMX SCU clock"
-	depends on ARCH_MXC || COMPILE_TEST
+	tristate
+	depends on ARCH_MXC
 	depends on IMX_SCU && HAVE_ARM_SMCCC
 
 config CLK_IMX1
-- 
2.23.0

