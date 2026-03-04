Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C5E3D5648
	for <linux-clk@vger.kernel.org>; Wed,  4 Mar 2026 18:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772647908; cv=none; b=B4W0SKKqFcwcsEVlpeqKzf8Gp5znEHlN8X6sFSD4hIQWIBQziEcQPYkbYHLvKx5LyQnNCD3XfRaT66w/qiQS7QChbbpui+jdwifuNRUHKApOzRnNAGrbm6Jcyn51spCRORAtsp/jPha6R66HDSFqdzARGSK4iFLPBl86RnRjD6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772647908; c=relaxed/simple;
	bh=nWy811gaDh3wRu1x8s4UcwtA1YzqURN2rSvxeSK1e2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q7KjWJ/H7NgXWYkaXbZ8pB4vaEcCfF+osTZdkraUSXC8atFLY/CLJ4gde90fRNkSPQmLjTxhT7tcxMawTzXB3sMVsuEEKZgMh8ZsWfIu2CRiBvA1MDTyYzF7yh6qIUDigtfbSs6Ps7YaYoFlvIexVPbFfS4jdDYyIOFia0+vZxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jEeaGp3t; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jEeaGp3t"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-827307b12dfso3851133b3a.1
        for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 10:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772647907; x=1773252707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GnLN33Ifloh+UfyT9Xr8GDknKJnwUYvHC0fyQTp1f3s=;
        b=jEeaGp3tkP6IdFi1iFEFMjhWjnGpuFInn/5uimiiRinkc3qrRMAyEIP6Eabuq2N9uR
         2qhxx1YvKz46eek2lrHdrIc74mSyBAzyOEKCS5VzjvfCiYuQDMX5a3kw8NYaY11bt/lJ
         NN+9LW61YudgFuDk9G4+vv0HJDJm98yBLeuJ4vyY7EvZSXOlHUJeNsS6FYrFHe/oM7s0
         3bk8D6A4IULyi848qNY0hDSko/eVvXTrJ08ViD/YKz06RpibFMChDazzEWb3OPFGHsg0
         UFnG+6WC1aWPxEychoTsQMPcdBaTCBnuZXoeKDmGMWIgeW1iHOXxX9dKLxje8gfvseK7
         H4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772647907; x=1773252707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GnLN33Ifloh+UfyT9Xr8GDknKJnwUYvHC0fyQTp1f3s=;
        b=PDMZXOQMLjrByZ5UV9jeh4NeTFszOjV9AeoFwDz3B/IJCShMbom80OAdszaqVqNUNc
         2MmwYWIaU0HmEpkybcV4xrP3Sly5WwpGvMYd+3R/SvkVttXCCtO3D+4KKy6EiF6ceuMg
         fwWM3OyOKBE8SrlbcZ6lmlU0YpJtg7gOIz9jP2lj3/PMKqpkTcs6mzA1nc6Y2pN2RiMH
         laB0X0gYpkS9RVPNfgdGCrJssT+Qg7DUjioKIunE7V/7EwwJRMJUv3GLt9Z/eUqIH3c2
         kqvKySGX+Ju3ibBs8Ms/Y0ReEG6IOJbtPxj5U3BT2gULJtu1/VKqDBrxJwlGUaVPOR0J
         k00Q==
X-Gm-Message-State: AOJu0Yy+unmXjbEI6oSTB6ihVLnAT6lJQQzg1Mws84QU57b8qScBDw+D
	Hh1yuKsOqkUWLcxlB+C7HgH94o5vh6etGco1YbQy1Okxe6An8Pj/MeXS
