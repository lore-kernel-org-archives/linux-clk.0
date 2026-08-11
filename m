Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C9C37B40A
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 18:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786472858; cv=none; b=cZ6bOwtSrsE/rDE4BJ+w25j1QDWhoGXsnirnKHy6aJG2ZjSo+2205uYWwJA2a2ALMWV3fugrIH9iWnMylkr7uymYotPJAslUtF7Q/nhBiioVpoRkx2UlNFNPhzGWUdqXKeqInJgiEZU06WQujQO5raZjYWUb1RSfIi6rWRm9Y0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786472858; c=relaxed/simple;
	bh=jKbHCzd+ozQePoq9WXeY4NwfoYP1YMZzlWwVgz+pbcg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mID2pWhKFDx/vciEdw0WwxXom1abNUew/CERMsjvaFTGjIiYwOXLFsEjgy6Q0/+fjQDOk6C2M5bSPzeR/THVv6ahcazhobhpEs28Ubls5iMuKwsyUV+gipzsceMD2OREq+ZJ1jyqgz0fYDScA1RsCKZ1lCBQ0iVXFg/mxB8hdtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jrO24Tf2; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jrO24Tf2"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49978908b35so782305e9.0
        for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 11:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786472854; x=1787077654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8XMdEa9OqGoefcLtODxhWhfSr/Csm51f2c+/MC7tWkc=;
        b=jrO24Tf2jA4xegnKuGJDUm3k0L/Vn6JyOlz1OAAnrpcE3QjZJZSrx9MQiJ/3DQ5g91
         ZlxC2fpxnrz0RGaTOBePVaHaZ9PbOFPgu1Do4GyPRuiRMZeqE6BV8D8+6Zwv5+xufX+W
         5H2KtX1kevkaGFYOhRRbXFKsXuNQ+mILZ4dbwkkKIBTryVsEJ/4kIIzEA6JiEmRMT5Mj
         R1yhK3zUi9WNnWKPLzVg1yOkpjoxoaHj41EDPJttdxLvDZ7UhqZjTMI0B+zLe+xINnYb
         A34t3geuPPsMntyMS9kL1gtVxhg0L0/wCOKHHxij3oEoNt3Zz4ntRkN5cpyMAsG/iq6Q
         adpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786472854; x=1787077654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8XMdEa9OqGoefcLtODxhWhfSr/Csm51f2c+/MC7tWkc=;
        b=dfrnZ57Jc8YZtPAA2zaPf/NhofTD0WWpHl2VMsq++K1IdgCEsBSj0vVS78IgKnNIsJ
         bT0UB3jziBk7NBhOQ2ikvEUZYOBW9V6JhmXLnHSHzVz/mOH8POVj1IyqEcAhrcLXc2F6
         tVNsKFA3F3h5NO7uqId8+meyI4vV+jZNCyA11puhqFOgfseuYoze2TAX2XmsrVkvkno3
         3hyzJUxsr9yUTKHkWNdD60B0v0gnE5TYQLAjHjbO9oynByKeqcCxWea3DhSni8lA8SAc
         doAIIK4EacTaB0FBkJ7yNvoz6Bz5KkKybBfG7DEa2GBSpqRfJ0bWRoVsKlSf0GrC80Xy
         GLKQ==
X-Forwarded-Encrypted: i=1; AHgh+RqTncbf00juW/l8yXhKh35jSbsaI9ZAzguEZuN2LMPichsvftCp5NY6TvGrBKlqsmCNVVgB/bDpaRI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoDwHY/e2+mGYnmTHp4RZllw+8nDuGaESRsgy/mbyKrZw5OMPL
	CVomOWO79LhxGha2UbJsse6CgTJYLx5TP5c4nME/KJEpz1cAxD+ivMeW
X-Gm-Gg: AR+sD11xIXaxI0loIAf5Ht3qVH1BY8caWBCWAp76ct2W0ttgVP65S1LzDIK9zh1zqFt
	VIDUN7n9tg7zkLU6kTh8IQGnEQvIS578MpJNZX8QrwR7ulrQ/xAOHOMWn4srOaC75utuIBTVMdm
	C5Ql1GVIMFL2BCNlm93m+DVtsNLxc+t+3v6y1K5MacwNUyWjVfraBdVcPyMZX3QQZ6sSQ9diESC
	mF0/LS/L5yxvycNy7iq3rugCoLtoLg/62s/AN94eSSpLqdZcse/NMIHCS6O8xQ5ZmuNaleVhvlh
	K805fgTobe4FMUy/I+Fz+G5wOiPYSyq1aVMI/39S2NX2+Km4AwGfK86zf659iidY8LmIvQYaNtp
	ezhi4dCJ/OTUU1VkCRTbU+p45SvbkIyUB5nPiyqeicYun5yo5hM3aL1CM/KNewliiEvarWaynwz
	7fmwmZ4N1/lD/DJmvV/p9f9efV0IIgEwoGmDbM+SiFxdt3XGmj4c4q2FCsNiylOnc51CEfLlmrx
	8UxzUc94fUL
