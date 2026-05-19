Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0360C4028E0
	for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 14:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779200126; cv=none; b=h5Wg5mhQhIHi1xuoMMAgVZjxfcO6m1y8UfAjCBfRLVhKCeDcMO6VYTG/a3GH8DPtk6wOsVUVgspXGqYb6/MVfFFEXF2zu0wCaBQcDT5gKlwjfD/E8YEas/wuaDnL1Mh6o6DZ9WRxvXluuPRwtZQHtQs5UHEvGDc9x23nr38io3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779200126; c=relaxed/simple;
	bh=pCIbonQaY01gdkVUQZdkziRl+vA0GKesQQYmOj+A/PU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n2VC9pzTnL7M7JD0vQpYkhZNufu2d8gdoNvdAyWJi9fXDHYVHWudPKEyrTCpsnDmO+wv7Q412lb5kyqqnoA7btY0VfDh3iaj6/VA6krmt0+G1EkGakZJZ7SP48wCsCDxXpXtDmbqqJ6kqPkqAdopYT+QN8au4xRMlq+PJvCtWqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MMjcWyBi; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MMjcWyBi"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso26753325e9.2
        for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 07:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779200123; x=1779804923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A6DuZOB9oPUQHqKQEB3iHnG+d1dypyecAQyiCjdc3Bc=;
        b=MMjcWyBiRsx/PuwwOugOcRGghPiDULrIZVGl7JUoVhbd8NB92J/Tm4UTE0IfKB0hE6
         p3H5TkOAxB8oLmz7Dh8W0WIULzcnp9/YzrpNGIvB/sQCor5ohTVPY+2H8+0hIaW0vOcp
         Mb4vEpJ8LLBUyqrQ2oU/21D/AyiIjXf67SaSkN09TK2i8l2j1p5c1JImDydzxUvFmEVq
         4r0dVDMWanWgMaSlF8LYbYEBMgSkG5BcKIzKBLzrLHuxdPgJveimUgAF5GuYCM/Mad4h
         w947I34X4sbVL/c78QMn49NtfT2+sXoO82lVLjmOzjibMD9wiajgJvtKjeisTs1g7ies
         wNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779200123; x=1779804923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A6DuZOB9oPUQHqKQEB3iHnG+d1dypyecAQyiCjdc3Bc=;
        b=sbyap28r+PviVYDouO7qBkm3YtAkPlu0JPI5x+PEgBdxkC6VL8AhIIrMxg/tnQgB2K
         wDeiZokkJh/ROxNLjG3e6yvmQJoI3/SFXmrfOo85Ie02UUhaUoud2G4EeRO9dJ7JG55d
         Wf13X0SOL+ULMJHrsZfdCwj/65oJpsjt7VPl9FznV4yVLURkuOuEbnylhfoCV5dP0o68
         kWUo0nEkHD3syxNSgT9V8gsV5ndvLg/WGS/KWiWU5s8nAael7SCcJeuBTv69W/GD8zS3
         xOx/07i87WcDiceMH6jXqd+TK8fAgB+FX0fM/8JSw16uStzjrEepowSph2lSNrD59DJu
         +Q4A==
X-Forwarded-Encrypted: i=1; AFNElJ8bry3Qt6rprD76btXYJEEbA0OTubBlOgC2AGTH37ePdGeVzriNa1bCmTZcy0skhPVIm0yWHdqNJvs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5t8c8R/aswOHXKCQe/1oC+q4EJlGcg59qQNpaFdGKHse3KZjj
	lV1K/pDACYdRB/WFGCtwxeT5gRXrlOyagjPCIuMgtPLMlxr2ax3GL8Fl
X-Gm-Gg: Acq92OE5NQ1yC6kGv8A/uSHjAA5vSSIzdUcZ7Y6ZYqiG9rSrRehhh0CShCOEgkwBOR+
	96eHcUHdSzoMOs1D19YIYUoi8e96h0iBc7Zjx/Pl12UluLMIZY1R0YMBjRR1wClG2axx+3s/F7y
	6ToUAUGkPm8qWtMHUD2GMRqzwp/40jwF2HwdYXFs9H26adn/FXRJAsvUj1DEOMLjOhkFWAkkiif
	HjqKJTO/jJy4IkobvhGCjsoraBiCd3r5k8NcJn+fraLYId+zJClapWzXW5C5NmRxBDg0g1nfVcx
	qVayghnccgMs7Ha11s5yG4OySmWexwerNdCxG7vBVgoQ0o/bwgDfGHbGARIUbogcCMBfHPe2RVI
	vl0HrAZyXqIusrTWNjbNzB54tQwuG8k9hLT7QTV6fB/d0CO0UPdfP506xhqMYYi6mJI1/3XwZgi
	TJ4Mgl8WExY+OtN92FXReOKxKj/JECAHBi06H4Ws5NmESGFzfZ
