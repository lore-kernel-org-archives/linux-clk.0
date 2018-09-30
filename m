Return-Path: <SRS0=xqQ/=MM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD1E8C64EAD
	for <linux-clk@archiver.kernel.org>; Sun, 30 Sep 2018 01:11:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 75794206B8
	for <linux-clk@archiver.kernel.org>; Sun, 30 Sep 2018 01:11:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="hiGX2pG+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75794206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbeI3HmQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 30 Sep 2018 03:42:16 -0400
Received: from mail-eopbgr10057.outbound.protection.outlook.com ([40.107.1.57]:48520
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726009AbeI3HmQ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 30 Sep 2018 03:42:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pKGgZiLiO+PLJfDcTFYIK2aiEIXYKvU3u+A703+Kku8=;
 b=hiGX2pG+thEi8+J6FaS49dVp0HhDykaxlfBVvZtyW1jaDmBOmvHTrMWf/TKwGw3mBoo5cuaceUQgrcriLazNcR64pZvZN2Vc3/w+yY6sbaHQjadswkemavX8F4PdtB02Q8ojBMKok9hfaUY1I159eYm49tYGGKBqNDbMV0I3FVk=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
Received: from shlinux2.ap.freescale.net (119.31.174.66) by
 VI1PR04MB4221.eurprd04.prod.outlook.com (2603:10a6:803:3e::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1185.22; Sun, 30 Sep 2018 01:11:24 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH V3 04/11] clk: imx: scu: add scu clock gpr divider
Date:   Sun, 30 Sep 2018 08:56:19 +0800
Message-Id: <1538268986-24890-5-git-send-email-aisheng.dong@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: dcc8ced3-0133-4777-7e94-08d62671a5c7
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:VI1PR04MB4221;
X-Microsoft-Exchange-Diagnostics: 1;VI1PR04MB4221;3:n9eG+8ap2IAeLqjAp8dE1T3ho/4N+3AEwjjp82uvFQ4PeKfryEmOf0eXkXf93EWUE27MGTObv4Z0gMGkqmWpwFVCzClqj4YW9do/0P7nKAazqiCMNA0OaEdsGbCvX+q+eTti9wBNT10k4E6Cz03sX7dtX9ANm3aVuylcPJCZ+N6SHejlVwVVCWhyPgQ7nT8l45dRR1fPCG8kWodDGdh0GflRkDh8USrnbCsetR9heD7+BGrPz06iRXnwWPlSx+yE;25:ob4McSg2qdWxY+FV1+jJb1MSPmR9pLvMG23Nwy39yJZd4eXiFntpVNld+d7J9WCOcxAEyAmf6Mo7t851Slg3afr65kKM3W7BUw7mVg3emZt+m8NdCIVAutm23q4GQ0Dvg4vpmRAbs9r/Di25XmiZfpQqej6Z/5lWdcfe0rAormZQiIxaY31gdicgNsXpa8IXDBvP9A1kE8qK12a5WgjgYFe9PorOTEWPWH3zlRSydXhxt2SUuzRR9FMxN7GxMPSyLI7ConMr4sd15D8MnnAvpznjq2X2NgzdGjfRidIvKOEhjg5JTwXwfaZwKHlL6rmi/lLZtU1eDHGJu4XIjPEeSw==;31:hweXREatb7di5QE4rnjVneyG7ct5Pqbdm+ulyFCs8ES934PiW1dVE3nIuEtQAVufPVjuO3mW7aCspn+vHRU6MPEPXcDWhP9IAOXH5Fvthj65MZUqdKnRzG8zEk59h8VSh/ILYiu9g/rucUVSgbBK4csezkfgTh+bLDYb2yjRHiyw2eKh4jRzMa8SUeiKpa/ZqKysakg3gx8fbSBk4w5lcczGbe9KxiMiRlxaBPAXvB8=
X-MS-TrafficTypeDiagnostic: VI1PR04MB4221:
X-Microsoft-Exchange-Diagnostics: 1;VI1PR04MB4221;20:qgLY8PcwW/e+PLwWmRh6S0GMjFSu4c3YO0RMnaPNj1OWmrZsMtWzN8NVzRH4wGPwxcYf16b3DDEe5vIsdfNJL4LUzyfTpZARM6jWaSM6Q5Dz7A1arDnKZ/wIPp1C5ICsb8ZIUjK0euxgrplaBYfIk+7Y8+onK3gG4z6bcX8bYHdVpAttLxH0NSRtjOYgw3d4HK7lHUfuvR6PniFemAJ1X+My+aT6hvdaed2oKhRiYfBzKGYPk1c6Ezz6mak9N+U05KrGLPnts/PYyOnbcWRQQcfzvOZUqKvA/AePb/X7ZHUQxmQdwQEGC13MW+N7PDYkXpoidMrRjATQbKh6/lSW7tEEUTUcfTbvug9pP94jd3X7cQASPjh+xp193gTy4XSjgRbyY5CSzQolnK3ZmjutW/qBZh3OtoFSWCeNeJ+4rLhfyA4Mab4mW6LUHPOi+Gb81f0Yi/rOkWtwNy31otqGq/++GKjt8DwyadmYmsFLs9o2URICUC+pNv7sGIwpl0Jw;4:U4F/tCc8u7X4ZSf/Qb/R7YjkrcdpENK7bYod8lLjfKe8ICKe5cxw6C/gTqxtMHiiRCBuU+Qj04HHSZePDZvGT+6bhR3gff9K0/i4VYfKjkx6GvR5mMgX7glxNFgheKavY+u9a3RD4tsdNE44hCPhOfMZFnUG4AuU8tqQvkfHbgtSX5tLJUX+OgdMpmJFr/GR0BMHZgFSiuZOFjGz/jVMdapbu/XdUhAANmSPTwAp+79T3VceBWhRfId8hW3YH5jRsWoNq6ufRK/hYiWmlH2CDsXzGiNZ61uMRJHbAbHSsEbfXa5OuGcc/EbPKR7fXN0B
X-Microsoft-Antispam-PRVS: <VI1PR04MB4221FE39A881EBEA8C160C4980EE0@VI1PR04MB4221.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231355)(944501410)(52105095)(10201501046)(3002001)(93006095)(93001095)(6055026)(149066)(150057)(6041310)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(201708071742011)(7699051);SRVR:VI1PR04MB4221;BCL:0;PCL:0;RULEID:;SRVR:VI1PR04MB4221;
X-Forefront-PRVS: 08118EFC2B
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(39860400002)(346002)(376002)(396003)(136003)(366004)(54534003)(189003)(199004)(14444005)(6486002)(81166006)(81156014)(66066001)(6512007)(8676002)(52116002)(53936002)(11346002)(446003)(2616005)(956004)(476003)(486006)(6506007)(48376002)(26005)(2906002)(47776003)(386003)(6916009)(478600001)(97736004)(68736007)(50226002)(5660300001)(8936002)(6116002)(50466002)(6666003)(3846002)(76176011)(51416003)(106356001)(25786009)(16586007)(4326008)(34290500001)(186003)(16526019)(2361001)(2351001)(316002)(105586002)(36756003)(305945005)(7736002)(86362001);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4221;H:shlinux2.ap.freescale.net;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;VI1PR04MB4221;23:3fo5waeG0BQ9IvgOdMDgOtrn/3UyaBzDM26T9vZ74?=
 =?us-ascii?Q?rEHFBP/g+XLiSmZbYiqEicORlA++VkyRvm4YtWEYSya5yFS/UJL2Ee/Zaem1?=
 =?us-ascii?Q?NRMZxSSng+HEBBQO7UMZLWJQZmZbOQ0lPL/MlWxdMlMdf8vlAlkNZtW6hfRg?=
 =?us-ascii?Q?lPTE7cT2SSLf1u5aHg0rRcLL50CaxMhkTg95GqHYnchRubo1Mg3PSXDwsSHq?=
 =?us-ascii?Q?xkI4L0r4pjq6l2ump1pXpBUl+u7s0bus6M+AjiGxgmybGPVsthM+s4Lgr3ng?=
 =?us-ascii?Q?8NBiCQ7fagnbfb+sm2R3vOjBS3BoK4hUQynCyH18p+2X/JaKXXLbDIKBAglO?=
 =?us-ascii?Q?KX36HIuRQPCJBWuYRNOVw8ra3kwdICVQKp0iFwb4bA3st2rVGeISx5G/Sl26?=
 =?us-ascii?Q?vCAy6Nl9VYaFEC7/AtXodj5GqOZNbZ6dxuX9OlIn46B+BMeCOMzD1IBXQoNy?=
 =?us-ascii?Q?87Sy3x5IU6nb+SDMZkKTTdSZnPJ4wb8s57eMMT/biU1hYEz/C626eO2llBYR?=
 =?us-ascii?Q?mJyF63c2qxyiGO8hrOi4DoyN4YViy969hXgVtlZiDRv7n8a8568nIZvt2FrU?=
 =?us-ascii?Q?96RcAd1wwPKe70eWJVpjLnZfNcTXhWD0pzaby/sJkFYLXZDWRJSkwZCXebdA?=
 =?us-ascii?Q?o+XII2QxV5ysyuvU+0xVeWkHbLVpT2OatJLBeAJ47vgYjRrED6ZI0UleXmYc?=
 =?us-ascii?Q?7NE+ci/4MRBkqavSs5b7zTqdk8ZBoZ1z1AsFwj0AoySs5Jx3YyGMWu2JrGk7?=
 =?us-ascii?Q?4gq4xpgR1BXpEz2lRRGvOJeglvoq6mEwmJMqN+bOyg5oNSkbkHB55NLSha8d?=
 =?us-ascii?Q?c6/EIXCMmbUE/5YEciN6+sB1zFGNc51YD1Zbm0OmHYP+CY4ixRCNbhnkhOnu?=
 =?us-ascii?Q?huO8xdqC14eBM9a7GTC2emiJf+ebfh27K3SywzBBQxT0rATVUKU94TY8ApSI?=
 =?us-ascii?Q?39f26rb7zrACEvcy1F8k8kxgScjKK6xq7UFRwoABglOFWZwogPnd0J+NC5yF?=
 =?us-ascii?Q?Iu0SrhIwH/s5bl3/nYF8fnZ5KS1PgWXLik0DEXFid+wVvziP/4S/5bhggGus?=
 =?us-ascii?Q?oY04Rx5FCYC2k/BjaC7BEaMHZ2GfzxXwJDXz8JzTTybJA6duvTMl0kpoIy+D?=
 =?us-ascii?Q?bZzpPYYOIiSwgdlFsiEasm+wHZMKbAQSMbsb7YttlnN/hWBNfdDdPXUN/rNt?=
 =?us-ascii?Q?exTZ75GtDW7lyC/hbxuGKLlyGJiuujTN0K09qQA99eeF6ognzOhi5vOuendG?=
 =?us-ascii?Q?IO2pkB3F1F4ggTpA+qQLhfjN1AAUoDScujsTd2f?=
