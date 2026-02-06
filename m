Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF54B392C5B
	for <linux-clk@vger.kernel.org>; Fri,  6 Feb 2026 10:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770375197; cv=none; b=B2GAD4eZB63plRmxfQ4UjljFXpEIxQ6jIGkTUwAxj4O0Vv5A2kzuTeva/u0y3I/zW5VvrpngnosutdzZby9f6cM2uF6kGr44LxVzFHsIhseEKrFEga+LC71SuhGWb5u+YHbp1D2wlQDvQB3ysUDW9pj2zLtStBnzk7IJpxQPIGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770375197; c=relaxed/simple;
	bh=kjScV1T5/VdYayocYBA2dz1cbmi0EZoIfKkzXZdS0LA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OllLtMktVCKVU9tEWzhyrLNzrh5iHqsf+1479PgnXT9Ypf7F8hUgF5yKX8vbCKKhslDkz6eTRC+f/1qktseeabOfFFQ40QWfgnWdtgKkmf+BlFJyfgshgQEBYFLsqGMpWecTJ5PwsrgNkiTWSve4cXZUi01Z9CcZdycCBy9gDEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CD4V2d+y; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CD4V2d+y"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4327790c4e9so1158924f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 06 Feb 2026 02:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770375195; x=1770979995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WmKsY8ayiw3/jo38sqRg0fzRnMmAiOhgs/UG6PFaCM=;
        b=CD4V2d+y5SBJELR8ZCbUSvJxPUtpp6Y2LQAwrYg0CT7MJb5TLfOnRUBYD+uXBAiFdc
         4P2mrNAYsWsjhBh0ffFhDh9sE8lAUPp8bfjXG9u01LCj/iN1Jd+g9K1I1pYSsce0FRx7
         ASGDQ9z32sjicKtQqQEfa7QpNvex7BcXdDq5msE7ojcVLEYBnAoHSlnJ7biKxzlU0NNA
         9yb9PetWRHHP83+YDehves7yJY6ZwoJLkU3T8NOWrLXeyOPq1ceEZO9fsXlYCmekSKSj
         ElP4B4/zGgeJIdnNRb+RxBSY61O8jJw9tjncNtIGuuWPYhmnSa3ENrRfjgJiX63+pDBE
         RiSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770375195; x=1770979995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1WmKsY8ayiw3/jo38sqRg0fzRnMmAiOhgs/UG6PFaCM=;
        b=Q0h3/6aPIn2TAQ5zm6hPrs28ZF5pWPcf2+MHJMIG19kP3XwL34obxE+BzGzY+12TmD
         kGA677h8Pv70b/3XG7tYrm+m5jZGuBaVYHhIhbx01DjQklTSXtctShzWT0L0+g36KtNj
         M2X2kX6i7HjZ/zFUWGR7QyzvzM6CnMNaLAi1ZVS55PpouKvpOx1li4r+pTDPDPNO+HyJ
         YXFdDIOnwjoeO9kMwgMzZ4dCP7cd7MLuoEOAEORmLTIPAF+iJcvGbHjN4399x3BgAmKU
         Od6lOjmO9T8AHKRpoER+cNZDOX/lVocTAtQep6N+nCS3ddbT6FwFhwHy3uDn15tWAqne
         XLGQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4/7+NoqpSDoQfszmu7rJOmuY1TcBCXHSYyohwJgms7NK3vhBdoVbnEobqkf1UVNr6EMgJg9zS5tM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ+Bxtlrq4dgFJphokB22kOfarjdmIHNl5e5LT5WpNb7f1jjE7
	T2tyvOTJ+o7KdCHw9I5e9EsaW7Nkq0WrsEVndgkppPzyi00mM+rI16NM
X-Gm-Gg: AZuq6aL3mqyFrc6T5hWqsvGXOdOYBNKGVdnNhuZGTfhxAJ9zm7hEW/+FMDKi9yjeLMC
	b8SxhzsJ7ttzqo3rBWVJ5Y8PWNUJ4eRcLx7lsxB8RK3Bkxra5xbmSR2FcDUUNunY1tpHhrr9LAt
	TnYQeZQa1OhwQ3phtFmBZGQIfAUmlf1ta8hjQ+V1rGHBhCf4B86FBWsVVnnDNUnzyJTRm2VQeeA
	Edc4v1ELscwplOThufGEv/T7/zBpidpSprbe0ZCCSrXwb5MWRZcB2lPpc0RJ9Kvtnm9LDTAD2Zc
	UAt7J9TpLGF52YsoZDUB7AO+6WJGNI/or/tK7CnLkso7zYOs5W1GAHFGYMzT+IBQ/YJG2curTZM
	EHH96yhmtCrY0mF2HuBCTT1Rmu3QNfvj3x8+blkMEg0q9gqhxPrwrlMZEyk0VytME8ZSYvYYeeU
	vaV2xFZyXIdaBu407SqQ==
X-Received: by 2002:a05:6000:2c05:b0:435:9f1b:8d19 with SMTP id ffacd0b85a97d-436293889f5mr3853188f8f.38.1770375195145;
        Fri, 06 Feb 2026 02:53:15 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:1e64:f8d5:9d7a:19d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43629730992sm4519611f8f.21.2026.02.06.02.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 02:53:14 -0800 (PST)
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
Subject: [PATCH v4 2/4] clk: renesas: rzg2l: Add support for enabling PLLs
Date: Fri,  6 Feb 2026 10:53:02 +0000
Message-ID: <20260206105312.231015-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206105312.231015-1-biju.das.jz@bp.renesas.com>
References: <20260206105312.231015-1-biju.das.jz@bp.renesas.com>
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
v3->v4:
 * No change
v2->v3:
 * No change
v1->v2:
 * No change
---
 drivers/clk/renesas/rzg2l-cpg.c | 67 +++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h |  4 ++
 2 files changed, 71 insertions(+)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 945e31c8f161..7e569a7c8fc2 100644
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
@@ -1175,6 +1182,63 @@ rzg2l_cpg_pll_clk_register(const struct cpg_core_clk *core,
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
@@ -1258,6 +1322,9 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
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

