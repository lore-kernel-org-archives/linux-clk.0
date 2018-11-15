Return-Path: <SRS0=YASP=N2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D6DCC43441
	for <linux-clk@archiver.kernel.org>; Thu, 15 Nov 2018 14:30:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 589382146D
	for <linux-clk@archiver.kernel.org>; Thu, 15 Nov 2018 14:30:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 589382146D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388088AbeKPAih (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 15 Nov 2018 19:38:37 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:51179 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387839AbeKPAih (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 15 Nov 2018 19:38:37 -0500
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7] helo=dude.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.89)
        (envelope-from <l.stach@pengutronix.de>)
        id 1gNIf8-0001Bd-9o; Thu, 15 Nov 2018 15:30:30 +0100
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     NXP Linux Team <linux-imx@nxp.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de, patchwork-lst@pengutronix.de
Subject: [PATCH v2 2/3] clk: imx6q: optionally get CCM inputs via standard clock handles
Date:   Thu, 15 Nov 2018 15:30:27 +0100
Message-Id: <20181115143028.19087-2-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181115143028.19087-1-l.stach@pengutronix.de>
References: <20181115143028.19087-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

When specifying external clock inputs to the CCM the current code
requires the clocks to be in a "clocks" child node of the DT root.
This is not really conformant with DT best practices.

To avoid the need to deviate from those best practices, allow the
clock inputs to be specified via standard clock handles. This is
in line with how drivers of the later CCM driver revisions on
newer i.MX SoCs handle this.

As we can't retroactively change the DT binding, allow this as an
option with a fallback to the old way of how this has been handled.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
---
v2: correct third clock name, as per review from Dong Aisheng
---
 .../devicetree/bindings/clock/imx6q-clock.txt |  3 +++
 drivers/clk/imx/clk-imx6q.c                   | 22 ++++++++++++++-----
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/imx6q-clock.txt b/Documentation/devicetree/bindings/clock/imx6q-clock.txt
index e1308346e00d..13d36d4c6991 100644
--- a/Documentation/devicetree/bindings/clock/imx6q-clock.txt
+++ b/Documentation/devicetree/bindings/clock/imx6q-clock.txt
@@ -13,6 +13,9 @@ Optional properties:
   management IC (PMIC) triggered via PMIC_STBY_REQ signal.
   Boards that are designed to initiate poweroff on PMIC_ON_REQ signal should
   be using "syscon-poweroff" driver instead.
+- clocks: list of clock specifiers, must contain an entry for each entry
+          in clock-names
+- clock-names: valid names are "osc", "ckil", "ckih1", "anaclk1" and "anaclk2"
 
 The clock consumer should specify the desired clock by having the clock
 ID in its "clocks" phandle cell.  See include/dt-bindings/clock/imx6qdl-clock.h
diff --git a/drivers/clk/imx/clk-imx6q.c b/drivers/clk/imx/clk-imx6q.c
index 59f6a3e087db..bd53c403bcc1 100644
--- a/drivers/clk/imx/clk-imx6q.c
+++ b/drivers/clk/imx/clk-imx6q.c
@@ -414,12 +414,24 @@ static void __init imx6q_clocks_init(struct device_node *ccm_node)
 	int ret;
 
 	clk[IMX6QDL_CLK_DUMMY] = imx_clk_fixed("dummy", 0);
-	clk[IMX6QDL_CLK_CKIL] = imx_obtain_fixed_clock("ckil", 0);
-	clk[IMX6QDL_CLK_CKIH] = imx_obtain_fixed_clock("ckih1", 0);
-	clk[IMX6QDL_CLK_OSC] = imx_obtain_fixed_clock("osc", 0);
+	clk[IMX6QDL_CLK_CKIL] = of_clk_get_by_name(ccm_node, "ckil");
+	if (IS_ERR(clk[IMX6QDL_CLK_CKIL]))
+		clk[IMX6QDL_CLK_CKIL] = imx_obtain_fixed_clock("ckil", 0);
+	clk[IMX6QDL_CLK_CKIH] = of_clk_get_by_name(ccm_node, "ckih1");
+	if (IS_ERR(clk[IMX6QDL_CLK_CKIH]))
+		clk[IMX6QDL_CLK_CKIH] = imx_obtain_fixed_clock("ckih1", 0);
+	clk[IMX6QDL_CLK_OSC] = of_clk_get_by_name(ccm_node, "osc");
+	if (IS_ERR(clk[IMX6QDL_CLK_OSC]))
+		clk[IMX6QDL_CLK_OSC] = imx_obtain_fixed_clock("osc", 0);
+
 	/* Clock source from external clock via CLK1/2 PADs */
-	clk[IMX6QDL_CLK_ANACLK1] = imx_obtain_fixed_clock("anaclk1", 0);
-	clk[IMX6QDL_CLK_ANACLK2] = imx_obtain_fixed_clock("anaclk2", 0);
+	clk[IMX6QDL_CLK_ANACLK1] = of_clk_get_by_name(ccm_node, "anaclk1");
+	if (IS_ERR(clk[IMX6QDL_CLK_ANACLK1]))
+		clk[IMX6QDL_CLK_ANACLK1] = imx_obtain_fixed_clock("anaclk1", 0);
+
+	clk[IMX6QDL_CLK_ANACLK2] = of_clk_get_by_name(ccm_node, "anaclk2");
+	if (IS_ERR(clk[IMX6QDL_CLK_ANACLK2]))
+		clk[IMX6QDL_CLK_ANACLK2] = imx_obtain_fixed_clock("anaclk2", 0);
 
 	np = of_find_compatible_node(NULL, NULL, "fsl,imx6q-anatop");
 	anatop_base = base = of_iomap(np, 0);
-- 
2.19.1

