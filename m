Return-Path: <SRS0=oWSs=4T=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 312C0C3F2D1
	for <linux-clk@archiver.kernel.org>; Mon,  2 Mar 2020 15:58:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0E07C21D56
	for <linux-clk@archiver.kernel.org>; Mon,  2 Mar 2020 15:58:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727450AbgCBP6d (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 2 Mar 2020 10:58:33 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:47302 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727085AbgCBP6d (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 2 Mar 2020 10:58:33 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: myjosserand)
        with ESMTPSA id E1E61295BA8
From:   =?UTF-8?q?Myl=C3=A8ne=20Josserand?= 
        <mylene.josserand@collabora.com>
To:     linux@armlinux.org.uk, heiko@sntech.de, mturquette@baylibre.com,
        sboyd@kernel.org
Cc:     mylene.josserand@collabora.com,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, kernel@collabora.com,
        linux-clk@vger.kernel.org
Subject: [PATCH 2/2] clk: rockchip: rk3288: Handle clock tree for rk3288w
Date:   Mon,  2 Mar 2020 16:57:03 +0100
Message-Id: <20200302155703.278421-3-mylene.josserand@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200302155703.278421-1-mylene.josserand@collabora.com>
References: <20200302155703.278421-1-mylene.josserand@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The revision rk3288w has a different clock tree about
"hclk_vio" clock, according to the BSP kernel code [1].

This patch handles this difference by detecting which SOC it is
and creating the div accordingly.

[1]: https://github.com/rockchip-linux/kernel/blob/develop-4.4/drivers/clk/rockchip/clk-rk3288.c#L960..L964

Signed-off-by: Mylène Josserand <mylene.josserand@collabora.com>
---
 drivers/clk/rockchip/clk-rk3288.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3288.c b/drivers/clk/rockchip/clk-rk3288.c
index cc2a177bbdbf..e7d6e3a095a5 100644
--- a/drivers/clk/rockchip/clk-rk3288.c
+++ b/drivers/clk/rockchip/clk-rk3288.c
@@ -10,6 +10,7 @@
 #include <linux/of_address.h>
 #include <linux/syscore_ops.h>
 #include <dt-bindings/clock/rk3288-cru.h>
+#include <soc/rockchip/revision.h>
 #include "clk.h"
 
 #define RK3288_GRF_SOC_CON(x)	(0x244 + x * 4)
@@ -425,8 +426,6 @@ static struct rockchip_clk_branch rk3288_clk_branches[] __initdata = {
 	COMPOSITE(0, "aclk_vio0", mux_pll_src_cpll_gpll_usb480m_p, CLK_IGNORE_UNUSED,
 			RK3288_CLKSEL_CON(31), 6, 2, MFLAGS, 0, 5, DFLAGS,
 			RK3288_CLKGATE_CON(3), 0, GFLAGS),
-	DIV(0, "hclk_vio", "aclk_vio0", 0,
-			RK3288_CLKSEL_CON(28), 8, 5, DFLAGS),
 	COMPOSITE(0, "aclk_vio1", mux_pll_src_cpll_gpll_usb480m_p, CLK_IGNORE_UNUSED,
 			RK3288_CLKSEL_CON(31), 14, 2, MFLAGS, 8, 5, DFLAGS,
 			RK3288_CLKGATE_CON(3), 2, GFLAGS),
@@ -819,6 +818,16 @@ static struct rockchip_clk_branch rk3288_clk_branches[] __initdata = {
 	INVERTER(0, "pclk_isp", "pclk_isp_in", RK3288_CLKSEL_CON(29), 3, IFLAGS),
 };
 
+static struct rockchip_clk_branch rk3288w_hclkvio_branch[] __initdata = {
+	DIV(0, "hclk_vio", "aclk_vio1", 0,
+	    RK3288_CLKSEL_CON(28), 8, 5, DFLAGS),
+};
+
+static struct rockchip_clk_branch rk3288_hclkvio_branch[] __initdata = {
+	DIV(0, "hclk_vio", "aclk_vio0", 0,
+	    RK3288_CLKSEL_CON(28), 8, 5, DFLAGS),
+};
+
 static const char *const rk3288_critical_clocks[] __initconst = {
 	"aclk_cpu",
 	"aclk_peri",
@@ -931,6 +940,14 @@ static void __init rk3288_clk_init(struct device_node *np)
 		return;
 	}
 
+	/* Check for the rk3288w revision as Clock tree is different */
+	if (soc_is_rk3288w())
+		rockchip_clk_register_branches(ctx, rk3288w_hclkvio_branch,
+					       ARRAY_SIZE(rk3288w_hclkvio_branch));
+	else
+		rockchip_clk_register_branches(ctx, rk3288_hclkvio_branch,
+					       ARRAY_SIZE(rk3288_hclkvio_branch));
+
 	rockchip_clk_register_plls(ctx, rk3288_pll_clks,
 				   ARRAY_SIZE(rk3288_pll_clks),
 				   RK3288_GRF_SOC_STATUS1);
-- 
2.25.1

