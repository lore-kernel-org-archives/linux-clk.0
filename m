Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC081BC3F;
	Thu, 26 Dec 2024 15:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735227138; cv=none; b=SdRikApoj4+nt8/DaVCcmoCP3Zz9tKgK4tzXWyqsovbd5ZrVFNqPQmMPksMeg7iSWVJ2LYPM+ZcCjhbRyK95M2o9N+kZCuN4r8YZffTFaa8rPxr9j6nyPEICgm+SOeAbSuQosTqunjuEtBmRZ+SGJewGNY++pMdhSa1y3gaJI8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735227138; c=relaxed/simple;
	bh=eCf61TV879FRWEletVkB/ZyBXkpMxHRp1k5UfEMeshY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tBXr4wA+8uRf1bdL3VJ1nDFVo64S0gaoP/P33lpCKSdL/hA7EPBlGQb/a56tR+/7aMnwZig9xocGpzgli4C+p36kHkxxoutxsFeXWPUreJb4RhhSCCOGmZoYW1P9orJm3BkxLxBKVMlC581MghOBEuhbyn7UNmJwWRuZBAU6eEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=gTlnc5Qw; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="gTlnc5Qw"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 184361040DBCD;
	Thu, 26 Dec 2024 16:32:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1735227133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TFjUgAGBP328g7w3LzTuf6nKlBpliXFLKE+Q4uYY6ig=;
	b=gTlnc5QwEUEggTx4AgJj7cIhuBXsi6tYpnmGxetSjtQezLrWzkt/jGUHvGJvz+rhLREq5P
	96PMoor0aWbQY+xKFStM0qcxbu5OCNA4GJynsuezdw2YT6RlEBi9iwE6hi6rIrBivui//6
	zx6/FT+hbOk/89Aboy0TzM0Orv2rhYLGgr1QyA+bZ7GQ6W97fpOn6zthWYUE5lDqeWdpKI
	slkiy0AzNwXzr6h60ewSHgrT4bRiFgMcjJDMANSNLOVXqkR/h6sbvT1G/BJ17afbS5Lkpq
	aWrUH8HUz22DVDfkwTWGb3OeEy0pocIel5Q0zqFbfCPCEr5vdTF4Niq+zpfVsQ==
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
Subject: [PATCH 2/4] clk: fsl-sai: Add i.MX8M Mini support with 8 byte register offset
Date: Thu, 26 Dec 2024 16:30:28 +0100
Message-ID: <20241226153155.36351-2-marex@denx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241226153155.36351-1-marex@denx.de>
References: <20241226153155.36351-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The i.MX8M Mini/Nano/Plus variant of the SAI IP has control registers
shifted by +8 bytes, add support for the i.MX8M Mini variant of the IP
with this register shift.

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