X-Microsoft-Antispam-Message-Info: IsAEUT4ZQI31NMPSP0WCK0ITTeCHWEoJyk0bDpOprs8jU2lYfXS3rOuwSKdsmvO66ko2OfRbjr6FlrbP3cuCIbk2Fv//HKNQQWsxpmqJkbtsqcJWnAFxx7jiG2gbfl8lpHYFrfIWzp0k+X4VQykl+lzHLeVs5Xs+eJtUtpyFO0U8PhJs9H2ABjMXTmVHSp2cMBLuF5JsrJDZE9Q7ZFXcYK2JwSMP8VJrr0qe17ag7QstwVl1YY1ttpXGEUNYKkMBfBYSr0jS0jhlbSFlqNH3bjONknnqYAo1t0oYIJb2Hd/lVj6zFoGsoKpXdhVP+5w88+P9lZeFaegPB4PUaa7+7z1x+krr06L0VyT2ezcQxnc=
X-Microsoft-Exchange-Diagnostics: 1;VI1PR04MB4221;6:zyX4r8T1rj0yD7ch/fiOCbeSR6AYuG9HlHbMfmVpmcfs97XiAKN/7rJJzN50p3GZZ1iyRJvuMO3b0KedWY03JRyeBagy5Mxtdzqevc49sjq5DNisvbdZnY1uSLlNqdR/NH2Xqk9fR3DghpMzKsiJdB3uR+uyttJlIK1Z0J6BT41T7IREGMhuFLnPdbV3cL8A4bdWWOh4mxh4tzMh1C1LH/X6K8ySQMAkAJEPUgN7/+ktSW/Qs9p64R8Rw4S8z5Iak+Frel5pJASjS6ITEK8VZoBhEHjBsNU2y1bXKDIIowIcDl7lrTog4j4fBkL+Sd1uvtClmJK9TnpjnF99afeCSeQz/G+MOrSlbD94i3G5VoqbQceTvmAvEJXi0DzH5DIHI5tfQ6Xppv2gur3s+eUTg/WClWa3sJMGyxfzunCPOYmEmFtFuCB51CU/SefA5UfrVEdNV1MQNC3nGwt/XUgE9w==;5:yP9pF76FS8+v+wYPeSqdlkBEtOtqgkRRRJurgVX0qHSqEGHa2WLlRldAKd10WHi+olcm7yI32nLRYjNtYuKXfWFWncUTkrwMD1LZp/QFBg9562coZsMI5ZQJ4j9GCRGh3DhMQjJTMne43yGV9kA1RY2SGohunRig3iS5Dujw9/8=;7:sTjUzWS2xSd7zj6nc1+KFyn1Ee8YV/K9jQwTtGo8vd6nbCepruB1/w7y5TZo0McwOwQrmOk/NTfcpluxL95Q/Fhwpta+5izov+6F3DV7gJt7gSnOEcW1sRMu82JvY7I+tNuaJc7m9c7TJ/LdYSmfPZ29lYu5NFFThnSQiY1AxwHZlooVvwdZ/BWrlu4E68jI6ThushXLJdJG9OeFmf26OMApCEpvwKBGuQcHo9FUTfjiWzm2kMXFUUqL80zholDp
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2018 01:11:24.6478
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcc8ced3-0133-4777-7e94-08d62671a5c7
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4221
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add scu based clock gpr divider. Unlike the normal scu divider, such
dividers are controlled by GPR bits through SCU sc_misc_set_control
API.

Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v2->v3:
 * structures name and api use update
