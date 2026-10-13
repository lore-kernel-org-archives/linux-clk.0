Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C622D539762
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 15:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904799; cv=none; b=VWDYkrNJElLAGXNsBNF6GsXWH8UMtLCBjrzGeculcrpEns0vO9cg5VtZzYYTfOF6286pLSOxGfO4St/9GTcanRWbbQWzMDH/3A80OIFWm1Z7GwPnIwDIwBmadaLmtSKuuzCSqCWLFSgyvXaHC80qFwPi0hJsL+wrOVmB3E5RxfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904799; c=relaxed/simple;
	bh=q5IQk6e7/7670zHFVfFFwEr5ZM7k1PuBcPKZHReZxbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HAwPFy8wgbrKV00QwRG+fs3Bfaam5ZarYTzwuqkmrOgtMNdNrtULS3oHgZxBsxMJtvD0tngyEgg7NHIdro8dYwm57XPLESqxlk2epKvv/MpNpIM/KzAjTUUhNVEEr10l53PZjb2Te3fB1h3weNSLIxVdxKI4YaNBcxgUGM/TAyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hVQICfIO; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hVQICfIO"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ab3260b35dso1935956a91.1
        for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 08:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904797; x=1792509597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EpB1pSYzU/DFyffmKgLpdYkjUU97msISlGmPAchVX0s=;
        b=hVQICfIOpTCWa58hPW3PN0l4Jk+Xii8WhULWG8As4UbK6DhTeN6AZuX2x6br3bjYbt
         ftBgFRxl2RL7xPjD+GYhlPESMaIF6gHnRtBZ/lb/d8SL4UlPZETiiemKZjIcK8XhB7A5
         9sEDXUZMkWJkDmE0+W5vgahBmvwv0rk0tFOpflqlEEYbBELSfHnVnoECanj3+SAePf0M
         P7Tyz0RNmmKKLTAAHlnyiYfjYv/FZ8xVhsV+K7AES91Oqou078kBzYU0D2j6diET76WX
         7zMUVVyHy4DAAFhTBkxvV/smDdsKe/Gu9bv81Jb93ejShBj6ZIKw6ZvcqMe21DjvAgfk
         Ldmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904797; x=1792509597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EpB1pSYzU/DFyffmKgLpdYkjUU97msISlGmPAchVX0s=;
        b=DA4iLGfgo2YVs4/6wL53U4BGvXvCLYW64qoMSnRUEELlTxRuBct4a5+MkadEFf4UTR
         RNOdiruD/etpxpvlMu3NcWVxeIxB3yEozbLytdTC1WzCudBXQ+HFB3ZipYf0VW/wRnYD
         fIMsMdsNeAORsGiiDsuAdDDOSVy7ITd20zXx1c/bNT6AVpoJn3Iji9Z3tcU6sd0wrUTS
         d4RJG0+Vm4b6S+5hAGS7qogFjnviyCFjsG+AECTm3t0ygNbgL4aQBxLpWI0/NNLkbWmE
         5HbzgKrDVZd0EzFcMts3Mh9nxX3ImbGJ16tPEe2oOE1WUUJ8MiuNQkKtRDC55BUnh7CT
         UHLA==
X-Forwarded-Encrypted: i=1; AKwUvBxHg3D1viRDtpgESul2kOzt3tcxMlv6dqYgLrkCAP7VPPHBZk8PbiegaPCKpOq9zs44FCKERCK5Xmo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPZFd4sQqe3RcbplCZyZ9p/DFVbwCcsPgWfdf2DHmJDbQJ5XtQ
	1fXIdvKJomTREobZZ3o6ImuV9mK+d4tCsTW4VqibvT2eUbHfil0n6iiY
