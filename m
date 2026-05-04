Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587AF3DF003
	for <linux-clk@vger.kernel.org>; Mon,  4 May 2026 14:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777905931; cv=none; b=Q5NwI+yNiuttx1CoZ1Q+4FdSV+F+roH/mzqW7puQ2RhBRjE9tr4wFtcZ5CsiGtlmCkxc4bM3QizsFjhKF0PtB89S2Y38poMqOmyJagh3vuLlyUTaEDqMjIkDftJzGuNjg9uMqwfAruULUR2L9p+rWbpDto5BIm5Pf4aYndIguTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777905931; c=relaxed/simple;
	bh=IuPuNT0iWwufeeItnNYuVUA1dN8Pvp00SEXIeDTiV0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZnNX3qpvCXNAz1yVdhYGXRT5297YDl93dx1wOjI711wopsPLKszDjTBeUr56QUl0EWJN5ry5sVQZ96ofWkz38rNdYbAIlewmEKuZFHus5wgl9tMfNPofmkjuVv/d0gSlvzXhq3C9yplQAej4/GbyYZae+0GE20UHkG0UGfl3FHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FYpxs5Uc; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FYpxs5Uc"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso52301245e9.1
        for <linux-clk@vger.kernel.org>; Mon, 04 May 2026 07:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777905928; x=1778510728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X5fkkKuXHHDwakN2Kt3vbnokuaWWi6ricw4daqx44Ro=;
        b=FYpxs5UcX1THOKjpk/RZYZB1KPAb2XaPtY5t82ilvKWkBpyFr01qW1G1G4Vn+i98qb
         CDvyxjCn0yxLaiUff1SHCg8uSFSkCppiAucbcmXSKgWWRWAyMlOTQ8tl4XbY8d9D3Zcz
         LMI/g1BoOmas5hICsjoebSlUkiZtgoQRtcPbEywM1E81XNzJ/UDWRNUCpD2TUKzBsuN9
         /G4xpbWwE0gigs0I7oVlaCTQCT5XYqwoCH3qmBOLMTnx+fHPW2x+6GFNFiWTfeq/g26p
         MkFdzq7PDJujMBuRMtzJPAimiwtblvEoVT6gZALtqmi590+ZtCRVRsOHagX5W19l/+Wy
         6Amw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777905928; x=1778510728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X5fkkKuXHHDwakN2Kt3vbnokuaWWi6ricw4daqx44Ro=;
        b=oR6COxmTkigS+lnSs7Q63cQnF+/8uHt+Mh3EgxC9fa5oSZtWafeh1m9e5bIB9RZMiA
         tIWkt7PlgeinI3JuSikmhAwrMJi8CoCcF1JUSxT+BQpb32da/weI1UlamH6BZvFs8gKB
         ebKYe2CJDAA3OFfGbuWjYPsQOF+l63xaIZQ1MdAplblMgWiN+R+l0ci/9CKTyQMhYmQ0
         WwzFQ2gxmZ6iqeZvcPgIHVcMjgBEjubnk07O7XIcmOYN2wn20vB/L7Sq/pUNpjul62V0
         LQouHVJSHDqtjqfCWmyZFMvCjj59tpMI7jMZ6+d2QRmMhUVhnmp0uE0HnUyF/mjbcw1u
         T9DQ==
X-Forwarded-Encrypted: i=1; AFNElJ9UBdTtaMCRAbF+5uRsw5fEjgRQ5ZejHcW7PODDrDKVPj0WmmTs62cDyS9h7natXabiS+XFN8jWElc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5WwPgRGjSyRcmcsuKwSCaC7iPxsu8/n8tis8Z6R7vach96sVW
	hEWngSj1RjiTW5QY2JcH5zc1YWnxs8hGcFmAuSkqtRSCMfwMGUlpWqdK
X-Gm-Gg: AeBDietN5vDQpYBEfp4GMPHL+nJ3MsTrLw8cHuwKu7duwseuowmbdBah+bx7IvtC/88
	vOKnLb673EmMyHqcYfAmjIFfQ6VOjHHVGmf6EMoIEpCpFe9vjdD1An4wCtfXx2wS2cV3wtD7CsR
	1ENuVdKvDrPfYHfYLSdZLvxBNZjDzINU6V5+EeR3zOZqvSiYPjXFkwcAB/bZXO5cUuu8dq2Fmv6
	J0y/l2sl8qiOoG3l/T5SzjU73hMOECL68g7OeysIkCUCFIetilu1RuDUgf/matFyjMFZ5DTpPUa
	kOqW3zeP1Vt+TKIWsK1ZmftfLrw1sXJAF9dCaWYGOZ1eMHt+4tV4gayX74ObVLLQ/KZxQZfwrkd
	lmeed7Q90+auMLEiC7x+qx4vNTQMek1jWfKRoOUMTsJo11FbY2IuC0EEpXhPbfdqTwau5BdUlzb
	580/mbX+a2EtkxaDXMMlgoawJBfIP+DiV3FuLZH43OjvEP2p0IU8dfo7I6+5wa+XrNM/xbxw==
X-Received: by 2002:a05:600c:c170:b0:48a:80cb:1bb4 with SMTP id 5b1f17b1804b1-48a98671d52mr158941185e9.22.1777905927533;
        Mon, 04 May 2026 07:45:27 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:6444:b23f:58b2:338c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a981defa6sm24371239f8f.24.2026.05.04.07.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 07:45:27 -0700 (PDT)
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
Subject: [PATCH 2/3] clk: renesas: rzg3s/rzg3l: Simplify PLL configuration macro
Date: Mon,  4 May 2026 15:45:18 +0100
Message-ID: <20260504144523.153906-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260504144523.153906-1-biju.das.jz@bp.renesas.com>
References: <20260504144523.153906-1-biju.das.jz@bp.renesas.com>
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

Drop the now-redundant GET_REG_SAMPLL_CLK1() and GET_REG_SAMPLL_SETTING()
macros, replacing the latter with CPG_PLL1_SETTING_OFFSET() using
FIELD_GET() to extract the offset value. Update RZG3L_PLL_MON_OFFSET() to
use CPG_PLL_STBY_OFFSET() + 0xc directly.

No functional changes.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
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
index 0004b9516fdf..0657dc01ff8a 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -56,9 +56,6 @@
 #define G3L_SEL_ETH1_CLK_TX_I	SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 11, 1)
 #define G3L_SEL_ETH1_CLK_RX_I	SEL_PLL_PACK(G3L_CPG_ETH_SSEL, 12, 1)
 
-/* PLL 1/4/6/7 configuration registers macro. */
-#define G3L_PLL1467_CONF(clk1, clk2, setting)	((clk1) << 22 | (clk2) << 12 | (setting))
-
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
 	LAST_DT_CORE_CLK = R9A08G046_USB_SCLK,
@@ -154,11 +151,11 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
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
 	DEF_FIXED(".pll3_div2", CLK_PLL3_DIV2, CLK_PLL3, 1, 2),
diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index c6f9f3417ce9..7e5173a37f3a 100644
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
+#define RZG3L_PLL_STBY_OFFSET(x)	(CPG_PLL1_SETTING_OFFSET(x))
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
 
@@ -1147,14 +1146,14 @@ static unsigned long rzg3s_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
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

