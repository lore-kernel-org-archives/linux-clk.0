Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D904376BF5;
	Tue, 17 Mar 2026 09:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773740047; cv=none; b=NCR4YIKtc4gi4FPKmUgFbn5yDbalTyWtYKFdYyR3uyDV8cNahf34KiYLZ9LZBQWoYuR3clWrEcVARAoweYz6sWlHz/671nJWgnshk6wCO3d0ckA2C6UMVROTjdVKJ5ATVQBh6syedOz7C//mLsNpnKL9F4+ZHaG1j4LtO3mwz7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773740047; c=relaxed/simple;
	bh=/hQY7FQRMEUod/Z9kKa5yjJXczNVyEO04gbtWHGwqio=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y3m/dO2Gm7LJTRw0taxbiA8PWbV7wTpdKjJjM0d2dJTVsAHWF9FpIIHde0FJVV+5PaiqaW+kdFyyZpR9qTvhYQqLaIWtJ8OQO1djUsfauABpSQV6ym4o177j5zHdc+vBhZw+P0sWXEfx4X9Nbw8icxonftymjBAWnH5ynxGd7l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Y8/aI619; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Y8/aI619"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=CYr2lsML4xXn9xvpQyi5HYRXhtmTvzAd2XvtNHp+U5M=; b=Y8/aI619pp3W9x2HLpKbvqAs9B
	p5p/G3+f1otQ5A+XIxcYtyS4jxQTFWupG1Ut59+s/EFnnROWZMHFC2CqNq00SdWUWIsDm8M05az11
	GrD+/pvnBJ5B2U0ts+zHuvminwHybOqsPbNtKiPBR5/p6UIS2x13c5tQUo5ZA9Rh4tGd4eFD4Dpy2
	FfbrKxYFNbzB6CkdjnAT4pwewLQFwy+vslAhdjLMSaI8jrKwI5tUWiDyLdIvGvsPjagQHx42Mzqkr
	Zw4iBt5e1qYvaUai18rJC8wqlugpZkNvGovF8d52iRDbOvfAuRGG7Y1d3Z7mUTxiKVCnbnhp8nTYL
	ZmBujQbQ==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w2QoM-000EvY-2O;
	Tue, 17 Mar 2026 10:34:02 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w2QoM-0004mK-1R;
	Tue, 17 Mar 2026 10:34:02 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] clk: imx: pll14xx: Use unsigned format specifier
Date: Tue, 17 Mar 2026 10:33:52 +0100
Message-ID: <20260317093353.964097-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27943/Tue Mar 17 07:24:09 2026)

The debug outputs use %d for clock rates resulting in negative clock rate
during rate calculation.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/clk/imx/clk-pll14xx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index 7552aaafc3395..701a7a02235cc 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -151,7 +151,7 @@ static void imx_pll14xx_calc_settings(struct clk_pll14xx *pll, unsigned long rat
 	/* First try if we can get the desired rate from one of the static entries */
 	tt = imx_get_pll_settings(pll, rate);
 	if (tt) {
-		pr_debug("%s: in=%ld, want=%ld, Using PLL setting from table\n",
+		pr_debug("%s: in=%lu, want=%lu, Using PLL setting from table\n",
 			 clk_hw_get_name(&pll->hw), prate, rate);
 		t->rate = tt->rate;
 		t->mdiv = tt->mdiv;
@@ -173,7 +173,7 @@ static void imx_pll14xx_calc_settings(struct clk_pll14xx *pll, unsigned long rat
 
 	if (rate >= rate_min && rate <= rate_max) {
 		kdiv = pll1443x_calc_kdiv(mdiv, pdiv, sdiv, rate, prate);
-		pr_debug("%s: in=%ld, want=%ld Only adjust kdiv %ld -> %d\n",
+		pr_debug("%s: in=%lu, want=%lu Only adjust kdiv %ld -> %d\n",
 			 clk_hw_get_name(&pll->hw), prate, rate,
 			 FIELD_GET(KDIV_MASK, pll_div_ctl1), kdiv);
 		fout = pll14xx_calc_rate(pll, mdiv, pdiv, sdiv, kdiv, prate);
@@ -211,7 +211,7 @@ static void imx_pll14xx_calc_settings(struct clk_pll14xx *pll, unsigned long rat
 		}
 	}
 found:
-	pr_debug("%s: in=%ld, want=%ld got=%d (pdiv=%d sdiv=%d mdiv=%d kdiv=%d)\n",
+	pr_debug("%s: in=%ld, want=%lu got=%u (pdiv=%d sdiv=%d mdiv=%d kdiv=%d)\n",
 		 clk_hw_get_name(&pll->hw), prate, rate, t->rate, t->pdiv, t->sdiv,
 		 t->mdiv, t->kdiv);
 }
-- 
2.43.0

