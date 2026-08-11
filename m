Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2316E37E5FF
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 18:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786472862; cv=none; b=TYTRZOAeDsPf3+MIT4y1TmpsMEAILZ4J/XcJmAKjFV6+36e7Z2QPO8RDuI1hKmDJof0epZxqfRfb8PtRAjOl4c6TlDxjzP487AUdkb9k/oBk9VB0e6Wp6X+8jqKF8g+SSq0R5+UegAuNEf7az5E3OcjAsvKlpDb7/UW4dvcvOGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786472862; c=relaxed/simple;
	bh=81srWI1KlHLjAM9miqRAolVpUFNZhILYy/bRj9ePtxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ilGj585OKchClwCVCymAqoEDpi5ZFXOO1AFOmRFWGhgsCDNavQF0G68vcq/2YDTliZbG4OJrct925vEv//j1n2v4LapCnj/GpQSEkYg5GuVlHmmpc0xOnO0gRJjbB9PqlUSug7zNpaa8ULYbu+87CdFC0DIeIhhrYHBivZpbTyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HuDsKawJ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HuDsKawJ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4980dc26022so1037885e9.1
        for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 11:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786472857; x=1787077657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nsxRdP5gqkJHIJj6w5qterCv5NlLzVyDoUjZaLik7xA=;
        b=HuDsKawJWCrecU0dI5ySEafGAmlM8wimKFq5ZzL4/L1J/LO7fE4s10I5lRmbXYprau
         rttugC9fkyznnwkA014hBOKw6kwXM3yxPrJCmXOrF8TNQiGDRPkI2SI6DlzxFN4lJGsQ
         jPAuiO0UqAf84iTP2UveVppoSEK6/N6JnHRLF80t9+9e+9GyWRjjvbZFelh6jWlHbQ7e
         pg7xfYm75XxnJ/QsBvQeMJ5Dq+I9IandoR9QFB7elzKbwus/81DmKzaU7H4VNEeUqL7i
         aUDIjPIsMQsMkEAo7Nei49vjxu7ba0U1Vvh2eUTGeFUg8VZxDB8edYesmy3+5uvQIzG7
         bykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786472857; x=1787077657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nsxRdP5gqkJHIJj6w5qterCv5NlLzVyDoUjZaLik7xA=;
        b=B49K3iMyMew9Qo1rGLM3+zbw5TdtFnuUEWrbWGtzQG65+LwgVMRhOy29PELtFQ1+qR
         9wLWLDQCU1AjsraVfe5wIbJPIQP9AgpAX9dNzNcLQCmt+a9XMLgLWIKXhkpXvTTiboIh
         t7JkrAMSbm5c7dkB/VNF+Jyc/zXCX5O/ZlMEAmv4bda7OODo/ZPB760qkyQvDBJ7Kbvq
         bmqEzO44X1bhZA4JQeka8CxXvTqwiDrmFAO7osRA/0ZJ+5ncdVuiXK8HW5Q/m5vuePg8
         G5K4qRQ0T7Uyqdzv2ofs/QNCMgQE35WDLlH3M0b9jfDYjIB954le6Q4qdD/LXcW8n+jA
         3Ong==
X-Forwarded-Encrypted: i=1; AHgh+RqkMokg5QxVSTepR822mChKai1lS3bKk1B9/woUZWVmosVu14hfshTYYD/8qISn9vNwY9n5EMyk4Hw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwqQr6NKsZDws/XNVHLYyje9iqQyMntAw5PEh9nNWFuMWQYd7A
	gWUPbnNU6yNBQqb0lR8QZZ0+x9zxex28uGi9WxncHrVTwsf3Pj9h4gD2nEkf2w==
