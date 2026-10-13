Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7C353D9CF
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 15:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904838; cv=none; b=UPydPTShxP2ovdBnTUssUNq6vSSDRlCcaV0HPzq3e3vUWqzwK1r+gFw/J2NLr1P4z8l8Xpf1RWuoFDZs7u1NrrV3HXEm0SxLq0OZmMHuwHRMZBvbZAZVfXzTitd+vIdXREz2MZ1rsKuTq5t8EJ9ZNmdE+IrYicAI01wHGS1K/OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904838; c=relaxed/simple;
	bh=EEYZOJo1fS1pyLaIRu4n/N1/lu9GsA3pg0KxBd0b5SQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Os6BSD027s3rKFh0pu0uiuGOLvyd0S0zWzwIgVCIGP87nN8a6Vf2BHNbzNqZs3siR3AOKpGfH9N5FFeis6waEUtu1xmMoODxIut/tO0jElkUvVqvEorBYWHiWRM2c4eyQKOAazyWuKZYPpKOR5+PrsfzRcGc0O6BDodgRIQazJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I6EAlxgz; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I6EAlxgz"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ac397836fbso826556a91.1
        for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 08:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904836; x=1792509636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=auCf8eCSpvAiDE8LzEvBEdtxk+NZAa2oXMsy16G7EVc=;
        b=I6EAlxgz9QyJOgyP4dlNSnuRlYpmBwRD8SeBxJH0lWnzc2BpNRuPrAbjHpOnefWlc0
         H4Dt9l5A69d7JVbWZFMb3SRWjCqu8BXiprAxdybc+a1umqQtmdegz/56YXOAKqzVMVSP
         D99nxlgk74xk8OoNK49SHKujCIosSMKLK4YR7byJHYhUG3dl7MPc0fgy5rdOxj6pRwbY
         FuiNU53NkVBPnkhfpsyNF2Ps0OSOP0aplhUVUHBcgeM9ARLhbIL7IfY0Z+xaGWUVCQlU
         LySNc41JCxXV0UJGMBQuVLFX16KvkqHg9QRaBuPS+D+dQmFikqL125Noj8IzLaz08BVJ
         39lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904836; x=1792509636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=auCf8eCSpvAiDE8LzEvBEdtxk+NZAa2oXMsy16G7EVc=;
        b=zcnaher0z4U6qfAYOC5SD8KVL0BU65Xk2vv6T5M59+QbQ/nBefHlGQsxYMruwFxmt9
         +MWUq73SY5H1HC0I1q7yJbjw4qfd1ARsCvM8TRPCuBMBfma8w8wDuRD2iSKoD1AcrKfg
         uwJ7LR3ACA5thDUrzVeLn6EaFuyLoJ2M2dw9neCyi/rNwiKbDP/3DSMTnEzbc3tppQJq
         oPbSwA3Pv79w8FIiathzeiJlluYk64A23yiIUDIFSKi84z71X0ipnllhoBRP+edUoi6R
         GtUBPF1YqeopJl86jEdmHPKAYC7qehXBDGojqU4Og1VW45JQTc2j92OFuAPwEfv9FvAJ
         cRmg==
X-Forwarded-Encrypted: i=1; AKwUvByDZIJqfYbjcGGME9W6Q+/COSiblHkDB/pG2zB4gOmmLhgQjgvsFnZZcVrPwQXJOcXP/gr2a+VE5BI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKt1T7YfEChux6PFDC1Hs+ZgBOujAnYi2ydfv3fiA2CgEISDOcN
	Hb22A24WQPJ3VLrcTUIIgpUK9b9K+eEDlq0KWTfQ3ygjpHWmdZQvPTo7
