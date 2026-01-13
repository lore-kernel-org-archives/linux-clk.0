Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9764F38F950
	for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 12:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768308043; cv=none; b=jD+y27FaWWS0A4nq1RCDdRAqoqr5YZuiAOC6+5le3aLJ1qm/STFk6nuN4UNiAzfP0Kx4qECTf9EHL0J5+QAc06e0w56Zli3etonQuf5DmB7VPFKkz238aHKQWpJh5xfHrn4LUAHTmeCvksg17t/1oXGCFWkC1wzhL8mwjGyeQho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768308043; c=relaxed/simple;
	bh=T65FtZGbxAWeSyV69OYNZiU9us1OP+wsJ3atPkQx7ic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kZvVh1NOvmpMah8KmAiKqKqyhlGEIgKYwqCmbLmSgRE6tflRe8pDhAlrBRaTmbwo2jLrUbdViUt3ayeVyP8N2XGj36GF2br+w2AxNhNCKSlCD2dKxkJCmfbxOsQoQBh/0abVGu8jyVggRYReO85c04gAv228md3b0G8mZZuOJr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1vfdhQ-0005zD-DM; Tue, 13 Jan 2026 13:40:40 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Tue, 13 Jan 2026 13:40:34 +0100
Subject: [PATCH v2 1/2] clk: imx: fracn-gppll: Add 332.60 MHz Support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-v6-18-topic-clk-fracn-gppll-v2-1-44567319aef7@pengutronix.de>
References: <20260113-v6-18-topic-clk-fracn-gppll-v2-0-44567319aef7@pengutronix.de>
In-Reply-To: <20260113-v6-18-topic-clk-fracn-gppll-v2-0-44567319aef7@pengutronix.de>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marco Felsch <m.felsch@pengutronix.de>, 
 Primoz Fiser <primoz.fiser@norik.com>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

Some parallel panels have a pixelclk of 33.260 MHz. Add support for
332.60 MHz so a by 10 divider can be used to derive the exact pixelclk.

Reviewed-by: Primoz Fiser <primoz.fiser@norik.com>
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/clk/imx/clk-fracn-gppll.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-fracn-gppll.c
index 090d608672508a8819dc68eedec5b8d4a2c140c8..579f76494eb041dfba58b8cd10eb2453a0ec4178 100644
--- a/drivers/clk/imx/clk-fracn-gppll.c
+++ b/drivers/clk/imx/clk-fracn-gppll.c
@@ -88,6 +88,7 @@ static const struct imx_fracn_gppll_rate_table fracn_tbl[] = {
 	PLL_FRACN_GP(445333333U, 167, 0, 1, 0, 9),
 	PLL_FRACN_GP(400000000U, 200, 0, 1, 0, 12),
 	PLL_FRACN_GP(393216000U, 163, 84, 100, 0, 10),
+	PLL_FRACN_GP(332600000U, 138, 584, 1000, 0, 10),
 	PLL_FRACN_GP(300000000U, 150, 0, 1, 0, 12)
 };
 

-- 
2.47.3