X-Gm-Gg: ATEYQzxeyJeDp9Yg3TwWEo2F2ZTEfDYJ13TAHU4M81XWW5SY9S/y7HnWI5dVvttvf+Y
	GppQiuXewhxzApeNe8JDn+TxVEqxBdf+kK5+YPZ14b/497YW43UphIKIi9fDddowqK6zbhUini9
	KCaByoh93bWpWbNPVUcGGs0lnBtYILDeI6aHHqyMPbBdsg3YjSRAF82VDjsV7NSCnCnyAtgkpZI
	+NPloBiLVuevEAUclj5K52Es2hUn2nBwuVFxZ8VJphHYfovg0x2DEcFmstrw3JqRQUZmowfAjhp
	Z9HRgy8vyzm5pavdnmSYUzpAH7JVSz7i8o6ucXZ+zFfsYEp70qEFH1Rn1HuQdFZxLfDW+fd+Gq6
	fE1PFcMYMcdjCUILjXvrnd6564Oi8AGzOrrr2D4h2SkbFgEk6KJJBfpnd0ITpe1T6m0/f7Ad/ku
	I4n9kV8Wp5BJOxKuQnqeAY4BpTYuiWaaJKqtRedrSXPPcmVVlL8tnvQ6BNKB0PZofUlr7hEt0VO
	HbXgYk=
X-Received: by 2002:a05:6a00:4215:b0:81e:b93a:ab09 with SMTP id d2e1a72fcca58-8295d845021mr5335049b3a.1.1772647906891;
        Wed, 04 Mar 2026 10:11:46 -0800 (PST)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829713825efsm2503835b3a.51.2026.03.04.10.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 10:11:44 -0800 (PST)
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
Subject: [PATCH 3/3] clk: mediatek: mt7622-infracfg: Switch to common probe/remove helpers
Date: Thu,  5 Mar 2026 03:10:24 +0900
Message-ID: <20260304181024.738391-4-akkun11.open@gmail.com>
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

The MT7622 infracfg driver can use the MediaTek clock framework's common
initialization sequence. Reduce the boilerplate code by creating
struct mtk_clk_desc and using the mtk_clk_simple_probe/remove helpers.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt7622-infracfg.c | 70 ++++------------------
 1 file changed, 11 insertions(+), 59 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7622-infracfg.c b/drivers/clk/mediatek/clk-mt7622-infracfg.c
index cfdf3b07c3e0..2e463d1481d0 100644
--- a/drivers/clk/mediatek/clk-mt7622-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7622-infracfg.c
@@ -9,7 +9,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
-#include "clk-cpumux.h"
 #include "clk-gate.h"
 #include "clk-mtk.h"
 #include "reset.h"
@@ -51,74 +50,27 @@ static const struct mtk_clk_rst_desc clk_rst_desc = {
 	.rst_bank_nr = ARRAY_SIZE(infrasys_rst_ofs),
 };
 
+static const struct mtk_clk_desc infra_desc = {
+	.clks = infra_clks,
+	.num_clks = ARRAY_SIZE(infra_clks),
+	.cpumuxes = cpu_muxes,
+	.num_cpumuxes = ARRAY_SIZE(cpu_muxes),
+	.rst_desc = &clk_rst_desc,
+};
+
 static const struct of_device_id of_match_clk_mt7622_infracfg[] = {
-	{ .compatible = "mediatek,mt7622-infracfg" },
+	{ .compatible = "mediatek,mt7622-infracfg", .data = &infra_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt7622_infracfg);
 
-static int clk_mt7622_infracfg_probe(struct platform_device *pdev)
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
-	ret = mtk_clk_register_gates(&pdev->dev, node, infra_clks,
-				     ARRAY_SIZE(infra_clks), clk_data);
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
-	mtk_clk_unregister_gates(infra_clks, ARRAY_SIZE(infra_clks), clk_data);
-free_clk_data:
-	mtk_free_clk_data(clk_data);
-	return ret;
-}
-
-static void clk_mt7622_infracfg_remove(struct platform_device *pdev)
-{
-	struct device_node *node = pdev->dev.of_node;
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_cpumuxes(cpu_muxes, ARRAY_SIZE(cpu_muxes), clk_data);
-	mtk_clk_unregister_gates(infra_clks, ARRAY_SIZE(infra_clks), clk_data);
-	mtk_free_clk_data(clk_data);
-}
-
 static struct platform_driver clk_mt7622_infracfg_drv = {
 	.driver = {
 		.name = "clk-mt7622-infracfg",
 		.of_match_table = of_match_clk_mt7622_infracfg,
 	},
-	.probe = clk_mt7622_infracfg_probe,
-	.remove = clk_mt7622_infracfg_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 };
 module_platform_driver(clk_mt7622_infracfg_drv);
 
-- 
2.52.0

