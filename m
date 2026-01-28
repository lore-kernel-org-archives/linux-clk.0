Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3972B37105B;
	Wed, 28 Jan 2026 18:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769625612; cv=pass; b=RHVuwpryx0mRt781Ns+E/g9b0UBIWQNmk4uitFv+P25o2xyhnkM5ycV6Ps1Sk5Bl0PB0sA5rUFPyHN3rTriw70obyexW7+B7PoA53asEiN32MoeICD8NBzvS2eztxx2rmzMlhenQ8nmg3NJzrqLyqq0m23fCzVemLmrIBBrZXqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769625612; c=relaxed/simple;
	bh=DjicpDGhvRkUFCtsY2UZa1ghKZK00ic02RXECM5InMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RmDzWwj0gfNSZuTI+HGaEjJ8BbR4LWhMW94jEx8g8J0unNvlbVVA6zMzc5X20SuTy4ZuRShWOwY0BBWZlmBIH/9dztp5zs6RrkX8mwCO6NXyR72s2wdH51onORSVszwC5ivzjTGUpRQ6Zs2gxHYYsbt6D62rZA6c9Qz/LIHqZDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=MRp5K8mz; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="MRp5K8mz"
ARC-Seal: i=1; a=rsa-sha256; t=1769625583; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=R++kYFz7gCfMdJMHUcVO2B3uN2gmHB0yIcDza4Rf3UliSC5Ao/2sxbpS2P8j4CCUBALZLflkdQ/ip3fPL400fYRU2djpHiEtUMU5TOP4axFpWahn5qO9MKc3bEIaA1ETeBbsQvTDr2Srhb2PP3bVrWw+SzGikLsRXoOX/TCYI1w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769625583; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=X/4xNgZc1irIgWz2/dXYtoRGvJYT5RtuSmiXMRgYKOM=; 
	b=CGzyu1Tl/RcMSxBQ7bdKYz2TR7FYWJevUKhvA5v1NG7oMRBIazhs8IRU/MrzJ93+nwulpDCV78ms1TLV2LBdl6pfU23LJg18Lqf46sq1a8pE/ei5/OxcZ4N/3R0lGzljIL7v8ZXOVWJ8H1HJQE1xeiEglRLtcVGi39+J9+Atn4E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769625583;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=X/4xNgZc1irIgWz2/dXYtoRGvJYT5RtuSmiXMRgYKOM=;
	b=MRp5K8mzfg8OF/g/+voqgixFXJN+bIP9cpHNWJwE0xdj4h0Yt/0BwdlFAnAPXBmo
	OCf9l06Y3IBPnb4QgMvRB3KCSvDFXoMXhQaiRZyaicQ2ROqkGtuYKfJdxKtYllYsOgA
	ezQrCvPJLaTsR9cdGUbfIW+9m8kRKUQ/l4Lrrcmw=
Received: by mx.zohomail.com with SMTPS id 1769625582177877.4278006459197;
	Wed, 28 Jan 2026 10:39:42 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 28 Jan 2026 19:38:51 +0100
Subject: [PATCH 2/2] clk: imx8mp: Mark arm_a53_div as critical
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-ops-parent-enable-fix-v1-2-ff39cc37f98d@collabora.com>
References: <20260128-ops-parent-enable-fix-v1-0-ff39cc37f98d@collabora.com>
In-Reply-To: <20260128-ops-parent-enable-fix-v1-0-ff39cc37f98d@collabora.com>
To: Mark Brown <broonie@kernel.org>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3

It appears the i.MX8MP does not like when arm_a53_div, or rather the
parent it depends on, sys_pll2_500m, is briefly turned off during
__clk_core_init.

In the past, this clock driver could get away with not declaring the
clock as critical, as nothing ever fiddled with its parent that early
on. However, after Commit 669917676e93 ("clk: Respect
CLK_OPS_PARENT_ENABLE during recalc"), this changed.

In order to guarantee that it keeps its parent enabled during
__clk_core_init if it sets the flag CLK_OPS_PARENT_ENABLE, the clock
must be marked as critical.

Fixes: 669917676e93 ("clk: Respect CLK_OPS_PARENT_ENABLE during recalc")
Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Closes: https://lore.kernel.org/r/6239343.lOV4Wx5bFT@steina-w/
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/clk/imx/clk-imx8mp.c | 4 +++-
 drivers/clk/imx/clk.h        | 4 ++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index fe6dac70f1a1..ee10f845faff 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -655,7 +655,9 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MP_CLK_CLKOUT2_DIV] = imx_clk_hw_divider("clkout2_div", "clkout2_sel", anatop_base + 0x128, 16, 4);
 	hws[IMX8MP_CLK_CLKOUT2] = imx_clk_hw_gate("clkout2", "clkout2_div", anatop_base + 0x128, 24);
 
-	hws[IMX8MP_CLK_A53_DIV] = imx8m_clk_hw_composite_core("arm_a53_div", imx8mp_a53_sels, ccm_base + 0x8000);
+	hws[IMX8MP_CLK_A53_DIV] = imx8m_clk_hw_composite_core_critical("arm_a53_div",
+								       imx8mp_a53_sels,
+								       ccm_base + 0x8000);
 	hws[IMX8MP_CLK_A53_SRC] = hws[IMX8MP_CLK_A53_DIV];
 	hws[IMX8MP_CLK_A53_CG] = hws[IMX8MP_CLK_A53_DIV];
 	hws[IMX8MP_CLK_M7_CORE] = imx8m_clk_hw_composite_core("m7_core", imx8mp_m7_sels, ccm_base + 0x8080);
diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index aa5202f284f3..97cac1d623ca 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -454,6 +454,10 @@ struct clk_hw *__imx8m_clk_hw_composite(const char *name,
 	_imx8m_clk_hw_composite(name, parent_names, reg, \
 			IMX_COMPOSITE_CORE, IMX_COMPOSITE_CLK_FLAGS_DEFAULT)
 
+#define imx8m_clk_hw_composite_core_critical(name, parent_names, reg)	\
+	_imx8m_clk_hw_composite(name, parent_names, reg, \
+			IMX_COMPOSITE_CORE, IMX_COMPOSITE_CLK_FLAGS_CRITICAL)
+
 #define imx8m_clk_hw_fw_managed_composite(name, parent_names, reg) \
 	_imx8m_clk_hw_composite(name, parent_names, reg, \
 			IMX_COMPOSITE_FW_MANAGED, \

-- 
2.52.0

