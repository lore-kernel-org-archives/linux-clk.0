Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795021592;
	b=M1z+AN8zi5J2vybIvw826ohd/KncuUUgzfr2OmAFGM/iOQ/rNuDmaJfh17pnmIWyqngI
	 ppiCfx8XY7nvxBSlYMeKXr8OrWQg/Ev0F64PZgYGUZFMFF575jDQti0VaQiizdQd3rNWV
	 wCtMm3yFssbPbZ51XQYE5oDC0HXaO+g5T4fekXIHWYQ+2cZt7/JBtuyueodj4h7HSXlpA
	 IxAIeu+KeXrXTyM7G2vgcLTK+dZ3XM51OdDSt2ie4NrRRbGbnx8iyV3XGcS+HcgCs+2Q1
	 ptX4EgVP/JKYbYxZ1HtkAc1C9/gXhSLDm+tFY6TJ3zkHfQ2sRuo5ea0rx2OSu6bk+gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021592;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=7wdiwY+9OKkEo4k0U8r8LO5bXp2VcIxl3SWuQS1sSLg=;
	b=EYnHxYbSgiMJFZX/3bec/mt/+y0VnBVq0WzExj1BJIsaiSisSww+bRGKfTTeLtGMESD/
	 dWkxjzASHKgXJJySfXsm2oB4hGgnht8Y60w4RvnMX0y79eLS2bILYDhgjqvcM6FGZ380o
	 3Mv5QV7c2C+8zuyl1XZ2rZmnIIsUrZ4inyyf2aRcfKYVJ8Uo6Sq/XFGhaZxGZ9EsIsy7o
	 KKmiHogP5w1ABhPotuGWhV/Ys4KVoe6h2euLugKHaCXCi9377djrKmchFhBK+ltFYQkQm
	 +XEFLBFHePBFlNaTV5zY4pSzdTcd4usPwBNEbug9+ZAF6tBDTt/lHmf2cWGVNbHTddw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=bx9i1rDG;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946E560A263A;
	Wed, 18 Nov 2026 17:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 946E560A263A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=bx9i1rDG
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 470A44E41635;
	Wed, 18 Nov 2026 17:06:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 110AD5FE9B;
	Wed, 18 Nov 2026 17:06:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0019C11BC2986;
	Wed, 18 Nov 2026 18:06:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795021588; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7wdiwY+9OKkEo4k0U8r8LO5bXp2VcIxl3SWuQS1sSLg=;
	b=bx9i1rDGJUtQFZ7kj3dOBf7OVdUTVrRAEk+0BKomP1eqlzaGygaMKIHJpsGGEoUOKiQh0S
	a1AOEq5nDMumA6N5wfXzcVuzlKD4gmsnIyiboH3HAlD4eNY4VN18t0As3XlUAOIWWJmTAn
	AP2t4Z5/5OpYkM7oo20seF9475ngjG8iu8cBVXx5wWQYxI0Xzwue0S1rskAWrvmdrskpai
	rhWr/oxyEoTa3AZtw4nj1DxScsBfbQck4nosYTxCPl71MZuOK9QLxl8A9QQmhHly4iNBbY
	cCNl6bGQtNGCBJfCU0beZw3pRx1CVTRUdiN+iYxBlLmabeYK3J8nMX1rEu12Nw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 18 Nov 2026 17:59:15 +0100
Subject: [PATCH v12 06/10] clk: nuvoton: ma35d1: Use device managed helpers
 for fixed rate clocks
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-perso-ma35d1-upstream-clk-v12-6-bee2c8dad4e1@bootlin.com>
References: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
In-Reply-To: <20261118-perso-ma35d1-upstream-clk-v12-0-bee2c8dad4e1@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Most of the clocks are already registered with device managed helpers,
except the fixed clocks. Harmonize the driver by using the already
available managed helper for that.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/nuvoton/clk-ma35d1.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
index d69c9fc0f39e..c11afc2f8f6d 100644
--- a/drivers/clk/nuvoton/clk-ma35d1.c
+++ b/drivers/clk/nuvoton/clk-ma35d1.c
@@ -139,9 +139,9 @@ static const struct clk_div_table eadc_div_table[] = {
 	{13, 28}, {14, 30}, {15, 32}, {0, 0},
 };
 
