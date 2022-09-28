Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EBBAC04A95
	for <linux-clk@archiver.kernel.org>; Wed, 28 Sep 2022 20:17:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233245AbiI1URB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Sep 2022 16:17:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231301AbiI1URA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Sep 2022 16:17:00 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEEEC6C115
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 13:16:59 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A47B47C;
        Wed, 28 Sep 2022 22:16:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1664396218;
        bh=Uxg50pIgYpOI9PE8XMmtiinzktazEO173WVuv/3uCzA=;
        h=From:To:Cc:Subject:Date:From;
        b=fd9VPIWSPV6QVLNl9K7a883IdRAHM31tFf+BhYAvQQoLz/w+XeHf/nOqJDUIHr6gN
         mP91UT3TyvowaXnLdPaIh5FzCsYbmaqYPEgKvnUttlxZel3NNvxGuh3b7uMj9OvO8m
         b8IxSGPzk4I8MaxgQzitbzb/ViLRQouHxp7HVeM4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-clk@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Michal Simek <michal.simek@xilinx.com>,
        Rajan Vaja <rajan.vaja@xilinx.com>,
        Quanyang Wang <quanyang.wang@windriver.com>
Subject: [PATCH] clk: zynqmp: pll: Fix divider calculation to avoid out-of-range rate
Date:   Wed, 28 Sep 2022 23:16:56 +0300
Message-Id: <20220928201656.30318-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

When calculating the divider in zynqmp_pll_round_rate() and
zynqmp_pll_set_rate(), the division rounding error may result in an
output frequency that is slightly outside of the PLL output range if the
requested range is close to the low or high limit. As a result, the
limits check in clk_calc_new_rates() would fail, and clk_set_rate()
would return an error, as seen in the zynqmp-dpsub driver:

[   13.672309] zynqmp-dpsub fd4a0000.display: failed to set pixel clock rate to 297000000 (-22)

Fix this by adjusting the divider. The rate calculation then succeeds
for zynqmp-dpsub:

[   13.554849] zynqmp-dpsub fd4a0000.display: requested pixel rate: 297000000 actual rate: 255555553

The resulting PLL configuration, however, is not optimal, as the rate
error is 14%. The hardware can do much better, but CCF doesn't attempt
to find the best overall configuration for cascaded clocks. That's a
candidate for a separate fix.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/clk/zynqmp/pll.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/zynqmp/pll.c b/drivers/clk/zynqmp/pll.c
index 91a6b4cc910e..be6fa44a21e0 100644
--- a/drivers/clk/zynqmp/pll.c
+++ b/drivers/clk/zynqmp/pll.c
@@ -120,6 +120,10 @@ static long zynqmp_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 	}
 
 	fbdiv = DIV_ROUND_CLOSEST(rate, *prate);
+	if (*prate * fbdiv < PS_PLL_VCO_MIN)
+		fbdiv++;
+	if (*prate * fbdiv > PS_PLL_VCO_MAX)
+		fbdiv--;
 	fbdiv = clamp_t(u32, fbdiv, PLL_FBDIV_MIN, PLL_FBDIV_MAX);
 	return *prate * fbdiv;
 }
@@ -208,6 +212,10 @@ static int zynqmp_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	}
 
 	fbdiv = DIV_ROUND_CLOSEST(rate, parent_rate);
+	if (parent_rate * fbdiv < PS_PLL_VCO_MIN)
+		fbdiv++;
+	else if (parent_rate * fbdiv > PS_PLL_VCO_MAX)
+		fbdiv--;
 	fbdiv = clamp_t(u32, fbdiv, PLL_FBDIV_MIN, PLL_FBDIV_MAX);
 	ret = zynqmp_pm_clock_setdivider(clk_id, fbdiv);
 	if (ret)

base-commit: 1c23f9e627a7b412978b4e852793c5e3c3efc555
-- 
Regards,

Laurent Pinchart

