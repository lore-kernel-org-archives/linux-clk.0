Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F2C47A88D
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 15:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904811; cv=none; b=JtxL976EwkjCKamFvrmkjpTYytPvsHxDUFLfX22yhflKckD1dTt/OrDlL2xCpwApUnUUaaMqgLgwYXLaDaKH7xsOxl90/RJ5v5ILh9ODObn1SPCBIpIywon+r5WealLDPq8Lfl54NMyrA9WParVPivF4T0dsFVCZg7aJLecqVts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904811; c=relaxed/simple;
	bh=7zbat2PACQc86QZQTEWg+nOIZFYEzXenfLe3AGTAhhk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kPjsv/RqcrhoDND772ydjwsv52S/RBFeBOjFolUd6I7+TLVXzyUeZf7538thmVJFJurUDgY4gWX1A47rIkXohfTadnx96QTySiJJjxrDHbfOomt+9WfVn2iw/wRXBV97N4VMygPXhnwWcb48yrAg0efiZXhGdOiPBitq0s0Z00Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dXSK7ouH; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dXSK7ouH"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-881269371acso2513744b3a.0
        for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 08:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904808; x=1792509608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B4Gl+sGd+5M6eL6jAwWWBS7MqC+3SN+gEIe9ESRruM0=;
        b=dXSK7ouHKYA2KaSxmOI/82FNqnVTRNTRMJ8d/rqOayu+WxGnDhaldPWA84lVlPXUK1
         QXIiVJOHIgnec4CBGFgWRzmB9P2f/ONjrm4WsVXN2yZQByizQPwshlsuy281sJLUF7d0
         pkz/EZwxt0YBilAzzF5R9ZXtLYyR0rQb12liuWA6KbB7ZgsT6anVu52BdlzMcm3SNTxc
         86YrKWI2gFDRW1nmgEVCXQcVpLZ2k5XiNsScY6b6vaXx7nBcKPmCE02qQHM31dOp4gW7
         QxTGN2xNLzi8jWKjQfyH/Cct6MHqeBaIhYuCVLdVdaQV09Er2+08zXF0nY7tXjCwIA7V
         DDKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904808; x=1792509608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B4Gl+sGd+5M6eL6jAwWWBS7MqC+3SN+gEIe9ESRruM0=;
        b=2QCfngTBlsFwPdq/bGoqp3g8yYP7GBl/87Ag2IUjjv3CYErkZHqicRHpibs6XQFjW5
         2BfO8Q7RmTb3as2XktQoho7Li6U6Z+o4pCqOwsuACUDySur0c1UholfXTZDaHko3gbIU
         LFgRrDAol4r5RHIGHd8wPHgUeAMMmjp8uRdVRQVT8PoeqMcsZaZGk70iv11dgvzFAya7
         0kNmX8yOJRQxj8B30JSwd4HBDkvFxp0aW3mDF2s5abquNT1/mLUkotpeLhL5e3Wu1aIk
         HXs+zoRWwUeXIjUQUyMqexAuYYvjiyeJQALfWfw/koFzLgH+ogpSf+Rw4ayH+j0F3ck4
         0G+w==
X-Forwarded-Encrypted: i=1; AKwUvBy5vASw6Hrqqpx78UK0ITkiH7FZ2lxUyjXvqXf4WiX6jTFLk3d9QSaloF0/sPbBfhNJaUTVWeAV/Wg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPYiYcuSnhPU/DkdhtzsBxlEKqoX+ta3mge7BREX5bTDx0BZDD
	pz/VOShxlxJMs3dodOrFhN9+QmoQtLyr5CdljrwinfGLfARoDvxUX+gz
X-Gm-Gg: AYBFou391MyEV0C1V9qPS0W4hCpSVePV++LUfjJ1Uk6iCNgHULO37ngP4V2J2YpzI9H
	nItsW874Z5HbxI6s5wn0AHCOjrZ2xui/5pcXNYhRWcrpwQzSBa8fShjz2nAEXe9W8/1PtBVjNU9
	ErxX/pSxHddKLbDApcqnL3vqVaxjgIVp5PTfjaVJkRHidedgxjgXOcse42b9z/LrEshUxFRPhC7
	qQqj2bhK1c77lsLB/C2y3XQ40LRdQatCm/id23xNTcacCSviOiwoCVNOoTGi80tfDqsG/ksj5pL
	FlL4YFIm2/19W93wKOJuFiCaBpAe5Ymjq6sMIOcEecvq2fSFoBGm7g1s+SOoY0kQV7hnlgmPGW9
	OKq9aViiHRrubm4yjqE7dWH3aq5Zp6LK3CadHxJB5hxWfVIW9+ahWjh3k9fpk8Bq2LWSRl3TXSE
	bm1uYGlQ80rUs1d/ldOAGJ/nhdnF69hrjveb3P3eRPWVQIkTRrk1unbvkHDEfBeEbqTMaxPpHJB
	nZyPRYhRhuy1JUZcEmL/9O5aurZCRk3ARrpZFU=
X-Received: by 2002:a05:6a20:a11f:b0:3e1:3734:63e0 with SMTP id adf61e73a8af0-3e16bec52eamr8017289637.41.1791904808186;
        Tue, 13 Oct 2026 08:20:08 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:20:07 -0700 (PDT)
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
Subject: [PATCH v2 22/35] clk: mediatek: mt7622: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:21 +0900
Message-ID: <20261013151734.3177690-23-akkun11.open@gmail.com>
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

