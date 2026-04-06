Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A1031D75E;
	Mon,  6 Apr 2026 21:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775512320; cv=none; b=VFuv3Z7bI5iOD0yl8WkOJdcXaI8NtCsAKWKas6EaAk2Qk+cTiTVIcT0rW3PGQazihw88EkQT0CiP55cpuniYx+MyWBWpru5SttgqynGZmZuvvE5cLxk8fmayLRgse7q0P6K67EvmpKVsOQfmIl7SRJdGTMg7Wep94N0PJj5IN/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775512320; c=relaxed/simple;
	bh=Nt4FJlk7pC1LR8MBJMjUm/OUnV/xVcNH6UDpYqa9KUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mf8uAf2+R+W829KQDHs2qF2R0mlyvsAdJ3S7EG1BrSgXzq1Es033gJij92vYwkfLmrg/jnq2IK84JyAwPijVSUPAVJV8sWYvwjANmgIYO2k7VIReXWEftObqwtZrwcQ05Fu4JP9S1xu33gJz+JxCExCAqsYflb9xbd1RxT5OzLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=fA+UFRaT; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="fA+UFRaT"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BC9DE1132E1;
	Mon,  6 Apr 2026 23:51:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1775512317; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=YK71xTTgqPNNdmfueMFfiikAEar3VYlPoTjRoQnm0ew=;
	b=fA+UFRaT0QYOpy0Dtm9oGPoXtuU1vWJJz1craRkPiehgc7AGvMeYEXke4+i4lTGTNYp2q3
	+uDY/FqK7iekEE08PNHVF3/QpKrjCQu8rkBXzCEd2A54ykvXHqT9OJPSBPcQEArvAzfAz0
	okvKCI6MC+SwbbHOvFR8k6OQ0B/EQ3Azsdtt0MQC6g05LwklBHdkNmEN4axhAHe5DkRLuc
	x33vUXU2S/vWzQxNFRoc2Vt5W8lbs/PloR3vyzL1N3vrHGIEZGb5ldOMS2Gbreiix+qHyA
	hD38qfftT/P6q4k9K1weY6B99TsC5EbckSxQKVZstesXNS5bkiQP7a3yahfxQg==
From: Marek Vasut <marex@nabladev.com>
To: linux-clk@vger.kernel.org
Cc: Marek Vasut <marex@nabladev.com>,
	Brian Masney <bmasney@redhat.com>,
	Peng Fan <peng.fan@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Michael Walle <michael@walle.cc>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/6] clk: fsl-sai: Add i.MX8M support with 8 byte register offset
Date: Mon,  6 Apr 2026 23:49:42 +0200
Message-ID: <20260406215150.176599-2-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406215150.176599-1-marex@nabladev.com>
References: <20260406215150.176599-1-marex@nabladev.com>
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

Reviewed-by: Brian Masney <bmasney@redhat.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Brian Masney <bmasney@redhat.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Michael Walle <michael@walle.cc>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
V2: Update commit message, align it with the bindings one
V3: - Rebase on current next, update mail address
    - Pick ancient RB from Peng, although this may be outdated
      https://patchwork.kernel.org/project/alsa-devel/patch/20241226162234.40141-2-marex@denx.de/
    - Optionally enable "bus" clock, which are needed on MX8M to operate
      register file
V4: Add RB from Brian
---
 drivers/clk/Kconfig       |  2 +-
 drivers/clk/clk-fsl-sai.c | 27 +++++++++++++++++++++++----
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index cc8743b11bb1f..9f7f391a5615a 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -255,7 +255,7 @@ config COMMON_CLK_FSL_FLEXSPI
 
 config COMMON_CLK_FSL_SAI
 	bool "Clock driver for BCLK of Freescale SAI cores"
-	depends on ARCH_LAYERSCAPE || COMPILE_TEST
+	depends on ARCH_LAYERSCAPE || ARCH_MXC || COMPILE_TEST
 	help
 	  This driver supports the Freescale SAI (Synchronous Audio Interface)
 	  to be used as a generic clock output. Some SoCs have restrictions
diff --git a/drivers/clk/clk-fsl-sai.c b/drivers/clk/clk-fsl-sai.c
index cba45e07562da..336aa8477d0ea 100644
--- a/drivers/clk/clk-fsl-sai.c
+++ b/drivers/clk/clk-fsl-sai.c
@@ -26,11 +26,17 @@ struct fsl_sai_clk {
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
+	struct clk *clk_bus;
 	void __iomem *base;
 	struct clk_hw *hw;
 
@@ -42,19 +48,23 @@ static int fsl_sai_clk_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
+	clk_bus = devm_clk_get_optional_enabled(dev, "bus");
+	if (IS_ERR(clk_bus))
+		return PTR_ERR(clk_bus);
+
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
@@ -69,8 +79,17 @@ static int fsl_sai_clk_probe(struct platform_device *pdev)
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
2.53.0

