Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF26351D52B
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 15:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904873; cv=none; b=UPlZ2F5Rg6d3pEgrXyOt3NEqHTLVl+V12bTblzpKInbf9o8GvMU0wd+VHQr1ArkT7k3Pzyu9q1AK2ZO2ctjBqavtkfPpMuR/TwkI3jS4DCrvd4/eoTD97rGESOuxwYGWCyJE2BbppdhhqIRcihyU3XY2hw/My8h3rJd1i0yZ8Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904873; c=relaxed/simple;
	bh=1YdGoWBNFgfAv+Hmopi0kddwewLZcD7aAm41qcmDNmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OC2VdbZA8+r03Z6h2MXGcOyUCER9DUKfkZNxqEUDmfbwYTaUn7W2x4S0V6oJATE0UM7eaVFDT3LBZ8RNsINTgaOxsJkECSFhqF1dPlzLVlOkZbgre8qzBPfaFS8ADEY2wSJxiQo606L7R/c4+xjs/XuFa/H10yL9hiQoTh3f8wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZxjTkek; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZxjTkek"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc1cf287ef8so1663947a12.3
        for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 08:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904870; x=1792509670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SWoddL2aeqwWck75D7tYMRLTpBryElggLirImAgRC5s=;
        b=IZxjTkekGb8Tnzfu3fgvePUX9nsXkkJ6+vnmHdzVKLiBXvJqcyfpnPctF4FZWAH7wu
         0msMqMqX8EcE9pYk+/ZD1PLiMlo6FUkyqXU/8x9kSkqyiLtTXyld2OEkVCWC+tUhpqje
         ltI3YfGm4DC7WOZzc5++4MNipDw2k+VO47cpN8VTtCNo52wli96fLLU6jUsLscbCKT3P
         LSoAvXgFMTiyo6jMOuGhKFazojCEkNohFhOETeteHxLSicsbpmSrxbsTJIzLyXUpqb3I
         NCoKGacN0QLYXXm0hIkGS7UDPceRVTxgag52KiqAhMnC1gqzLO3JgUq87ZwkSzXXVA2J
         N/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904870; x=1792509670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SWoddL2aeqwWck75D7tYMRLTpBryElggLirImAgRC5s=;
        b=G1XoYUrRMLMgVqDyMeyTexYgXnu5f+63o8xHddw4eWKoc3olKlUGe3o/QcA7EgsrpO
         XbwMIjLxAjfAMqDjg1rGJNpaj3YyE6xayeIw0IWLBR41BiC7ZDFWqRSTfpHnXbd/bsip
         8dwvPxOvJG5cuqIM7qEeSnp4peAKPmuaDbnd7Bx8UoPqrOXyHyP6hbjV1Z4vGcFlxwMF
         2uJOWwQMnmUNPT5fqFLPkoRtu+2PlAbb3C9sSWtba6g2wb0trKmyoA/CUsOzqKF/xIb+
         zmoLcYOJp0mmRHLfxp6HvtScOMQN2f8F46RFilxcTkgUMDTTgzLAyF6KO+cBoBYqQDWI
         Gc/w==
X-Forwarded-Encrypted: i=1; AKwUvBxpViSK0Pyv/5Bum4u4T6Uf3CP9Vlz7RdN1JWlq7p2F1LaciVKDXkVGfGRX8IQgwI5E+sWBYfOG+Og=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcEaR5T+zoqUD5aCVt3eofuCTURiSpl4Utg55tvvOEwD5DyEBf
	hfn3vbc+jZXEucnVIf6jhKrlsrdjiQW5dKmEKjxyCsc0rWtJtTwH0IR+
