Return-Path: <SRS0=xqQ/=MM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 612E9C64EAD
	for <linux-clk@archiver.kernel.org>; Sun, 30 Sep 2018 01:11:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 12095206B8
	for <linux-clk@archiver.kernel.org>; Sun, 30 Sep 2018 01:11:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="FuBAvbBK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12095206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbeI3HmM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 30 Sep 2018 03:42:12 -0400
Received: from mail-eopbgr10057.outbound.protection.outlook.com ([40.107.1.57]:48520
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726009AbeI3HmM (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 30 Sep 2018 03:42:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VhSF5nopnJuQvy4sYgAhXN28f4m0YEhlXFxTp0Rvf0Q=;
 b=FuBAvbBKcXUOA++KFjKQJgihiM9uk2RENK+yXTl0jp41lu9PJrqNOUYz935dpea7wEP+Zy3WsRm6Qk0l1YyESLRHLBO83h6ls0CKMTg3XltM3fQOcDk0hXFYZwRSsJLgM1FS0L2t1jOvzFkrASbVG59PzzT+1uWa0YYkdn+Y25E=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
Received: from shlinux2.ap.freescale.net (119.31.174.66) by
 VI1PR04MB4221.eurprd04.prod.outlook.com (2603:10a6:803:3e::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1185.22; Sun, 30 Sep 2018 01:11:21 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH V3 03/11] clk: imx: scu: add scu clock divider
Date:   Sun, 30 Sep 2018 08:56:18 +0800
Message-Id: <1538268986-24890-4-git-send-email-aisheng.dong@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: a28166aa-4490-4b3b-b1e9-08d62671a3cc
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:VI1PR04MB4221;
X-Microsoft-Exchange-Diagnostics: 1;VI1PR04MB4221;3:uuRHVSFZW9mh+KGB/NW1lw1uyPugvn/2OYu/T0z7fPHA26zg4QkYOya5uutj5eWoP0AEsINXN8bSdVyGZhrebj3L5WjeL7uPDuzV+ZjsPBEUYfCCWTgmWhcwF0g/AP7syO1mNAwz8Sw9rVS8ypCz0XT1fnr4oGzoahis4Kwkijzcsp1TGOkM/G8xDI67AMSwgxPMJOiG905lxCklwJUj26bzseJcrqyN9eU+SzTmNpktbxNiw5qJ/e+4PYWdODPI;25:O/uAQ6SelF/mwvcDdSNQ/oH5H4mi5GeyRMX72bFihiTaE95KWd93SX/nWhbsJApCrI/ksr5at/fYepSpF9eMB0JF0GSWbP2NQ5WwweDKwH0VEy3Wv4QNkhRIr0sSI7ful8oA7Busw3M2G34NiCdmxOqv50N2dwie33q+HS2w8rDbeEqUGgPlCZlT/peSYQnFWG4ICwDL/b+zDGu+UQLKvc1bbcC8YluF1zbUrlGmLsVgPxLcqPMhyA/sEoe+Oc6jkLh4hAz8uYqK/ECACiIbwW7Nz/6EfFEF/utEtgZ9fslt9w5Q30lZseU8E5dNQ5KdgEDMxiOwqSTmAmgqd6RsZA==;31:LdScE8FHsqjxKlCnAPo/mHhapb+Y56ZAFut0oGcvO1TN/6tyypJhKnFE9DkUsPYyBlATGfg2GH4LhJch7KeOpeN7EVkTxvsxoDL5BhYNePYONkpIbonTSHhMT1XMDgdTPAmBsWeDW5Jcj46WgfzPcv5JqGEzxE87mkrmkVBq4gp4MgvCm7O+E/zy2lJINzTf1UvlZXFhC52ErFvL8H6Dbniwto0CWBGWP9Dmq4cj/rM=
X-MS-TrafficTypeDiagnostic: VI1PR04MB4221:
X-Microsoft-Exchange-Diagnostics: 1;VI1PR04MB4221;20:OxeSpZOO7+JQuIm1+z0oV7DOjAQuwA/7pzVWAR9W3FF6xXtnzUeF1HiXezooaywABNi9JWQCjWPw0jez/lOp4AEoqL4XBQmZS4ouTV7koFjiPTeMRC1nqfuiurJEhaLKdnc/E1bHKJnuMDgF4ZN7gWtf3Jm1wMcvLgHj9KU4mzwCMfJveszo150LqdX2xridbBItjickjxTAnQ4UB9dtOTlLe1S2fiKQxTfE4DiyHzPn6tSoQFINBgCbDB1dzojOYq46bHfe3cWUv/xOvJKLV/EzehFVGcjry8+QUcx9pSrJUGFEvqbs8AI8zaFglZ9PtXvoJ/6VAYMRtbF3UrHcLPx1utqKNQ+aNjTmh22xZDBgqZfOYLciKsfeHNRHpcUy+ohE/dHpIw/gQEjletfMWk8pDycybjaQfJnYIcDlZiC1LcYH6qNb2CAV8PPI9vn84lNO8/qJCtZyUPl0wCKM/XWvOYXo3wLZ0gFvrUdQvkQExvQRyyMq3opV1u9xeS2L;4:ibylVz/qEtLceIrkHlB3B0mnYZ5YHdTys56L9YPL9PWheWnGXFRg5Y+3L5Jg4sTd7NoSZKb6BHtkb0JUumnAS4btH9jrOx4O/5Avx/UssrxVqxLvFX8IYQRx3XoWifFt6xjmxCgS6lEQ2eYYit2PVr7VXetLU2FAKlDo16p+LtTj2llpsB9fKojoyfFuGAeYzWCGILVwQ099rcdWSnUnzRVano7IwNLC3+QmdUPP/5OzNyXgIfq/rapIqHghUVcZj83gzmPZb7Sst1wEBX7DN84JRI3YOuh9H171HxGeoPVXSu6ho825CFlCYfL3uXyq
X-Microsoft-Antispam-PRVS: <VI1PR04MB4221E08B1888D4DF3B57CEA680EE0@VI1PR04MB4221.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231355)(944501410)(52105095)(10201501046)(3002001)(93006095)(93001095)(6055026)(149066)(150057)(6041310)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(201708071742011)(7699051);SRVR:VI1PR04MB4221;BCL:0;PCL:0;RULEID:;SRVR:VI1PR04MB4221;
X-Forefront-PRVS: 08118EFC2B
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(39860400002)(346002)(376002)(396003)(136003)(366004)(54534003)(189003)(199004)(14444005)(6486002)(81166006)(81156014)(66066001)(6512007)(8676002)(52116002)(53936002)(11346002)(446003)(2616005)(956004)(476003)(486006)(6506007)(48376002)(26005)(2906002)(47776003)(386003)(6916009)(478600001)(97736004)(68736007)(50226002)(5660300001)(8936002)(6116002)(50466002)(6666003)(3846002)(76176011)(51416003)(106356001)(25786009)(16586007)(4326008)(34290500001)(186003)(16526019)(2361001)(2351001)(316002)(105586002)(36756003)(305945005)(7736002)(86362001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4221;H:shlinux2.ap.freescale.net;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;VI1PR04MB4221;23:ZHZ4pKXTcDSGm1bCFGnhlCn5gtSSpO2xLL4J8wTnQ?=
 =?us-ascii?Q?1/B7ymNvKKWY5kRdFtoQiAwnPLvhHPElGaRgbd2XItzILP+2yuOotWW/vM/7?=
 =?us-ascii?Q?SejDNME4cxtfom/1LnGhrWpKI9J3dkcwF6rBGV/B/2/8Tn5WVw9VTfiR4+dQ?=
 =?us-ascii?Q?NGMWhBEPppB9pnEW/XXP6OB1CJw+t/lglYD2sZKXn4HA/TmdPmbcCNq+Icqk?=
 =?us-ascii?Q?BZyuB1t01YBv4GEmmHcZTb4fjyyJ8cvUqiiQVxxR+31j6tiZjubfqG6NWU56?=
 =?us-ascii?Q?3fxemry1Cdv6TbCGGzP7m/e9q2gQooieKs4OAelrA1RkomWveyLRbMvdgEbN?=
 =?us-ascii?Q?c8sz5Dvp7V2SCvZY3CaKp5oZATn6uRtM4DiRp3IialbyHuhJZOWoWH1cgUwg?=
 =?us-ascii?Q?7CGQJwup4JdXA27BRJdlxG6mIyWTPkdE3g9NaTc5e5rfs3k1DC+7xlW+TdlI?=
 =?us-ascii?Q?az6vdV9h/g8boS5P+OUzWAXvTTp4VI87LS9OFevlmZXOJneggba2/OUfnzWp?=
 =?us-ascii?Q?/p7sT417g/XmpRlle3CNVgR/rJdDsN3WJdZmW7pQsupK1Lv2Us0HxNqghn6J?=
 =?us-ascii?Q?xdLg7QKe0ihwcko5Buv060w9RpSHr3uR4BLgmnoqO4dVxpyX6bJ7VYb94dqs?=
 =?us-ascii?Q?RS4cA3+2CCx2hQc1lpOi3qufC1nQwqS8one/no3sfm4NXZUadYNIVC2XbuCM?=
 =?us-ascii?Q?jejAL5gXU30DL4hKgK1fSxCBk53152r73HFiUFiRzyAeHn7k+WhCng6H8waH?=
 =?us-ascii?Q?jfboqY1FFwpQm4tOALr9ftpgal7bDIlKM8hBzDGHAUsj1BEhT9zzQ1uu/Qcb?=
 =?us-ascii?Q?9Pb2m4RVHAbDcgZISwKWtI/7c+TdF34AoOyBApCl07p73GyBIhVFoTRNrKpQ?=
 =?us-ascii?Q?Fzt/wrN3fFHLyMZPMwnietBYNjogHzoqSNuP1vbHdkjfjvkyDTqoAEZhx2YF?=
 =?us-ascii?Q?q9pcfkzDpp7+exUugD2yX5d/kHsLsY4+6gSmpEjbTLlfcSvYjyOJaT6z7zd6?=
 =?us-ascii?Q?F4fUbfLmgfI5TVphbZPPS6Rm0WB5v7QJlWqkkuPqaTEekGPVQhHA9PxdyFCw?=
 =?us-ascii?Q?NEOkEtmxjITGmKg/WWXIoieL/y5GNalCYMvSed9RxB8V/jnfdXt2YcZQuFE3?=
 =?us-ascii?Q?eMwSqfvMGjhMmj36YDCXO6y0BXQhRVINWX1dLj72VhI5Eo1kl2iDIM0ZxfiT?=
 =?us-ascii?Q?Ils99AQXB5rkgF4SvjBOhxeiotR3DBlrRq54ySoxYuoz5mJCals6uZRGmJfT?=
 =?us-ascii?Q?DiQkJbj35+IalWBtXDYxvjzVhjp+Honxkxexvre?=
X-Microsoft-Antispam-Message-Info: nSCnZEp8gkTMrCq7ayPWWhUIy0pCVkbvd0ACXJncE+bAQtrFfGtBdithRzQIXc7Dj9TJPqVJmmvaIXnh+v4asgFGkgtgogvBumeYT3eSpzcUhk2u2t0pV0LRuS81HRNjDEAoHReskyUcbwJDJzxMkBuUCdh4F+CoRUw5Er0K6W6I9tRfwF//zHY+JXM/U2rnZnMtCSsrf/zoHyc6f4AffPrIzYGIg2bsA/uqNEIeOV6E8S5XSfqkdaBHAz0Vazyq8dwZ1zf+FsbhpnQ3gUelLVkY9YPdaHUSD7ybzD5y+7fN7Y6c4Adbm2KKMeDa2lrdT3RBUT56PietBDGFuESyOh1GkXLei25S8q6ximLsm2A=
X-Microsoft-Exchange-Diagnostics: 1;VI1PR04MB4221;6:83rojTjotf5fK+5laT/JScdiuoRJjQPiMIwS29fikjR5/fwndBJTv1Hc6uo28fT7Stu7ihfceBcUWEaDRxFD2GL1PuFUeKF681VgPmtQxIZ9vgCDTSTXIrRgn8pBx/xvIdVnfq4arjQ4xQFkUKHb19obgqtGvGqrI2zVYdohwCcI0bnzHl3KUOdcwaQpoKcchuSTO2lfvDrRomeqHVIRiFbtwBWdyb4CexEwGP5HMiIQx+1+Io44xIJ7Z0fVHkEdRiUBP54ip1vvbH4b4ajyxfutF+2OgXMNLpquloMzJK+cS1hBiNt7L89pry2JhrYAPdzl3q3d21CSf8u8uQwT2JnH7ULGzgHqUQXv+T8RrGp1wrTd8RuAxDBi2AK84eIqAfS0c7z32FMlHgoNPCmPBqjSduG1grIVqZZVbCCn/B0wdECBpADNnEy4G4CYrQj94kzk35KfBDHOBhVJtPEmjA==;5:AJ0H7wkogxyj5QukDXPzZnXvP7EeBSMsWLPemKddl2AgFq+SqWZsvyUD3o2UmfIDSyzLH3e6kvwSn9OnUMl1x4QS52wtiEMqRZVyrXCDkJ8Gf478M5RHBwx7aoGG+iemajqND2pReBhJ/Aeyn5yfLlXQqOyK4n9NnFU1QuM1XZg=;7:OOWnFLFyQw40w0li8+70MRQ53/S5gBX37osgxlQB/ueuw1XSptDUHVjiTAbe4cUuMzwDI4+o3jl6fXyJRuAIVfkAZebMqzu2ixicrdarSQUNLRVvBeXdmEyry5j7kqjbYhWnfD600gIViXszQVex9W68VSeNl86hj0ZTdCW8EjlAt7uGxq0OjGxvgnYkxiyUXszSCEnR7vCCAZu++yRvO+bt4u2iiWQWb3tw4q03FvHgz40kMuMNxcvDIFro+qD3
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2018 01:11:21.3275
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a28166aa-4490-4b3b-b1e9-08d62671a3cc
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4221
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add scu based clock divider.

Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v2->v3:
 * structures/enums name update with imx_sc prefix
v1->v2:
 * move SCU clock API implementation into driver
---
 drivers/clk/imx/scu/Makefile          |   3 +-
 drivers/clk/imx/scu/clk-divider-scu.c | 177 ++++++++++++++++++++++++++++++++++
 drivers/clk/imx/scu/clk-scu.h         |  18 ++++
 3 files changed, 197 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/imx/scu/clk-divider-scu.c

diff --git a/drivers/clk/imx/scu/Makefile b/drivers/clk/imx/scu/Makefile
index 7dead13..7e360e2 100644
--- a/drivers/clk/imx/scu/Makefile
+++ b/drivers/clk/imx/scu/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_MXC_CLK_SCU) += \
-	clk-scu.o
+	clk-scu.o \
+	clk-divider-scu.o
diff --git a/drivers/clk/imx/scu/clk-divider-scu.c b/drivers/clk/imx/scu/clk-divider-scu.c
new file mode 100644
index 0000000..8790126
--- /dev/null
+++ b/drivers/clk/imx/scu/clk-divider-scu.c
@@ -0,0 +1,177 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2016 Freescale Semiconductor, Inc.
+ * Copyright 2017~2018 NXP
+ *	Dong Aisheng <aisheng.dong@nxp.com>
+ *
+ */
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/jiffies.h>
+#include <linux/slab.h>
+#include <soc/imx/scu/sci.h>
+
+#include "clk-scu.h"
+
+struct clk_divider_scu {
+	struct clk_hw	hw;
+	u32 rsrc_id;
+	u8 clk_type;
+};
+
+/* SCU Clock Protocol definitions */
+struct imx_sc_msg_req_set_clock_rate {
+	struct imx_sc_rpc_msg hdr;
+	u32 rate;
+	u16 resource;
+	u8 clk;
+} __packed;
+
+struct imx_sc_msg_req_get_clock_rate {
+	struct imx_sc_rpc_msg hdr;
+	u16 resource;
+	u8 clk;
+} __packed;
+
+struct imx_sc_msg_resp_get_clock_rate {
+	struct imx_sc_rpc_msg hdr;
+	u32 rate;
+} __packed;
+
+
+static inline struct clk_divider_scu *to_clk_divider_scu(struct clk_hw *hw)
+{
+	return container_of(hw, struct clk_divider_scu, hw);
+}
+
+/*
+ * clk_divider_scu_recalc_rate - Get clock rate for a SCU clock
+ * @hw: clock to get rate for
+ * @parent_rate: parent rate provided by common clock framework, not used
+ *
+ * Gets the current clock rate of a SCU clock. Returns the current
+ * clock rate, or zero in failure.
+ */
+static unsigned long clk_divider_scu_recalc_rate(struct clk_hw *hw,
+						  unsigned long parent_rate)
+{
+	struct clk_divider_scu *div = to_clk_divider_scu(hw);
+	struct imx_sc_msg_req_get_clock_rate msg;
+	struct imx_sc_msg_resp_get_clock_rate *resp;
+	struct imx_sc_rpc_msg *hdr = &msg.hdr;
+	int ret;
+
+	hdr->ver = IMX_SC_RPC_VERSION;
+	hdr->svc = (uint8_t)IMX_SC_RPC_SVC_PM;
+	hdr->func = (uint8_t)IMX_SC_PM_FUNC_GET_CLOCK_RATE;
+	hdr->size = 2;
+
+	msg.resource = div->rsrc_id;
+	msg.clk = div->clk_type;
+
+	ret = imx_scu_call_rpc(ccm_ipc_handle, &msg, true);
+	if (ret) {
+		pr_err("%s: failed to get clock rate %d\n",
+			clk_hw_get_name(hw), ret);
+		return 0;
+	}
+
+	resp = (struct imx_sc_msg_resp_get_clock_rate *)&msg;
+
+	return resp->rate;
+}
+
+/*
+ * clk_divider_scu_round_rate - Round clock rate for a SCU clock
+ * @hw: clock to round rate for
+ * @rate: rate to round
+ * @parent_rate: parent rate provided by common clock framework, not used
+ *
+ * Gets the current clock rate of a SCU clock. Returns the current
+ * clock rate, or zero in failure.
+ */
+static long clk_divider_scu_round_rate(struct clk_hw *hw, unsigned long rate,
+				       unsigned long *parent_rate)
+{
+	/*
+	 * Assume we support all the requested rate and let the SCU firmware
+	 * to handle the left work
+	 */
+	return rate;
+}
+
+/*
+ * clk_divider_scu_set_rate - Set rate for a SCU clock
+ * @hw: clock to change rate for
+ * @rate: target rate for the clock
+ * @parent_rate: rate of the clock parent, not used for SCU clocks
+ *
+ * Sets a clock frequency for a SCU clock. Returns the SCU
+ * protocol status.
+ */
+static int clk_divider_scu_set_rate(struct clk_hw *hw, unsigned long rate,
+				    unsigned long parent_rate)
+{
+	struct clk_divider_scu *div = to_clk_divider_scu(hw);
+	struct imx_sc_msg_req_set_clock_rate msg;
+	struct imx_sc_rpc_msg *hdr = &msg.hdr;
+	int ret;
+
+	hdr->ver = IMX_SC_RPC_VERSION;
+	hdr->svc = (uint8_t)IMX_SC_RPC_SVC_PM;
+	hdr->func = (uint8_t)IMX_SC_PM_FUNC_SET_CLOCK_RATE;
+	hdr->size = 3;
+
+	msg.rate = rate;
+	msg.resource = div->rsrc_id;
+	msg.clk = div->clk_type;
+
+	ret = imx_scu_call_rpc(ccm_ipc_handle, &msg, true);
+	if (ret)
+		pr_err("%s: failed to set clock rate %ld : ret %d\n",
+			clk_hw_get_name(hw), rate, ret);
+
+	return 0;
+}
+
+static const struct clk_ops clk_divider_scu_ops = {
+	.recalc_rate = clk_divider_scu_recalc_rate,
+	.round_rate = clk_divider_scu_round_rate,
+	.set_rate = clk_divider_scu_set_rate,
+};
+
+struct clk_hw *imx_clk_register_divider_scu(const char *name,
+					    const char *parent_name,
+					    u32 rsrc_id,
+					    u8 clk_type)
+{
+	struct clk_divider_scu *div;
+	struct clk_init_data init;
+	struct clk_hw *hw;
+	int ret;
+
+	div = kzalloc(sizeof(*div), GFP_KERNEL);
+	if (!div)
+		return ERR_PTR(-ENOMEM);
+
+	div->rsrc_id = rsrc_id;
+	div->clk_type = clk_type;
+
+	init.name = name;
+	init.ops = &clk_divider_scu_ops;
+	init.flags = CLK_GET_RATE_NOCACHE;
+	init.parent_names = parent_name ? &parent_name : NULL;
+	init.num_parents = parent_name ? 1 : 0;
+	div->hw.init = &init;
+
+	hw = &div->hw;
+	ret = clk_hw_register(NULL, hw);
+	if (ret) {
+		kfree(div);
+		hw = ERR_PTR(ret);
+	}
+
+	return hw;
+}
diff --git a/drivers/clk/imx/scu/clk-scu.h b/drivers/clk/imx/scu/clk-scu.h
index 1ed2946..38f9cb2 100644
--- a/drivers/clk/imx/scu/clk-scu.h
+++ b/drivers/clk/imx/scu/clk-scu.h
@@ -7,6 +7,7 @@
 #ifndef __IMX_CLK_SCU_H
 #define __IMX_CLK_SCU_H
 
+#include <linux/clk-provider.h>
 #include <linux/spinlock.h>
 #include <soc/imx/scu/sci.h>
 
@@ -15,4 +16,21 @@ extern struct imx_sc_ipc *ccm_ipc_handle;
 
 int imx_clk_scu_init(void);
 
+struct clk_hw *imx_clk_register_divider_scu(const char *name,
+				const char *parent_name, u32 rsrc_id,
+				u8 clk_type);
+
+static inline struct clk_hw *imx_clk_divider_scu(const char *name,
+				u32 rsrc_id, u8 clk_type)
+{
+	return imx_clk_register_divider_scu(name, NULL, rsrc_id, clk_type);
+}
+
+static inline struct clk_hw *imx_clk_divider2_scu(const char *name,
+				const char *parent_name,
+				u32 rsrc_id, u8 clk_type)
+{
+	return imx_clk_register_divider_scu(name, parent_name, rsrc_id, clk_type);
+}
+
 #endif
-- 
2.7.4