X-Received: by 2002:a05:600c:8488:b0:499:49f2:bb86 with SMTP id 5b1f17b1804b1-4997841e807mr88473705e9.6.1786472854001;
        Tue, 11 Aug 2026 11:27:34 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:935c:3ee:d543:9da1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997aac8c47sm12499385e9.15.2026.08.11.11.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 11:27:33 -0700 (PDT)
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
Subject: [PATCH v2 1/9] clk: renesas: rzg2l: Add DSI divider clock support for RZ/G3L
Date: Tue, 11 Aug 2026 19:27:14 +0100
Message-ID: <20260811182729.360959-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811182729.360959-1-biju.das.jz@bp.renesas.com>
References: <20260811182729.360959-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add a new DSI divider clock type (CLK_TYPE_G3L_PLLDSI_DIV) for the RZ/G3L
SoC, which requires a different divider implementation than the existing
RZ/G2L DSI divider clock.

The RZ/G3L DSI divider uses two cascaded dividers, DIV_DSI_A and
DIV_DSI_B, where the effective divider is:

  rate = parent_rate / ((1 << div_a) * (div_b + 1))

DIV_DSI_A is a power-of-two divider with values in the range [0, 5],
and DIV_DSI_B is a linear divider with values in the range [1, 16].

Introduce the g3l_dsi_div_hw_data structure, rzg3l_cpg_dsi_div_ops, and
rzg3l_cpg_dsi_div_clk_register() to implement the new clock type, and add
the DEF_G3L_PLLDSI_DIV() macro for use in clock table definitions.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Introduced the macro DIV_DSI_{A,B}_SET and used inside 
   rzg3l_cpg_dsi_div_recalc_rate() and rzg3l_cpg_dsi_div_set_rate()
 * Simplified the divider to "(div_b + 1) << div_a" in
   rzg3l_cpg_dsi_div_recalc_rate().
 * Replaced the data type u32->unsigned int for the variable divider in
   rzg3l_cpg_dsi_div_determine_rate()
 * Moved the declarations of the loop counters inside the for()-statements
 * Updated the comment sections in rzg3l_cpg_dsi_div_determine_rate().
 * Updated loop logic in rzg3l_cpg_dsi_div_determine_rate().
---
 drivers/clk/renesas/rzg2l-cpg.c | 141 ++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h |   5 ++
 2 files changed, 146 insertions(+)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 975b705d3a2b..1660508d523a 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -67,6 +67,12 @@
 #define CPG_PLL_MON_LOCK		BIT(4)
 #define CPG_PLL_MON_RESETB		BIT(0)
 
+#define DIV_DSI_A_SET    GENMASK(2, 0)
+#define DIV_DSI_B_SET    GENMASK(7, 4)
+
+#define RZG3L_SDIV_DIV_DSI_A_WEN	BIT(16)
+#define RZG3L_SDIV_DIV_DSI_B_WEN	BIT(20)
+
 #define CLK_ON_R(reg)		(reg)
 #define CLK_MON_R(reg)		(0x180 + (reg))
 #define CLK_RST_R(reg)		(reg)
@@ -833,6 +839,138 @@ rzg2l_cpg_dsi_div_clk_register(const struct cpg_core_clk *core,
 	return clk_hw->clk;
 }
 