X-Received: by 2002:a05:600c:b95:b0:48a:8b02:ae91 with SMTP id 5b1f17b1804b1-48fe60ea2dfmr299875135e9.11.1779200123300;
        Tue, 19 May 2026 07:15:23 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:4abf:a82a:41d5:6663])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c8344asm557912205e9.1.2026.05.19.07.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:15:22 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 2/3] clk: renesas: rzg3s/rzg3l: Simplify PLL configuration macro
Date: Tue, 19 May 2026 15:15:14 +0100
Message-ID: <20260519141518.389670-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519141518.389670-1-biju.das.jz@bp.renesas.com>
References: <20260519141518.389670-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Replace the per-SoC G3S_PLL146_CONF() and G3L_PLL1467_CONF() macros with
a unified CPG_PLL_CONF(stby, setting) macro defined in rzg2l-cpg.h.

Drop the now-redundant GET_REG_SAMPLL_{CLK1, SETTING}() macros, replacing
the latter with CPG_PLL1_SETTING_OFFSET() using FIELD_GET() to extract the
offset value. Update RZG3L_PLL_{STBY,MON}_OFFSET() macros to derive
offsets directly from CPG_PLL_STBY_OFFSET().

No functional changes.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Rebased to renesas-clk and fixed the merge conflict.
v1->v2:
 * Updated commit description.
 * Fixed the macro RZG3L_PLL_STBY_OFFSET by using CPG_PLL_STBY_OFFSET.
---
 drivers/clk/renesas/r9a08g045-cpg.c |  5 +----
 drivers/clk/renesas/r9a08g046-cpg.c |  7 ++-----
 drivers/clk/renesas/rzg2l-cpg.c     | 11 +++++------
 drivers/clk/renesas/rzg2l-cpg.h     |  1 +
 4 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index 1232fec913eb..9610676058de 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -50,9 +50,6 @@
 #define G3S_SEL_SDHI1		SEL_PLL_PACK(G3S_CPG_SDHI_DSEL, 4, 2)
 #define G3S_SEL_SDHI2		SEL_PLL_PACK(G3S_CPG_SDHI_DSEL, 8, 2)
 
