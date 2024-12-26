Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF115136351;
	Thu, 26 Dec 2024 16:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735230183; cv=none; b=WqR3G7eivn9hHsL5ZoTffjSlRWIls7L7EHpkIvL+cBX5vMbWxglKtgrOZ/iuTTH7HvxPHWL13j+IWX7n/aVjoMw6dyigCxy07e9arJxwtcRgFX+Wm2BRhQBeMEtexlowvZE36eYJPNDfi5Tv/zBYNWkpFHFYZ1OkP0SNw9EWL7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735230183; c=relaxed/simple;
	bh=HX2dcd0dEZnWFbH+RWYUNc658kLWSRrTvyAiqCrzkBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cGFtwEggxFyGCppRKq3vTVClhdeILv2P4vxqDK6BtKOHmC4+1LHN2A2IIpM9e61LdXp9kc6WRV1bRW/9/9mdBxiwRyY3GUaA+sVmGZGjXuFRjWtSKd3ea6XM6l2lj0unW8tgBmTqJlmW1Pp3odRGuvFXsexLoOdQbN/5dN80BeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=Ri1EJQsM; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="Ri1EJQsM"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CFDCF1040DBF2;
	Thu, 26 Dec 2024 17:22:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1735230179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xx3lg1AGhCfYl5q5RI/QuoDaHJg4kxp86RO6KSzpna4=;
	b=Ri1EJQsMEO/EJDHMqGP6bD75N72O32AaUPOlNAHCYywoZE/UB1YxXbPdFe1y9DEPCeVGdv
	V+IB83+twHO2XrkCwPOsk7lbW01tsTjIBRwrU4kyCmeclRGagu9mxO3ZEiYwWy/clqJSZM
	ikdFXyObpcuTMLGjndF7GqjGhjzjs3bk3n3j+guu0O1NppgfRNUbSz3ialZPvFhtBx6CGf
	zI6jw8Cj1A0lYZu0nAArIuc+jxKsjDh5E5iA7mn28Qb71SZzH9xtDNpD/vJB3N3cnJ5PWq
	lVB4eC/ineI8zbysDpGIuDtrXnE6hTG3iTAJh3UL8K342QzlJE1gwEbff+dkOg==
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
Subject: [PATCH v2 4/4] clk: fsl-sai: Add MCLK generation support
Date: Thu, 26 Dec 2024 17:22:24 +0100
Message-ID: <20241226162234.40141-4-marex@denx.de>
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

The driver currently supports generating BCLK. There are systems which
require generation of MCLK instead. Register new MCLK clock and handle
clock-cells = <1> to differentiate between BCLK and MCLK. In case of a
legacy system with clock-cells = <0>, the driver behaves as before, i.e.
always returns BCLK.

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
V2: No change
---
 drivers/clk/clk-fsl-sai.c | 81 ++++++++++++++++++++++++++++++++-------
 1 file changed, 67 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/clk-fsl-sai.c b/drivers/clk/clk-fsl-sai.c
index 628e53a3a26fa..0f8e2f2662d87 100644
--- a/drivers/clk/clk-fsl-sai.c
+++ b/drivers/clk/clk-fsl-sai.c
@@ -7,6 +7,7 @@
 
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/of.h>
@@ -15,27 +16,44 @@
 
 #define I2S_CSR		0x00
 #define I2S_CR2		0x08
+#define I2S_MCR		0x100
 #define CSR_BCE_BIT	28
+#define CSR_TE_BIT	31
 #define CR2_BCD		BIT(24)
 #define CR2_DIV_SHIFT	0
 #define CR2_DIV_WIDTH	8
+#define MCR_MOE		BIT(30)
 
 struct fsl_sai_clk {
-	struct clk_divider div;
-	struct clk_gate gate;
+	struct clk_divider bclk_div;
+	struct clk_divider mclk_div;
+	struct clk_gate bclk_gate;
+	struct clk_gate mclk_gate;
+	struct clk_hw *bclk_hw;
+	struct clk_hw *mclk_hw;
 	spinlock_t lock;
 };
 
 struct fsl_sai_data {
 	unsigned int	offset;	/* Register offset */
+	bool		have_mclk; /* Have MCLK control */
 };
 
