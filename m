Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7F6EC7EE3A
	for <linux-clk@archiver.kernel.org>; Thu,  2 Mar 2023 00:58:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbjCBA6u (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Mar 2023 19:58:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjCBA6t (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Mar 2023 19:58:49 -0500
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BD132A17B;
        Wed,  1 Mar 2023 16:58:46 -0800 (PST)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
        id 084DC20263; Thu,  2 Mar 2023 08:58:43 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codeconstruct.com.au; s=2022a; t=1677718723;
        bh=0kwMhqVKXMShhj9z9nunJyIHNvvxeZ99kfoySaYtGoU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=a+eNlAW+VBKOSFkBgBOLdwafZVZonsBjJ7+SxU+WiK6EIACZ/hW3esQZHER6YrjoE
         sXxLdSvlB7fzTBVqXftuInoscOKsAASuQZrnQcHyl7iR6FiwkUqk9+2Rvn3wxF8ZTs
         TFFZg+uavm1y2LNuoBsdoLXFMbj0AKAlXF/ed2KvcfF+JuvsO0RR9bU55JcrRu99Ag
         82d475R+yR5DxhR5snO++RcvfBeRHW5a1IL9gv9W1hRbR7baB68hScnP2RImD4+0Fu
         qcqI6au2krfdTmWU2f9jBgvlo2yukQvpc9+8DHpkG+1SUqZxn4oQkMd43BNdWcH/gS
         x+gRpY882Pc7g==
From:   Jeremy Kerr <jk@codeconstruct.com.au>
To:     devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-clk@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dylan Hung <dylan_hung@aspeedtech.com>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v5 3/6] clk: ast2600: Add full configs for I3C clocks
Date:   Thu,  2 Mar 2023 08:58:31 +0800
Message-Id: <20230302005834.13171-4-jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302005834.13171-1-jk@codeconstruct.com.au>
References: <20230302005834.13171-1-jk@codeconstruct.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The current ast2600 I3C clock definitions are top-level (rather than
based on their actual hw sources: either HCLK or APLL), and include a
couple of definitions for (non-existent) i3c6 and i3c7.

Re-parent the individual I3C controller clocks to the main i3c clock,
explicitly sourced from the APLL rather than whatever G6_CLK_SELECTION5
was last set to.

While we're at it, remove the definitions for the i3c6 and i3c7 clock
lines; this hardware isn't present.

This is a partial cherry-pick and rework of ed44b8cdfdb and 1a35eb926d7
from Aspeed's own tree, originally by Dylan Hung
<dylan_hung@aspeedtech.com>.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>

---
v5:
 - use regmap_update_bits()
 - add comment on NUM_CLKS semantics
v4:
 - expand NUM_CLKS for the new I3C clock
v3:
 - split dt-bindings and clk changes
v2:
 - reword commit message
---
 drivers/clk/clk-ast2600.c | 43 +++++++++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
index 1f08ff3c60fa..09f26ab5f9af 100644
--- a/drivers/clk/clk-ast2600.c
+++ b/drivers/clk/clk-ast2600.c
@@ -15,7 +15,11 @@
 
 #include "clk-aspeed.h"
 
-#define ASPEED_G6_NUM_CLKS		71
+/*
+ * This includes the gates (configured from aspeed_g6_gates), plus the
+ * explicitly-configured clocks (ASPEED_CLK_HPLL and up).
+ */
+#define ASPEED_G6_NUM_CLKS		72
 
 #define ASPEED_G6_SILICON_REV		0x014
 #define CHIP_REVISION_ID			GENMASK(23, 16)
@@ -32,6 +36,20 @@
 #define ASPEED_G6_CLK_SELECTION1	0x300
 #define ASPEED_G6_CLK_SELECTION2	0x304
 #define ASPEED_G6_CLK_SELECTION4	0x310
+#define ASPEED_G6_CLK_SELECTION5	0x314
+#define   I3C_CLK_SELECTION_SHIFT	31
+#define   I3C_CLK_SELECTION		BIT(31)
+#define     I3C_CLK_SELECT_HCLK		(0 << I3C_CLK_SELECTION_SHIFT)
+#define     I3C_CLK_SELECT_APLL_DIV	(1 << I3C_CLK_SELECTION_SHIFT)
+#define   APLL_DIV_SELECTION_SHIFT	28
+#define   APLL_DIV_SELECTION		GENMASK(30, 28)
+#define     APLL_DIV_2			(0b001 << APLL_DIV_SELECTION_SHIFT)
+#define     APLL_DIV_3			(0b010 << APLL_DIV_SELECTION_SHIFT)
+#define     APLL_DIV_4			(0b011 << APLL_DIV_SELECTION_SHIFT)
+#define     APLL_DIV_5			(0b100 << APLL_DIV_SELECTION_SHIFT)
+#define     APLL_DIV_6			(0b101 << APLL_DIV_SELECTION_SHIFT)
+#define     APLL_DIV_7			(0b110 << APLL_DIV_SELECTION_SHIFT)
+#define     APLL_DIV_8			(0b111 << APLL_DIV_SELECTION_SHIFT)
 
 #define ASPEED_HPLL_PARAM		0x200
 #define ASPEED_APLL_PARAM		0x210
@@ -97,14 +115,13 @@ static const struct aspeed_gate_data aspeed_g6_gates[] = {
 	[ASPEED_CLK_GATE_LHCCLK]	= { 37, -1, "lhclk-gate",	"lhclk", 0 },	/* LPC master/LPC+ */
 	/* Reserved 38 RSA: no longer used */
 	/* Reserved 39 */
-	[ASPEED_CLK_GATE_I3C0CLK]	= { 40,  40, "i3c0clk-gate",	NULL,	 0 },	/* I3C0 */
-	[ASPEED_CLK_GATE_I3C1CLK]	= { 41,  41, "i3c1clk-gate",	NULL,	 0 },	/* I3C1 */
-	[ASPEED_CLK_GATE_I3C2CLK]	= { 42,  42, "i3c2clk-gate",	NULL,	 0 },	/* I3C2 */
-	[ASPEED_CLK_GATE_I3C3CLK]	= { 43,  43, "i3c3clk-gate",	NULL,	 0 },	/* I3C3 */
-	[ASPEED_CLK_GATE_I3C4CLK]	= { 44,  44, "i3c4clk-gate",	NULL,	 0 },	/* I3C4 */
-	[ASPEED_CLK_GATE_I3C5CLK]	= { 45,  45, "i3c5clk-gate",	NULL,	 0 },	/* I3C5 */
-	[ASPEED_CLK_GATE_I3C6CLK]	= { 46,  46, "i3c6clk-gate",	NULL,	 0 },	/* I3C6 */
-	[ASPEED_CLK_GATE_I3C7CLK]	= { 47,  47, "i3c7clk-gate",	NULL,	 0 },	/* I3C7 */
+	[ASPEED_CLK_GATE_I3C0CLK]	= { 40,  40, "i3c0clk-gate",	"i3cclk", 0 }, /* I3C0 */
+	[ASPEED_CLK_GATE_I3C1CLK]	= { 41,  41, "i3c1clk-gate",	"i3cclk", 0 }, /* I3C1 */
+	[ASPEED_CLK_GATE_I3C2CLK]	= { 42,  42, "i3c2clk-gate",	"i3cclk", 0 }, /* I3C2 */
+	[ASPEED_CLK_GATE_I3C3CLK]	= { 43,  43, "i3c3clk-gate",	"i3cclk", 0 }, /* I3C3 */
+	[ASPEED_CLK_GATE_I3C4CLK]	= { 44,  44, "i3c4clk-gate",	"i3cclk", 0 }, /* I3C4 */
+	[ASPEED_CLK_GATE_I3C5CLK]	= { 45,  45, "i3c5clk-gate",	"i3cclk", 0 }, /* I3C5 */
+	/* Reserved: 46 & 47 */
 	[ASPEED_CLK_GATE_UART1CLK]	= { 48,  -1, "uart1clk-gate",	"uart",	 0 },	/* UART1 */
 	[ASPEED_CLK_GATE_UART2CLK]	= { 49,  -1, "uart2clk-gate",	"uart",	 0 },	/* UART2 */
 	[ASPEED_CLK_GATE_UART3CLK]	= { 50,  -1, "uart3clk-gate",	"uart",  0 },	/* UART3 */
@@ -775,6 +792,14 @@ static void __init aspeed_g6_cc(struct regmap *map)
 	/* USB 2.0 port1 phy 40MHz clock */
 	hw = clk_hw_register_fixed_rate(NULL, "usb-phy-40m", NULL, 0, 40000000);
 	aspeed_g6_clk_data->hws[ASPEED_CLK_USBPHY_40M] = hw;
+
+	/* i3c clock: source from apll, divide by 8 */
+	regmap_update_bits(map, ASPEED_G6_CLK_SELECTION5,
+			   I3C_CLK_SELECTION | APLL_DIV_SELECTION,
+			   I3C_CLK_SELECT_APLL_DIV | APLL_DIV_8);
+
+	hw = clk_hw_register_fixed_factor(NULL, "i3cclk", "apll", 0, 1, 8);
+	aspeed_g6_clk_data->hws[ASPEED_CLK_I3C] = hw;
 };
 
 static void __init aspeed_g6_cc_init(struct device_node *np)
-- 
2.39.1

