Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891E24C2275
	for <linux-clk@vger.kernel.org>; Fri, 25 Sep 2026 15:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790349076; cv=none; b=Rb5JiDLUMcwXYGOx0Q3ynVHn5r6D9Rv8KXGC71w3V+BECoGIHcwbyQQf2YV7m9jkHpSGPgTa8y7PBFgy45VFUN7Aph2ptT+bAsK5OPxQVWZ5BxiwRNi8mK4T0B4e1jHypF8mwzdlD9Obsjx5r5sk2T5ZVz0pCMG9aVeXvVh606w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790349076; c=relaxed/simple;
	bh=3NwNXpfbsgXW14leb1yPauHBPIemCC2vesH1PvkFNgE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pUQqk7QUJSKBFuEj6Edv3uE2roYgT97MgP3SyjcFanlz002z6PBN+RcW1+7mBYGbcoGAn8Oin4YLyRxOVzNynfB+cTjlzDgfr9gv+hT7iaNfMzo1IO0HAQ1z2z8GWHQE4jiCTO0YJyrzyzA/EkYQkPMdrgl5CsN8UihrGJwhMHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=J65rG9Q8; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="J65rG9Q8"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 10110C653F5;
	Fri, 25 Sep 2026 15:11:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1E8B06073B;
	Fri, 25 Sep 2026 15:10:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3E849102F1E1F;
	Fri, 25 Sep 2026 17:10:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790349052; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WteHsaWuaUS9zUy8ie6UCRK5ilxUsXqhbklltbuZpx8=;
	b=J65rG9Q8UcLKkKjj1SOgJtTraHleZm0AqexhyeE6rFhylyAVpBE+eKExzQCGG23J9RB88B
	dsWOVsy6YU5I8VOer4TYYwMVZ9xOfF/oVDFvRiO1deq/KPzG3qNMkXCCmYN7DCWtE+nN0P
	HfCgP8gDVQrlJTK8/RFiP5JWXUiaMhySSd7qMbUKTNqQSmJW4KLXYfeX8oPU26Je25kNOo
	o4mM53NdW4EuQW72kAy+6CnZXbBir995HRXEMgStv1mmvRHm6K9mTkFWOobNDIh4SS7nPK
	wzvjV23KvTkoV9+PDJDFzay5ugoo5dm0ITOpW7nz0UtcC/1fP93e2ospE/v8KA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 25 Sep 2026 17:10:14 +0200
Subject: [PATCH v4 4/6] clk: nuvoton: ma35d1: Add missing WDT/WWDT parent
 clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-perso-ma35d1-upstream-clk-v4-4-f3697553391f@bootlin.com>
References: <20260925-perso-ma35d1-upstream-clk-v4-0-f3697553391f@bootlin.com>
In-Reply-To: <20260925-perso-ma35d1-upstream-clk-v4-0-f3697553391f@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Jacky Huang <ychuang570808@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The WDT and WWDT muxes list PCLK3/4096 and PCLK4/4096 among their
possible parents, but the driver never registers the corresponding
clocks, so these parents could never be used.

Add pclk3_div4096 and pclk4_div4096 as fixed factor children of pclk3
and pclk4 and expose them through the clock provider.

Reported-by: Jacky Huang <ychuang570808@gmail.com>
Closes: https://lore.kernel.org/linux-clk/b8a8a65b-e302-4747-bc90-4920fc48795a@gmail.com/
Suggested-by: Jacky Huang <ychuang570808@gmail.com>
Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/nuvoton/clk-ma35d1.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
index 6aa42a3e1be3..c914079cee2d 100644
--- a/drivers/clk/nuvoton/clk-ma35d1.c
+++ b/drivers/clk/nuvoton/clk-ma35d1.c
@@ -17,7 +17,7 @@
 static DEFINE_SPINLOCK(ma35d1_lock);
 
 #define PLL_MAX_NUM		5
-#define	MA35D1_CLK_COUNT	236
+#define	MA35D1_CLK_COUNT	238
 
 /* Clock Control Registers Offset */
 #define REG_CLK_PWRCTL		0x00
@@ -544,6 +544,8 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
 	hws[HCLK3] = ma35d1_clk_fixed_factor(dev, "hclk3", "sysclk1_mux", 1, 2);
 	hws[PCLK3] = ma35d1_clk_fixed_factor(dev, "pclk3", "sysclk1_mux", 1, 2);
 	hws[PCLK4] = ma35d1_clk_fixed_factor(dev, "pclk4", "sysclk1_mux", 1, 2);
+	hws[PCLK3_DIV4096] = ma35d1_clk_fixed_factor(dev, "pclk3_div4096", "pclk3", 1, 4096);
+	hws[PCLK4_DIV4096] = ma35d1_clk_fixed_factor(dev, "pclk4_div4096", "pclk4", 1, 4096);
 
 	hws[USBPHY0] = ma35d1_clk_fixed("usbphy0", 480000000);
 	hws[USBPHY1] = ma35d1_clk_fixed("usbphy1", 480000000);

-- 
2.55.0

