Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F53B36BCDE
	for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 11:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769774336; cv=none; b=SZ0qvNTFXfVkleAFYrXo9F0trSKx5d6LzGuMtUv9mEqcHcsMJ6ofkZDGefB+exvD70qF9BFe7i4O/0jro4A1nOzND/o3sw4nkldYSn2ZimeIF85O/j0bs1agHCVdyIcUhFaaOJoN80zvRvE84c83ZaQUormZHRde7BKrR7gswuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769774336; c=relaxed/simple;
	bh=RFS3L+HoKH/ZpUq4IYPiZn2EYx+MJ9MMW1dc0w7GCLw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ll9RhevTLPu6cZkl76l6cNp8mh7/tYOFtlZ1RdBByOiFCvlSez74FiRcEmn8A2/L+U5chPijB4L1Ja9sh4ijsnDysYKbPXVxqyxUhx20++wVPjrgYi2INH72n7Bgg0AX2YOZyTMTbG12e8mN0Ox37jmGxjGCBrDASa3G+bu3slg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aXTiwbgZ; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXTiwbgZ"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b8845cb580bso333018266b.3
        for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 03:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769774333; x=1770379133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGMFI6tCot74p730gmYxB0ganfKY4B4oFGS/FHtw0j4=;
        b=aXTiwbgZVk5XMABOxFNKhCMNg6zjF0PYYeZi6KQJziMeRfgDl8RiWo1L0ipNXunSuj
         mX3g6bBv+e4vT5b39bbYoSwq1oGZLiHw6K3VSWZXVzUwpRLw+8taX4Ek+kHVTZmXeQxm
         ajBzdzOgZJkVKtQFZPlLlzg9M7Nnzcc76Vls21a88Q28x0bOOPWMTLJmg5emQHaE1g48
         Qv/oRFdLpqYEwrwWG8HSK6zFN86OB1dbWWDGapzR76nwzKwRI+HtIl65xSpSFq7IASN3
         AeoqiAdqJ5EI+DcqqBBgf3CTsF2EACNev3yjVpWVkoz3eK7r1q0LnT0wmcQOgbFjIP0X
         C+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769774333; x=1770379133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HGMFI6tCot74p730gmYxB0ganfKY4B4oFGS/FHtw0j4=;
        b=IHsD+ykRPUYBpBBAWz0/4ytRqNeXJdH3kD6J7HL3i5c/uqLoeL8TiPZmP5sCI4xA2N
         6Atr/wYactQ3g2k0IVHqgPjSc1UgZeb3/4je7c9bAXEida7xoh3rg0woOrXbQ2H581uT
         XgViArRXn0N3ZRz1sFhfBTNtPPA7NPDRk0tTEshiFoEzhyBpVZ4sHDoGtso45lWz7m1+
         Sjpg9U9K6Ek3eGxirknyMNgHnFJlO2ICaM5JqhkbLVahtkH4OlBqCqNZ5LMXyRQZSdsJ
         UaPxgS+O7aGqdkE1RsIR+pVJDVGe9ogwMhjI2Zrh6PuwPoaMu0TXARF3YWOk9SneiXrR
         P4jw==
X-Forwarded-Encrypted: i=1; AJvYcCWm4dETklaaFUM1P7Ca7DYvPBLT0i4jSJn5ziXow9xso6hbD4i4FZCWqFnCzZx2Z/PDlkm9nQsThXE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYhkBz4TXy/lPSlmXc8vLcQY/WD8DeLM1sGBEq7NP5qKvipGBG
	EP5M7gsOeSejZAPWF2Cr5IgA6XA1dhNbTxWefsfBMVxn89OQRcdh1/LS
