Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64481378800;
	Tue, 17 Mar 2026 12:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773749999; cv=none; b=ZTHuu0XTLDcqLSmP51pqZgZf5UCUfHoWYDMVuBXPicUaT4aJ7w6eRYEn62g9zYTVe3P4O440F3Wa4pmu1fdi6YsfdWytiiOfZrqUNs5M8ccT54t+Ymau7brkS/kYEP8sreA1wnQ/lF/GcZKSWpbmmUyqPMjeG2r1AxVKiVskra0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773749999; c=relaxed/simple;
	bh=T7INaOmnKzLIQfSGtOLgCjDLWHuGnJfHP1HF24XqzSI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SyAo/VUWaXakpufin1of92WnlZqiP9+/QaEREme8CNZW92PGroXv850hPPZd3UsOuS0F3Gqlx2t0OBN5Rma1Sc0FSoWT3TbICUoNYEv7JYwJ48wJBSAaQYNdkjdlwyusKhPyaoCEZqcxHW2pVc5UlXhO6uc1KOQGHdwmlwwm8xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=gPw2b1rS; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="gPw2b1rS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=wlZZWFuDFZY5bBtJez1qRMxaOgMw8oBWK1n/kXNB9cM=; b=gPw2b1rSiBSdAmQO+g4Nd0EhJY
	yox/CA6IKOxuL8wzbLjVm/9949O9O5ij0HULXMVxerLWPPWQ8kdaxgLRIfr7Ax1P3d3J3xsJRBAd8
	60sxMkkWTfC1s69iW6tRtbA4EZBHU4kT2QNfumC9VYhd4fxvUVPGimTjsX30zObJJ9fD8jSE9Rsec
	Mi0JIRsBrdfp6dk3f425kkhVSpe/KfOzmP1OnHZQzE2zBjyhUqHKNgvjtVAnjXz9EZgwUBCNi/4Z0
	Wi286HLlmfsLXnYK344jJmcccG06vHX0OiSRfVKez4ywlB1M+2h87alPR/vmiohKbsp3T+58Jqtg2
	VqbrNaDw==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w2TOu-000M22-0o;
	Tue, 17 Mar 2026 13:19:56 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w2TOs-000Gx7-2x;
	Tue, 17 Mar 2026 13:19:55 +0100
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
	linux-kernel@vger.kernel.org,
	Daniel Baluta <daniel.baluta@oss.nxp.com>
Subject: [PATCH v2 1/1] clk: imx: pll14xx: Use unsigned format specifier
Date: Tue, 17 Mar 2026 13:19:52 +0100
Message-ID: <20260317121953.1100619-1-alexander.stein@ew.tq-group.com>
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
Changes in v2:
* Adjusted another format specifier

 drivers/clk/imx/clk-pll14xx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index 7552aaafc3395..39600ee22be30 100644
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
+	pr_debug("%s: in=%lu, want=%lu got=%u (pdiv=%d sdiv=%d mdiv=%d kdiv=%d)\n",
 		 clk_hw_get_name(&pll->hw), prate, rate, t->rate, t->pdiv, t->sdiv,
 		 t->mdiv, t->kdiv);
 }
-- 
2.43.0

