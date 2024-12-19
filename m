Received: from mail.steuer-voss.de (mail.steuer-voss.de [85.183.69.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D559A221D8E;
	Thu, 19 Dec 2024 10:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.183.69.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734605714; cv=none; b=Yk0Gyu7ymbqOvimeHIkqvvH9sKep59oH8m6EvOR1qriisr4aGD7DKRhzxlzYw2D8PMCq4iNU22BTnkwR/7d0QDz2u/MPlA/sg3Mm4RPnomxAuYNQmtf6zK93GK3j+O8TmEMHfO3YJciC7AoYfd2DEvMspRdJVYb+dpZEck9SiWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734605714; c=relaxed/simple;
	bh=Ix6uxdZrt0hP5B/efNdUfd6VpDYNdXI1qIEICRhitc8=;
	h=From:Date:Subject:To:Cc:Message-Id; b=CygjdDT7sJ6+9op3xE04I1WQjiX0RkpN8iMiuGiwbq6lLh8tP6JNmLYxO+6oa4PckGk1xoojn2vTuoPWeVXcDsmKtmvfWGoiP5JpTJIdx9H+BG7Y3Z5Uc4SAmcrRvxeoSXL1ThQasG6kHnV+7Ic/oW/6Edosl7rrVDQ7fIGdVVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vosn.de; spf=pass smtp.mailfrom=vosn.de; arc=none smtp.client-ip=85.183.69.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vosn.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vosn.de
X-Virus-Scanned: Debian amavisd-new at mail.steuer-voss.de
Received: by mail.steuer-voss.de (Postfix, from userid 1000)
	id 889CB11FE; Thu, 19 Dec 2024 11:54:47 +0100 (CET)
From: Nikolaus Voss <nv@vosn.de>
Date: Thur, 19 Dec 2024 11:54:11 +0100
Subject: [PATCH] clk: clk-imx8mp-audiomix: fix function signature
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Marco Felsch <m.felsch@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <20241219105447.889CB11FE@mail.steuer-voss.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

clk_imx8mp_audiomix_reset_controller_register() in the
"if !CONFIG_RESET_CONTROLLER" branch had the first
argument missing. It is an empty function for this branch
so it wasn't immediately apparent.

Fixes: 6f0e817175c5 ("clk: imx: clk-audiomix: Add reset controller")
Cc: <stable@vger.kernel.org> # 6.12.x
Signed-off-by: Nikolaus Voss <nv@vosn.de>
---
 drivers/clk/imx/clk-imx8mp-audiomix.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-imx8mp-audiomix.c
index b2cb157703c57..c409fc7e06186 100644
--- a/drivers/clk/imx/clk-imx8mp-audiomix.c
+++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
@@ -278,7 +278,8 @@ static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev,
 
 #else /* !CONFIG_RESET_CONTROLLER */
 
-static int clk_imx8mp_audiomix_reset_controller_register(struct clk_imx8mp_audiomix_priv *priv)
+static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev,
+							 struct clk_imx8mp_audiomix_priv *priv)
 {
 	return 0;
 }
-- 
2.43.0