X-Gm-Gg: AZuq6aIQAvnE9yfG+9R5Ao4jQkrEEvF/ApIkfc1t8l65AP1KzS51qJ+fir0FHZ8PanU
	1i7aCEQ5ALwMNrEVDpBet96kTQh8Icf5DwDiEnyOy3SeRk1VEuxccyLRGDNk91kROBhIfkTSqCd
	YXWJmLXTxbp3HbgFgxFiStBw9Ul/BHSJr5YKYel/g7oGOAJOHrP3EMA43SnQqsNKbU23c6tDPtG
	0KOWUd0SHvjoBBhS3ZSpvEe6PIS8HJmbWRmDltOGtsxbPuHcrrInfZ+kSANgA8E+bKQbVLDB9f3
	Xdv+j54Ar4X+c5olnHwvElDYWyji2TyLkAvx7PdaqqVirF3nofzicte6OJQwXTnUrEnnHT1Mcek
	hjk3bct7bBblvK3GpWTIOyIAv8soQ3EUHKXLTeau2nD2weAyOJ6+CII+KAhsJ7lvfFQJgPvwJau
	pFXvd/4scEJJevSwBfktYjQfrDeY/N66Jeus7IYuG3L0LaHw==
X-Received: by 2002:a17:906:d554:b0:b88:5722:700 with SMTP id a640c23a62f3a-b8dff52ba80mr155016866b.5.1769774333210;
        Fri, 30 Jan 2026 03:58:53 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:bd64:2984:fe71:7633])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbeffed15sm404671566b.31.2026.01.30.03.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 03:58:53 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 2/4] clk: renesas: rzg2l: Add support for enabling PLLs
Date: Fri, 30 Jan 2026 11:58:43 +0000
Message-ID: <20260130115850.253555-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260130115850.253555-1-biju.das.jz@bp.renesas.com>
References: <20260130115850.253555-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for enabling PLL clocks in the RZ/G3L CPG driver to turn off
some PLLs, if they are not in use(eg: PLL6, PLL7)

Introduce `is_enabled` and `enable` callbacks to handle PLL state
transitions. With the `enable` callback, PLL will be turned ON only when
the PLL consumer device is enabled; otherwise, it will remain off. Define
new macros for PLL standby and monitor registers to facilitate this
process.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change
---
 drivers/clk/renesas/rzg2l-cpg.c | 67 +++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h |  4 ++
 2 files changed, 71 insertions(+)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index ee92d07c6ff7..dfb36e6e6a7b 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -58,6 +58,13 @@
 #define RZG3S_DIV_NF		GENMASK(12, 1)
 #define RZG3S_SEL_PLL		BIT(0)
 
+#define RZG3L_PLL_STBY_OFFSET(x)	(GET_REG_SAMPLL_CLK1(x) - 0x4)
+#define RZG3L_PLL_STBY_RESETB		BIT(0)
+#define RZG3L_PLL_STBY_RESETB_WEN	BIT(16)
+#define RZG3L_PLL_MON_OFFSET(x)		(GET_REG_SAMPLL_CLK1(x) + 0x8)
+#define RZG3L_PLL_MON_RESETB		BIT(0)
+#define RZG3L_PLL_MON_LOCK		BIT(4)
+
 #define CLK_ON_R(reg)		(reg)
 #define CLK_MON_R(reg)		(0x180 + (reg))
 #define CLK_RST_R(reg)		(reg)
@@ -1181,6 +1188,63 @@ rzg2l_cpg_pll_clk_register(const struct cpg_core_clk *core,
 	return pll_clk->hw.clk;
 }
 