X-Gm-Gg: AYBFou0bj5B4iAc80Xik1YR+HdZNj4Q723mcA8tA6ixrZw45UO41ggbrgKb3nUzMsAd
	Ca+KJd+/izFTgPnGGx22l+bI6Xs+GnZdjmTNyLE3ms27LEeUSeZLv5prVYxqCnXkekHpcNkukdO
	hjHnhPNYg+8nkjwnY2nRuGvKQ4UpyUlfS/pBGjBVqr3uPpKOR6VtjLpZnTGNbdl9191YtTuKWUt
	p6u/3MJwpXQzXidY50iP+DolwzJa531eykY5HPSLUDv4gDZzqb//9k0J1nH6SPZWftBkMGJ9Lp4
	g2c4sErHtI9lsVTxwY8HBWcrhiS6ATvS94gWteGG7Hc8mldyXROuY5HRrqBYZsdCNRs1TsgACiB
	OOyKd7ilMCc4HUmPgSAH4b1gICeiCdp2qKBCFibSGqqo2C+wuDv5bI6cNU0Kjd7AAvc9ZdB4kaB
	6oCOOnPEN/gqYHgNkruS0lKic/eWFOaeMtwsNgQguwkX5UQFYZuGZpY0sqsL1ZmAIkM5rGTjjf7
	EAxQpx34hpcetyILePW+D6kLKcJ
X-Received: by 2002:a05:6a21:329a:b0:3e0:df21:9df1 with SMTP id adf61e73a8af0-3e16be5f9e4mr10904187637.45.1791904870106;
        Tue, 13 Oct 2026 08:21:10 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:21:09 -0700 (PDT)
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
Subject: [PATCH v2 33/35] clk: mediatek: mt8195: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:32 +0900
Message-ID: <20261013151734.3177690-34-akkun11.open@gmail.com>
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

The MT8195 apmixedsys driver previously needed custom probe/remove
callbacks to configure FHCTL and register/unregister FHCTL clocks.
The apusys_pll driver also needed custom callbacks to register and
unregister regular PLLs. With FHCTL and PLL registration supported
by the common helpers, both drivers can use
mtk_clk_simple_probe() and mtk_clk_simple_remove().

Note that the topckgen driver is excluded from this conversion because
it requires devm_mtk_clk_mux_notifier_register(), which is not
currently supported by the common simple probe helper.

