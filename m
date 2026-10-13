Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D015538D6A
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 15:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904794; cv=none; b=fXrAw9xUcFpVaFNww3y12p4u6H0C9VMlBcMz1h+8owfLW7upaI9gy/WT6ZbcxQ8eFaBPM34kf8qN51AzBXrGo0q8qgkxyZOqL8MK5+PzgAh1IHQnut8DZe/sp9qQUIefALhlASzVp/gY/SqUDCqem5Kj+ii/6EQKPBk7eUS0t3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904794; c=relaxed/simple;
	bh=jQXISte4512UXkB7nD+gR2uEbebk7kGJfbPVPBxzajo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DjwsIoO0lNJp7eCfAnn9/7+KZEur96pnHL5DzfnxDBOUvmEhgalzjgBDXES6O18ovX0ClCcIDdXBCUnsQ5u3s7k1q1+isTzTE6SZgFW21xh1A88Lk/XRFWkMVjOyfBzM/yMcIUixJ/ntmWpGS+lAwZE9oRU+ltPlNfGYt4qua5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F9DVx3U8; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9DVx3U8"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc4dbcf2b85so1368813a12.3
        for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 08:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904791; x=1792509591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=feoaN6NpRHCSeWvh9mDowzQEdrnMihG5ZQRjKnCemwM=;
        b=F9DVx3U8sNCftQjNzTNuFhosVCzruO9jl+PA1X+KwZKq5hF0asl/TjZ0P+5j5vVcB2
         wUOcAWaLSet9jKu3OTNdXTTsJCO+CzAXOBtOKVwLr3hG+NGcyhVC6OW2l3edDWPGKSfB
         XpGeiJ71BbtWfrq1ehf8YusmYsLrIQNRx8Ge7WKeeZAdQ/bKVfpUWf5F32oTgaYax4uf
         qvV1V8vueqYYSC4KGwu36M6QB2U5yFcnXPSOeffXV08E6PK/t5lMIOyCkM5IoW6RE22H
         taW87NXJ4dlShGz4Ss1LcMbYZGYLpuNpz326e0Tznd01wnlQ7Adx8VATba7IevZ/Eza8
         GKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904791; x=1792509591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=feoaN6NpRHCSeWvh9mDowzQEdrnMihG5ZQRjKnCemwM=;
        b=TLMRH9YdSkPgIfq8CcniyNM723gmJyg6FZbnpqCTLoOILdFzz9rKxAD9ftE+s+os05
         U+pd+aFIZJc3JsVu+rS18ckodV7A/B3If3LihqFgIU7OCcMjisf9HPhRjjN8me/fZEMy
         g4Ut3dYJwnMBhdnFRNfh91K04UAYm6REDcbjnPNGXpV1AfHm/s3KrL+ak2GmVxF/cNOT
         J+bJp6kTdfcm3vbeT/fcVqUrhCWWHsrEHrlytiVE8pJ0+CuM3kuZobicXukjGxITjLV6
         yq72JP1B16gghfaSPEmqwPuVuFeIHbmNurkbNEofu3JA/HDyXBf/C1hBxud0mokVGn8u
         Pb7g==
X-Forwarded-Encrypted: i=1; AKwUvBxtBw71spY11FSS8qCHyGCbd6roDC89Oq8HiBlMEOhQEomIzlxojlMr4VVNGIPbfLRCk8tHqLLbR0o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIofhRY38/UYcBC0LaDMJCqYArfovd0LIna1i7L59GqJvApZaJ
	hDi3vOXVnMieT6UpImaaoFsPfjRJqTOMDCH2OmBKLTvQyl/e/8nKifsu
