Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0C351CF5F
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 15:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904845; cv=none; b=IpjYSlHKXGZeyqXSCru95VNZU9ko9nHdVVXXAPR5jVe8dtLTxKEUkdtNISGEYu6EOvtiI/DKYCmDOapipcjTPOrQq90BE1ypCrPaM026VjteNp1NGbV6x/KZCYdQAvetZBTjei9i370C17UPZj0f7ETIxxzydfcyz6bX/IEPRNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904845; c=relaxed/simple;
	bh=Qz6CH6RneGaMcHmU+KF2bgELVFhNLI8AahJ2Hx0DklA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sGLrUNiaF6wIVWCINFZgp/6RIaHv5rbndtPKnrDqOMxkQP2DoXyI2xA41/5ntYQLcY2f5vr8bwjCC9ueZ6H2U3ELUmVQhPN8/wP4kM5zyOIbWVir+aLmLCLwt1oZtRb+rKqFgEBwEVq6fuGOAFaNxTGtHwo9spp23XaO76tXeY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BAroVGlS; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BAroVGlS"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so1450043a12.0
        for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 08:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904842; x=1792509642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o35PHDe/WaanrdpB4YPbubHCz42M3a4P2DweWS1SB0E=;
        b=BAroVGlSYww4yc/OnKOoK20iwOX86kophrBaqv7IUIXoR99CeDIuA+pn/UmDFonb3e
         hkSgGe1FB+LmySMwqVJae2E3TSzz5wBZwM4P/WMAFt3sk3w73n8P6ri0JZVXo9DzVuNj
         Ub5Y7+wNtTDRXUS74A08Vi0Bt/zMzvCYvxnlPjZcYbLqGDenRJwPQFvJwfPwVVgQY6PZ
         ootDQuHO/icJEqYShkYdcRE+TQdFBI8ee+mQLjlVNS7GkfG7sMhktitIMSsMYebGSTke
         G3nhj0gLlZoQD7I2c5pXoBp9AHsHi/iXd+a0PaTwzEt/L0DAplVAiQ4WZ6H8jbslh35i
         +Q6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904842; x=1792509642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o35PHDe/WaanrdpB4YPbubHCz42M3a4P2DweWS1SB0E=;
        b=mdhfyEnNc2cgwkPO7OetZzrRQQPyBKj9aeEadoXumpvgeQpGXkf9ie/Tlm6sn+B7m2
         5TfpIhC72mdX14LBsAeCtvW95ubzzuVCcYx5IokKh8eamfZQXte6uqKTN9f1AsKADxAa
         6AxrQdpN0sBBkNhVw/NV7cL1ezzlsxNCPwC4p3FxdXzYf6CUUsz4vijaoEcUma1mp2jg
         HWi0BFN27mI0uqdiVrzGP64gcp7yydHZqjCK+NYumW3HCMrYsk+I76FfEbDm1K0JK79C
         pn6aVJyI3ac3vXgdMg79f9fuPhWjNU0E0sIXi9+V3YMK0O1e2W0SAnsi2aK9Qb4RL8cz
         uXvg==
X-Forwarded-Encrypted: i=1; AKwUvBwfQ7VRx8B5NgkNm75v6SVolns606mFmHdaGTjS2OL71cRJOaHikhdLh8q1G2erOcWpxUYhU2f7YH4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJM8NFrnYTx7n+NFtqYsWv9elNgnw/EBiPjjiPt9sAOIey3di0M
	apQkyFpeePeom62dIoG6PG7svwVPbMWu2gqGrGW4Q11T5Dbz5hoSYLtF
X-Gm-Gg: AYBFou1Ji63Pu17lDEMSpckM2PzsIa4mD428deUzjmCymB/PLQVWdqmFDdglo6uYmuH
	xoYAudRaVmazcagBgkUOonF0WDGpNfdqN2uL+DuyKCNfu+M6REENqy7jDnh1MZPhxaYBztejdJJ
	mOQRJWSaHZBDgSohpgZUA2bXHz0Cgb7sMXqCv9rAAlrpZ5cgK/cdUnE26P/CDwJX+WRcsECIbM7
	V+WedO876YTm87meLHqGJUbkA7I92jEKyJAqvDzQyHB7O+yv1g2D2s0KXSiToMHDwr1hpqK/uRz
	Liz6TN3+M+frSYujpimrAqow52EUUeUlg97flbnmneGYAjH3OexR/nsT6k4W4NxrheyUIw2BW/R
	JMfigBCRS1I7Jyof+pfENWUOpL35dVbouK5EjsKwL8UnO4da5S0QcB39rWZvpiGnhko2qLIacRk
	cvEuWU+7m5HLLogZ/TQgc9I04fPiNbIPNDXOZEhSRO9rOiYtV/ZwaNTI/StQUq5y/sTk1S/BaOq
	iVnwreIGvnEArMqStOrapq7Lz6cV+SgOoAFOgk=
X-Received: by 2002:a05:6a21:8217:b0:3dd:a00a:c5ba with SMTP id adf61e73a8af0-3e16c02df28mr13473096637.45.1791904842064;
        Tue, 13 Oct 2026 08:20:42 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:20:40 -0700 (PDT)
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
Subject: [PATCH v2 28/35] clk: mediatek: mt8173-infracfg: Switch to common probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:27 +0900
Message-ID: <20261013151734.3177690-29-akkun11.open@gmail.com>
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

The MT8173 infracfg driver previously needed custom probe/remove
callbacks to register and unregister cpumux. With cpumux support now
available in the common helpers, the driver can use
mtk_clk_simple_probe() and mtk_clk_simple_remove().

