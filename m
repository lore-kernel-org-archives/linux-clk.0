Return-Path: <SRS0=aw6K=MH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 649CAC43382
	for <linux-clk@archiver.kernel.org>; Tue, 25 Sep 2018 16:59:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 10034206B5
	for <linux-clk@archiver.kernel.org>; Tue, 25 Sep 2018 16:59:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="kd4pfB4P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10034206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbeIYXIL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Sep 2018 19:08:11 -0400
Received: from mail-eopbgr70052.outbound.protection.outlook.com ([40.107.7.52]:28491
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726922AbeIYXIK (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 25 Sep 2018 19:08:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmQNfqkRoVm6YWOtUq0KmQtduOwOk4FaMHzr3dgV9vU=;
 b=kd4pfB4P7JvTKIgbBue59mwpMZbrgEjVsdH4u8KkpTb7AjKuym2Bll4vsfCgxMgAvFO0MkX2bANwlfeIw3FFO5lVB0OQU1a3FibSTsP2GVelOyYSgwLuc75RSzAZd85hH5s8xve2HJLN5lKw+rGFi0xmwwgln2dgtjLpmXXmhgM=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
Received: from shlinux2.ap.freescale.net (119.31.174.66) by
 AM0PR04MB4211.eurprd04.prod.outlook.com (2603:10a6:208:66::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1164.22; Tue, 25 Sep 2018 16:59:23 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH V2 07/11] clk: imx: scu: add scu clock mux
Date:   Wed, 26 Sep 2018 00:43:53 +0800
Message-Id: <1537893837-31172-8-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1537893837-31172-1-git-send-email-aisheng.dong@nxp.com>
References: <1537893837-31172-1-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK0PR03CA0033.apcprd03.prod.outlook.com
 (2603:1096:203:2f::21) To AM0PR04MB4211.eurprd04.prod.outlook.com
 (2603:10a6:208:66::21)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3449ded-7117-4c89-ddce-08d6230840b9
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4211;
X-Microsoft-Exchange-Diagnostics: 1;AM0PR04MB4211;3:lBmQtYR1mOO5MGgSaTLqp0nhPeM9geiHICT65LngZYDTyzeg02Uau9floEIVNmkBIh7VWzNTQA9dZQF8jLOSJ/FQ8wzwpYr/p59urlvIRQX/BAsRSDZ9EEpTvAMAUGHhKVtS3hftfXr5OxJeOraD+xJyyXzMwUyd1WbcgkbMaY2e5LsSTd0hg/DlfO8rP0TTJKn/2RIEzisGwTUQUefITGrtXbG2NHQm4LKtIwgImw8LkIJaHJ198vFHSVfiYSFf;25:ve0aCPtA9Fp1mNaU8HIGywFSgvZY4q+8tDkpbIuziq0/WEqKteAhdm+aT3t0u/h+peyir9WVv8KLzny8K8UG5JZV+VINHkiWPwDulbQ1ZmmEGv6Csm8izqudQO3wrbEBTHT21B551h+6/1biBXtQuLDngrKbcLkqzElWzz+Jp4kR1NswzxoSVZMM5D3T0VvpNVT+CoCUho/cQJvwvPvfpDvRjrYJdT/+DxA9j8Roc7Yz3LBsaQ2PE1wMcvsH05J8s3WDxtWTvDEXMFl9YXNm7OLKIbES3RigKFHnkUpJA9pJELhjRM41XBcfgUTnrvuLPa6MW5faEHxO0o/ArpFB0w==;31:obfqEivYxLYmSk8Cit0QDuTpqF3n5BINkp8Ji1Ch5ZkGRkLNd0EtAfh+wt5ACR3gYKzW886u3MOso+Lg4pxTyrunLFltFVxDNl1AKRWiySOOJkoA1uGoYZKyWE4ImcHsAVOtetaLSZ1Sh9QkofO9VIfEqn1EOtL9/xpFvm1BNsCGONqePZbIKxAWCJwyeC6ZXTFJHLKysA9vx9EdQB9n0gKDk5qagBdR4K24RQ6dz0I=
X-MS-TrafficTypeDiagnostic: AM0PR04MB4211:
X-Microsoft-Exchange-Diagnostics: 1;AM0PR04MB4211;20:Ll/6aLgk6Jn4rqKcagA2ikrrVC0aB7A8MGCw0nM52qQ/iUNoJ2xxyqbsRnRjC2wEYGooG9EGsTwVm2RNM1WG+kHPCe5gcwVpFBKHZhvDdg71j7Gr/Y1WvtzErGg7rySUGuE1QZxjIrcpwSDk91FgTXLkUN3VWzr5/A6DJ6HeIrcd63e8QsV3YrOX3fpDoJ4PzkZ3Zt3iNlqzoeCFH25WHEHKPA8+vryLdczo6DrxE3eQNHObie2OQEBjiy4Rqlv769RSO8ZLTa+FbnYO6gHy+kvNeVa4QveZLLnxWRF5tL0Nc0lvkBA3J65Id2ema4O7IwnEQmu1MVE6BLqSaL50d78VtqPSIQUxbyIQ/AEZ0WNO3I1fNHw8h0chCFtF/2DiarwSVPgeBIARh1w6DLFVAaeEyVlwqJpodCmLncrPZ6B1gN8mr8ETv++ACzYBONVXO2X1xtdyXJGs7KkI+Ad/Ht3zUBXnCidmQ8KOgS/awpgoLPVIoWW2X5Pekgcz95FW;4:GxesGNhSaMPWtMrTgd+5uk+vtYT0Bt5S5rIrlSOx3aBZKBMsFC0cfnMVSHmSrs84v5kn5PuwPNr2/9WWlNyESYprZga8GkPhkvpLfQF/GZymY4avk7nOI8mNX31ej0C4JWODpptzpL2GnFyKDE4BLypqZ6OLY1lGMuwx2CsOLMD5qZEkmSLLwTQn1Quvo77i0qzWHO8aPo2r1xkJtVb04FORtcXQFkLzX1/EHpRGxORoIWc1FdOU2DIDHOJpJFB5beGs/Fe6rR8OiXA2mW8DpfClrPvgrDYSVkh+YM4S2i1DFh4qUlCGw6drKtYlwjZ6
X-Microsoft-Antispam-PRVS: <AM0PR04MB4211F36C1301EA4EF68CB56680160@AM0PR04MB4211.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231355)(944501410)(52105095)(3002001)(93006095)(93001095)(10201501046)(6055026)(149066)(150027)(6041310)(20161123564045)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(201708071742011)(7699051);SRVR:AM0PR04MB4211;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4211;
X-Forefront-PRVS: 08062C429B
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(136003)(366004)(39860400002)(396003)(346002)(376002)(54534003)(199004)(189003)(478600001)(6486002)(11346002)(446003)(53936002)(6512007)(68736007)(2906002)(48376002)(6116002)(316002)(3846002)(34290500001)(14444005)(106356001)(186003)(16526019)(2361001)(2351001)(26005)(305945005)(7736002)(486006)(36756003)(66066001)(4326008)(47776003)(25786009)(105586002)(6916009)(6666003)(50226002)(97736004)(81156014)(8676002)(16586007)(5660300001)(956004)(52116002)(386003)(86362001)(2616005)(476003)(76176011)(51416003)(6506007)(8936002)(50466002)(81166006);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4211;H:shlinux2.ap.freescale.net;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;AM0PR04MB4211;23:ZVIpezHtx6mtsYSn10gheaWq2qJlK8bwV4H1h6sdZ?=
 =?us-ascii?Q?gFAb2Qe784Nf3uUQS77xmyEOQ3NkepBMWG/UAKFJc3ZZyjBqzazRYahBtWnk?=
 =?us-ascii?Q?2AXlwS/dqcb3Ey4Aj0MLR36uPcYVXDWj+ksE9qtDzMcPuniFibD3vdgYtHRt?=
 =?us-ascii?Q?oyX3SaDFR7SBXc61izcuiWrDNMT9vMDVJWol31fgtybinvhA2c1mGP42GgHW?=
 =?us-ascii?Q?nR1oDPiQJ6GJgLp/nTR+AUXyxyFwP9YhtPkKWlIYb47knPc5AQsgIbLXLgdp?=
 =?us-ascii?Q?1AA7BJr2VJdwLbWs1tEPYCY/9oQw6YwgpTczK3bikpIzSPcoo2SkDdi0Ofnd?=
 =?us-ascii?Q?4t77b0CfX6XPtXrs/UWeGRO5lXzYy+Af1Wc7sYun+BdJKtEW1r0neJ5du+Bl?=
 =?us-ascii?Q?kQnqCJY9w0C9Py8ijTD65trEBXngym01llw8P0dlOrUUfBxpDtUhTvvdmFh2?=
 =?us-ascii?Q?yl8xcpW8MpUPL1emyOJg3aZuZQR1HmMzjwp5kPCWPeIFuop3mTvhNFVtSJWE?=
 =?us-ascii?Q?C5DtY9ox/k9sv56XOXgW12On11pPFquvHwi6O22Mb8qz5ZB7SLdPBf4OIdie?=
 =?us-ascii?Q?8Ey55PlsFfv8ygHK2C19jqQf45fzJGpewk3rCdYfECEMix+b8gkZ/uMMsmxF?=
 =?us-ascii?Q?c7BgohevRU1lIZ0SseFV15+y/EjLz+plbkQREmSFYsdWx+2QeZkPQvxzo17R?=
 =?us-ascii?Q?eM15a0dv97H0O2GCJHIjvu6RZsKTzqa9PgqrJRZxCGSsPAXMtZXqDTzSzbO8?=
 =?us-ascii?Q?7mwLAoUf7v27AHpF6wAUfge/zLqDosRaMhpKp1OZv5J4a2qb6HOwM0mv/HCW?=
 =?us-ascii?Q?v0MUY7uSjY7J0hDnEc7RgZWG9SczPLR8rjqnWCqrxWkwvLWMVruKpxFHPxVg?=
 =?us-ascii?Q?geiOHP90csz9dJ1+fx26mMYTRvZ0PswL/6tGfkGg3kathL+0ipRXaCKALKgm?=
 =?us-ascii?Q?JTn1PNwRnxtiRvg1Jcg+grQNwWX9AQAHlZ6HK5y3fkL5xLZYa3bj731nGEdU?=
 =?us-ascii?Q?WzYNatd5JM18uivjdAv7xLCGkDDcNImaKfmcoQwWacEBMlM4Fa3n9/qvZETr?=
 =?us-ascii?Q?mvmwSxRIPzb0GyXa/Zl77YYrGFVAb87kun7F8GpbHCxhMsFmlQeyyuCezRJA?=
 =?us-ascii?Q?AfdRQTkdRbncyBqE/0zFPQGrzLbt8juAFZcalAbcRGTlrhFrSeuyTu3CRQ5y?=
 =?us-ascii?Q?Om1l7PsCHSgYKjCsUyJoQlNQ8gYfzCUhiCDIN0X8J3vSNlvc98Fao+/eBse+?=
 =?us-ascii?Q?wXQfcESfb9lO5wgjqMVUa4xyjtZzohnNhuok918?=
X-Microsoft-Antispam-Message-Info: cTjWDIxh7JnRTLKqTGHsXhfqQbQMxeRDCtkpLeTNBYcoHtG+wkcxz54prxVYLZqb1tO+x7VCgSJCTK22b/wzP7EvPud02djKVhm545s7GuItqbI5f4UKhRosmhn6+WAWc/9RAMxD2kTNVuEyE7G6DGij2roA94pNxArhGWF3//VIa6JwDVQmvSP2kp5Bfv6Fh73JPIOzQ1yS/B7Ba1ix4LTI1/gmamqisy4RtXl6z9FI182o4UIEfBvnUgF+NRJRaoMFzL4nOSmsTqVfz49ppHUYTcmG+KD6mFPUMacdCw4mNPe203xLGhznCkb+mHg6MDd21nkZF8/VUVeJUydBAl9HT9/WEGlwYYV5vW/aMq8=
X-Microsoft-Exchange-Diagnostics: 1;AM0PR04MB4211;6:cVVWfMCx7i8JUEG2vlvcoKA4jOYkXsJk9sCpS0F2Ug4Va0dpUYUGg+h7HRtQjw3pYT5w/Bt0sO0cfljgqvS13VoXxhpnj09JRZqNLiEzkW538aIW359nhKaOweaWa9sZZb8vAjDLcbSPB4wSXGErU1eFG3YcSZOSdDrf7gZeZzxufcGvDqkDPFW5qlMDbfZuya8oQT9T0aFgQ6uBi1BqQf3JjOWpz9yeIPQveWiafBBPeugobKEY5DTVoC8qgvoWiUgZ03EfnQE6Xs8KL2x2iTTNOzgA1R/NnV/5AYTiCmf/Hr9cY7QYsd6WKgFfVCziMLhj+HV6dxHG0fJ/B4FfAjfiv7RK5rSyxTak0VTX+FAvGmSKDeBZXmyClVP7SrQY52G8MJraEWUoq5DvtyM9fjGqhfEX0V2xcLDJjovOaDCawP5wKC6pOyjZLFWdUF0Ac5gdrcgJ8rBK1nf4SwlDqg==;5:RuTtp/heeyOOqOY4FvuW3kGbdMeP0D1kSTujmM3q2ZKjrGlyftdQj3HyAebiXDk6KVL7UqUvkVgZc4fpZqBIqiI/1bmZO+usDFJpdxvlFxPFoW0R/lK5eYDIKhO7RD9Nil1pRnxZzJPhGGL1nMkyyId7Pzb+YkJ38G3JUbzl5A8=;7:L4+qYaM026veGwfr2yDyUQMzdDbY52kXR9Z4/0YPdIOYFJa04BDN0aspX/Np9sli4L2WukfHRJ0edDfhmEz4eJj/OqtLY87g/C2+CXsmRAZ/wqWW7sGiHSEWTscin2m4H9GFumIiSgps90N6vlcKerUn+spsn2+BDcseXP7cNPHTZNrHJCUvFW9k1d76cu9qyflrqv3nVKu9QKbhtAUbdlv1J1XqAuGNFohbRseUaS6fpzv8kMCRlNtlOndsZmTQ
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2018 16:59:23.9637
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3449ded-7117-4c89-ddce-08d6230840b9
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4211
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180925164353.rMn7ALGcZGwQY4LJ6yavRpdlM4b2GgW7YRGmfZbJhSU@z>

Add scu based clock mux.

Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v1->v2:
 * move SCU clock API implementation into driver
---
 drivers/clk/imx/scu/Makefile      |   3 +-
 drivers/clk/imx/scu/clk-mux-scu.c | 142 ++++++++++++++++++++++++++++++++++++++
 drivers/clk/imx/scu/clk-scu.h     |  13 ++++
 3 files changed, 157 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/imx/scu/clk-mux-scu.c

diff --git a/drivers/clk/imx/scu/Makefile b/drivers/clk/imx/scu/Makefile
index 25d3511..aee56bf 100644
--- a/drivers/clk/imx/scu/Makefile
+++ b/drivers/clk/imx/scu/Makefile
@@ -5,4 +5,5 @@ obj-$(CONFIG_MXC_CLK_SCU) += \
 	clk-divider-scu.o \
 	clk-divider-gpr-scu.o \
 	clk-gate-scu.o \
-	clk-gate-gpr-scu.o
+	clk-gate-gpr-scu.o \
+	clk-mux-scu.o
diff --git a/drivers/clk/imx/scu/clk-mux-scu.c b/drivers/clk/imx/scu/clk-mux-scu.c
new file mode 100644
index 0000000..bd6f51b
--- /dev/null
+++ b/drivers/clk/imx/scu/clk-mux-scu.c
@@ -0,0 +1,142 @@
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
+struct clk_mux_scu {
+	struct clk_hw	hw;
+	sc_rsrc_t	rsrc_id;
+	uint8_t	clk_type;
+};
+
+#define to_clk_mux_scu(_hw) container_of(_hw, struct clk_mux_scu, hw)
+
+
+/* SCU Clock Protocol definitions */
+struct imx_sc_msg_req_set_clock_parent {
+	struct sc_rpc_msg hdr;
+	u16 resource;
+	u8 clk;
+	u8 parent;
+} __packed;
+
+struct imx_sc_msg_req_get_clock_parent {
+	struct sc_rpc_msg hdr;
+	u16 resource;
+	u8 clk;
+} __packed;
+
+struct imx_sc_msg_resp_get_clock_parent {
+	struct sc_rpc_msg hdr;
+	u8 parent;
+} __packed;
+
+static u8 clk_mux_scu_get_parent(struct clk_hw *hw)
+{
+	struct clk_mux_scu *mux = to_clk_mux_scu(hw);
+	struct imx_sc_msg_req_get_clock_parent msg;
+	struct imx_sc_msg_resp_get_clock_parent *resp;
+	struct sc_rpc_msg *hdr = &msg.hdr;
+	sc_err_t sci_err;
+	int ret;
+
+	hdr->ver = SC_RPC_VERSION;
+	hdr->svc = (uint8_t)SC_RPC_SVC_PM;
+	hdr->func = (uint8_t)PM_FUNC_GET_CLOCK_PARENT;
+	hdr->size = 2;
+
+	msg.resource = mux->rsrc_id;
+	msg.clk = mux->clk_type;
+
+	ret = imx_scu_call_rpc(ccm_ipc_handle, &msg, true);
+	if (ret)
+		return ret;
+
+	resp = (struct imx_sc_msg_resp_get_clock_parent *)&msg;
+	sci_err = (sc_err_t)resp->hdr.func;
+	if (sci_err) {
+		pr_err("%s: failed to get clock parent %d\n",
+			clk_hw_get_name(hw), sci_err);
+		return -EINVAL;
+	}
+
+	return resp->parent;
+}
+
+static int clk_mux_scu_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct clk_mux_scu *mux = to_clk_mux_scu(hw);
+	struct imx_sc_msg_req_set_clock_parent msg;
+	struct sc_rpc_msg *hdr = &msg.hdr;
+	sc_err_t sci_err;
+	int ret;
+
+	hdr->ver = SC_RPC_VERSION;
+	hdr->svc = (uint8_t)SC_RPC_SVC_PM;
+	hdr->func = (uint8_t)PM_FUNC_SET_CLOCK_PARENT;
+	hdr->size = 2;
+
+	msg.resource = mux->rsrc_id;
+	msg.clk = mux->clk_type;
+	msg.parent = index;
+
+	ret = imx_scu_call_rpc(ccm_ipc_handle, &msg, true);
+	if (ret)
+		return ret;
+
+	sci_err = (sc_err_t)hdr->func;
+	if (sci_err) {
+		pr_err("%s: failed to set clock parent %d : ret %d\n",
+			clk_hw_get_name(hw), index, sci_err);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct clk_ops clk_mux_scu_ops = {
+	.get_parent = clk_mux_scu_get_parent,
+	.set_parent = clk_mux_scu_set_parent,
+};
+
+struct clk_hw *clk_register_mux_scu(const char *name, const char * const *parents,
+				    int num_parents, unsigned long flags,
+				    sc_rsrc_t rsrc_id, uint8_t clk_type)
+{
+	struct clk_init_data init;
+	struct clk_mux_scu *mux;
+	struct clk_hw *hw;
+	int ret;
+
+	mux = kzalloc(sizeof(*mux), GFP_KERNEL);
+	if (!mux)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	init.ops = &clk_mux_scu_ops;
+	init.parent_names = parents;
+	init.num_parents = num_parents;
+
+	mux->hw.init = &init;
+	mux->rsrc_id = rsrc_id;
+	mux->clk_type = clk_type;
+
+	hw = &mux->hw;
+	ret = clk_hw_register(NULL, hw);
+	if (ret) {
+		kfree(mux);
+		hw = ERR_PTR(ret);
+	}
+
+	return hw;
+}
diff --git a/drivers/clk/imx/scu/clk-scu.h b/drivers/clk/imx/scu/clk-scu.h
index 13af045..43009c4 100644
--- a/drivers/clk/imx/scu/clk-scu.h
+++ b/drivers/clk/imx/scu/clk-scu.h
@@ -68,4 +68,17 @@ static inline struct clk_hw *imx_clk_gate_gpr_scu(const char *name, const char *
 	return clk_register_gate_gpr_scu(name, parent, rsrc_id, gpr_id, invert_flag);
 }
 
+struct clk_hw *clk_register_mux_scu(const char *name, const char * const *parents,
+			int num_parents, unsigned long flags,
+			sc_rsrc_t rsrc_id, uint8_t clk_type);
+
+static inline struct clk_hw *imx_clk_mux_scu(const char *name,
+			const char * const *parents, int num_parents,
+			sc_rsrc_t rsrc_id, uint8_t clk_type)
+{
+	return clk_register_mux_scu(name, parents, num_parents,
+			CLK_SET_RATE_NO_REPARENT, rsrc_id,
+			clk_type);
+}
+
 #endif
-- 
2.7.4

