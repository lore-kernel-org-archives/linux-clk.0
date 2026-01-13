Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2602C3259
	for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 14:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768315978; cv=none; b=pMGzAm0qBc3CD8OHjX9mx0SMsHlyB7SPrGSS4+pUWUUqsXuCfCZh6EFUx4hJVluepxjmrKm26hav2r3TjDMFq9rq4TtZ1SoOnXLphuPX17EVYSplfyqjDa+UQzTG2d10BwkOWgncBGpKc3oedOK0H/HqjQsunK5jPfyMwzTVZyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768315978; c=relaxed/simple;
	bh=vy2eDOBMlUafSeBCk378hYNIaa68KFbvq8F1auntqWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lIgteG043j2jwXAbSU7L5nts3cw52HObZWZ/rpovzlAjoULhgOFTz3oR0grs7TWb6q7DukMQlS/vtENeLkxXhmLTEfCrALTgI8ZtQA7WlqjDiRPAgc0ppx5OWzcpC5uv+/u7XehQ8dYW4qu13YJ335egQpTxud9gU+kLb6FT8M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1vfflD-0004eQ-7e; Tue, 13 Jan 2026 15:52:43 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Tue, 13 Jan 2026 15:52:42 +0100
Subject: [PATCH v3 2/2] clk: imx: fracn-gppll: Add 241.90 MHz Support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-v6-18-topic-clk-fracn-gppll-v3-2-45da70f43c98@pengutronix.de>
References: <20260113-v6-18-topic-clk-fracn-gppll-v3-0-45da70f43c98@pengutronix.de>
In-Reply-To: <20260113-v6-18-topic-clk-fracn-gppll-v3-0-45da70f43c98@pengutronix.de>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

Some parallel panels have a pixelclk of 24.19 MHz. Add support for
241.90 MHz so a by 10 divider can be used to derive the exact pixelclk.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/clk/imx/clk-fracn-gppll.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-fracn-gppll.c
index 579f76494eb041dfba58b8cd10eb2453a0ec4178..6de5349adf706382fbb9d66d53283dbb1460ee70 100644
--- a/drivers/clk/imx/clk-fracn-gppll.c
+++ b/drivers/clk/imx/clk-fracn-gppll.c
@@ -89,7 +89,8 @@ static const struct imx_fracn_gppll_rate_table fracn_tbl[] = {
 	PLL_FRACN_GP(400000000U, 200, 0, 1, 0, 12),
 	PLL_FRACN_GP(393216000U, 163, 84, 100, 0, 10),
 	PLL_FRACN_GP(332600000U, 138, 584, 1000, 0, 10),
-	PLL_FRACN_GP(300000000U, 150, 0, 1, 0, 12)
+	PLL_FRACN_GP(300000000U, 150, 0, 1, 0, 12),
+	PLL_FRACN_GP(241900000U, 201, 584, 1000, 0, 20),
 };
 
 struct imx_fracn_gppll_clk imx_fracn_gppll = {

-- 
2.47.3

