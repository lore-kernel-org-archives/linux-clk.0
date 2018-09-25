Return-Path: <SRS0=aw6K=MH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82579C43382
	for <linux-clk@archiver.kernel.org>; Tue, 25 Sep 2018 16:59:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 28F7920676
	for <linux-clk@archiver.kernel.org>; Tue, 25 Sep 2018 16:59:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="KQxGlxig"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28F7920676
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727027AbeIYXIE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Sep 2018 19:08:04 -0400
Received: from mail-eopbgr70052.outbound.protection.outlook.com ([40.107.7.52]:28491
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726922AbeIYXID (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 25 Sep 2018 19:08:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9XA7qaexrDEMb3LEcuQLA1eLe0zdNnZNfnFj/Ly8+0=;
 b=KQxGlxig1upjwh4paw90wGFT2pOoaNUzAGRf6Il8SNxzEHlBwKdaKcLi4BylUim+8404f2D5M9du3Dx87/dd1UequqM/4U04P7hoeRKP3/7PNxIXoPHWyrCvkL7OyaLqY4yqnUnchzmnY34pkQfWSl4g8E3OVeCfw3Vsd3wM8io=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=aisheng.dong@nxp.com; 
Received: from shlinux2.ap.freescale.net (119.31.174.66) by
 AM0PR04MB4211.eurprd04.prod.outlook.com (2603:10a6:208:66::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1164.22; Tue, 25 Sep 2018 16:59:13 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH V2 04/11] clk: imx: scu: add scu clock gpr divider
Date:   Wed, 26 Sep 2018 00:43:50 +0800
Message-Id: <1537893837-31172-5-git-send-email-aisheng.dong@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: ec4bc908-f8f0-4974-a306-08d623083a45
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4618075)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);SRVR:AM0PR04MB4211;
X-Microsoft-Exchange-Diagnostics: 1;AM0PR04MB4211;3:SudmS/8pTIv1yCQ9OGE9tBQL5n0imZlVjabZsL3XXETIF6FV2CmqccgCqUsObnAb2PGIaygxEd0H9o8n1I4baBT5HjWW90snXAqlicBOYcZox2YLyYo3vzSw7DS/pbVeiBYDxqcO5VQiUODz5KnsJtMwAqW6I4qaRJS/eatWko0gZqDArAGrC0jot5KeabuVWxYuMAe6ltH8BYMyYjHAupXflCVCMbos/Xj/rSoV4kWgMKARPfjbc+3Jx8Mdt0br;25:ze2LlIZ8Jir5F/GOBENMdEVxTmSb2ELrlJJqs4PTbAGomV7hHfcqRgwcCaPVsX+1OUl6S6qB/uj11wBLXlDjsYoQ/O8dW2Ngvm0Ln0/1hLXSWsUIsU7xOZSHlUORglh0EsVOLSA0q/jkopUT6pq/wxh5/U+0K40obRSQ491QluGn1RH8zrIwsxCmz0kNjGEXh0waLauo6ALq3EovGlXu7vmEd81OiVFV2Wcv8q3DMMZH0N+yMHnt5EllOXuL6OPOg5LXqhniykUC670jiNjoqfUu6D6CycqKsyqV4vWGSVOPRjbBBJvwoIr5vzdaGeXSl7WIrD1fy5QN3Ji1+tzGdg==;31:0+POXQtHdx34aLjEAsdt9f4VFFTmbr/3xa4PYOaZYgG9hTS6JfR0YDzmA923zOV69BPdD3rA7R6YFOUY86pvNeZEcKGbI5QR723BkILVFkdwzJ/GQPw5zUfta2fle1+Cqi2Aw0sm9FFABfxb6zznOGzoMmKetgp/EG6MYegWwOAqltm66yw9VBWAg9GdIIqTY6gxAsP16qbAB5g5u3D6uhcvcb5ki6M/PrjxvPUf84U=
X-MS-TrafficTypeDiagnostic: AM0PR04MB4211:
X-Microsoft-Exchange-Diagnostics: 1;AM0PR04MB4211;20:AIon3BEnUBAXSlzeipsEIsZlnVzxwwbX8q8audf2gB6AEn/aizMctsUYlSq0jKEh7qoqn0z0dfM/s2GrfNtOnI8/bow0aKJXgzH8ra/EDj1OtC1JQpK/lgzZ0iZbX7VYQ3wNGb1OULXW40c5+ccRCIZIqXm6uPrjUjel5351u8e2baLLFeg3g93JMkQZt16K/hF15v2zvrSeieKYE0+bjHJf8TaMo6Vmt+0jnQbK1mjSt76yWxtAj2AEt4dNwtGnbk5wZ0PBIjueOP/GsiWlZRhKEX8TakZUKhAIjTRa6gB73IkriPtgMB8vDEtZuO6KsU+YqFIye7f6fZB+hDjLHkmt00dK1YdyHMNB6YgnNjAvy+PPNGsmzFj0yveBDxyAVJQLJ7NYimGEVROncQQptiQepumQVXyR+X2+GwXvRqNSDwuKHdWQjRynuhXDbhGPWT48T9DK+GyrGRalRxn6z0BNnDoQgTP6p4D6/Io4pRKHk9psljG0na1Lx+MDRMHg;4:x5FrkFOKuoPk22BD03wPQ/UiNm6zXGYKvgTqYQz1s6VdmqMUQucR2JR0z0jKRMmEz0LSb8HcudDxFjUknwxhyReEBZYjAyIh9uIus1akLyS8kZsF9R5TZA4qDhkEMf3kJmuPNzltwhcot8pWWikOy4dU/Gav1KOsoeEBXRfm3N6nfIrUDTb2dWPAzWA9zF6X2HmZPBdbnN+7XySC5V/WT+USX7yS2aGnTzaUlhbXneXzx9KgSXc4/h4H0gVAF13Wt2L7TI/QJb7JUi2XJYdK/jzsUOEpPEE17CbLuYBXu3vLFsp6+ccL11SjPIQnofY4
X-Microsoft-Antispam-PRVS: <AM0PR04MB421141ADF63F7D5302FF3E8480160@AM0PR04MB4211.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231355)(944501410)(52105095)(3002001)(93006095)(93001095)(10201501046)(6055026)(149066)(150027)(6041310)(20161123564045)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(201708071742011)(7699051);SRVR:AM0PR04MB4211;BCL:0;PCL:0;RULEID:;SRVR:AM0PR04MB4211;
X-Forefront-PRVS: 08062C429B
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(136003)(366004)(39860400002)(396003)(346002)(376002)(54534003)(199004)(189003)(478600001)(6486002)(11346002)(446003)(53936002)(6512007)(68736007)(2906002)(48376002)(6116002)(316002)(3846002)(34290500001)(14444005)(106356001)(186003)(16526019)(2361001)(2351001)(26005)(305945005)(7736002)(486006)(36756003)(66066001)(4326008)(47776003)(25786009)(105586002)(6916009)(6666003)(50226002)(97736004)(81156014)(8676002)(16586007)(5660300001)(956004)(52116002)(386003)(86362001)(2616005)(476003)(76176011)(51416003)(6506007)(8936002)(50466002)(81166006);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4211;H:shlinux2.ap.freescale.net;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;AM0PR04MB4211;23:0k+1WqfG5kYkyd2zAN5VLPx5Ug7d0Vy3eMEmx9acG?=
 =?us-ascii?Q?AvNKAtxHmclcxZ79ymsCIXAPFXJIRK7gLHIKRQMrOn9Yv0+4tG9ezJ70DzDq?=
 =?us-ascii?Q?dzfi5PJnZTzM16YGKY47jY9AMuWRuD1ebcPL67Ez203P/j16480V3OY3lc5c?=
 =?us-ascii?Q?7p5YEvuMyFEfE5unVxZifuyjppK1h9w7hNmjjkSOK1I7EwcCPBtYKBTSlEkL?=
 =?us-ascii?Q?ULjbzNwodaq6lOveSceescpkxMHf8zsFT09685D9sJt+qpCyIKQbcXcUmAph?=
 =?us-ascii?Q?NtVQrNqpsAYfqEK1lJMnYA7IcDLlBMbI+8awMVcUVc19/HwRfn2scmofHeDu?=
 =?us-ascii?Q?+YEUm3kMCng9VQ1twht2rR56d2XQM2ipzPuKjbANQZ4+N7Dq+535ZjYP7MHu?=
 =?us-ascii?Q?IWhxLu38hEPHuWvw734tsjDCIwelTAjbodJuw8JkJXL4unG0ImuA5sVGVXiV?=
 =?us-ascii?Q?u2HiTJA9vGblreqMFVXW5kvuYUZoWiTq2bYYtoGHEM5ho7aDwOniX/wpagna?=
 =?us-ascii?Q?Q+7WCvA9dOLTImla3Lh4bUdMPjcUfYn0aresjcvqW+C4WrdN1qSgpvu5w9Er?=
 =?us-ascii?Q?367wVriT9DkULQkhBtGQNAwvWkzNOi9E7jArs/ePUlckqGGYvTMEA1nO+5ok?=
 =?us-ascii?Q?4hKY59bIo55TxGRly5ydn5Py6441Z66+YwFPFT1b1gqZNl3JmHB3wM3R5YNA?=
 =?us-ascii?Q?58V8wY2Ej4hTgLEqh7LmLH2jCKzSC2ShY8mSN2fMc2bYjI8HnwO//JNDdPSG?=
 =?us-ascii?Q?pAx/vLeKdNgm7hAGlB8LpyS3MiO8/KUZ0f1jA4TcIuU9WYy0u5Hz+aXHvWoy?=
 =?us-ascii?Q?chZA2zcAWa24t3vqZzsE3Y1nn0ThIJJhi+tnrXq5kbb5sbkrfLL9mUHhfd+6?=
 =?us-ascii?Q?jn905wIs88X4DjGbA3dzh8e/ON8sSUfnk7cowKjPhjDCEbSzFM1FF6ZYFFIP?=
 =?us-ascii?Q?ff4ZkMti3ziIeU3JTts/qBWevHQNQ/MJHaMSUSNH8aqT7nJYJ5h/sEwpxtIO?=
 =?us-ascii?Q?BtMsaO2xRnW5T0IS6YblwPZdQCJjF8dMa8kV3gria8aU6P8dtBUzNkpHRlnz?=
 =?us-ascii?Q?qwVKsWxF+SpjcmtchwBHsR5sGBUqGnt12ATvhq7fHP+ccW/hqkdMkXQLFSbh?=
 =?us-ascii?Q?nYdtguPC8VMTEQ/QzW4E0plZ3nN9JjTKSvGivEeqmvNpTh9H24Yw5lyCc+3e?=
 =?us-ascii?Q?R5INXcxTkrekQchCHjO1/fuRSJk7Oe1XYNW3uqXKBMTPY+uh84ezytJIfhz4?=
 =?us-ascii?Q?QaZ2dh/e+KL5nVL8VNPnc6ZFDvQouV4Fxi2ZHvi?=