-static struct clk_hw *ma35d1_clk_fixed(const char *name, int rate)
+static struct clk_hw *ma35d1_clk_fixed(struct device *dev, const char *name, int rate)
 {
-	return clk_hw_register_fixed_rate(NULL, name, NULL, 0, rate);
+	return devm_clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
 }
 
 static struct clk_hw *ma35d1_clk_mux(struct device *dev, const char *name,
@@ -279,24 +279,24 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
 	 * purposes.
 	 */
 	if (num_clks == 1) {
-		hws[HXT] = ma35d1_clk_fixed("hxt", 24000000);
-		hws[LXT] = ma35d1_clk_fixed("lxt", 32768);
+		hws[HXT] = ma35d1_clk_fixed(dev, "hxt", 24000000);
+		hws[LXT] = ma35d1_clk_fixed(dev, "lxt", 32768);
 	}
 
 	hws[HXT_GATE] = ma35d1_clk_gate_parent_data(dev, "hxt_gate", hxtg_parent_data,
 						    clk_base + REG_CLK_PWRCTL, 0);
 	hws[LXT_GATE] = ma35d1_clk_gate_parent_data(dev, "lxt_gate", lxtg_parent_data,
 						    clk_base + REG_CLK_PWRCTL, 1);
-	hws[HIRC] = ma35d1_clk_fixed("hirc", 12000000);
+	hws[HIRC] = ma35d1_clk_fixed(dev, "hirc", 12000000);
 	hws[HIRC_GATE] = ma35d1_clk_gate(dev, "hirc_gate", "hirc",
 					 clk_base + REG_CLK_PWRCTL, 2);
-	hws[LIRC] = ma35d1_clk_fixed("lirc", 32000);
+	hws[LIRC] = ma35d1_clk_fixed(dev, "lirc", 32000);
 	hws[LIRC_GATE] = ma35d1_clk_gate(dev, "lirc_gate", "lirc",
 					 clk_base + REG_CLK_PWRCTL, 3);
 
 	hws[CAPLL] = ma35d1_reg_clk_pll(dev, CAPLL, pllmode[0], "capll",
 					hws[HXT_GATE], clk_base + REG_CLK_PLL0CTL0);
-	hws[SYSPLL] = ma35d1_clk_fixed("syspll", 180000000);
+	hws[SYSPLL] = ma35d1_clk_fixed(dev, "syspll", 180000000);
 	hws[DDRPLL] = ma35d1_reg_clk_pll(dev, DDRPLL, pllmode[1], "ddrpll",
 					hws[HXT_GATE], clk_base + REG_CLK_PLL2CTL0);
 	hws[APLL] = ma35d1_reg_clk_pll(dev, APLL, pllmode[2], "apll",
@@ -337,8 +337,8 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
 	hws[PCLK3_DIV4096] = ma35d1_clk_fixed_factor(dev, "pclk3_div4096", "pclk3", 1, 4096);
 	hws[PCLK4_DIV4096] = ma35d1_clk_fixed_factor(dev, "pclk4_div4096", "pclk4", 1, 4096);
 
-	hws[USBPHY0] = ma35d1_clk_fixed("usbphy0", 480000000);
-	hws[USBPHY1] = ma35d1_clk_fixed("usbphy1", 480000000);
+	hws[USBPHY0] = ma35d1_clk_fixed(dev, "usbphy0", 480000000);
+	hws[USBPHY1] = ma35d1_clk_fixed(dev, "usbphy1", 480000000);
 
 	/* DDR */
 	hws[DDR0_GATE] = ma35d1_clk_gate(dev, "ddr0_gate", "ddrpll",

-- 
2.56.0