The MT7622 apmixedsys driver used custom probe/remove callbacks to
register PLLs. The infracfg driver also needed CPU mux registration,
and the audsys driver needed child-device population.
With PLL, CPU mux, and child-device population support available in the
common helpers, all three drivers can use mtk_clk_simple_probe()
and mtk_clk_simple_remove().

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
---
 drivers/clk/mediatek/clk-mt7622-apmixedsys.c | 62 +++--------------
 drivers/clk/mediatek/clk-mt7622-aud.c        | 35 +---------
 drivers/clk/mediatek/clk-mt7622-infracfg.c   | 72 +++-----------------
 3 files changed, 23 insertions(+), 146 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7622-apmixedsys.c b/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
index fae8abda14b3..e9f731eadace 100644
--- a/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
@@ -80,66 +80,22 @@ static const struct mtk_gate apmixed_clks[] = {
 	GATE_APMIXED_AO(CLK_APMIXED_MAIN_CORE_EN, "main_core_en", "mainpll", 5),
 };
 
-static int clk_mt7622_apmixed_probe(struct platform_device *pdev)
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
-	clk_data = mtk_devm_alloc_clk_data(dev, CLK_APMIXED_NR_CLK);
-	if (!clk_data)
-		return -ENOMEM;
-
-	ret = mtk_clk_register_plls(dev, plls, ARRAY_SIZE(plls), clk_data);
-	if (ret)
-		return ret;
-
-	ret = mtk_clk_register_gates(&pdev->dev, node, apmixed_clks,
-				     ARRAY_SIZE(apmixed_clks), clk_data);
-	if (ret)
-		goto unregister_plls;
-
-	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (ret)
-		goto unregister_gates;
-
-	platform_set_drvdata(pdev, clk_data);
-
-	return 0;
-
-unregister_gates:
-	mtk_clk_unregister_gates(apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
-unregister_plls:
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
-
-	return ret;
-}
-
-static void clk_mt7622_apmixed_remove(struct platform_device *pdev)
-{
-	struct device_node *node = pdev->dev.of_node;
-	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
-
-	of_clk_del_provider(node);
-	mtk_clk_unregister_gates(apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
-	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
-}
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+	.clks = apmixed_clks,
+	.num_clks = ARRAY_SIZE(apmixed_clks),
+};
 
 static const struct of_device_id of_match_clk_mt7622_apmixed[] = {
-	{ .compatible = "mediatek,mt7622-apmixedsys" },
+	{ .compatible = "mediatek,mt7622-apmixedsys", .data = &apmixed_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt7622_apmixed);
 
 static struct platform_driver clk_mt7622_apmixed_drv = {
-	.probe = clk_mt7622_apmixed_probe,
-	.remove = clk_mt7622_apmixed_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt7622-apmixed",
 		.of_match_table = of_match_clk_mt7622_apmixed,
diff --git a/drivers/clk/mediatek/clk-mt7622-aud.c b/drivers/clk/mediatek/clk-mt7622-aud.c
index a4ea5e20efa2..6004c58be1b5 100644
--- a/drivers/clk/mediatek/clk-mt7622-aud.c
+++ b/drivers/clk/mediatek/clk-mt7622-aud.c
@@ -110,38 +110,9 @@ static const struct mtk_gate audio_clks[] = {
 static const struct mtk_clk_desc audio_desc = {
 	.clks = audio_clks,
 	.num_clks = ARRAY_SIZE(audio_clks),
+	.populate_children = true,
 };
 
-static int clk_mt7622_aud_probe(struct platform_device *pdev)
-{
-	int r;
-
-	r = mtk_clk_simple_probe(pdev);
-	if (r) {
-		dev_err(&pdev->dev,
-			"could not register clock provider: %s: %d\n",
-			pdev->name, r);
-
-		return r;
-	}
-
-	r = devm_of_platform_populate(&pdev->dev);
-	if (r)
-		goto err_plat_populate;
-
-	return 0;
-
-err_plat_populate:
-	mtk_clk_simple_remove(pdev);
-	return r;
-}
-
-static void clk_mt7622_aud_remove(struct platform_device *pdev)
-{
-	of_platform_depopulate(&pdev->dev);
-	mtk_clk_simple_remove(pdev);
-}
-
 static const struct of_device_id of_match_clk_mt7622_aud[] = {
 	{ .compatible = "mediatek,mt7622-audsys", .data = &audio_desc },
 	{ /* sentinel */ }
@@ -149,8 +120,8 @@ static const struct of_device_id of_match_clk_mt7622_aud[] = {
 MODULE_DEVICE_TABLE(of, of_match_clk_mt7622_aud);
 
 static struct platform_driver clk_mt7622_aud_drv = {
-	.probe = clk_mt7622_aud_probe,
-	.remove = clk_mt7622_aud_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt7622-aud",
 		.of_match_table = of_match_clk_mt7622_aud,
diff --git a/drivers/clk/mediatek/clk-mt7622-infracfg.c b/drivers/clk/mediatek/clk-mt7622-infracfg.c
index cec19447d637..2e463d1481d0 100644
--- a/drivers/clk/mediatek/clk-mt7622-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7622-infracfg.c
@@ -9,7 +9,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
-#include "clk-cpumux.h"
 #include "clk-gate.h"
 #include "clk-mtk.h"
 #include "reset.h"
@@ -51,76 +50,27 @@ static const struct mtk_clk_rst_desc clk_rst_desc = {
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
-	platform_set_drvdata(pdev, clk_data);
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
2.56.0