X-Gm-Gg: AYBFou0vG9y6QXknyMwJJTO5Cquqyd1ls6X3nZzBdjN/tCpuElk2Hvo75AjY6JefJ9W
	Mao3L87ucbuQBvhVy0K/yzFN2RwJ56mhhF+mJoYL0MJXPEj2gpMGmdmsVuhpkN7HwUuw6oEM6cY
	BjPYhxKTzu6lCyIGW7Bwxs+jyLv+6ELnpxKvkzXBO7YEIoVMA7wAlwXnebv3ZEDrwjAbNjdaK6N
	Kqqgkcrq+1dwXrvlexcPxt0dzZ4SIj/+ZulOklfo8kuD6/yK/Ud++Mzcg2nEU4A7ffe8UhA+rir
	gnkCN8RxmbFaJLymcFBy3qzAmeb/EI4vhn4fjmWLIGxmDeE1j4wEm2TdT0Sn3c2NbiCmWHXoIQs
	VjfQCldeCa/fmW75VAoJzQ1MsOeEKgGB3BrkuB4DMtMdBL87z1x7g9Oej+qAH+Pml0eQZGPUZYO
	lrgGkW20mon/GMsTB3YcIJE6NvvLP/1NqMPEGBwEQg5KLFM+oy1IvGOKoWrr69QiaaUWyDxozCt
	mng5sBgIwzxpdSYUkA/Qio/UuKT
X-Received: by 2002:a17:90b:3b84:b0:3ab:c80:9370 with SMTP id 98e67ed59e1d1-3ab3a736596mr9866608a91.20.1791904796990;
        Tue, 13 Oct 2026 08:19:56 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:19:56 -0700 (PDT)
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
Subject: [PATCH v2 20/35] clk: mediatek: mt6795: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:19 +0900
Message-ID: <20261013151734.3177690-21-akkun11.open@gmail.com>
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

The MT6795 infracfg driver previously needed custom probe/remove
callbacks to register CPU muxes, which were not supported by the
common helpers. With CPU mux support now available, infracfg can
use mtk_clk_simple_probe() and mtk_clk_simple_remove().

The pericfg driver can also use the common helpers, which already
support its gate and composite clocks.

Keep the apmixedsys driver unchanged because it requires ref2usb_tx
clock handling, which is not yet supported by the common helpers.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
---
 drivers/clk/mediatek/clk-mt6795-infracfg.c | 72 ++++-----------------
 drivers/clk/mediatek/clk-mt6795-pericfg.c  | 73 ++++------------------
 2 files changed, 23 insertions(+), 122 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt6795-infracfg.c b/drivers/clk/mediatek/clk-mt6795-infracfg.c
index 914bb069aa85..6aefc577ece5 100644
--- a/drivers/clk/mediatek/clk-mt6795-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt6795-infracfg.c
@@ -8,7 +8,6 @@
 #include <dt-bindings/reset/mediatek,mt6795-resets.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include "clk-cpumux.h"
 #include "clk-gate.h"
 #include "clk-mtk.h"
 #include "reset.h"
@@ -77,76 +76,27 @@ static const struct mtk_clk_rst_desc clk_rst_desc = {
 	.rst_idx_map_nr = ARRAY_SIZE(infra_ao_idx_map),
 };
 
+static const struct mtk_clk_desc infra_desc = {
+	.clks = infra_gates,
+	.num_clks = ARRAY_SIZE(infra_gates),
+	.cpumuxes = cpu_muxes,
+	.num_cpumuxes = ARRAY_SIZE(cpu_muxes),
+	.rst_desc = &clk_rst_desc,
+};
+
 static const struct of_device_id of_match_clk_mt6795_infracfg[] = {
-	{ .compatible = "mediatek,mt6795-infracfg" },
+	{ .compatible = "mediatek,mt6795-infracfg", .data = &infra_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt6795_infracfg);
 
-static int clk_mt6795_infracfg_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	void __iomem *base;
-	int ret;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	clk_data = mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	ret = mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc);
-	if (ret)
-		goto free_clk_data;
-
-	ret = mtk_clk_register_gates(&pdev->dev, node, infra_gates,
-				     ARRAY_SIZE(infra_gates), clk_data);
-	if (ret)
-		goto free_clk_data;
-
-	ret = mtk_clk_register_cpumuxes(&pdev->dev, node, cpu_muxes,
-					ARRAY_SIZE(cpu_muxes), clk_data);
-	if (ret)
-		goto unregister_gates;
-
-	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (ret)
-		goto unregister_cpumuxes;
-
-	platform_set_drvdata(pdev, clk_data);
-
-	return 0;
-
-unregister_cpumuxes:
-	mtk_clk_unregister_cpumuxes(cpu_muxes, ARRAY_SIZE(cpu_muxes), clk_data);
-unregister_gates:
-	mtk_clk_unregister_gates(infra_gates, ARRAY_SIZE(infra_gates), clk_data);
-free_clk_data:
-	mtk_free_clk_data(clk_data);
-	return ret;
-}
-
-static void clk_mt6795_infracfg_remove(struct platform_device *pdev)
-{
-	struct device_node *node = pdev->dev.of_node;
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_cpumuxes(cpu_muxes, ARRAY_SIZE(cpu_muxes), clk_data);
-	mtk_clk_unregister_gates(infra_gates, ARRAY_SIZE(infra_gates), clk_data);
-	mtk_free_clk_data(clk_data);
-}
-
 static struct platform_driver clk_mt6795_infracfg_drv = {
 	.driver = {
 		.name = "clk-mt6795-infracfg",
 		.of_match_table = of_match_clk_mt6795_infracfg,
 	},
-	.probe = clk_mt6795_infracfg_probe,
-	.remove = clk_mt6795_infracfg_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 };
 module_platform_driver(clk_mt6795_infracfg_drv);
 
