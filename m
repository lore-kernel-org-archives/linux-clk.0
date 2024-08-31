Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F0D16A94A;
	Sat, 31 Aug 2024 07:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725088761; cv=none; b=IRYA2VypLiSqrvv6AkiKGauYtRdOoA7/NeGgDgReDpD+1SjIUO9PhsyBp8bW03rOhNXRWtuCzjUaPVgFGv9ZmjO3RXu2ZHUKy5HSipE6bp/lo3gDewy+k/Cc3lizCzPi3XGkMMrJUCiFfpKIFKf71aIP5G2Q9A4Guc21YXTwQLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725088761; c=relaxed/simple;
	bh=mZL17vTSI21fYGe1Av6s7TLeSZDfb8YawTBbr0HBHhI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XwsoLHDlFhCMFswOgwToO4AmUYqWENWVeXOSi+cmHQ+mQZCmxiYT5H8aH9DEUIDhSe05YLGSRhjGEMQKyrsyae18MyGIq+bQEfu0cUjyxqlNrxMMD9fBbnnqn7atcUpWMKy/06GFJajLsmBXrG0gJFvdQJBkdmesfOL1nmRPO2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bcPj41u3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bcPj41u3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37197C4CEC0;
	Sat, 31 Aug 2024 07:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725088761;
	bh=mZL17vTSI21fYGe1Av6s7TLeSZDfb8YawTBbr0HBHhI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bcPj41u3QSyfWeqJkfGD1hRF2ZAZQ3efZZE+7tvYBrIMQmvum/tK7aUPZC9m2upKh
	 wu1pINB3emr1YxBGd/j2NDWHjwjFcslw+jpz/U78XyraE47kz/+gLhDY8CB7LJlrtT
	 Ops/IMVaeHj+DVVBTZwgL1Q13z5tDsd7dV+bC5EvJfHQiHZIAqyb5xCtHSE91HgC/H
	 pqF/yHPTV07KQfd0otv/eJj9G8JT1rCayen5GMEH1D62DwJlhKPmWYdeXazKLAzPxy
	 L7AiQhegq1I86jz2xiimCRtpdIQzGVbWNh5RqezFKlCfuBTIZnTmmXT41jCsitjy90
	 GF55Lnfr5kx7w==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 31 Aug 2024 09:18:47 +0200
Subject: [PATCH 5/7] clk: en7523: fix estimation of fixed rate for EN7581
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240831-clk-en7581-syscon-v1-5-5c2683541068@kernel.org>
References: <20240831-clk-en7581-syscon-v1-0-5c2683541068@kernel.org>
In-Reply-To: <20240831-clk-en7581-syscon-v1-0-5c2683541068@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 upstream@airoha.com, angelogioacchino.delregno@collabora.com, 
 linux-arm-kernel@lists.infradead.org, lorenzo.bianconi83@gmail.com, 
 ansuelsmth@gmail.com, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.1

Introduce en7581_base_clks array in order to define per-SoC fixed-rate
clock parameters and fix wrong parameters for emi, npu and crypto EN7581
clocks