v1->v2:
 * no changes except update headfile name
---
 drivers/clk/imx/scu/Makefile              |   3 +-
 drivers/clk/imx/scu/clk-divider-gpr-scu.c | 130 ++++++++++++++++++++++++++++++
 drivers/clk/imx/scu/clk-scu.h             |   3 +
 3 files changed, 135 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/imx/scu/clk-divider-gpr-scu.c

diff --git a/drivers/clk/imx/scu/Makefile b/drivers/clk/imx/scu/Makefile
index 7e360e2..9e7f4aa 100644
--- a/drivers/clk/imx/scu/Makefile
+++ b/drivers/clk/imx/scu/Makefile
@@ -2,4 +2,5 @@
 
 obj-$(CONFIG_MXC_CLK_SCU) += \
 	clk-scu.o \
-	clk-divider-scu.o
+	clk-divider-scu.o \
+	clk-divider-gpr-scu.o
diff --git a/drivers/clk/imx/scu/clk-divider-gpr-scu.c b/drivers/clk/imx/scu/clk-divider-gpr-scu.c
new file mode 100644
index 0000000..2843bf9
--- /dev/null
+++ b/drivers/clk/imx/scu/clk-divider-gpr-scu.c
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2016 Freescale Semiconductor, Inc.
+ * Copyright 2017~2018 NXP
+ *	Dong Aisheng <aisheng.dong@nxp.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/slab.h>
+#include <soc/imx/scu/sci.h>
+
+#include "clk-scu.h"
+
+struct clk_divider_gpr_scu {
+	struct clk_hw	hw;
+	u32	rsrc_id;
+	u8	gpr_id;
+};
+
+static inline struct clk_divider_gpr_scu *to_clk_divider_gpr_scu(struct clk_hw *hw)
+{
+	return container_of(hw, struct clk_divider_gpr_scu, hw);
+}
+
+/*
+ * clk_divider_scu_recalc_rate - Get clock rate for a SCU clock
+ * @hw: clock to get rate for
+ * @parent_rate: parent rate provided by common clock framework
+ *
+ * Gets the current clock rate of a SCU clock. Returns the current
+ * clock rate, or zero in failure.
+ */
+static unsigned long clk_divider_gpr_scu_recalc_rate(struct clk_hw *hw,
+						     unsigned long parent_rate)
+{
+	struct clk_divider_gpr_scu *clk = to_clk_divider_gpr_scu(hw);
+	u32 val;
+	int ret;
+
+	ret = imx_sc_misc_get_control(ccm_ipc_handle, clk->rsrc_id,
+				      clk->gpr_id, &val);
+	if (ret) {
+		pr_err("%s: failed to get clock rate %d\n",
+			clk_hw_get_name(hw), ret);
+		return 0;
+	}
+
+	return val ? parent_rate / 2 : parent_rate;
+}
+
+/*
+ * clk_divider_scu_round_rate - Round clock rate for a SCU clock
+ * @hw: clock to round rate for
+ * @rate: rate to round
+ * @parent_rate: parent rate provided by common clock framework
+ *
+ * Round clock rate for a SCU clock according to parent rate
+ */
+static long clk_divider_gpr_scu_round_rate(struct clk_hw *hw, unsigned long rate,
+					   unsigned long *prate)
+{
+	if (rate < *prate)
+		rate = *prate / 2;
+	else
+		rate = *prate;
+
+	return rate;
+}
+
+/*
+ * clk_divider_scu_set_rate - Set rate for a SCU clock
+ * @hw: clock to change rate for
+ * @rate: target rate for the clock
+ * @parent_rate: rate of the clock parent
+ *
+ * Sets a clock frequency for a SCU clock. Returns the SCU
+ * protocol status.
+ */
+static int clk_divider_gpr_scu_set_rate(struct clk_hw *hw, unsigned long rate,
+					unsigned long parent_rate)
+{
+	struct clk_divider_gpr_scu *clk = to_clk_divider_gpr_scu(hw);
+	uint32_t val;
+
+	val = (rate < parent_rate) ? 1 : 0;
+
+	return imx_sc_misc_set_control(ccm_ipc_handle, clk->rsrc_id,
+				       clk->gpr_id, val);
+}
+
+static const struct clk_ops clk_divider_gpr_scu_ops = {
+	.recalc_rate = clk_divider_gpr_scu_recalc_rate,
+	.round_rate = clk_divider_gpr_scu_round_rate,
+	.set_rate = clk_divider_gpr_scu_set_rate,
+};
+
+struct clk_hw *imx_clk_divider_gpr_scu(const char *name, const char *parent_name,
+				       u32 rsrc_id, u8 gpr_id)
+{
+	struct clk_divider_gpr_scu *div;
+	struct clk_init_data init;
+	struct clk_hw *hw;
+	int ret;
+
+	div = kzalloc(sizeof(*div), GFP_KERNEL);
+	if (!div)
+		return ERR_PTR(-ENOMEM);
+
+	div->rsrc_id = rsrc_id;
+	div->gpr_id = gpr_id;
+
+	init.name = name;
+	init.ops = &clk_divider_gpr_scu_ops;
+	init.flags = CLK_GET_RATE_NOCACHE;
+	init.parent_names = parent_name ? &parent_name : NULL;
+	init.num_parents = parent_name ? 1 : 0;
+
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
index 38f9cb2..10aa687 100644
--- a/drivers/clk/imx/scu/clk-scu.h
+++ b/drivers/clk/imx/scu/clk-scu.h
@@ -33,4 +33,7 @@ static inline struct clk_hw *imx_clk_divider2_scu(const char *name,
 	return imx_clk_register_divider_scu(name, parent_name, rsrc_id, clk_type);
 }
 
+struct clk_hw *imx_clk_divider_gpr_scu(const char *name, const char *parent_name,
+				u32 rsrc_id, u8 gpr_id);
+
 #endif
-- 
2.7.4