+static int rzg3l_cpg_pll_clk_is_enabled(struct clk_hw *hw)
+{
+	struct pll_clk *pll_clk = to_pll(hw);
+	struct rzg2l_cpg_priv *priv = pll_clk->priv;
+	u32 val = readl(priv->base + RZG3L_PLL_MON_OFFSET(pll_clk->conf));
+	u32 mon_val = RZG3L_PLL_MON_RESETB | RZG3L_PLL_MON_LOCK;
+
+	/* Ensure both RESETB and LOCK bits are set */
+	return (mon_val == (val & mon_val));
+}
+
+static int rzg3l_cpg_pll_clk_endisable(struct clk_hw *hw, bool enable)
+{
+	struct pll_clk *pll_clk = to_pll(hw);
+	struct rzg2l_cpg_priv *priv = pll_clk->priv;
+	u32 stby_offset, mon_offset;
+	u32 val, mon_val;
+	int ret;
+
+	stby_offset = RZG3L_PLL_STBY_OFFSET(pll_clk->conf);
+	mon_offset = RZG3L_PLL_MON_OFFSET(pll_clk->conf);
+
+	if (enable) {
+		val = RZG3L_PLL_STBY_RESETB_WEN | RZG3L_PLL_STBY_RESETB;
+		mon_val = RZG3L_PLL_MON_RESETB | RZG3L_PLL_MON_LOCK;
+	} else {
+		val = RZG3L_PLL_STBY_RESETB_WEN;
+		mon_val = 0;
+	}
+
+	writel(val, priv->base + stby_offset);
+
+	/* ensure PLL is in normal/stanby mode */
+	ret = readl_poll_timeout_atomic(priv->base + mon_offset, val, mon_val ==
+					(val & (RZG3L_PLL_MON_RESETB | RZG3L_PLL_MON_LOCK)),
+					10, 100);
+	if (ret)
+		dev_err(priv->dev, "Failed to %s PLL 0x%x/%pC\n", enable ?
+			"enable" : "disable", stby_offset, hw->clk);
+
+	return ret;
+}
+
+static int rzg3l_cpg_pll_clk_enable(struct clk_hw *hw)
+{
+	if (rzg3l_cpg_pll_clk_is_enabled(hw))
+		return 0;
+
+	return rzg3l_cpg_pll_clk_endisable(hw, true);
+}
+
+static const struct clk_ops rzg3l_cpg_pll_ops = {
+	.is_enabled = rzg3l_cpg_pll_clk_is_enabled,
+	.enable = rzg3l_cpg_pll_clk_enable,
+	.recalc_rate = rzg3s_cpg_pll_clk_recalc_rate,
+};
+
 static struct clk
 *rzg2l_cpg_clk_src_twocell_get(struct of_phandle_args *clkspec,
 			       void *data)
@@ -1264,6 +1328,9 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
 	case CLK_TYPE_SAM_PLL:
 		clk = rzg2l_cpg_pll_clk_register(core, priv, &rzg2l_cpg_pll_ops);
 		break;
+	case CLK_TYPE_G3L_PLL:
+		clk = rzg2l_cpg_pll_clk_register(core, priv, &rzg3l_cpg_pll_ops);
+		break;
 	case CLK_TYPE_G3S_PLL:
 		clk = rzg2l_cpg_pll_clk_register(core, priv, &rzg3s_cpg_pll_ops);
 		break;
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 1db413bb433d..7de4cb7af1cc 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -123,6 +123,7 @@ enum clk_types {
 	CLK_TYPE_IN,		/* External Clock Input */
 	CLK_TYPE_FF,		/* Fixed Factor Clock */
 	CLK_TYPE_SAM_PLL,
+	CLK_TYPE_G3L_PLL,
 	CLK_TYPE_G3S_PLL,
 
 	/* Clock with divider */
@@ -152,6 +153,9 @@ enum clk_types {
 	DEF_TYPE(_name, _id, _type, .parent = _parent)
 #define DEF_SAMPLL(_name, _id, _parent, _conf) \
 	DEF_TYPE(_name, _id, CLK_TYPE_SAM_PLL, .parent = _parent, .conf = _conf)
+#define DEF_G3L_PLL(_name, _id, _parent, _conf, _default_rate) \
+	DEF_TYPE(_name, _id, CLK_TYPE_G3L_PLL, .parent = _parent, .conf = _conf, \
+		 .default_rate = _default_rate)
 #define DEF_G3S_PLL(_name, _id, _parent, _conf, _default_rate) \
 	DEF_TYPE(_name, _id, CLK_TYPE_G3S_PLL, .parent = _parent, .conf = _conf, \
 		 .default_rate = _default_rate)
-- 
2.43.0

