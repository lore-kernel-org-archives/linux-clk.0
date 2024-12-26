Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087B34F20C;
	Thu, 26 Dec 2024 16:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735230179; cv=none; b=IsnT8/I3Pbuj4nZOALWIAixl+txe+rGtWinMjKAHSJVG1GWVL2Hfk/AJIRWLX+msYJ7QcP28QrBnSDwq06E5WXWnD3Ql9bEyxHThaMGyQjabQ346fdQa3774nwnrsMBePYBAvHWwKpUOeMD1+kGyfUNwmJriFdSBya0QajxQLAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735230179; c=relaxed/simple;
	bh=TCXf9eG5cHibieJLNjPGIuIMhC7kjQFEBB0b/VGx1qk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MKDuCBL3oy5R5o9TvlU8V8aAAx0WohZMAbjsgm03Jvy6AW+v57v6sfYxbHSxyVkDsaFWQTZcWuDOi7CxMRtL+jM1Scx7UZ3aEY8yditzaZASUffJBk+/X2nYPjCU/U135X23ZMGasBfIvGGbiAAsub28gk1nrMN2GzCl4Os+8ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=C1yhjPYt; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="C1yhjPYt"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 531B41040DBDA;
	Thu, 26 Dec 2024 17:22:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1735230175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CvF+amNlnLxoaD4M5EPg2x62mg/GwN1hltldxBw9RHQ=;
	b=C1yhjPYtGiGa6jd0ghNy7MAKQkrOHgVdd8QU6RpR5wI0As7mmH28fA83NDCTds24LyQ8Tz
	oGuZlNThCzxUyV17YrKg7h862aw7WFYSf08LAjlE61aivbPLuLB4QKeQLkuK1poRE4JWhM
	c7C8watavqmjhI4SGJFC8pzhoO+n7hP9yCeH4EQPkTTh3YCpjqEVAN5drctbEnWSa3d56E
	4rNSGR2kp9q2NjT4DkCedRcbpR0mzyI6xO6XfV4KUwAMYrlpIqF95z99/L/Sd3PIxGpdDd
	djaJFuSyLIAweWYdkiEBdRDbTS1ywaYHr/s71HOhmfISMCbcaWgwIlgkIn9kqw==
From: Marek Vasut <marex@denx.de>
To: linux-clk@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Michael Walle <michael@walle.cc>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH v2 2/4] clk: fsl-sai: Add i.MX8M support with 8 byte register offset
Date: Thu, 26 Dec 2024 17:22:22 +0100
Message-ID: <20241226162234.40141-2-marex@denx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241226162234.40141-1-marex@denx.de>
References: <20241226162234.40141-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The i.MX8M/Mini/Nano/Plus variant of the SAI IP has control registers
shifted by +8 bytes and requires additional bus clock. Add support for
the i.MX8M variant of the IP with this register shift and additional
clock.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Michael Walle <michael@walle.cc>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-sound@vger.kernel.org
---
V2: Update commit message, align it with the bindings one
---
 drivers/clk/Kconfig       |  2 +-
 drivers/clk/clk-fsl-sai.c | 22 ++++++++++++++++++----
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 713573b6c86c7..575743d7e2c71 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -247,7 +247,7 @@ config COMMON_CLK_FSL_FLEXSPI
 
 config COMMON_CLK_FSL_SAI
 	bool "Clock driver for BCLK of Freescale SAI cores"
-	depends on ARCH_LAYERSCAPE || COMPILE_TEST
+	depends on ARCH_LAYERSCAPE || ARCH_MXC || COMPILE_TEST
 	help
 	  This driver supports the Freescale SAI (Synchronous Audio Interface)
 	  to be used as a generic clock output. Some SoCs have restrictions
diff --git a/drivers/clk/clk-fsl-sai.c b/drivers/clk/clk-fsl-sai.c
index cba45e07562da..628e53a3a26fa 100644
--- a/drivers/clk/clk-fsl-sai.c
+++ b/drivers/clk/clk-fsl-sai.c
@@ -26,9 +26,14 @@ struct fsl_sai_clk {
 	spinlock_t lock;
 };
 
+struct fsl_sai_data {
+	unsigned int	offset;	/* Register offset */
+};
+
 static int fsl_sai_clk_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	const struct fsl_sai_data *data = device_get_match_data(dev);
 	struct fsl_sai_clk *sai_clk;
 	struct clk_parent_data pdata = { .index = 0 };
 	void __iomem *base;
@@ -44,17 +49,17 @@ static int fsl_sai_clk_probe(struct platform_device *pdev)
 
 	spin_lock_init(&sai_clk->lock);
 
-	sai_clk->gate.reg = base + I2S_CSR;
+	sai_clk->gate.reg = base + data->offset + I2S_CSR;
 	sai_clk->gate.bit_idx = CSR_BCE_BIT;
 	sai_clk->gate.lock = &sai_clk->lock;
 
-	sai_clk->div.reg = base + I2S_CR2;
+	sai_clk->div.reg = base + data->offset + I2S_CR2;
 	sai_clk->div.shift = CR2_DIV_SHIFT;
 	sai_clk->div.width = CR2_DIV_WIDTH;
 	sai_clk->div.lock = &sai_clk->lock;
 
 	/* set clock direction, we are the BCLK master */
-	writel(CR2_BCD, base + I2S_CR2);
+	writel(CR2_BCD, base + data->offset + I2S_CR2);
 
 	hw = devm_clk_hw_register_composite_pdata(dev, dev->of_node->name,
 						  &pdata, 1, NULL, NULL,
@@ -69,8 +74,17 @@ static int fsl_sai_clk_probe(struct platform_device *pdev)
 	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, hw);
 }
 
+static const struct fsl_sai_data fsl_sai_vf610_data = {
+	.offset	= 0,
+};
+
+static const struct fsl_sai_data fsl_sai_imx8mq_data = {
+	.offset	= 8,
+};
+
 static const struct of_device_id of_fsl_sai_clk_ids[] = {
-	{ .compatible = "fsl,vf610-sai-clock" },
+	{ .compatible = "fsl,vf610-sai-clock", .data = &fsl_sai_vf610_data },
+	{ .compatible = "fsl,imx8mq-sai-clock", .data = &fsl_sai_imx8mq_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, of_fsl_sai_clk_ids);
-- 
2.45.2

