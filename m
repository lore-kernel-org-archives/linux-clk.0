Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E550F3D1CD4
	for <linux-clk@vger.kernel.org>; Wed,  4 Mar 2026 18:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772647902; cv=none; b=dudV+hOZCANgJQYuCXOgHiiDv8jMDB0nESwCuaBJDpsPkbyERy0n1XUt+yFGglf66L0k1136FZBnZx30UMGw557OrDNDnMEA08lsnVVNE+l2C+CetUEjH+ZHsQw4bT4GCVYYaD9EPPZC790iK30V+/+cILXMg3khKV8TMfSJGSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772647902; c=relaxed/simple;
	bh=ihIXHqqluv5bizDOEaQvw/6UyZnqqzM48Pjhmaj1tQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tt9O+nLhGoefuDv8KTnDrRPVD2Oc4YR7v6oAOjH6TIS7dvEWfryTGuFKftcV3DiA7ETxEXoCUgsEaJ/dEXs6YauKnzgMqahp1x6vbsGn3ICqY+esU1vnGLJ71zbrkVmJYl1MgHlb7udoEl1fxqRxx/UjtoLcnjwI3QPsCdbfP0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AK8fbiql; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AK8fbiql"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82980945556so72215b3a.0
        for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 10:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772647900; x=1773252700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/F7XmH5/hs11BL5Bv9gfwXPkKTxvFijq4nvY+SwIm9w=;
        b=AK8fbiqlRkZA5RLl3v+qTaQCMAbbnEGCCU5OT5x2dTAK0GrH0NGlLGbm6zcnqHuhhR
         w5juRm8OKu8SNBTyb4jQmLR52vFLjOrdJ1vaaxxb2Wc/1Jo8bvKukONZStUWsJ63D/LA
         yGJOzK8F3McHUfsVQkPkF4z9L+o78zY3cYPkMQA6pVO1nS6wWGf0+73yKpr8LI4H7FKv
         swfzDP9EF4/zoVq6gt36J/2rlGnWQK9CNbQmYx3TnmC15fus5HVEsXOwbHbMTT9nrIdS
         vsT7CoaASu5EgSaRQqpPM0GtLEkD3hKNkfUjDC2QciuSHXQCeDk/zIm/A4ADjKe5AW6V
         jMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772647900; x=1773252700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/F7XmH5/hs11BL5Bv9gfwXPkKTxvFijq4nvY+SwIm9w=;
        b=VG1GHKxYph2H7EfjA0S1ckDxn/tvRyZGtirvSPkokKYb40w9LwArF1n4OnZmT4P3af
         /eorBIDhq+r/n4SrJLElGj3ut+fzcomf4+ZxKTabBl7VdUD4BdpVWkbrLmemIZ6GA7xS
         gZcSNi3WRBOil4de+MCphrzMnnO1FeweX/pLKr3NQdFL38dtCK7du4BtZhYIvKScygj0
         OL+alKpvseLPl5S6Sk1VRjaMIwNzwG2lDtDwMMlCbrseONwLR9cdeiPeW2ghCMXxdd1O
         BbXQEdpc8wd7FMS7wAs3l3dsp2xW/Rvj8aHHGFtTdvXTQhuvcirBYg2D+ZKUAQ9Hcb3O
         40Ag==
X-Gm-Message-State: AOJu0YxXMGkBz6rclqLbMwnWXtQPErZVg019ykDxF39/FsUzWJiu95cb
	I2RvafEj+pzLTpzbqfywuvZT3GL5K594Cz/yC/856m3DVqs39jx9+E2f
X-Gm-Gg: ATEYQzxgoGKwQJq+eXRvm7r42VE03sCIIXYoAKF2y2i/5D03OGftGYGP47NSoX9sh94
	A89XqCtmOL+WEtITbJCp2Exkxq3nMQQf3ONT3QlaRHFOX8/nEUxL41LOvuFEbK3uUvOE5If4+UL
	OzRqhU5rSCMw2Y7x+b7Ni4Fgwf6gmJvUDUfw0iNmHywOmF9lO8Sjd1q8uzQ/XMftc3Sir90s7L8
	+jgf6JSNQ7ZuBGnB/nmBLG3lni8jenNYaGjGR01RBftQ8oMefFIWRThLZFQbsdwJVaHa4u4/dLg
	GdOTEqxGnCq30xxg76+mc9+maW+IYNW1jCsGOEH3YfjL1WbcgbOULDTbUnke6u93GHOqWfZEhi1
	ctS9mHsHkO0bbkEt6GONX0mzN8l5vVrvO8FRcNT7sBAqbY9dS08999NC2SSL/IP+mpd3j7M3LNW
	wdFvHENnq8zpzamzzVwyTWhxotoEU4WXZVbdi+3dQ3So7RPiX9qs1K15jtNXdTYjKWEp6//76ee
	ogfu+4=
X-Received: by 2002:a05:6a00:2191:b0:81f:4675:c2a6 with SMTP id d2e1a72fcca58-82972b7584amr2427606b3a.2.1772647900198;
        Wed, 04 Mar 2026 10:11:40 -0800 (PST)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829713825efsm2503835b3a.51.2026.03.04.10.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 10:11:39 -0800 (PST)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH 2/3] clk: mediatek: mt6795-infracfg: Switch to common probe/remove helpers
Date: Thu,  5 Mar 2026 03:10:23 +0900
Message-ID: <20260304181024.738391-3-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260304181024.738391-1-akkun11.open@gmail.com>
References: <20260304181024.738391-1-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MT6795 infracfg driver can use the MediaTek clock framework's common
initialization sequence. Reduce the boilerplate code by creating
struct mtk_clk_desc and using the mtk_clk_simple_probe/remove helpers.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt6795-infracfg.c | 70 ++++------------------
 1 file changed, 11 insertions(+), 59 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt6795-infracfg.c b/drivers/clk/mediatek/clk-mt6795-infracfg.c
index e4559569f5b0..6aefc577ece5 100644
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
@@ -77,74 +76,27 @@ static const struct mtk_clk_rst_desc clk_rst_desc = {
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
 
-- 
2.52.0