X-Gm-Gg: AR+sD13N0Ujzz0EP21iyPDbO0dNDs48hLlQddTOKpc/vx+ZJjkOqlU/nwNvJ0k9N/Pg
	JbgbdIvDB5PRbhWXD/O8YRSo6BzIRdfjVWIGREBGnAkArQckuvNlk5qRtiZAMl00K5Xa+BrE33a
	bSO3uaEBCuVqbp22E3UbZsmBBi8EXIh3bSL59aRe4vcEpscjBnrO+s7YcYXNJZfTG5ibpG38jPs
	tDRQ58cH2LiW5r2a1GTtNDgAH+waPs2zJaJG+m/qApxwnJLP8+NcJoJkH/RlzNNFv7bQsfr5oI/
	jUUC1BM0F+oBiw7eI9w1prCHUapryVqixMv8kOwH4xVKySQmLZHdsMMhsfLKSm8J7vAZZ7WXQWR
	ctpzXzlB74+FNik2Z5lZq7Ig8lx9e7FNCRAqngabD4guWZK5b9D2LEN8HJ2PkAhI1qnq1dHfyEc
	lB/vvuwXDt61ONY12wqQePE9BgUIFyHS+Eo4OcrMaAAfZ4i8XqPphZSpOLJGn2295c+RdKJfdL8
	RHpNsqMMr0w
X-Received: by 2002:a05:600c:4683:b0:499:5210:c537 with SMTP id 5b1f17b1804b1-4997842c1efmr76883715e9.1.1786472857045;
        Tue, 11 Aug 2026 11:27:37 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:935c:3ee:d543:9da1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997aac8c47sm12499385e9.15.2026.08.11.11.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 11:27:36 -0700 (PDT)
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
Subject: [PATCH v2 5/9] clk: renesas: rzg2l: Add support for LVDS fixed-factor divider with 4:7 duty cycle
Date: Tue, 11 Aug 2026 19:27:18 +0100
Message-ID: <20260811182729.360959-6-biju.das.jz@bp.renesas.com>
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

Add a new CLK_TYPE_G3L_LVDS_DIV clock type and register function for
a fixed-factor divider used by the LVDS clock, which cannot produce a
50% duty cycle for odd divider values. Implement a custom
get_duty_cycle() callback that reports the actual (div + 1) / 2 : div
duty cycle, and add the DEF_G3L_LVDS_DIV() macro to define such
clocks.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2:
 * New patch.
---
 drivers/clk/renesas/rzg2l-cpg.c | 87 +++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h |  6 +++
 2 files changed, 93 insertions(+)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 2d80775c60c2..d3d4e618466c 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -864,6 +864,90 @@ rzg2l_cpg_dsi_div_clk_register(const struct cpg_core_clk *core,
 	return clk_hw->clk;
 }
 
