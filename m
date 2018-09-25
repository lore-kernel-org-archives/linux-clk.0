Return-Path: <SRS0=aw6K=MH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E33C43382
	for <linux-clk@archiver.kernel.org>; Tue, 25 Sep 2018 16:59:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7BF8F206B5
	for <linux-clk@archiver.kernel.org>; Tue, 25 Sep 2018 16:59:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="ULSn8z/S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BF8F206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbeIYXIH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Sep 2018 19:08:07 -0400
Received: from mail-eopbgr70052.outbound.protection.outlook.com ([40.107.7.52]:28491
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726922AbeIYXIH (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 25 Sep 2018 19:08:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3r9mZHr/fY+avIBSDHPMwzb84Stu5L20xkKUzZBqhaI=;
 b=ULSn8z/SMU8JfiVU4kxLYn3dlXQGYftOlNinsKDe+6wyET1VdNPI8wRtSli59T69xnnBclYy3pXPsNJcDNuJDERjDryRlTC0eP8wAHAFCaHGXStbW0JPW+fhoAauS74P7Ffpt02Atfi4dIadQnVhXuYVBwAKgZLdie2padx6xBQ=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
Received: from shlinux2.ap.freescale.net (119.31.174.66) by
 AM0PR04MB4211.eurprd04.prod.outlook.com (2603:10a6:208:66::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1164.22; Tue, 25 Sep 2018 16:59:20 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH V2 06/11] clk: imx: scu: add scu clock gpr gate
Date:   Wed, 26 Sep 2018 00:43:52 +0800
Message-Id: <1537893837-31172-7-git-send-email-aisheng.dong@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0ba371fe-0712-4852-0e40-08d623083e61
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4211;
X-Microsoft-Exchange-Diagnostics: 1;AM0PR04MB4211;3:QHxZ84zG2hFosq1rLk21Av8naNJnk9gSV02k54qMHg0UPM3KFdN17DHy/259lV6RKvpH6CeEBexbIP6OfINefCS+uBJateGTtREHBPnSy597vBjsNvEUpwLC9r4NX/nV+xsYfsbC/h34SEjLuzYenn1PtjqYmhhrreiavMakYi109kl8fQPJ4LDXNUq25Q241VLfsLr5Vjgf6YOnuMgquP/h21COTu4RcPu41YnZjYzWqGQmOFmYQLSfAXN1Pwia;25:GUmlDiVvmw7dx51BwHwmRHkhvyrQXMwRybXYJw3Yu56W1tUuoXqAg4FHZntVhgvSaYCjOzfsZltECOSnmdvhGLe+dTpE4cHIERZ1O0O9Tk52QgejNTOTkFBStKs5aCyMMzcivJdqjyBCzv8NYBiouM8GZDD9pjcRD8Qf6sVp3+SjOS/JXC8FuLVU4CLQIreI+GIUoWuBxJQN/2yO2ZMdnMeXQE1iOioCHpfkfB0+FhnpRj2OGYvmK1cxm9URYY4MLhahOjK5z9LR6TbpLPZ7+X7Xtifz8Q+7v4WQS2CxI+hfYSjc0tFfxETeBFghvCS0WzHkq4NFHXLJuxS/xiznQw==;31:t5uIJWL1PvEufnEGhJr7Cxcwz6ghq/VNNjbeYtLYJoB53S8BoJbdpGTbNl5Jksv8AN8iJ7VIfpvQi286GGGHP+brpBvWkTC9RMEZxObsg7On6OTsJPosde42i/WjhmtbDop2EAvP5UlToMWFcoSbKuDSqOKYmobK8MnDOpX1GqqENQl0bO/mzqxN77Ye+7gG16rNJy1hnTr33yjRWk2tQHiMmtdpcoPYVC8K9ejyNfM=
X-MS-TrafficTypeDiagnostic: AM0PR04MB4211:
X-Microsoft-Exchange-Diagnostics: 1;AM0PR04MB4211;20:YrHQA/28BQ6iJRWlPXr0nY9noE2EHHYBT6QVCTKjkG0MutaezSThRhNnHd4aVSa2OjWWv1xhMsA9mOo9g/dkN+v6oy7E65wLSRJparLjCjauU3oH2CeHIlf/pxON4tddIs0qSJ3oekjOi0d31p5DebcnSkqyFB0mesDj4d7ml2Iht8FleTAsp2wcBDQ7N2ImxFJRWMUmWVrL5mkLtvZBUqaMQ+KZuXPPIjqHL5pOLYjz7CpE0cas6W+USH9TErHhc4ZTsWrtQbHDl2BxtE/ZMZGZaYjWI+ig3AzinbjOMVEgSPmqRJ2ywZkk3/te9Gtte6kmWkZFwWU9AZtxFgBs7EI6osofgYhvP9chEC2j0KRwo+SkBL5RsC6iTBGsyzOg5wDFNmdoX4tD+ZOwI5tFJS7tF9YGGWSAauNJINZVr7Fu4pHtPtF+cN7wa2YWDFQoJg7N23gZDSS+DDk7nsnYCAEuVXvTVFPTdSeX6mkCeStrch0j2iIcU+eB8ioyeovZ;4:PPpQSHse1vCXXrW5nZBmzbom0bjnelbCdrvi3HjbYIRU7UYl8IGdAnWFC9DIjM/NJ223HQGo1VVSCOvnqt4sB9wUUrKn77q0odRhQHbnqVi21jgkrq2Pln3Z3M144RgYdE5Z5bUpEh1JdMRFm7ScAQ1LYp5r6GUa8VF/kjYPAoI+t0hRasdWBVq8GS2oLOwpgYfnLHunJjBexDEMmf85QgI5AkBwLLtKAKygO3lXW7lqSaFhfDjtYQBzWZMQt9GdO8gpuEz5Kredj9DDF0BzAL5iKm52eVlEBeWo+n5+p+VDgJ+ce0kcXM48DbmNwUO4
X-Microsoft-Antispam-PRVS: <AM0PR04MB4211D37C5D27CBCA4210729480160@AM0PR04MB4211.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231355)(944501410)(52105095)(3002001)(93006095)(93001095)(10201501046)(6055026)(149066)(150027)(6041310)(20161123564045)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(201708071742011)(7699051);SRVR:AM0PR04MB4211;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4211;
X-Forefront-PRVS: 08062C429B
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(136003)(366004)(39860400002)(396003)(346002)(376002)(54534003)(199004)(189003)(478600001)(6486002)(11346002)(446003)(53936002)(6512007)(68736007)(2906002)(48376002)(6116002)(316002)(3846002)(34290500001)(14444005)(106356001)(186003)(16526019)(2361001)(2351001)(26005)(305945005)(7736002)(486006)(36756003)(66066001)(4326008)(47776003)(25786009)(105586002)(6916009)(6666003)(50226002)(97736004)(81156014)(8676002)(16586007)(5660300001)(956004)(52116002)(386003)(86362001)(2616005)(476003)(76176011)(51416003)(6506007)(8936002)(50466002)(81166006);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4211;H:shlinux2.ap.freescale.net;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;AM0PR04MB4211;23:lh1OehECp3g032WlM18JJprlpEla2uMOLMkBSBz9z?=
 =?us-ascii?Q?voSxogNLtBn8yEaejda9Ru3IX+jZqV3JjzMpVg2zv6hwk7KCOvji6ENGCauO?=
 =?us-ascii?Q?/TmRKyh+4jU6HROpypb6b7ImlSR0OvzYDfSaEx0WEnKUryZUGga46hOeKViK?=
 =?us-ascii?Q?4ckcQb2MdqPsg86FCyg9Ag8RAPyqHR+3lAtJ+nho0T6v2JNy5Rw8/6lD7RcI?=
 =?us-ascii?Q?uO7yv/nzHb6X771kpL7ITONj6ileUp/dHKRP1dZURQ1OCRp2MYIdPO4EeHEV?=
 =?us-ascii?Q?bMkg7roeLZoNeU5lckwpRvqvHjfWh6ChGnTx7q2Iasqz6AXCVaodOj39Utvb?=
 =?us-ascii?Q?L47eugqai81Eb6e/7ubLW9OqprDWDhTMg0k51OIDkEQp4S3jmgOHMnzW1pDn?=
 =?us-ascii?Q?CUrfomDPfIfhPPllwBX6VFE452EVkfMLHRh9hnjaePbGjTFOgEusdH7xZw8Y?=
 =?us-ascii?Q?wWbtZFFmQN8B+euJaulcPjDqRCAVaJEqOhHs6Q+PyUTGDYH2Ko57m/8RbUIW?=
 =?us-ascii?Q?icf4dueVflnT6CApa8bWuBlSu3MqnX6tWttpuWIYDgshkpu+U/IQB/NAeROy?=
 =?us-ascii?Q?QKvbFkr59UE1R2CjKBLJJmQ1zGUQ92Sc+568Zb44gVYIRekUhDcnKhzL+9QR?=
 =?us-ascii?Q?BC85GJKoymear2lSEsy4zBF/2FRWdlvwnsNaTvvBrwNHNthh0zTaYIz6AH0n?=
 =?us-ascii?Q?T7NfUROfFZSfqcoJa7g8zd0DrS3rLlJZ54t8qrrfi9EMuP6H84fQk8kigFBb?=
 =?us-ascii?Q?r7d3OXYAQnoe/G6y0tCu7Stzu7bVTzX7YX9s/QxEE0UKD11AlGGiW0Xwg92S?=
 =?us-ascii?Q?W/1vDYPu5M5WKSj5miDmTTl62zFZMjWxMu0ddbGNW/RL/yGceGWPUe/zlGy+?=
 =?us-ascii?Q?Zto2fw2MKFhtBdlMV70z+O8ZWULuDRt/NKU/fh0+vCuMhwqIyHq9Jx+jROn4?=
 =?us-ascii?Q?2b+y1V7UBbA59yfa2bmYpgMLb8i+MrdJwDooR/Mfl35nrSe8WNugo60Hp8g5?=
 =?us-ascii?Q?s3iLjwJG4yN/zELB10YwPipnP6LPyX0aicAb26By2XApxirzahO9HoJV0chm?=
 =?us-ascii?Q?5vvFeahvxlAoq0CMyFCjHAVR+nP780FWf3Ga2pBsy6Vip8dCwn//rXp+WQH6?=
 =?us-ascii?Q?/0dZ2LkxxKK1TIVOToO0rpForsWfUhQj5XaFWkazirf7AwoVAbWjxGqcj4TV?=
 =?us-ascii?Q?Eq4i1/VWwEtR1VO0ztV9/R/4xnYUgB8O32tTKVOyqmBm35AyaSNa4zi85htA?=
 =?us-ascii?Q?tI9djFBpstRJhFi7lV8H50eHzmf9lCPg9+B/YQq?=
X-Microsoft-Antispam-Message-Info: SS+/N0zzK48rheSGJYhJMXEK44eX46prAQVaDp20zZinQGEfdXbzAmWREYDIPvaiGv7vTh3YKxf2o1qI3P9DNAFvXCsXCjJdbRqAqbKdmYxx/9eGGSzmJSZqRDc26LUKc049gR839L0H/I8ZJ24Py6XTn0BAJjeWNyDu5j4vwGPuHbCBtS6rMw1TygNacEKPSBlKD1P1dnNXakQB0hujI9tnIS6FvUt8dBkIY+fJ0OUEBQflevKQpfwhL+PVt5zuOd1EP9s9/vbxy+ySt0tx/3EB1sAkQkx59n6YhsefQrdJwEhPE2toVBhxmQ2jN6hn4Zm55OSRcvZkHMiU83xR/rF9xxyXLvippJ15wtqIY4o=
X-Microsoft-Exchange-Diagnostics: 1;AM0PR04MB4211;6:dXss5mN47QsH4y6aYUJ7gim8eiTIQoFZGblO3rWn5QuqcjDGhkKVs5m+3lCu6YImliNP8Njk6sX1GyL4sciIh4bxcyD/1c4tF96Rzh13L8anUT6yavz4Ege1ZRNwOYtySgxerW+LJYVCbp6k1x8if0UGSpwkPfDbFKH0YwRmsWjftKdIDzgrg8bmdKjlY7rmL9jiALaH8J0vk09ZX22QKY4LqVuaENvXnC9CWsKfjOl2IDCMQp4ibGWRelHuJUJNTz6haGI8WLrueQ9RiCqZbE5Nt5leOJWR6YtJiAyNpurB1kbySTebMKunyRcxHN77/2H7C872KbwwJSmRrvX1+o9jTozjbN8yINdOObM1sUXBpyUkM0c1vZbZL+0WA/f0XEN7rTUVxA8ZlIEnaH0ToHtP51DeCXDDikw1PRE1sZTj7bysbFybXR/T7kTlk9x0zGplh6dWeqk+FSBXbQye1A==;5:mTunazyK65EAQH4dUV2PJFyI4sS68TiNiD7Vi43g2z7s1sxs83aA8owdQR2fplVRkDYFYhyrgZaG5fdTdMJjAnulWUuWlZg8gw56FlRUyjhXB4gdx1zOhcoQjQ7730tTGo2ZXu25501bvisGItfEFLcX/2cLZ4eIJrEwsy/oTrk=;7:Wwo2rJsyc/f3zDXNLoUVTBOxR5Gma9axHyXHcLpd3tynGjw+CwdOSJ8jRm/vL2AszzoB/FinBfOms9WP+PTAZ+0vE5P9d2GNHGZB9TgFYkWyTFXcexuFlkuiN0KK0i8e4MJIU4T7YOfLd6uNlyO0HIXAsB2IQJlWAf7mC+gFo5+MTjQ2CkFmFt2hikf11tcbMXmmk+qcu2NrFECX792Gp+1O3QsWcSJTa+9ts+6nF8vFUJfBsynCQSXa4hFUOMgP
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2018 16:59:20.3387
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ba371fe-0712-4852-0e40-08d623083e61
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4211
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180925164352.iicHd_5d0F_M3y608Lzr9m-oPh30LlIGJW37KtSeucI@z>

Add scu based clock gpr gate. Unlike the normal scu gate, such
gates are controlled by GPR bits through SCU sc_misc_set_control
API.

Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
    v1->v2: no changes except update headfile name
---
 drivers/clk/imx/scu/Makefile           |  3 +-
 drivers/clk/imx/scu/clk-gate-gpr-scu.c | 84 ++++++++++++++++++++++++++++++++++
 drivers/clk/imx/scu/clk-scu.h          |  9 ++++
 3 files changed, 95 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/imx/scu/clk-gate-gpr-scu.c

diff --git a/drivers/clk/imx/scu/Makefile b/drivers/clk/imx/scu/Makefile
index 2abed17..25d3511 100644
--- a/drivers/clk/imx/scu/Makefile
+++ b/drivers/clk/imx/scu/Makefile
@@ -4,4 +4,5 @@ obj-$(CONFIG_MXC_CLK_SCU) += \
 	clk-scu.o \
 	clk-divider-scu.o \
 	clk-divider-gpr-scu.o \
-	clk-gate-scu.o
+	clk-gate-scu.o \
+	clk-gate-gpr-scu.o
diff --git a/drivers/clk/imx/scu/clk-gate-gpr-scu.c b/drivers/clk/imx/scu/clk-gate-gpr-scu.c
new file mode 100644
index 0000000..ea3d4fb
--- /dev/null
+++ b/drivers/clk/imx/scu/clk-gate-gpr-scu.c
@@ -0,0 +1,84 @@
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
+struct clk_gate_gpr_scu {
+	struct clk_hw hw;
+	sc_rsrc_t	rsrc_id;
+	sc_ctrl_t	gpr_id;
+
+	/* default: enable 1 disable 0 */
+	bool	invert;
+};
+
+#define to_clk_gate_gpr_scu(_hw) container_of(_hw, struct clk_gate_gpr_scu, hw)
+
+static int clk_gate_gpr_scu_enable(struct clk_hw *hw)
+{
+	struct clk_gate_gpr_scu *gate = to_clk_gate_gpr_scu(hw);
+
+	return sc_misc_set_control(ccm_ipc_handle, gate->rsrc_id,
+				   gate->gpr_id, !gate->invert);
+}
+
+static void clk_gate_gpr_scu_disable(struct clk_hw *hw)
+{
+	struct clk_gate_gpr_scu *gate = to_clk_gate_gpr_scu(hw);
+	sc_err_t sci_err;
+
+	sci_err = sc_misc_set_control(ccm_ipc_handle, gate->rsrc_id,
+				      gate->gpr_id, gate->invert);
+	if (sci_err)
+		pr_warn("%s: %s: clk disable failed %d\n",
+			__func__, clk_hw_get_name(hw), sci_err);
+}
+
+static const struct clk_ops clk_gate_gpr_scu_ops = {
+	.enable = clk_gate_gpr_scu_enable,
+	.disable = clk_gate_gpr_scu_disable,
+};
+
+struct clk_hw *clk_register_gate_gpr_scu(const char *name, const char *parent_name,
+					 sc_rsrc_t rsrc_id, sc_ctrl_t gpr_id,
+					 bool invert_flag)
+{
+	struct clk_gate_gpr_scu *gate;
+	struct clk_init_data init;
+	struct clk_hw *hw;
+	int ret;
+
+	gate = kzalloc(sizeof(*gate), GFP_KERNEL);
+	if (!gate)
+		return ERR_PTR(-ENOMEM);
+
+	gate->rsrc_id = rsrc_id;
+	gate->gpr_id = gpr_id;
+	gate->invert = invert_flag;
+
+	init.name = name;
+	init.ops = &clk_gate_gpr_scu_ops;
+	init.parent_names = parent_name ? &parent_name : NULL;
+	init.num_parents = parent_name ? 1 : 0;
+
+	gate->hw.init = &init;
+
+	hw = &gate->hw;
+	ret = clk_hw_register(NULL, hw);
+	if (ret) {
+		kfree(gate);
+		hw = ERR_PTR(ret);
+	}
+
+	return hw;
+}
diff --git a/drivers/clk/imx/scu/clk-scu.h b/drivers/clk/imx/scu/clk-scu.h
index 99e45ae..13af045 100644
--- a/drivers/clk/imx/scu/clk-scu.h
+++ b/drivers/clk/imx/scu/clk-scu.h
@@ -59,4 +59,13 @@ static inline struct clk_hw *imx_clk_gate2_scu(const char *name, const char *par
 	return clk_register_gate2_scu(name, parent, 0, reg, bit_idx, hw_gate);
 }
 
+struct clk_hw *clk_register_gate_gpr_scu(const char *name, const char *parent_name,
+				sc_rsrc_t rsrc_id, sc_ctrl_t gpr_id, bool invert_flag);
+
+static inline struct clk_hw *imx_clk_gate_gpr_scu(const char *name, const char *parent,
+				sc_rsrc_t rsrc_id, sc_ctrl_t gpr_id, bool invert_flag)
+{
+	return clk_register_gate_gpr_scu(name, parent, rsrc_id, gpr_id, invert_flag);
+}
+
 #endif
-- 
2.7.4