X-Gm-Gg: AYBFou20fxou3KU6cQpoSlni9gDx+KSbHvbY7FLn+MFrpg7nmPQsJVx9vCWv8AFYTHy
	vnsuOz3xE8WE+zw/rsfHmKMuh9XO6yBt6xA30AYqdL4CBjWXxOcEmKisgcMlSBXycK9OxJ6ahmv
	9NY6UxqNdNbnIzPkMyMqhn/HQGuZUKhjP+YXSpfJ3m6gUoG/vtGXcklv3I7Oi3ksc4WupyqarDi
	x8BFwMH0Io61/jfKPmWs/fua/uvr+KrOXzFrGVbYOzarijXyEGRGZd8z2zOkLXNq8qDIBVLeiaX
	LoaX9kKTE6M/rl33QZ6iL8wpouWVdgrQGh3jRXTFGr7EATpea8O0jO3XnjG5tW95AlSbK/OBj3P
	7lIEYZqRDaVhMVF4b7Yboj1paUubjg+OjBc0BW66zYYRoYbBnq+9tcgMS3HzX3WISd17h2H+23I
	msSHtM77Gep/6vbAdxj83xvhZJJxHX0k7ToNFzJPcelbxZLyI+diUpvILVPp1Dx6MP78oFj9ePg
	wwi/AQbLK2KD7B8eL1U4dHXxCEWrzulm2IztDg=
X-Received: by 2002:a05:6a20:6a0b:b0:3e1:348d:b477 with SMTP id adf61e73a8af0-3e16bf7e317mr11955865637.20.1791904791499;
        Tue, 13 Oct 2026 08:19:51 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:19:50 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Miles Chen <miles.chen@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2 19/35] clk: mediatek: mt6779: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:18 +0900
Message-ID: <20261013151734.3177690-20-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MT6779 apmixedsys driver used a custom probe to register PLLs.
With PLL registration now supported by the common helpers, it can use
mtk_clk_simple_probe() and mtk_clk_simple_remove().

Consolidate the apmixedsys, topckgen, and infracfg match entries under
a single platform driver, using struct mtk_clk_desc for the clock
configurations. Replace the custom arch_initcall() registration with
module_platform_driver().

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
---
 drivers/clk/mediatek/clk-mt6779.c | 124 ++++++------------------------
 1 file changed, 22 insertions(+), 102 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt6779.c b/drivers/clk/mediatek/clk-mt6779.c
index 4b9dcb910b03..a806789ae27c 100644
--- a/drivers/clk/mediatek/clk-mt6779.c
+++ b/drivers/clk/mediatek/clk-mt6779.c
@@ -808,7 +808,7 @@ static const char * const i2s5_m_ck_parents[] = {
 	"aud_2_sel"
 };
 