+struct g3l_dsi_div_hw_data {
+	struct clk_hw hw;
+	struct rzg2l_cpg_priv *priv;
+	unsigned long rate;
+	u32 off;
+	u8 div_a;
+	u8 div_b;
+};
+
+#define to_g3l_dsi_div_hw_data(_hw)	container_of(_hw, struct g3l_dsi_div_hw_data, hw)
+
+static unsigned long rzg3l_cpg_dsi_div_recalc_rate(struct clk_hw *hw,
+						   unsigned long parent_rate)
+{
+	struct g3l_dsi_div_hw_data *dsi_div = to_g3l_dsi_div_hw_data(hw);
+	struct rzg2l_cpg_priv *priv = dsi_div->priv;
+	int div_a, div_b, val;
+
+	val = readl(priv->base + dsi_div->off);
+	div_a = FIELD_GET(DIV_DSI_A_SET, val);
+	div_b = FIELD_GET(DIV_DSI_B_SET, val);
+
+	return DIV_ROUND_CLOSEST_ULL((u64)parent_rate, (div_b + 1) << div_a);
+}
+
+static int rzg3l_cpg_dsi_div_determine_rate(struct clk_hw *hw,
+					    struct clk_rate_request *req)
+{
+	struct g3l_dsi_div_hw_data *dsi_div = to_g3l_dsi_div_hw_data(hw);
+	struct rzg2l_cpg_priv *priv = dsi_div->priv;
+	unsigned int divider = dsi_div_ab_desired;
+	bool divider_found = false;
+
+	if (dsi_div_target) {
+		/* Calculate DIV_DSI_A and DIV_DSI_B */
+		for (unsigned int div_a = 0; div_a <= 5 && !divider_found; div_a++) {
+			unsigned int div_a_tmp = 5 - div_a;
+
+			for (unsigned int div_b = 0; div_b < 16; div_b++) {
+				divider = (div_b + 1) << div_a_tmp;
+				if (divider == dsi_div_ab_desired) {
+					dsi_div->div_a = div_a_tmp;
+					dsi_div->div_b = div_b;
+					divider_found = true;
+					break;
+				}
+			}
+		}
+	} else {
+		dsi_div->div_b = 0;
+		/* Calculate DIV_DSI_A */
+		for (unsigned int div_a = 0; div_a <= 5 && !divider_found; div_a++) {
+			unsigned int div_a_tmp = 5 - div_a;
+
+			divider = 1 << div_a_tmp;
+			if (divider == dsi_div_ab_desired) {
+				dsi_div->div_a = div_a_tmp;
+				divider_found = true;
+				break;
+			}
+		}
+	}
+
+	if (!divider_found) {
+		dev_err(priv->dev, "failed dsi div for: %u\n", divider);
+		return -EINVAL;
+	}
+
+	req->best_parent_rate = req->rate * divider;
+
+	return 0;
+}
+
+static int rzg3l_cpg_dsi_div_set_rate(struct clk_hw *hw, unsigned long rate,
+				      unsigned long parent_rate)
+{
+	struct g3l_dsi_div_hw_data *dsi_div = to_g3l_dsi_div_hw_data(hw);
+	struct rzg2l_cpg_priv *priv = dsi_div->priv;
+
+	writel(RZG3L_SDIV_DIV_DSI_A_WEN | RZG3L_SDIV_DIV_DSI_B_WEN |
+	       FIELD_PREP(DIV_DSI_A_SET, dsi_div->div_a) |
+	       FIELD_PREP(DIV_DSI_B_SET, dsi_div->div_b),
+	       priv->base + dsi_div->off);
+
+	return 0;
+}
+
+static const struct clk_ops rzg3l_cpg_dsi_div_ops = {
+	.recalc_rate = rzg3l_cpg_dsi_div_recalc_rate,
+	.determine_rate = rzg3l_cpg_dsi_div_determine_rate,
+	.set_rate = rzg3l_cpg_dsi_div_set_rate,
+};
+
+static struct clk * __init
+rzg3l_cpg_dsi_div_clk_register(const struct cpg_core_clk *core,
+			       struct rzg2l_cpg_priv *priv)
+{
+	struct g3l_dsi_div_hw_data *clk_hw_data;
+	const struct clk *parent;
+	const char *parent_name;
+	struct clk_init_data init;
+	struct clk_hw *clk_hw;
+	int ret;
+
+	parent = priv->clks[core->parent];
+	if (IS_ERR(parent))
+		return ERR_CAST(parent);
+
+	clk_hw_data = devm_kzalloc(priv->dev, sizeof(*clk_hw_data), GFP_KERNEL);
+	if (!clk_hw_data)
+		return ERR_PTR(-ENOMEM);
+
+	clk_hw_data->priv = priv;
+	clk_hw_data->off = core->conf;
+
+	parent_name = __clk_get_name(parent);
+	init.name = core->name;
+	init.ops = &rzg3l_cpg_dsi_div_ops;
+	init.flags = CLK_SET_RATE_PARENT;
+	init.parent_names = &parent_name;
+	init.num_parents = 1;
+
+	clk_hw = &clk_hw_data->hw;
+	clk_hw->init = &init;
+
+	ret = devm_clk_hw_register(priv->dev, clk_hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return clk_hw->clk;
+}
+
 struct pll5_mux_hw_data {
 	struct clk_hw hw;
 	u32 conf;
@@ -1346,6 +1484,9 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
 	case CLK_TYPE_DSI_DIV:
 		clk = rzg2l_cpg_dsi_div_clk_register(core, priv);
 		break;
+	case CLK_TYPE_G3L_DSI_DIV:
+		clk = rzg3l_cpg_dsi_div_clk_register(core, priv);
+		break;
 	default:
 		goto fail;
 	}
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index bd6169f62538..24642a089b6c 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -142,6 +142,8 @@ enum clk_types {
 	/* Clock for DSI divider */
 	CLK_TYPE_DSI_DIV,
 
+	/* Clock for G3L DSI divider */
+	CLK_TYPE_G3L_DSI_DIV,
 };
 
 #define DEF_TYPE(_name, _id, _type...) \
@@ -201,6 +203,9 @@ enum clk_types {
 		 .num_parents = ARRAY_SIZE(_parent_names))
 #define DEF_DSI_DIV(_name, _id, _parent, _flag) \
 	DEF_TYPE(_name, _id, CLK_TYPE_DSI_DIV, .parent = _parent, .flag = _flag)
+#define DEF_G3L_DSI_DIV(_name, _id, _parent, _conf) \
+	DEF_TYPE(_name, _id, CLK_TYPE_G3L_DSI_DIV, .parent = _parent, .conf = _conf, \
+		 .flag = CLK_SET_RATE_PARENT)
 
 /**
  * struct rzg2l_mod_clk - Module Clocks definitions
-- 
2.43.0