Fixes: 66bc47326ce2 ("clk: en7523: Add EN7581 support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/clk/clk-en7523.c | 105 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 103 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index d0f936ec6bb2..f9ebbdb70393 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -43,6 +43,7 @@
 #define REG_NP_SCU_SSTR			0x9c
 #define REG_PCIE_XSI0_SEL_MASK		GENMASK(14, 13)
 #define REG_PCIE_XSI1_SEL_MASK		GENMASK(12, 11)
+#define REG_CRYPTO_CLKSRC2		0x20c
 
 #define REG_RST_CTRL2			0x00
 #define REG_RST_CTRL1			0x04
@@ -95,6 +96,10 @@ static const u32 emi_base[] = { 333000000, 400000000 };
 static const u32 bus_base[] = { 500000000, 540000000 };
 static const u32 slic_base[] = { 100000000, 3125000 };
 static const u32 npu_base[] = { 333000000, 400000000, 500000000 };
+/* EN7581 */
+static const u32 emi7581_base[] = { 540000000, 480000000, 400000000, 300000000 };
+static const u32 npu7581_base[] = { 800000000, 750000000, 720000000, 600000000 };
+static const u32 crypto_base[] = { 540000000, 480000000 };
 
 static const struct en_clk_desc en7523_base_clks[] = {
 	{
@@ -192,6 +197,102 @@ static const struct en_clk_desc en7523_base_clks[] = {
 	}
 };
 
+static const struct en_clk_desc en7581_base_clks[] = {
+	{
+		.id = EN7523_CLK_GSW,
+		.name = "gsw",
+
+		.base_reg = REG_GSW_CLK_DIV_SEL,
+		.base_bits = 1,
+		.base_shift = 8,
+		.base_values = gsw_base,
+		.n_base_values = ARRAY_SIZE(gsw_base),
+
+		.div_bits = 3,
+		.div_shift = 0,
+		.div_step = 1,
+		.div_offset = 1,
+	}, {
+		.id = EN7523_CLK_EMI,
+		.name = "emi",
+
+		.base_reg = REG_EMI_CLK_DIV_SEL,
+		.base_bits = 2,
+		.base_shift = 8,
+		.base_values = emi7581_base,
+		.n_base_values = ARRAY_SIZE(emi7581_base),
+
+		.div_bits = 3,
+		.div_shift = 0,
+		.div_step = 1,
+		.div_offset = 1,
+	}, {
+		.id = EN7523_CLK_BUS,
+		.name = "bus",
+
+		.base_reg = REG_BUS_CLK_DIV_SEL,
+		.base_bits = 1,
+		.base_shift = 8,
+		.base_values = bus_base,
+		.n_base_values = ARRAY_SIZE(bus_base),
+
+		.div_bits = 3,
+		.div_shift = 0,
+		.div_step = 1,
+		.div_offset = 1,
+	}, {
+		.id = EN7523_CLK_SLIC,
+		.name = "slic",
+
+		.base_reg = REG_SPI_CLK_FREQ_SEL,
+		.base_bits = 1,
+		.base_shift = 0,
+		.base_values = slic_base,
+		.n_base_values = ARRAY_SIZE(slic_base),
+
+		.div_reg = REG_SPI_CLK_DIV_SEL,
+		.div_bits = 5,
+		.div_shift = 24,
+		.div_val0 = 20,
+		.div_step = 2,
+	}, {
+		.id = EN7523_CLK_SPI,
+		.name = "spi",
+
+		.base_reg = REG_SPI_CLK_DIV_SEL,
+
+		.base_value = 400000000,
+
+		.div_bits = 5,
+		.div_shift = 8,
+		.div_val0 = 40,
+		.div_step = 2,
+	}, {
+		.id = EN7523_CLK_NPU,
+		.name = "npu",
+
+		.base_reg = REG_NPU_CLK_DIV_SEL,
+		.base_bits = 2,
+		.base_shift = 8,
+		.base_values = npu7581_base,
+		.n_base_values = ARRAY_SIZE(npu7581_base),
+
+		.div_bits = 3,
+		.div_shift = 0,
+		.div_step = 1,
+		.div_offset = 1,
+	}, {
+		.id = EN7523_CLK_CRYPTO,
+		.name = "crypto",
+
+		.base_reg = REG_CRYPTO_CLKSRC2,
+		.base_bits = 1,
+		.base_shift = 0,
+		.base_values = crypto_base,
+		.n_base_values = ARRAY_SIZE(crypto_base),
+	}
+};
+
 static const u16 en7581_rst_ofs[] = {
 	REG_RST_CTRL2,
 	REG_RST_CTRL1,
@@ -463,8 +564,8 @@ static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 	u32 rate;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(en7523_base_clks); i++) {
-		const struct en_clk_desc *desc = &en7523_base_clks[i];
+	for (i = 0; i < ARRAY_SIZE(en7581_base_clks); i++) {
+		const struct en_clk_desc *desc = &en7581_base_clks[i];
 		u32 val, reg = desc->div_reg ? desc->div_reg : desc->base_reg;
 
 		if (regmap_read(map, desc->base_reg, &val)) {

-- 
2.46.0