+static struct clk_hw *
+fsl_sai_of_clk_get(struct of_phandle_args *clkspec, void *data)
+{
+	struct fsl_sai_clk *sai_clk = data;
+
+	return clkspec->args[0] ? sai_clk->mclk_hw : sai_clk->bclk_hw;
+}
+
 static int fsl_sai_clk_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	const struct fsl_sai_data *data = device_get_match_data(dev);
-	struct fsl_sai_clk *sai_clk;
 	struct clk_parent_data pdata = { .index = 0 };
+	struct fsl_sai_clk *sai_clk;
+	struct clk *clk_bus;
 	void __iomem *base;
 	struct clk_hw *hw;
 
@@ -47,39 +65,74 @@ static int fsl_sai_clk_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
+	clk_bus = devm_clk_get_enabled(dev, "bus");
+	if (IS_ERR(clk_bus))
+		return PTR_ERR(clk_bus);
+
 	spin_lock_init(&sai_clk->lock);
 
-	sai_clk->gate.reg = base + data->offset + I2S_CSR;
-	sai_clk->gate.bit_idx = CSR_BCE_BIT;
-	sai_clk->gate.lock = &sai_clk->lock;
+	sai_clk->bclk_gate.reg = base + data->offset + I2S_CSR;
+	sai_clk->bclk_gate.bit_idx = CSR_BCE_BIT;
+	sai_clk->bclk_gate.lock = &sai_clk->lock;
 
-	sai_clk->div.reg = base + data->offset + I2S_CR2;
-	sai_clk->div.shift = CR2_DIV_SHIFT;
-	sai_clk->div.width = CR2_DIV_WIDTH;
-	sai_clk->div.lock = &sai_clk->lock;
+	sai_clk->bclk_div.reg = base + data->offset + I2S_CR2;
+	sai_clk->bclk_div.shift = CR2_DIV_SHIFT;
+	sai_clk->bclk_div.width = CR2_DIV_WIDTH;
+	sai_clk->bclk_div.lock = &sai_clk->lock;
 
 	/* set clock direction, we are the BCLK master */
 	writel(CR2_BCD, base + data->offset + I2S_CR2);
 
-	hw = devm_clk_hw_register_composite_pdata(dev, dev->of_node->name,
+	hw = devm_clk_hw_register_composite_pdata(dev, "BCLK",
 						  &pdata, 1, NULL, NULL,
-						  &sai_clk->div.hw,
+						  &sai_clk->bclk_div.hw,
 						  &clk_divider_ops,
-						  &sai_clk->gate.hw,
+						  &sai_clk->bclk_gate.hw,
 						  &clk_gate_ops,
 						  CLK_SET_RATE_GATE);
 	if (IS_ERR(hw))
 		return PTR_ERR(hw);
 
-	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, hw);
+	sai_clk->bclk_hw = hw;
+
+	if (data->have_mclk) {
+		sai_clk->mclk_gate.reg = base + data->offset + I2S_CSR;
+		sai_clk->mclk_gate.bit_idx = CSR_TE_BIT;
+		sai_clk->mclk_gate.lock = &sai_clk->lock;
+
+		sai_clk->mclk_div.reg = base + I2S_MCR;
+		sai_clk->mclk_div.shift = CR2_DIV_SHIFT;
+		sai_clk->mclk_div.width = CR2_DIV_WIDTH;
+		sai_clk->mclk_div.lock = &sai_clk->lock;
+
+		pdata.index = 1; /* MCLK1 */
+		hw = devm_clk_hw_register_composite_pdata(dev, "MCLK",
+							  &pdata, 1, NULL, NULL,
+							  &sai_clk->mclk_div.hw,
+							  &clk_divider_ops,
+							  &sai_clk->mclk_gate.hw,
+							  &clk_gate_ops,
+							  CLK_SET_RATE_GATE);
+		if (IS_ERR(hw))
+			return PTR_ERR(hw);
+
+		sai_clk->mclk_hw = hw;
+
+		/* set clock direction, we are the MCLK output */
+		writel(MCR_MOE, base + I2S_MCR);
+	}
+
+	return devm_of_clk_add_hw_provider(dev, fsl_sai_of_clk_get, sai_clk);
 }
 
 static const struct fsl_sai_data fsl_sai_vf610_data = {
 	.offset	= 0,
+	.have_mclk = false,
 };
 
 static const struct fsl_sai_data fsl_sai_imx8mq_data = {
 	.offset	= 8,
+	.have_mclk = true,
 };
 
 static const struct of_device_id of_fsl_sai_clk_ids[] = {
-- 
2.45.2

