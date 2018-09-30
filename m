Return-Path: <SRS0=xqQ/=MM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4C42C43143
	for <linux-clk@archiver.kernel.org>; Sun, 30 Sep 2018 01:12:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7D355206B8
	for <linux-clk@archiver.kernel.org>; Sun, 30 Sep 2018 01:12:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="ptIRqaMK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D355206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbeI3Hmo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 30 Sep 2018 03:42:44 -0400
Received: from mail-eopbgr10057.outbound.protection.outlook.com ([40.107.1.57]:48520
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726009AbeI3Hmo (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 30 Sep 2018 03:42:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LOjxorsrLLtppRqxswIFvWl22iPUpuiGlye0Yf4Ksco=;
 b=ptIRqaMKg39WPAqK0XTHqPoNHrpPFwIByrBkdZ01M+67mwjuocRURMVKm5MmBKeG4/VtGeftoZELmBHyvEXODG+EJj56vDyhYbsUspd0KWXK2uGxGVA8/XPYkZakmIgN+KcA6HXeFcv2DqePU7IG89GnY/RrbVZVx5T+nma3/lk=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
Received: from shlinux2.ap.freescale.net (119.31.174.66) by
 VI1PR04MB4221.eurprd04.prod.outlook.com (2603:10a6:803:3e::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1185.22; Sun, 30 Sep 2018 01:11:41 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH V3 09/11] clk: imx: add common imx_clk_hw_fixed functions
Date:   Sun, 30 Sep 2018 08:56:24 +0800
Message-Id: <1538268986-24890-10-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1538268986-24890-1-git-send-email-aisheng.dong@nxp.com>
References: <1538268986-24890-1-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK0PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::15) To VI1PR04MB4221.eurprd04.prod.outlook.com
 (2603:10a6:803:3e::20)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 982549b6-3df9-42dc-0f8e-08d62671afc8
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:VI1PR04MB4221;
X-Microsoft-Exchange-Diagnostics: 1;VI1PR04MB4221;3:GrMryx51tXS696JYFCZ6PlOTDvrxd1OWZ+yLLVPFc+zmdYn9gsjjXWT+xvwP/5VaqxU08BW60Rd2i7lMbqCGngwnqFkDnAfuEq7/jFsE98sYW0NF4PBm4nWWsCA83m77r0f6J0GE3I16jPiGwSxBAnPD5eaGqgp0Uchytx+zuTT3HoBbkoM80zfMk+dXFDI1sB6OZSXiLm2CexWZkgzQsCQlw0dMgCx5985N0HlBzPXR4wcmvKJWF8hHqTTwVhX+;25:2NBOp6z2sWU15dFiFzxPfxduYJ1XiuiFbxIEo8bhvzcMcflQIi/W5sDdUNw79yi9KSWlsX4rKz1kUnF7qytoARcD2j7Pneotf+FHBSElSQtcPngaqPRxqcJkkFFepfu8FxaZGh26k4Z7p0XmgiBD0LaMve08xU3dO6QGCdnx1CBWumT/LwhqXhjElyF7gey4q92K9/ohaKsTaZILCa1x5mzvvZy2DAjGLOmDCEzk0KCuWx1x/x+goBL/eEhdOK222mpypY/gJQNH9NUHmmLf/ONZtY3rUdHnYbdgzm8o1ZlSrro2tsoMKYRa208hMq9OBWfW4zQcCRaW8qSfzmsLGw==;31:xRtYuVmZFcKCTEr8B8YtZE8sUaoCwQZa36hSmSM5qnNby9k7OwWlEjF9LaTfjIyH43nMCs7gzmLVdL/dN6mSvLMDSFlbdKSo+cZ0xYPUu9o7Iujmnd/nxoK5PjdnlgQmGk58posYp5zfbaKHC8DoYoCGcAxjHRrm/v6deGrDHQIBpQ24JsmwBVhRtViaoELn0+havgnfkJXg8RY+y/DuDAW37pQKoHeGgf+hNi5xxYs=
X-MS-TrafficTypeDiagnostic: VI1PR04MB4221:
X-Microsoft-Exchange-Diagnostics: 1;VI1PR04MB4221;20:tBf38ziMoQRCUWM8zugDz69pWTqihcJmnK+JyaSgychIMplSDp3/Dl4EHm5tgYjSppLWGjIlaoEu0ICMFt7cgBX/NcvWkp/wEbcgea3id0+L06N2fQO3P1fyQcqJ9XhhiFq8D+ulqPVKU/T514S/UqrYfY+0N0pyQARmBHkecj5cTODfNKIwvxXsT9VnTkjbvcbgReFjj/g/87JTFPUAuHUlArjYSRO89ZpjfFt+pSRgnTHawGc/9HTxZekNo434ghQqTunX3mq6C11nHHjU3fDyW+RV8K/VEuTXfivE+/zjA4zhaCIeEgguskloSh90/wHmqtLQqh32xYIWW0Bpoqh3DEmAppOSG89/aJL1+c8ZGEcqaV4Lris4dwKKd+GgJ06OKwURMfXnb+3OHln/QP+RaiQXTha9mtaWPczyDKB96XXaXBSX4mjsg0DFPux9KBRNcMof8RVEXSISszMtm4kgmdRe6dTPZm6KaHn2VXVWKCGRh/sBt4yyUoqE3r+/;4:iun3eYV4LPC85Q/3ur0Lqe8dXMhaqw5M3AR5gX6pUgbQjJ+6qpiF3zsmokjwnTodVkdPY4/l+GMizxTWQ10IC/3I5XZEZsz5hVOZx8awwc5F3zoLNkl90d0G45Wfa4yx3cQ0Y8hZ9/Gr+fqiFOYLUsPGhy3NXm9kAVxsCcqs2gbHhXsQn9Cu9Hoy0RnzrIInpRWpkyPMVE1escMMANP81EN2S8QOWCXNsKrbuNmvZRsR8TQ7AAqE1gRYzvr/f7kSxQ/CiWFOtWL7vLvKsnYAWGBSEMCZPY7EwXbAIdxrhls7h2iYx/kiGYgXV0N3izCR
X-Microsoft-Antispam-PRVS: <VI1PR04MB4221BF72D33DFF81423D831C80EE0@VI1PR04MB4221.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231355)(944501410)(52105095)(10201501046)(3002001)(93006095)(93001095)(6055026)(149066)(150057)(6041310)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(201708071742011)(7699051);SRVR:VI1PR04MB4221;BCL:0;PCL:0;RULEID:;SRVR:VI1PR04MB4221;
X-Forefront-PRVS: 08118EFC2B
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(39860400002)(346002)(376002)(396003)(136003)(366004)(189003)(199004)(14444005)(6486002)(81166006)(81156014)(66066001)(6512007)(8676002)(52116002)(53936002)(11346002)(446003)(2616005)(956004)(476003)(486006)(6506007)(48376002)(26005)(2906002)(47776003)(386003)(6916009)(478600001)(97736004)(68736007)(50226002)(5660300001)(8936002)(6116002)(50466002)(6666003)(3846002)(76176011)(51416003)(106356001)(25786009)(16586007)(4326008)(34290500001)(186003)(16526019)(2361001)(2351001)(316002)(105586002)(36756003)(305945005)(7736002)(86362001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4221;H:shlinux2.ap.freescale.net;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;VI1PR04MB4221;23:atrOz8KF6DE+wkdVuoIuq05CWKEIVDLapQ4iVV2CW?=
 =?us-ascii?Q?enxcf+T/UqybK6vKi/5kH6s71BbPpimK1MnB90tEUxXmz82IbsBhvwy1ThBz?=
 =?us-ascii?Q?UC9zZDfankX5ijTzsoI7xmZWkFq+pOnB0h7NqXL6RlHQX1ekUJJoGQZy7COv?=
 =?us-ascii?Q?deP7kMN7R2XLwbkH7dlkLp3zFbFTSu54ADERCEc8TlQJaMRIh9MAoQMAryri?=
 =?us-ascii?Q?eP5Y/igyMIJE2qzbRmBiLgmlPQr8+7wPkY1geptV9c+LmavzzRgRrY4bY4iv?=
 =?us-ascii?Q?qCrdH2dzgJVNTPF1wHrXKiFsPXgdDRCo0T3v0iGy9QYgMXYFR89tVXbufHK0?=
 =?us-ascii?Q?cACpvi55xtDkA533v8owmCKupBeHS6nbRqSQnkr4Fy07QgJ++ZAHdZetLbru?=
 =?us-ascii?Q?eGhqMXb851LWD2R5RK2al1sSIV1jxsi54FfkYVhofKYnVxMTE3pj9DHF+kF2?=
 =?us-ascii?Q?E7A1BzDQgX4ymAkow1vgNacdTHYPSAErjLjVhuY+S9e7jqeetZqOLg0VjqVg?=
 =?us-ascii?Q?oeca1XuNuy/n/HP7zzIyozAAgfPbT/eslWMkZEo5nFCsnCDdsCZd0jeYAywA?=
 =?us-ascii?Q?lQLQN9Azi97WrnJ8CGNMmPk2vRlqwJ4IwIy1aPufSiNnZMJzN9U+7IxDeEqe?=
 =?us-ascii?Q?CCJQ5qAKZAyjzj98Jc6YYY5rUBhOWvfDnHdGF0UwusjQu7mKlu7B9GmwkaGh?=
 =?us-ascii?Q?HwR3x0sR4bd+OeKHDiW7EU+mS+V9lx6QNebRJYtDleb32S7hRJ7FLBbKgRPM?=
 =?us-ascii?Q?NU3ZmjkzEf8bD8rMg1J1YF1NHIN8WW6DPSm99Np5nCUfWlPfK6tVSV53k/ZJ?=
 =?us-ascii?Q?E4En1hOFpp6mafPmDDoVmW2binES98fx43yf5WRRP/WLA/yFytM1bYJtoU4L?=
 =?us-ascii?Q?NQqQGNhL6bwo7qnBTDRcTzMBlew161tR8FlIIHDFy7igUwIOga6dk5ufwH3H?=
 =?us-ascii?Q?GxmubKlD+1wCGntx19cfEPpqhzhRnxOb0c/CxMbJ9J98xCZ0F/bT34Cx6qFQ?=
 =?us-ascii?Q?nfBMFw647A5AMCp8YCxKg1swiQfBT4mu+vw1nT9bnD3AmrbAb4x0gXf2yttF?=
 =?us-ascii?Q?ODfFBnN01X5HQ4oggb4sjXtfjNes2vWqI8lAl1IgNBZO1QBUO+mXt5F6ZQbT?=
 =?us-ascii?Q?tvJZeUehFzp9IadX9/7qwqpIMXdE1bsAhgDoE/5C+h0aDieZKdvUC6w5GnOo?=
 =?us-ascii?Q?ktQU8OQrqX1x1US9w7uRhHXMxMfnQFFhDDvYE02iD+ksOBgZyfCug3vpyjdw?=
 =?us-ascii?Q?WIZHreXceDBcQEu2JY=3D?=
X-Microsoft-Antispam-Message-Info: aFk368R6rfuX2fwQPGrn50Pduqa0fD/eJmBbhsTtWT/m7PvtXPr0Zqcnp2InE2oJY+SLtyOvzhxHbIai+09bGx63pJ1o5QGuFQgKflTdgnz5b04WARhaaNR+1viO4azoFHWtl1PxEJ66v9DdceRSEJte7ulFayNUWwkk+rTbKU0HSAlr54J1IOBYkbASVabfqgWbfWgNRt13oW6XEt12t2vqDBtQlghfz9egN02OWGc6PXe7IxXeRyCuql+k/ALdx5luwLHD8hRfvqBK4R+I8m1h0sWAZJFcu2/VzXUH0M6xMOMF64PwiyQR6zazLqhZ0KAMzkCH5tarcTYcFFM9EtMlFW9BpRJWTiAHqNBlpjE=
X-Microsoft-Exchange-Diagnostics: 1;VI1PR04MB4221;6:8TqpiP+RDngxZYFLXtiJJF0BDXsaVDuLZSCLAJgGXnmRPC5NSeEOPJXRT5RRD6UXc+YntnyohRESpSEOAlnYREKBJyx3B3Bce6NhWsR6s26RT4O1FyQOpXrZYlQOQKh1iE05ewm8r2q3tQh7j4DTtR3LyMNQrgmdMVwdth8m+pwuIQTTc8hrrevj8OjxQgOegJxqSHH0b3fiqfYFPeGpZojVRdCPpfF5OUFABNJwwJtiyFuj7seqpexGYXyBei+yMq3aYFRR7am2CKAI9Te0jPAlXuTWpmtgqZyWVzx1c3UP/Qv0IhPH7uHpCPokyeS1iKXT6kH9XM0bqkSSJK3LAb1Fbtk+7/jczX6G2HxTam5wN2Cas48eBjo3GxmbjQIYg4IrrTRKDwLfwPnYVujrv4Jmaw6/jXi+wvQBVNRVLiO++3kKfXRBCf4KCrH1Cs4vYWhIdvm+gJTDvE7VdPHc+Q==;5:+LgGnDWPnRZRQ7MeF4mVkuxP2sXzenebkaTjeLyRMzcWgs4LMaiVDJfwi7Xn+kqBw7R99KVREElU2KspvBhijUdDvtVNxxG+IgZMuQXsTZlq4LS7MDNTt7groBpSKql3+fOEMLV76dDKFsqLQbvNT1VOWTAN+T9La0TNJVHtoMs=;7:JSArYLeuo4nHGT7fWuYj0EvPR3UoWB9bQJd0kG3ekK6p0OIi+kGd5qgl+Q41SiOkx9ERbiUVpNcCZsX8gqNz7fDHFQ7Zkk0qHA01VyDJeiHaGg3Vq76HRJip3saEW1SEJicoaEwcCZns0KaqRaWF8rhas4IoAfzTNgbGbTNYrbgSYnHf8TxHpbBnRKtleDfasmahhCaDy1/Vl9RNo+L9c2KvRnHbZLAMi56lrC/mlGpB8MO3IzJM/fXH1aZyMN4Q
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2018 01:11:41.4228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 982549b6-3df9-42dc-0f8e-08d62671afc8
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4221
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This may be used by both mmio and scu clks. So let's put it
into a common file.

Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 drivers/clk/imx/clk-common.h  | 16 ++++++++++++++++
 drivers/clk/imx/scu/clk-scu.h |  2 ++
 2 files changed, 18 insertions(+)
 create mode 100644 drivers/clk/imx/clk-common.h

diff --git a/drivers/clk/imx/clk-common.h b/drivers/clk/imx/clk-common.h
new file mode 100644
index 0000000..e3634a5
--- /dev/null
+++ b/drivers/clk/imx/clk-common.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2018 NXP
+ */
+
+#ifndef __IMX_CLK_COMMON_H
+#define __IMX_CLK_COMMON_H
+
+#include <linux/clk-provider.h>
+
+static inline struct clk_hw *imx_clk_hw_fixed(const char *name, int rate)
+{
+	return clk_hw_register_fixed_rate(NULL, name, NULL, 0, rate);
+}
+
+#endif /* __IMX_CLK_COMMON_H */
diff --git a/drivers/clk/imx/scu/clk-scu.h b/drivers/clk/imx/scu/clk-scu.h
index fd36a98..27b19a6 100644
--- a/drivers/clk/imx/scu/clk-scu.h
+++ b/drivers/clk/imx/scu/clk-scu.h
@@ -11,6 +11,8 @@
 #include <linux/spinlock.h>
 #include <soc/imx/scu/sci.h>
 
+#include "../clk-common.h"
+
 extern spinlock_t imx_ccm_lock;
 extern struct imx_sc_ipc *ccm_ipc_handle;
 
-- 
2.7.4