X-Gm-Gg: AYBFou0ApmWtxjs1TzvvyUbESkSjOdz5IMNFk/jg4VyRzI+Z8YkVYEiqP1RvaUtIMLX
	TqNUE89LNoP8dU3GnYQ8GqU6fMgZuY2SMIutyVjnk8EyKrkbTttEzsNnCj4hs1ed2wrXLx7/2Z2
	X8X351Ot8HdrotPWiQF8Y2hojsLfJ13WbA5Mm/P5O6SaTSkjF6OvQ3DEGg/ZSzfenuI2o8BbLeC
	RsC0IIPzj2QLXm5EOBWn1//eK6DoyBAgYRp+HDsPrRbNtcAllL/KwbVQUCk1CUrqzoyT987XBYM
	gWKNex0xG81veCxxxEO2JBM/YMysI5zlNmd7FGwkGlQIKUZTzVBU5H6MyLkmIu7OrDkIJIpcM2q
	1kNHJ7dvYc0oyKYqWRnJT5vHPWpYrEbU64ctV1QATmyIN+1ZTZ2ep0NC/0+mHkvLNHfYnUIVvEJ
	S87MM9oIyHyW8D+FzzbpKvxTlUmZjaH6uwGY0xeUDRUn8NrkqXYIg44wY+UQ0x6bHHebi4eRHkO
	QF+jVDT5rL9Mo+mGrEiJEhQPK0/
X-Received: by 2002:a17:90b:2d86:b0:39d:f4fd:8075 with SMTP id 98e67ed59e1d1-3ab3a60eb9bmr10510529a91.19.1791904835959;
        Tue, 13 Oct 2026 08:20:35 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:20:35 -0700 (PDT)
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
Subject: [PATCH v2 27/35] clk: mediatek: mt8167-apmixedsys: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:26 +0900
Message-ID: <20261013151734.3177690-28-akkun11.open@gmail.com>
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

The MT8167 apmixedsys driver used a custom probe to register PLLs and
divider clocks but had no remove callback. With PLL registration now
supported alongside the existing divider-clock support,
the driver can use mtk_clk_simple_probe() and mtk_clk_simple_remove().

Switch to module_platform_driver() to support module unloading and
ensure that registered clocks are unregistered on removal.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
- Add missing `.data = &apmixed_desc` entry to the OF match table.
---
 drivers/clk/mediatek/clk-mt8167-apmixedsys.c | 58 ++++++--------------
 1 file changed, 16 insertions(+), 42 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8167-apmixedsys.c b/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
index fb6c21bbeef8..aba33e5aafe6 100644
--- a/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
@@ -89,59 +89,33 @@ static const struct mtk_clk_divider adj_divs[] = {
 		     0x1c4, 24, 3, CLK_DIVIDER_POWER_OF_TWO),
 };
 
-static int clk_mt8167_apmixed_probe(struct platform_device *pdev)
-{
-	void __iomem *base;
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	struct device *dev = &pdev->dev;
-	int ret;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	clk_data = mtk_devm_alloc_clk_data(dev, MT8167_CLK_APMIXED_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	ret = mtk_clk_register_plls(dev, plls, ARRAY_SIZE(plls), clk_data);
-	if (ret)
-		return ret;
-
-	ret = mtk_clk_register_dividers(dev, adj_divs, ARRAY_SIZE(adj_divs), base,
-					&mt8167_apmixed_clk_lock, clk_data);
-	if (ret)
-		goto unregister_plls;
-
-	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (ret)
-		goto unregister_dividers;
-
-	return 0;
-
-unregister_dividers:
-	mtk_clk_unregister_dividers(adj_divs, ARRAY_SIZE(adj_divs), clk_data);
-unregister_plls:
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
-
-	return ret;
-}
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+	.divider_clks = adj_divs,
+	.num_divider_clks = ARRAY_SIZE(adj_divs),
+	.clk_lock = &mt8167_apmixed_clk_lock,
+};
 
 static const struct of_device_id of_match_clk_mt8167_apmixed[] = {
-	{ .compatible = "mediatek,mt8167-apmixedsys" },
-	{ /* sentinel */ }
+	{
+		.compatible = "mediatek,mt8167-apmixedsys",
+		.data = &apmixed_desc,
+	}, {
+		/* sentinel */
+	},
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8167_apmixed);
 
 static struct platform_driver clk_mt8167_apmixed_drv = {
-	.probe = clk_mt8167_apmixed_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8167-apmixed",
 		.of_match_table = of_match_clk_mt8167_apmixed,
 	},
 };
-builtin_platform_driver(clk_mt8167_apmixed_drv)
+module_platform_driver(clk_mt8167_apmixed_drv)
 
 MODULE_DESCRIPTION("MediaTek MT8167 apmixedsys clocks driver");
 MODULE_LICENSE("GPL");
-- 
2.56.0