-static const struct mtk_composite top_aud_muxes[] = {
+static const struct mtk_composite top_aud_muxes_divs[] = {
 	MUX(CLK_TOP_I2S0_M_SEL, "i2s0_m_ck_sel", i2s0_m_ck_parents,
 	    0x320, 8, 1),
 	MUX(CLK_TOP_I2S1_M_SEL, "i2s1_m_ck_sel", i2s1_m_ck_parents,
@@ -821,9 +821,7 @@ static const struct mtk_composite top_aud_muxes[] = {
 	    0x320, 12, 1),
 	MUX(CLK_TOP_I2S5_M_SEL, "i2s5_m_ck_sel", i2s5_m_ck_parents,
 	    0x328, 20, 1),
-};
 
-static struct mtk_composite top_aud_divs[] = {
 	DIV_GATE(CLK_TOP_APLL12_DIV0, "apll12_div0", "i2s0_m_ck_sel",
 		 0x320, 2, 0x324, 8, 0),
 	DIV_GATE(CLK_TOP_APLL12_DIV1, "apll12_div1", "i2s1_m_ck_sel",
@@ -1211,125 +1209,47 @@ static const struct mtk_pll_data plls[] = {
 	    0, 0, 32, 8, 0x02D4, 1, 0, 0x14, 1, 0x02D8, 0, 0x02D4),
 };
 
-static int clk_mt6779_apmixed_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-
-	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	mtk_clk_register_plls(&pdev->dev, plls, ARRAY_SIZE(plls), clk_data);
-
-	mtk_clk_register_gates(&pdev->dev, node, apmixed_clks,
-			       ARRAY_SIZE(apmixed_clks), clk_data);
-
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-}
-
-static int clk_mt6779_top_probe(struct platform_device *pdev)
-{
-	void __iomem *base;
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	mtk_clk_register_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks),
-				    clk_data);
-
-	mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), clk_data);
-
-	mtk_clk_register_muxes(&pdev->dev, top_muxes,
-			       ARRAY_SIZE(top_muxes), node,
-			       &mt6779_clk_lock, clk_data);
-
-	mtk_clk_register_composites(&pdev->dev, top_aud_muxes,
-				    ARRAY_SIZE(top_aud_muxes), base,
-				    &mt6779_clk_lock, clk_data);
-
-	mtk_clk_register_composites(&pdev->dev, top_aud_divs,
-				    ARRAY_SIZE(top_aud_divs), base,
-				    &mt6779_clk_lock, clk_data);
-
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-}
-
-static const struct of_device_id of_match_clk_mt6779[] = {
-	{
-		.compatible = "mediatek,mt6779-apmixed",
-		.data = clk_mt6779_apmixed_probe,
-	}, {
-		.compatible = "mediatek,mt6779-topckgen",
-		.data = clk_mt6779_top_probe,
-	}, {
-		/* sentinel */
-	}
+static const struct mtk_clk_desc apmixed_desc = {
+	.clks = apmixed_clks,
+	.num_clks = ARRAY_SIZE(apmixed_clks),
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
 };
 
-static int clk_mt6779_probe(struct platform_device *pdev)
-{
-	int (*clk_probe)(struct platform_device *pdev);
-	int r;
-
-	clk_probe = of_device_get_match_data(&pdev->dev);
-	if (!clk_probe)
-		return -EINVAL;
-
-	r = clk_probe(pdev);
-	if (r)
-		dev_err(&pdev->dev,
-			"could not register clock provider: %s: %d\n",
-			pdev->name, r);
-
-	return r;
-}
+static const struct mtk_clk_desc topck_desc = {
+	.fixed_clks = top_fixed_clks,
+	.num_fixed_clks = ARRAY_SIZE(top_fixed_clks),
+	.factor_clks = top_divs,
+	.num_factor_clks = ARRAY_SIZE(top_divs),
+	.mux_clks = top_muxes,
+	.num_mux_clks = ARRAY_SIZE(top_muxes),
+	.composite_clks = top_aud_muxes_divs,
+	.num_composite_clks = ARRAY_SIZE(top_aud_muxes_divs),
+	.clk_lock = &mt6779_clk_lock,
+};
 
 static const struct mtk_clk_desc infra_desc = {
 	.clks = infra_clks,
 	.num_clks = ARRAY_SIZE(infra_clks),
 };
 
-static const struct of_device_id of_match_clk_mt6779_infra[] = {
+static const struct of_device_id of_match_clk_mt6779[] = {
+	{ .compatible = "mediatek,mt6779-apmixed", .data = &apmixed_desc },
+	{ .compatible = "mediatek,mt6779-topckgen", .data = &topck_desc },
 	{ .compatible = "mediatek,mt6779-infracfg_ao", .data = &infra_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt6779);
 
-static struct platform_driver clk_mt6779_infra_drv  = {
+static struct platform_driver clk_mt6779_drv  = {
 	.probe = mtk_clk_simple_probe,
 	.remove = mtk_clk_simple_remove,
-	.driver = {
-		.name = "clk-mt6779-infra",
-		.of_match_table = of_match_clk_mt6779_infra,
-	},
-};
-
-static struct platform_driver clk_mt6779_drv = {
-	.probe = clk_mt6779_probe,
 	.driver = {
 		.name = "clk-mt6779",
 		.of_match_table = of_match_clk_mt6779,
 	},
 };
-
-static int __init clk_mt6779_init(void)
-{
-	int ret = platform_driver_register(&clk_mt6779_drv);
-
-	if (ret)
-		return ret;
-	return platform_driver_register(&clk_mt6779_infra_drv);
-}
-
-arch_initcall(clk_mt6779_init);
+module_platform_driver(clk_mt6779_drv);
 
 MODULE_DESCRIPTION("MediaTek MT6779 main clocks driver");
 MODULE_LICENSE("GPL");
-- 
2.56.0

