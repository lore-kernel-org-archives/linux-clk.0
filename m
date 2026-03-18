Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBD1386459
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 08:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773823327; cv=none; b=qh8ZW0TvhAiUDhJSRRcSNjUw6Di+5z3XqDUjsZIoGvIb1+CbMCUuf/uo7h5asHGvTQ1XvVLY7LZ+dBIeEmVCQ5oWMGhlwV3kGXsqmcRZ10ftP88JvhO2v7PLV+WYl2S2I5tKrXTS8Wkc0uGdFzy8+3mLsCiURdd8vKpUAGz1tVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773823327; c=relaxed/simple;
	bh=UlVIEWksOGidzLhELm6FOhj1fA2LcWYuCIseKRxqo0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WZIhvCUhiLZU1JT3z33BeUsG9ORFu/7vVPg7XHDvmQCOfVUr5kmXTP4OVanvsgJkGWAUYfU5b7KUBGi1YxZBm6CDCigvZ6G7Srljet1pZGPYs++IyRt+/1WTIw7Yido9c3rJBE9M6KBt4RYqaXP5Lbs/JwBo+rUpmYn3oyhMJSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hKIu3Km8; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKIu3Km8"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439af7d77f0so4892759f8f.0
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 01:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773823319; x=1774428119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJhdYIHEqHngGQnhgH6a4HSKJLQKsmBPc8Z152SEJH8=;
        b=hKIu3Km8SLbc3vxQjpbKWzeXwD//YeAIpAdj/5NZE2m7338LspWZkwVJgwQ4NIHOSH
         rFqSycvxQBWGTVF9KI/P1X5fvIvyuEkwxKSJjl7M7xX90+YkqkwWP3UIv3Pv19uE/4F2
         e4ynQaic5c65+66WGSBiI4HXaByF9S5VZOh05EBNY7Ro16i/s1fvvm9Zo3swlS2kfswL
         Mq6DO9XHpotiWQ618au09FUbQAFPBNNCSvuT5iLwIrBw+obI/HRo8hMo8h1ArQx/GNom
         1IeuKgHnBg3/4yeHakXdkgZet3ub8Ecx+3hgKLEKA6PMvhl4+oXiI0ewSRBBnjYfpfUy
         0Ozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773823319; x=1774428119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zJhdYIHEqHngGQnhgH6a4HSKJLQKsmBPc8Z152SEJH8=;
        b=YZXOsf3+kfHH8hL6TotQw1CkdU/WpmtS6uMkfYq4CEcMY9pgraYcAutnkYCWsknJCc
         EEt2mehz+xj2OHSJGT7BaZM+qxsSUOdnStaOIbekZVuUqQnpbKZA2N8f8K1/FRQGmeZY
         R5VE5WJUdVVoIo046Ms8mnuu/cjMmArpBH+dTAipZ7E4VL+DbibBW5pfqI1I2E2ATufF
         0y2XBHvud/by1LBp1YHBfmn4wuZSrCCTCDE52VcV3LJ0vMsQj7MuZoPnN2gIgkeZy7Fc
         yD0XkH1UBaEUscgMwd//ZINpcLleZRt1hMqUTl1AO6KE5zM8SS9hedSWRB9wpWQ8igqo
         ZgWA==
X-Forwarded-Encrypted: i=1; AJvYcCUJwPU+QKMfJhlrAID8jnp2uSOMS8SDhDTE4rQTeNrxWpD8IMX0F94TaBfCTQqBP+wDcT2qNNn495U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/zpsOnPI/tg/yXifBYmQezDUlATvLdYMK+9ZCJhyLn1kexS+W
	Tah4nZXMLwn0mVgBPGhGf81R0gG844IXzQ6Bd9E30aSOwFEcCrBuh2oG
X-Gm-Gg: ATEYQzx9E4k4gm7k8+/jIEgZ9N5K+KdSZRqTv4TRZPvpJJ0dJcT6BSgj000njtbXhFw
	nt0ylSzonHmEzVwVi99VaPZrdy9Nr/4cgGYpze/1BuEFEL0D5D9Na6rQDusuBbO24+ITLJSroZN
	iGaKkeMClZVLoRjaJvjK46akJWxFCYeuUE1SiYrskHtwxb/cEofjQsoYp8HTptI7TpENnHGIlhD
	hMQ5HM7OlrM57sxfEcvV+uEXUdAhcullSpYT8grAySDY8JKLkd5tZPE7j7GRbDtDyl1m4sLUQnB
	iZim5EHPuKpRin47p74HmVCMNpKILGZvQjVThy1t/UjARCgtbig4vNBTKpNpKsSU0lBfpp8D6kn
	nsOyFbzxFGo5XqdW+V8KLGLN9j9mBsvzTXa1q67r++pnijLTD3SA2tDUhdKg7+RwfeQunadqAS3
	5mci2k6zuVwLQwDmEAgsE2grmNAXK/PnNtKtDXEKIssZA50s9D