X-Microsoft-Antispam-Message-Info: XjwZAz7HM37N1wvf5opJ8eLwH6bhMyh+jdL10R702OtGryEKa0y0KfLOYeW3OJO9SM/E4Keh+98zDVxbIpckUpDhPOwuX0lEkp/6sWO69nbb7Kje1EgfNwKntn7mbcgCEve3pqYXJ6Gj7gzf2lPyP+lVvbKNeFwXdxxEAX9YlolPUacBLgONdU/LwQoA0FqAxS7uhvXpyjApgNBkLdkf7quJBKnhgu4mvMQWHIyEMQ7gXo0yBibvTqggjpjZJ7OX7IBgzdLT/XQaQEdtwWJ5LYlV9kvfCWm7O0iu4yUB9DwPnjC9X6v36A6NUor0fwpkv/9pqOHhMr+XEXqnM/d3BfsLUFpB65DANdcJtF4MMJE=
X-Microsoft-Exchange-Diagnostics: 1;AM0PR04MB4211;6:a6EDM09xHjgznFXJH4ImYipECDjguTIn9zbos7nPHSfWW/bym/i2jtJFIXKISpCqOGVOk8DhqCoW+ztKMIV1eNcMnWTgFl/J058VOyxHya3gudmQdQ++uFPMSRH5YCxeCvQLUZUC1JVeYZ3fnfKOLU5mKWXI1KRbfVGv/sz+06entvfY0v90qZIYprQBZWut70efULmKQwAHMrjv1irePohsnGrfoS2/gRuU2CxFXdnpHFbwG3pQhPemAcKXFV38HKZ0//eaxlBOBb48vOUn5KrkJasjXhynKrtnlyrFnUw8gSmsxSk9JQx5za2BFDQHj2zdkTBRqW17r3/O++WKajcNDwJukE5D3SJP6EGpXjQBLVtHaUh0PlZH+M9cBshTPr619DLMm72oUih/1x7aWH5v/yU7EQIeE0neo8sTkx6EkXA8LddWV561v3gdeN+vQ9WRYUFsrRO98ckOucxMjg==;5:+M8VD1SsSpMSf0qBUqkOqopKYcsLS0GqceYEskKAb8iTnJodFHk5zYw3/xFQDCKeWRQe7F4IBnvw+PE8wUFd0d1URqgKwGGO7PDVv9xlkYj35joqm7mvugwJNnUneIUPj5uA7t3YihwHJcZCHuoG5P7XOKBvRYvKtX6YqgwogWU=;7:iLwNEx223euiL+Km6XVQ7bcRFDca/OBewDorrd8kkRs5EAhAEGRQuKk30HtVjZsIXRye2VCXzsCVEDfIv3yAKq2OgIVgic9dhMcoQShMlZEtuTkPt7y8cgeGkuPOcSr0Qnzk4sA8zfnJXVhAdjG6++UEahpR6pC4Akw2W9aVafRrA4yQFjrhu8CA0SvdDUBbOBh0m2uwuK92Eo9eUuI8jGKjUCApqzGuFYeeCbJc9D3a8P0uTL05uViZlCfq9B4C
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2018 16:59:13.1669
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec4bc908-f8f0-4974-a306-08d623083a45
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4211
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180925164350.cJFhvSYS55ESR0eXQAeUyrNaQnkNl8OCNb5ehOOrmFU@z>

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
v1->v2: no changes except update headfile name
---
 drivers/clk/imx/scu/Makefile              |   3 +-
 drivers/clk/imx/scu/clk-divider-gpr-scu.c | 131 ++++++++++++++++++++++++++++++
 drivers/clk/imx/scu/clk-scu.h             |   3 +
 3 files changed, 136 insertions(+), 1 deletion(-)
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
index 0000000..14deb7a
--- /dev/null
+++ b/drivers/clk/imx/scu/clk-divider-gpr-scu.c
@@ -0,0 +1,131 @@
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
+	sc_rsrc_t	rsrc_id;
+	sc_ctrl_t	gpr_id;
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
+	uint32_t rate = 0;
+	sc_err_t sci_err;
+	uint32_t val;
+
+	sci_err = sc_misc_get_control(ccm_ipc_handle, clk->rsrc_id,
+				      clk->gpr_id, &val);
+
+	rate  = val ? parent_rate / 2 : parent_rate;
+
+	return sci_err ? 0 : rate;
+}
+
+/*
+ * clk_divider_scu_round_rate - Round clock rate for a SCU clock
+ * @hw: clock to round rate for
+ * @rate: rate to round
+ * @parent_rate: parent rate provided by common clock framework
+ *
+ * Gets the current clock rate of a SCU clock. Returns the current
+ * clock rate, or zero in failure.
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
+		unsigned long parent_rate)
+{
+	struct clk_divider_gpr_scu *clk = to_clk_divider_gpr_scu(hw);
+	uint32_t val;
+	sc_err_t sci_err;
+
+	val = (rate < parent_rate) ? 1 : 0;
+	sci_err = sc_misc_set_control(ccm_ipc_handle, clk->rsrc_id,
+		clk->gpr_id, val);
+
+	return sci_err ? -EINVAL : 0;
+}
+
+static struct clk_ops clk_divider_gpr_scu_ops = {
+	.recalc_rate = clk_divider_gpr_scu_recalc_rate,
+	.round_rate = clk_divider_gpr_scu_round_rate,
+	.set_rate = clk_divider_gpr_scu_set_rate,
+};
+
+struct clk_hw *imx_clk_divider_gpr_scu(const char *name, const char *parent_name,
+				       sc_rsrc_t rsrc_id, sc_ctrl_t gpr_id)
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
index c433cd4..97d8bdc 100644
--- a/drivers/clk/imx/scu/clk-scu.h
+++ b/drivers/clk/imx/scu/clk-scu.h
@@ -33,4 +33,7 @@ static inline struct clk_hw *imx_clk_divider2_scu(const char *name,
 	return imx_clk_register_divider_scu(name, parent_name, rsrc_id, clk_type);
 }
 
+struct clk_hw *imx_clk_divider_gpr_scu(const char *name, const char *parent_name,
+				sc_rsrc_t rsrc_id, sc_ctrl_t gpr_id);
+
 #endif
-- 
2.7.4