diff --git a/drivers/clk/mediatek/clk-mt6795-pericfg.c b/drivers/clk/mediatek/clk-mt6795-pericfg.c
index 27d0ef7d7b2f..53c79e830b6a 100644
--- a/drivers/clk/mediatek/clk-mt6795-pericfg.c
+++ b/drivers/clk/mediatek/clk-mt6795-pericfg.c
@@ -85,77 +85,28 @@ static const struct mtk_clk_rst_desc clk_rst_desc = {
 	.rst_idx_map_nr = ARRAY_SIZE(peri_idx_map),
 };
 
+static const struct mtk_clk_desc pericfg_desc = {
+	.clks = peri_gates,
+	.num_clks = ARRAY_SIZE(peri_gates),
+	.composite_clks = peri_clks,
+	.num_composite_clks = ARRAY_SIZE(peri_clks),
+	.rst_desc = &clk_rst_desc,
+	.clk_lock = &mt6795_peri_clk_lock,
+};
+
 static const struct of_device_id of_match_clk_mt6795_pericfg[] = {
-	{ .compatible = "mediatek,mt6795-pericfg" },
+	{ .compatible = "mediatek,mt6795-pericfg", .data = &pericfg_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt6795_pericfg);
 
-static int clk_mt6795_pericfg_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	void __iomem *base;
-	int ret;
-
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	clk_data = mtk_alloc_clk_data(CLK_PERI_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	ret = mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc);
-	if (ret)
-		goto free_clk_data;
-
-	ret = mtk_clk_register_gates(&pdev->dev, node, peri_gates,
-				     ARRAY_SIZE(peri_gates), clk_data);
-	if (ret)
-		goto free_clk_data;
-
-	ret = mtk_clk_register_composites(&pdev->dev, peri_clks,
-					  ARRAY_SIZE(peri_clks), base,
-					  &mt6795_peri_clk_lock, clk_data);
-	if (ret)
-		goto unregister_gates;
-
-	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (ret)
-		goto unregister_composites;
-
-	platform_set_drvdata(pdev, clk_data);
-
-	return 0;
-
-unregister_composites:
-	mtk_clk_unregister_composites(peri_clks, ARRAY_SIZE(peri_clks), clk_data);
-unregister_gates:
-	mtk_clk_unregister_gates(peri_gates, ARRAY_SIZE(peri_gates), clk_data);
-free_clk_data:
-	mtk_free_clk_data(clk_data);
-	return ret;
-}
-
-static void clk_mt6795_pericfg_remove(struct platform_device *pdev)
-{
-	struct device_node *node = pdev->dev.of_node;
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_composites(peri_clks, ARRAY_SIZE(peri_clks), clk_data);
-	mtk_clk_unregister_gates(peri_gates, ARRAY_SIZE(peri_gates), clk_data);
-	mtk_free_clk_data(clk_data);
-}
-
 static struct platform_driver clk_mt6795_pericfg_drv = {
 	.driver = {
 		.name = "clk-mt6795-pericfg",
 		.of_match_table = of_match_clk_mt6795_pericfg,
 	},
-	.probe = clk_mt6795_pericfg_probe,
-	.remove = clk_mt6795_pericfg_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 };
 module_platform_driver(clk_mt6795_pericfg_drv);
 
-- 
2.56.0