X-Received: by 2002:a05:6000:26c7:b0:43b:47cd:8f6c with SMTP id ffacd0b85a97d-43b527abd15mr3693582f8f.20.1773823318724;
        Wed, 18 Mar 2026 01:41:58 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:d643:4385:f93a:2085])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5184961csm6389350f8f.6.2026.03.18.01.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 01:41:58 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v5 4/9] clk: renesas: rzg2l-cpg: Re-enable critical module clocks during resume
Date: Wed, 18 Mar 2026 08:41:39 +0000
Message-ID: <20260318084151.122674-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260318084151.122674-1-biju.das.jz@bp.renesas.com>
References: <20260318084151.122674-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

After a suspend/resume cycle, critical module clocks may be left disabled
as the hardware state is not automatically restored. Unlike regular clocks
which are re-enabled by their respective drivers, critical clocks
(CLK_IS_CRITICAL) have no owning driver to restore them, so the CPG driver
must take responsibility for re-enabling them on resume.

Introduce struct rzg2l_crit_clk_hw to track critical module clock hardware
entries in a singly-linked list anchored at crit_clk_hw_head in
rzg2l_cpg_priv. Populate the list during module clock registration by
checking for the CLK_IS_CRITICAL flag after clk_hw_register() succeeds.

On resume, walk the list and re-enable any critical module clock that is
found to be disabled, before deasserting critical resets, ensuring the
correct clock-before-reset restore ordering.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * No change
v4:
 * Moved this patch from [1] as it is boot-dependent
 [1] https://lore.kernel.org/all/20260306134228.871815-1-biju.das.jz@bp.renesas.com/
---
 drivers/clk/renesas/rzg2l-cpg.c | 41 +++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 8165c163143a..c2d31b93f62b 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -130,6 +130,12 @@ struct div_hw_data {
 	u32 width;
 };
 
+/* Critical clk list  */
+struct rzg2l_crit_clk_hw {
+	struct clk_hw *hw;
+	struct rzg2l_crit_clk_hw *next;
+};
+
 #define to_div_hw_data(_hw)	container_of(_hw, struct div_hw_data, hw_data)
 
 struct rzg2l_pll5_param {
@@ -168,6 +174,7 @@ struct rzg2l_pll5_mux_dsi_div_param {
  * @info: Pointer to platform data
  * @genpd: PM domain
  * @mux_dsi_div_params: pll5 mux and dsi div parameters
+ * @crit_clk_hw_head: Head of the linked list critical clk entries
  */
 struct rzg2l_cpg_priv {
 	struct reset_controller_dev rcdev;
@@ -186,8 +193,26 @@ struct rzg2l_cpg_priv {
 	struct generic_pm_domain genpd;
 
 	struct rzg2l_pll5_mux_dsi_div_param mux_dsi_div_params;
+
+	struct rzg2l_crit_clk_hw *crit_clk_hw_head;
 };
 
+static int rzg2l_cpg_add_crit_clk_hw_entry(struct rzg2l_cpg_priv *priv,
+					   struct clk_hw *hw)
+{
+	struct rzg2l_crit_clk_hw *node;
+
+	node = devm_kzalloc(priv->dev, sizeof(*node), GFP_KERNEL);
+	if (!node)
+		return -ENOMEM;
+
+	node->hw = hw;
+	node->next = priv->crit_clk_hw_head;
+	priv->crit_clk_hw_head = node;
+
+	return 0;
+}
+
 static inline u8 rzg2l_cpg_div_ab(u8 a, u8 b)
 {
 	return (b + 1) << a;
@@ -1737,6 +1762,13 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
 		goto fail;
 	}
 
+	if (init.flags & CLK_IS_CRITICAL) {
+		if (rzg2l_cpg_add_crit_clk_hw_entry(priv, &clock->hw)) {
+			clk = ERR_PTR(-ENOMEM);
+			goto fail;
+		}
+	}
+
 	clk = clock->hw.clk;
 	dev_dbg(dev, "Module clock %pC at %lu Hz\n", clk, clk_get_rate(clk));
 	priv->clks[id] = clk;
@@ -2086,8 +2118,17 @@ static int __init rzg2l_cpg_probe(struct platform_device *pdev)
 static int rzg2l_cpg_resume(struct device *dev)
 {
 	struct rzg2l_cpg_priv *priv = dev_get_drvdata(dev);
+	struct rzg2l_crit_clk_hw *node;
 	int ret;
 
+	for (node = priv->crit_clk_hw_head; node; node = node->next) {
+		if (!rzg2l_mod_clock_is_enabled(node->hw)) {
+			ret = rzg2l_mod_clock_endisable(node->hw, true);
+			if (ret)
+				return ret;
+		}
+	}
+
 	ret = rzg2l_cpg_deassert_crit_resets(&priv->rcdev, priv->info);
 	if (ret)
 		return ret;
-- 
2.43.0