Drop the CLK_OF_DECLARE_DRIVER early init for infracfg; the kernel's
deferred probe mechanism ensures dependent drivers like cpufreq are
initialized correctly.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Improvement of commit messages
---
 drivers/clk/mediatek/clk-mt8173-infracfg.c | 100 ++++-----------------
 1 file changed, 16 insertions(+), 84 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8173-infracfg.c b/drivers/clk/mediatek/clk-mt8173-infracfg.c
index 9b8c35897789..fdd994736e83 100644
--- a/drivers/clk/mediatek/clk-mt8173-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt8173-infracfg.c
@@ -17,22 +17,20 @@
 		GATE_MTK(_id, _name, _parent, &infra_cg_regs,	\
 			 _shift, &mtk_clk_gate_ops_setclr)
 
-static struct clk_hw_onecell_data *infra_clk_data;
-
 static const struct mtk_gate_regs infra_cg_regs = {
 	.set_ofs = 0x0040,
 	.clr_ofs = 0x0044,
 	.sta_ofs = 0x0048,
 };
 
-static const char * const ca53_parents[] __initconst = {
+static const char * const ca53_parents[] = {
 	"clk26m",
 	"armca7pll",
 	"mainpll",
 	"univpll"
 };
 
-static const char * const ca72_parents[] __initconst = {
+static const char * const ca72_parents[] = {
 	"clk26m",
 	"armca15pll",
 	"mainpll",
@@ -44,7 +42,7 @@ static const struct mtk_composite cpu_muxes[] = {
 	MUX(CLK_INFRA_CA72SEL, "infra_ca72_sel", ca72_parents, 0x0000, 2, 2),
 };
 
-static const struct mtk_fixed_factor infra_early_divs[] = {
+static const struct mtk_fixed_factor infra_divs[] = {
 	FACTOR(CLK_INFRA_CLK_13M, "clk13m", "clk26m", 1, 2),
 };
 
@@ -70,95 +68,29 @@ static const struct mtk_clk_rst_desc clk_rst_desc = {
 	.rst_bank_nr = ARRAY_SIZE(infrasys_rst_ofs),
 };
 
+static const struct mtk_clk_desc infracfg_desc = {
+	.clks = infra_gates,
+	.num_clks = ARRAY_SIZE(infra_gates),
+	.factor_clks = infra_divs,
+	.num_factor_clks = ARRAY_SIZE(infra_divs),
+	.cpumuxes = cpu_muxes,
+	.num_cpumuxes = ARRAY_SIZE(cpu_muxes),
+	.rst_desc = &clk_rst_desc,
+};
+
 static const struct of_device_id of_match_clk_mt8173_infracfg[] = {
-	{ .compatible = "mediatek,mt8173-infracfg" },
+	{ .compatible = "mediatek,mt8173-infracfg", .data = &infracfg_desc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8173_infracfg);
 
-static void clk_mt8173_infra_init_early(struct device_node *node)
-{
-	int i;
-
-	infra_clk_data = mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
-	if (!infra_clk_data)
-		return;
-
-	for (i = 0; i < CLK_INFRA_NR_CLK; i++)
-		infra_clk_data->hws[i] = ERR_PTR(-EPROBE_DEFER);
-
-	mtk_clk_register_factors(infra_early_divs,
-				 ARRAY_SIZE(infra_early_divs), infra_clk_data);
-
-	of_clk_add_hw_provider(node, of_clk_hw_onecell_get, infra_clk_data);
-}
-CLK_OF_DECLARE_DRIVER(mtk_infrasys, "mediatek,mt8173-infracfg",
-		      clk_mt8173_infra_init_early);
-
-static int clk_mt8173_infracfg_probe(struct platform_device *pdev)
-{
-	struct device_node *node = pdev->dev.of_node;
-	int r, i;
-
-	if (!infra_clk_data) {
-		infra_clk_data = mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
-		if (!infra_clk_data)
-			return -ENOMEM;
-	} else {
-		for (i = 0; i < CLK_INFRA_NR_CLK; i++)
-			if (infra_clk_data->hws[i] == ERR_PTR(-EPROBE_DEFER))
-				infra_clk_data->hws[i] = ERR_PTR(-ENOENT);
-	}
-
-	r = mtk_clk_register_gates(&pdev->dev, node, infra_gates,
-				   ARRAY_SIZE(infra_gates), infra_clk_data);
-	if (r)
-		return r;
-
-	r = mtk_clk_register_cpumuxes(&pdev->dev, node, cpu_muxes,
-				      ARRAY_SIZE(cpu_muxes), infra_clk_data);
-	if (r)
-		goto unregister_gates;
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, infra_clk_data);
-	if (r)
-		goto unregister_cpumuxes;
-
-	r = mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc);
-	if (r)
-		goto unregister_clk_hw;
-
-	platform_set_drvdata(pdev, infra_clk_data);
-
-	return 0;
-
-unregister_clk_hw:
-	of_clk_del_provider(node);
-unregister_cpumuxes:
-	mtk_clk_unregister_cpumuxes(cpu_muxes, ARRAY_SIZE(cpu_muxes), infra_clk_data);
-unregister_gates:
-	mtk_clk_unregister_gates(infra_gates, ARRAY_SIZE(infra_gates), infra_clk_data);
-	return r;
-}
-
-static void clk_mt8173_infracfg_remove(struct platform_device *pdev)
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
 static struct platform_driver clk_mt8173_infracfg_drv = {
 	.driver = {
 		.name = "clk-mt8173-infracfg",
 		.of_match_table = of_match_clk_mt8173_infracfg,
 	},
-	.probe = clk_mt8173_infracfg_probe,
-	.remove = clk_mt8173_infracfg_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 };
 module_platform_driver(clk_mt8173_infracfg_drv);
 
-- 
2.56.0