-/* PLL 1/4/6 configuration registers macro. */
-#define G3S_PLL146_CONF(clk1, clk2, setting)	((clk1) << 22 | (clk2) << 12 | (setting))
-
 #define DEF_G3S_MUX(_name, _id, _conf, _parent_names, _mux_flags, _clk_flags) \
 	DEF_TYPE(_name, _id, CLK_TYPE_MUX, .conf = (_conf), \
 		 .parent_names = (_parent_names), \
@@ -134,7 +131,7 @@ static const struct cpg_core_clk r9a08g045_core_clks[] __initconst = {
 
 	/* Internal Core Clocks */
 	DEF_FIXED(".osc_div1000", CLK_OSC_DIV1000, CLK_EXTAL, 1, 1000),
-	DEF_G3S_PLL(".pll1", CLK_PLL1, CLK_EXTAL, G3S_PLL146_CONF(0x4, 0x8, 0x100),
+	DEF_G3S_PLL(".pll1", CLK_PLL1, CLK_EXTAL, CPG_PLL_CONF(0, 0x100),
 		    1100000000UL),
 	DEF_FIXED(".pll2", CLK_PLL2, CLK_EXTAL, 200, 3),
 	DEF_FIXED(".pll3", CLK_PLL3, CLK_EXTAL, 200, 3),
diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index fc9db5a2f0ac..a57638734ce7 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -81,9 +81,6 @@
 #define G3L_SEL_RSPI1		SEL_PLL_PACK(G3L_CPG_RSPI_SSEL, 2, 2)
 #define G3L_SEL_RSPI2		SEL_PLL_PACK(G3L_CPG_RSPI_SSEL, 4, 2)
 
-/* PLL 1/4/6/7 configuration registers macro. */
-#define G3L_PLL1467_CONF(clk1, clk2, setting)	((clk1) << 22 | (clk2) << 12 | (setting))
-
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
 	LAST_DT_CORE_CLK = R9A08G046_USB_SCLK,
@@ -207,11 +204,11 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 	DEF_INPUT("eth1_rxc_rx_clk", CLK_ETH1_RXC_RX_CLK_IN),
 
 	/* Internal Core Clocks */
-	DEF_G3L_PLL(".pll1", CLK_PLL1, CLK_EXTAL, G3L_PLL1467_CONF(0x4, 0x8, 0x100),
+	DEF_G3L_PLL(".pll1", CLK_PLL1, CLK_EXTAL, CPG_PLL_CONF(0, 0x100),
 		    1200000000UL),
 	DEF_FIXED(".pll2", CLK_PLL2, CLK_EXTAL, 200, 3),
 	DEF_FIXED(".pll3", CLK_PLL3, CLK_EXTAL, 200, 3),
-	DEF_G3L_PLL(".pll6", CLK_PLL6, CLK_EXTAL, G3L_PLL1467_CONF(0x54, 0x58, 0),
+	DEF_G3L_PLL(".pll6", CLK_PLL6, CLK_EXTAL, CPG_PLL_CONF(0x50, 0),
 		    500000000UL),
 	DEF_FIXED(".pll2_div2", CLK_PLL2_DIV2, CLK_PLL2, 1, 2),
 	DEF_FIXED(".pll2_div2_4", CLK_PLL2_DIV2_4, CLK_PLL2_DIV2, 1, 4),
diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index ad9aab2ecc62..096901e25317 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -58,14 +58,15 @@
 #define RZG3S_DIV_NF		GENMASK(12, 1)
 #define RZG3S_SEL_PLL		BIT(0)
 
+#define CPG_PLL1_SETTING_OFFSET(conf)	FIELD_GET(GENMASK(11, 0), (conf))
 #define CPG_PLL_STBY_OFFSET(conf)	FIELD_GET(GENMASK(23, 12), (conf))
 #define CPG_PLL_CLK1_OFFSET(x)		(CPG_PLL_STBY_OFFSET(x) + 0x4)
 #define CPG_PLL_CLK2_OFFSET(x)		(CPG_PLL_STBY_OFFSET(x) + 0x8)
 
-#define RZG3L_PLL_STBY_OFFSET(x)	(GET_REG_SAMPLL_CLK1(x) - 0x4)
+#define RZG3L_PLL_STBY_OFFSET(x)	(CPG_PLL_STBY_OFFSET(x))
 #define RZG3L_PLL_STBY_RESETB		BIT(0)
 #define RZG3L_PLL_STBY_RESETB_WEN	BIT(16)
-#define RZG3L_PLL_MON_OFFSET(x)		(GET_REG_SAMPLL_CLK1(x) + 0x8)
+#define RZG3L_PLL_MON_OFFSET(x)		(CPG_PLL_STBY_OFFSET(x) + 0xc)
 #define RZG3L_PLL_MON_RESETB		BIT(0)
 #define RZG3L_PLL_MON_LOCK		BIT(4)
 
@@ -75,8 +76,6 @@
 #define CLK_MRST_R(reg)		(0x180 + (reg))
 
 #define GET_REG_OFFSET(val)		((val >> 20) & 0xfff)
-#define GET_REG_SAMPLL_CLK1(val)	((val >> 22) & 0xfff)
-#define GET_REG_SAMPLL_SETTING(val)	((val) & 0xfff)
 
 #define CPG_WEN_BIT		BIT(16)
 
@@ -1117,14 +1116,14 @@ static unsigned long rzg3s_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
 	u32 nir, nfr, mr, pr, val, setting;
 	u64 rate;
 
-	setting = GET_REG_SAMPLL_SETTING(pll_clk->conf);
+	setting = CPG_PLL1_SETTING_OFFSET(pll_clk->conf);
 	if (setting) {
 		val = readl(priv->base + setting);
 		if (val & RZG3S_SEL_PLL)
 			return pll_clk->default_rate;
 	}
 
-	val = readl(priv->base + GET_REG_SAMPLL_CLK1(pll_clk->conf));
+	val = readl(priv->base + CPG_PLL_CLK1_OFFSET(pll_clk->conf));
 
 	pr = 1 << FIELD_GET(RZG3S_DIV_P, val);
 	/* Hardware interprets values higher than 8 as p = 16. */
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 17ec6f285c21..bd6169f62538 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -59,6 +59,7 @@
 #define CPG_CLKSTATUS_SELSDHI1_STS	BIT(29)
 
 #define CPG_SAM_PLL_CONF(stby)		((stby) << 12)
+#define CPG_PLL_CONF(stby, setting)	((stby) << 12 | (setting))
 
 #define DDIV_PACK(offset, bitpos, size) \
 		(((offset) << 20) | ((bitpos) << 12) | ((size) << 8))
-- 
2.43.0