+static int rzg3l_cpg_lvds_div_determine_rate(struct clk_hw *hw,
+					     struct clk_rate_request *req)
+{
+	return clk_fixed_factor_ops.determine_rate(hw, req);
+}
+
+static int rzg3l_cpg_lvds_div_set_rate(struct clk_hw *hw, unsigned long rate,
+				       unsigned long parent_rate)
+{
+	return clk_fixed_factor_ops.set_rate(hw, rate, parent_rate);
+}
+
+static unsigned long rzg3l_cpg_lvds_div_recalc_rate(struct clk_hw *hw,
+						    unsigned long parent_rate)
+{
+	return clk_fixed_factor_ops.recalc_rate(hw, parent_rate);
+}
+
+static unsigned long rzg3l_cpg_lvds_div_recalc_accuracy(struct clk_hw *hw,
+							unsigned long parent_accuracy)
+{
+	return clk_fixed_factor_ops.recalc_accuracy(hw, parent_accuracy);
+}
+
+static int rzg3l_cpg_lvds_div_get_duty_cycle(struct clk_hw *hw,
+					     struct clk_duty *duty)
+{
+	struct clk_fixed_factor *fix = to_clk_fixed_factor(hw);
+
+	/*
+	 * An odd divider cannot generate a 50% duty cycle: the output stays
+	 * high for (div + 1) / 2 input clock cycles out of div, e.g. a divider
+	 * of 7 gives a duty cycle of 4/7.
+	 */
+	duty->num = (fix->div + 1) / 2;
+	duty->den = fix->div;
+
+	return 0;
+}
+
+static const struct clk_ops rzg3l_cpg_lvds_div_ops = {
+	.determine_rate	= rzg3l_cpg_lvds_div_determine_rate,
+	.set_rate	= rzg3l_cpg_lvds_div_set_rate,
+	.recalc_rate	= rzg3l_cpg_lvds_div_recalc_rate,
+	.recalc_accuracy = rzg3l_cpg_lvds_div_recalc_accuracy,
+	.get_duty_cycle	= rzg3l_cpg_lvds_div_get_duty_cycle,
+};
+
+static struct clk * __init
+rzg3l_cpg_lvds_div_clk_register(const struct cpg_core_clk *core,
+				struct rzg2l_cpg_priv *priv)
+{
+	struct clk_fixed_factor *ff;
+	struct clk_init_data init;
+	const struct clk *parent;
+	const char *parent_name;
+	int ret;
+
+	parent = priv->clks[core->parent];
+	if (IS_ERR(parent))
+		return ERR_CAST(parent);
+
+	ff = devm_kzalloc(priv->dev, sizeof(*ff), GFP_KERNEL);
+	if (!ff)
+		return ERR_PTR(-ENOMEM);
+
+	parent_name = __clk_get_name(parent);
+	init.name = core->name;
+	init.ops = &rzg3l_cpg_lvds_div_ops;
+	init.flags = CLK_SET_RATE_PARENT;
+	init.parent_names = &parent_name;
+	init.num_parents = 1;
+
+	ff->hw.init = &init;
+	ff->mult = 1;
+	ff->div = core->conf;
+
+	ret = devm_clk_hw_register(priv->dev, &ff->hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return ff->hw.clk;
+}
+
 struct g3l_dsi_div_hw_data {
 	struct clk_hw hw;
 	struct rzg2l_cpg_priv *priv;
@@ -1715,6 +1799,9 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
 	case CLK_TYPE_G3L_DSI_DIV:
 		clk = rzg3l_cpg_dsi_div_clk_register(core, priv);
 		break;
+	case CLK_TYPE_G3L_LVDS_DIV:
+		clk = rzg3l_cpg_lvds_div_clk_register(core, priv);
+		break;
 	case CLK_TYPE_G3L_PLLDSI:
 		clk = rzg2l_cpg_pll_clk_register(core, priv, &rzg3l_cpg_plldsi_ops);
 		break;
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index ebf6b744dac4..22cca4795301 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -148,6 +148,9 @@ enum clk_types {
 
 	/* Clock for G3L DSI divider */
 	CLK_TYPE_G3L_DSI_DIV,
+
+	/* Clock for G3L LVDS divider */
+	CLK_TYPE_G3L_LVDS_DIV,
 };
 
 #define DEF_TYPE(_name, _id, _type...) \
@@ -217,6 +220,9 @@ enum clk_types {
 #define DEF_G3L_DSI_DIV(_name, _id, _parent, _conf) \
 	DEF_TYPE(_name, _id, CLK_TYPE_G3L_DSI_DIV, .parent = _parent, .conf = _conf, \
 		 .core_flags = CLK_SET_RATE_PARENT)
+#define DEF_G3L_LVDS_DIV(_name, _id, _parent, _conf) \
+	DEF_TYPE(_name, _id, CLK_TYPE_G3L_LVDS_DIV, .parent = _parent, .conf = _conf, \
+		 .core_flags = CLK_SET_RATE_PARENT)
 #define DEF_G3L_PLLDSI(_name, _id, _parent, _conf) \
 	DEF_TYPE(_name, _id, CLK_TYPE_G3L_PLLDSI, .parent = _parent, .conf = _conf)
 
-- 
2.43.0