Enable module builds by changing the Kconfig setting to "tristate".

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
- Add missing `.data = &apmixed_desc` entry to the OF match table.
---
 drivers/clk/mediatek/Kconfig                 | 12 ++--
 drivers/clk/mediatek/clk-mt8195-apmixedsys.c | 75 +++++---------------
 drivers/clk/mediatek/clk-mt8195-apusys_pll.c | 49 ++-----------
 3 files changed, 31 insertions(+), 105 deletions(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 54ecf2692607..2a25cf6991fc 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -919,13 +919,13 @@ config COMMON_CLK_MT8192_VENCSYS
 	  This driver supports MediaTek MT8192 vencsys clocks.
 
 config COMMON_CLK_MT8195
-        bool "Clock driver for MediaTek MT8195"
-        depends on ARM64 || COMPILE_TEST
-        select COMMON_CLK_MEDIATEK
+	tristate "Clock driver for MediaTek MT8195"
+	depends on ARM64 || COMPILE_TEST
+	select COMMON_CLK_MEDIATEK
 	select COMMON_CLK_MEDIATEK_FHCTL
-        default ARCH_MEDIATEK
-        help
-          This driver supports MediaTek MT8195 clocks.
+	default ARCH_MEDIATEK
+	help
+	  This driver supports MediaTek MT8195 clocks.
 
 config COMMON_CLK_MT8195_APUSYS
 	tristate "Clock driver for MediaTek MT8195 apusys"
diff --git a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c b/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
index a120c3305547..b79a423d25f8 100644
--- a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
@@ -161,68 +161,29 @@ static struct mtk_pllfh_data pllfhs[] = {
 	FH(CLK_APMIXED_TVDPLL2, FH_TVDPLL1, 0x154),
 };
 
+static const struct mtk_clk_desc apmixed_desc = {
+	.clks = apmixed_clks,
+	.num_clks = ARRAY_SIZE(apmixed_clks),
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+	.fhctl_node = "mediatek,mt8195-fhctl",
+	.pllfhs = pllfhs,
+	.num_pllfhs = ARRAY_SIZE(pllfhs),
+};
+
 static const struct of_device_id of_match_clk_mt8195_apmixed[] = {
-	{ .compatible = "mediatek,mt8195-apmixedsys", },
-	{}
+	{
+		.compatible = "mediatek,mt8195-apmixedsys",
+		.data = &apmixed_desc,
+	}, {
+		/* sentinel */
+	},
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8195_apmixed);
 
-static int clk_mt8195_apmixed_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	const u8 *fhctl_node = "mediatek,mt8195-fhctl";
-	int r;
-
-	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
-
-	r = mtk_clk_register_pllfhs(&pdev->dev, plls, ARRAY_SIZE(plls),
-				    pllfhs, ARRAY_SIZE(pllfhs), clk_data);
-	if (r)
-		goto free_apmixed_data;
-
-	r = mtk_clk_register_gates(&pdev->dev, node, apmixed_clks,
-				   ARRAY_SIZE(apmixed_clks), clk_data);
-	if (r)
-		goto unregister_plls;
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		goto unregister_gates;
-
-	platform_set_drvdata(pdev, clk_data);
-
-	return r;
-
-unregister_gates:
-	mtk_clk_unregister_gates(apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
-unregister_plls:
-	mtk_clk_unregister_pllfhs(plls, ARRAY_SIZE(plls), pllfhs,
-				  ARRAY_SIZE(pllfhs), clk_data);
-free_apmixed_data:
-	mtk_free_clk_data(clk_data);
-	return r;
-}
-
-static void clk_mt8195_apmixed_remove(struct platform_device *pdev)
-{
-	struct device_node *node = pdev->dev.of_node;
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_gates(apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
-	mtk_clk_unregister_pllfhs(plls, ARRAY_SIZE(plls), pllfhs,
-				  ARRAY_SIZE(pllfhs), clk_data);
-	mtk_free_clk_data(clk_data);
-}
-
 static struct platform_driver clk_mt8195_apmixed_drv = {
-	.probe = clk_mt8195_apmixed_probe,
-	.remove = clk_mt8195_apmixed_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8195-apmixed",
 		.of_match_table = of_match_clk_mt8195_apmixed,
diff --git a/drivers/clk/mediatek/clk-mt8195-apusys_pll.c b/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
index a2d98ed58e34..36d358141ecb 100644
--- a/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
+++ b/drivers/clk/mediatek/clk-mt8195-apusys_pll.c
@@ -56,55 +56,20 @@ static const struct mtk_pll_data apusys_plls[] = {
 	PLL(CLK_APUSYS_PLL_APUPLL2, "apusys_pll_apupll2", 0x038, 0x044, 0x03c, 0x03c),
 };
 
-static int clk_mt8195_apusys_pll_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	int r;
-
-	clk_data = mtk_alloc_clk_data(CLK_APUSYS_PLL_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	r = mtk_clk_register_plls(&pdev->dev, apusys_plls,
-				  ARRAY_SIZE(apusys_plls), clk_data);
-	if (r)
-		goto free_apusys_pll_data;
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		goto unregister_plls;
-
-	platform_set_drvdata(pdev, clk_data);
-
-	return r;
-
-unregister_plls:
-	mtk_clk_unregister_plls(apusys_plls, ARRAY_SIZE(apusys_plls), clk_data);
-free_apusys_pll_data:
-	mtk_free_clk_data(clk_data);
-	return r;
-}
-
-static void clk_mt8195_apusys_pll_remove(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-	struct device_node *node = pdev->dev.of_node;
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_plls(apusys_plls, ARRAY_SIZE(apusys_plls), clk_data);
-	mtk_free_clk_data(clk_data);
-}
+static const struct mtk_clk_desc apu_pll_desc = {
+	.plls = apusys_plls,
+	.num_plls = ARRAY_SIZE(apusys_plls),
+};
 
 static const struct of_device_id of_match_clk_mt8195_apusys_pll[] = {
-	{ .compatible = "mediatek,mt8195-apusys_pll", },
+	{ .compatible = "mediatek,mt8195-apusys_pll", .data = &apu_pll_desc },
 	{}
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8195_apusys_pll);
 
 static struct platform_driver clk_mt8195_apusys_pll_drv = {
-	.probe = clk_mt8195_apusys_pll_probe,
-	.remove = clk_mt8195_apusys_pll_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8195-apusys_pll",
 		.of_match_table = of_match_clk_mt8195_apusys_pll,
-- 
2.56.0

