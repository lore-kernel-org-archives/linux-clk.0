Received: from mxb.seznam.cz (mxb.seznam.cz [77.75.78.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2934A48A2BD;
	Wed,  1 Jul 2026 13:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.75.78.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782911670; cv=none; b=HbLcNrJgHAFVVOGcXW90c92mv7QYI929J7FxO7qxmxly7ncXLSqJ/XVk8XTCgyEz+eLHIE+wZ7Gt423uCFTb90AvkPqWictZ2lQLQlEPgSC5nbSwSysbO1OOYvNJjkUSrhG26zNQVPlFsFJL0b4ahWoeBSn4iQg1UqIlbZyX6cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782911670; c=relaxed/simple;
	bh=wEhqK9ZcRJnUrkfMYETVQwR4TZAKupDVbQ0ATET5Sdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tVJAZS0kbiwTSnHCwEWRhqo1hfysQqAZLR/o0R7qMcuTMzchzXCu95ejFA32CUyOia/oIj/2R25gVNjsSWTangcsF1D9Tg2sThKds+uNrirZeJw56BSHupWRoBSznePeTKb197kNz5aPsSLz4YjD6MRN5sTnkmfJhJphf8EVdOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loebl.cz; spf=none smtp.mailfrom=loebl.cz; dkim=pass (2048-bit key) header.d=emailprofi.seznam.cz header.i=@emailprofi.seznam.cz header.b=CM74W3cM; arc=none smtp.client-ip=77.75.78.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loebl.cz
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=loebl.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=emailprofi.seznam.cz header.i=@emailprofi.seznam.cz header.b="CM74W3cM"
Received: from email.seznam.cz
	by smtpc-mxb-7dd54556bb-mmpkq
	(smtpc-mxb-7dd54556bb-mmpkq [2a02:598:64:8a00::1000:90e])
	id 785bf1b063c97c647cbe4832;
	Wed, 01 Jul 2026 15:14:17 +0200 (CEST)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=emailprofi.seznam.cz; s=szn1; t=1782911657;
	bh=SYYG4nwI5R6Y4AdmHwYZVeNZXWLSDa/AE/TBoB9/nN8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=CM74W3cMdLhtqknUqiYpb4CpXIIwFXYgmAUVwAoxQu4Ok7nu7vP+UyfA9onv/pPxO
	 RYx3ncYE3IeO6H+7knfKeoaXxAjr2dmqzJzvauYTQGlNlYlIx8j1xukfOY4FE4PVOY
	 N0PIzLsYaQ0lmd3pDtv1FwbmwD2Y49mL/FlKfIaeHow9BmQ/lQDTi/FngbnVXEjSLD
	 +11I4rxN2AMBE0h9dbepndHTKLzdacrJ0LBVO3QlCi5h//FV9epDqFXpD/FE0iOY1S
	 cSKTvrhAajzSHH7XZnalYV1V7YYS6As5gQEZNxltXRO6Lty082/t/ruFHfeY5tpz5U
	 9svLTzdU9hjVQ==
Received: from localhost (109-81-118-98.rct.o2.cz [109.81.118.98])
	by smtpd-relay-f8b496c7c-7h56j (szn-email-smtpd/2.0.76) with ESMTPA
	id 6421de43-0c1f-4942-a7cc-7782ff9e9ed1;
	Wed, 01 Jul 2026 15:13:51 +0200
From: =?UTF-8?q?Pavel=20L=C3=B6bl?= <pavel@loebl.cz>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	=?UTF-8?q?Pavel=20L=C3=B6bl?= <pavel@loebl.cz>
Subject: [PATCH 2/2] clk: si544: add support for si549
Date: Wed,  1 Jul 2026 15:09:26 +0200
Message-ID: <20260701130927.3858536-3-pavel@loebl.cz>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260701130927.3858536-1-pavel@loebl.cz>
References: <20260701130927.3858536-1-pavel@loebl.cz>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for Si549, which only differs from Si544 in internal
oscilator frequency. Si549 also comes in three types A,B and C.
Each having different maximum output frequency.

This patch also fixes maximum frequency of Si544 C. Which should
be 325MHz according to datasheet.

Signed-off-by: Pavel Löbl <pavel@loebl.cz>
---
 drivers/clk/Kconfig     |   6 +--
 drivers/clk/clk-si544.c | 100 ++++++++++++++++++++++++++++++----------
 2 files changed, 78 insertions(+), 28 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 1717ce75a907..159f546a48f0 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -155,12 +155,12 @@ config COMMON_CLK_SI514
 	  generator.
 
 config COMMON_CLK_SI544
-	tristate "Clock driver for SiLabs 544 devices"
+	tristate "Clock driver for SiLabs 544 and compatible devices"
 	depends on I2C
 	select REGMAP_I2C
 	help
-	  This driver supports the Silicon Labs 544 programmable clock
-	  generator.
+	  This driver supports the Silicon Labs 544/549 programmable clock
+	  generators.
 
 config COMMON_CLK_SI570
 	tristate "Clock driver for SiLabs 570 and compatible devices"
diff --git a/drivers/clk/clk-si544.c b/drivers/clk/clk-si544.c
index 09c06ecec1a5..2643546eb940 100644
--- a/drivers/clk/clk-si544.c
+++ b/drivers/clk/clk-si544.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Driver for Silicon Labs Si544 Programmable Oscillator
+ * Driver for Silicon Labs Si544/Si549 Programmable Oscillator
  * Copyright (C) 2018 Topic Embedded Products
  * Author: Mike Looijmans <mike.looijmans@topic.nl>
  */
@@ -40,7 +40,9 @@
 #define SI544_MIN_FREQ	    200000U
 
 /* Si544 Internal oscillator runs at 55.05 MHz */
-#define FXO		  55050000U
+#define SI544_XO_FREQ	55050000U
+/* Si549 Internal oscilator runs at 152.60 MHz */
+#define SI549_XO_FREQ	152600000U
 
 /* VCO range is 10.8 .. 12.1 GHz, max depends on speed grade */
 #define FVCO_MIN       10800000000ULL
@@ -56,11 +58,17 @@
 #define DELTA_M_FRAC_NUM	19
 #define DELTA_M_FRAC_DEN	20000
 
+struct si544_clk_desc {
+	unsigned long max_freq;
+	unsigned long xo_freq;
+};
+
 struct clk_si544 {
+	const struct si544_clk_desc *desc;
 	struct clk_hw hw;
 	struct regmap *regmap;
 	struct i2c_client *i2c_client;
-	unsigned long  max_freq;
+	const struct si544_clk_desc *chip_info;
 };
 #define to_clk_si544(_hw)	container_of(_hw, struct clk_si544, hw)
 
@@ -79,6 +87,7 @@ struct clk_si544_muldiv {
 	u16 hs_div;
 	u8 ls_div_bits;
 	s32 delta_m;
+	u32 xo_freq;
 };
 
 /* Enables or disables the output driver */
@@ -145,6 +154,8 @@ static int si544_get_muldiv(struct clk_si544 *data,
 	settings->delta_m = reg[0] << 8 | reg[1] << 16 | reg[2] << 24;
 	settings->delta_m >>= 8;
 
+	settings->xo_freq = data->chip_info->xo_freq;
+
 	return 0;
 }
 
@@ -193,14 +204,15 @@ static bool is_valid_frequency(const struct clk_si544 *data,
 	if (frequency < SI544_MIN_FREQ)
 		return false;
 
-	return frequency <= data->max_freq;
+	return frequency <= data->chip_info->max_freq;
 }
 
 /* Calculate divider settings for a given frequency */
-static int si544_calc_muldiv(struct clk_si544_muldiv *settings,
-	unsigned long frequency)
+static int si544_calc_muldiv(const struct clk_si544 *data,
+	struct clk_si544_muldiv *settings, unsigned long frequency)
 {
 	u64 vco;
+	u32 fxo = settings->xo_freq;
 	u32 ls_freq;
 	u32 tmp;
 	u8 res;
@@ -238,13 +250,13 @@ static int si544_calc_muldiv(struct clk_si544_muldiv *settings,
 	vco = (u64)ls_freq * settings->hs_div;
 
 	/* Calculate the integer part of the feedback divider */
-	tmp = do_div(vco, FXO);
+	tmp = do_div(vco, fxo);
 	settings->fb_div_int = vco;
 
 	/* And the fractional bits using the remainder */
 	vco = (u64)tmp << 32;
-	vco += FXO / 2; /* Round to nearest multiple */
-	do_div(vco, FXO);
+	vco += fxo / 2; /* Round to nearest multiple */
+	do_div(vco, fxo);
 	settings->fb_div_frac = vco;
 
 	/* Reset the frequency adjustment */
@@ -254,19 +266,20 @@ static int si544_calc_muldiv(struct clk_si544_muldiv *settings,
 }
 
 /* Calculate resulting frequency given the register settings */
-static unsigned long si544_calc_center_rate(
+static unsigned long si544_calc_center_rate(const struct clk_si544 *data,
 		const struct clk_si544_muldiv *settings)
 {
 	u32 d = settings->hs_div * BIT(settings->ls_div_bits);
+	u32 fxo = settings->xo_freq;
 	u64 vco;
 
 	/* Calculate VCO from the fractional part */
-	vco = (u64)settings->fb_div_frac * FXO;
-	vco += (FXO / 2);
+	vco = (u64)settings->fb_div_frac * fxo;
+	vco += (fxo / 2);
 	vco >>= 32;
 
 	/* Add the integer part of the VCO frequency */
-	vco += (u64)settings->fb_div_int * FXO;
+	vco += (u64)settings->fb_div_int * fxo;
 
 	/* Apply divider to obtain the generated frequency */
 	do_div(vco, d);
@@ -274,9 +287,10 @@ static unsigned long si544_calc_center_rate(
 	return vco;
 }
 
-static unsigned long si544_calc_rate(const struct clk_si544_muldiv *settings)
+static unsigned long si544_calc_rate(const struct clk_si544 *data,
+				const struct clk_si544_muldiv *settings)
 {
-	unsigned long rate = si544_calc_center_rate(settings);
+	unsigned long rate = si544_calc_center_rate(data, settings);
 	s64 delta = (s64)rate * (DELTA_M_FRAC_NUM * settings->delta_m);
 
 	/*
@@ -304,7 +318,7 @@ static unsigned long si544_recalc_rate(struct clk_hw *hw,
 	if (err)
 		return 0;
 
-	return si544_calc_rate(&settings);
+	return si544_calc_rate(data, &settings);
 }
 
 static int si544_determine_rate(struct clk_hw *hw,
@@ -356,7 +370,7 @@ static int si544_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (err)
 		return err;
 
-	center = si544_calc_center_rate(&settings);
+	center = si544_calc_center_rate(data, &settings);
 	max_delta = si544_max_delta(center);
 	delta = rate - center;
 
@@ -365,7 +379,7 @@ static int si544_set_rate(struct clk_hw *hw, unsigned long rate,
 					 si544_calc_delta(delta, max_delta));
 
 	/* Too big for the delta adjustment, need to reprogram */
-	err = si544_calc_muldiv(&settings, rate);
+	err = si544_calc_muldiv(data, &settings, rate);
 	if (err)
 		return err;
 
@@ -446,7 +460,7 @@ static int si544_probe(struct i2c_client *client)
 	init.num_parents = 0;
 	data->hw.init = &init;
 	data->i2c_client = client;
-	data->max_freq = (uintptr_t)i2c_get_match_data(client);
+	data->chip_info = i2c_get_match_data(client);
 
 	if (of_property_read_string(client->dev.of_node, "clock-output-names",
 			&init.name))
@@ -478,18 +492,54 @@ static int si544_probe(struct i2c_client *client)
 	return 0;
 }
 
+static const struct si544_clk_desc clk_si544a_info = {
+	.xo_freq = SI544_XO_FREQ,
+	.max_freq = 1500000000,
+};
+
+static const struct si544_clk_desc clk_si544b_info = {
+	.xo_freq = SI544_XO_FREQ,
+	.max_freq = 800000000,
+};
+
+static const struct si544_clk_desc clk_si544c_info = {
+	.xo_freq = SI544_XO_FREQ,
+	.max_freq = 325000000,
+};
+
+static const struct si544_clk_desc clk_si549a_info = {
+	.xo_freq = SI549_XO_FREQ,
+	.max_freq = 1500000000,
+};
+
+static const struct si544_clk_desc clk_si549b_info = {
+	.xo_freq = SI549_XO_FREQ,
+	.max_freq = 800000000,
+};
+
+static const struct si544_clk_desc clk_si549c_info = {
+	.xo_freq = SI549_XO_FREQ,
+	.max_freq = 325000000,
+};
+
 static const struct i2c_device_id si544_id[] = {
-	{ "si544a", 1500000000 },
-	{ "si544b", 800000000 },
-	{ "si544c", 350000000 },
+	{ "si544a", (kernel_ulong_t)&clk_si544a_info },
+	{ "si544b", (kernel_ulong_t)&clk_si544b_info },
+	{ "si544c", (kernel_ulong_t)&clk_si544c_info },
+	{ "si549a", (kernel_ulong_t)&clk_si549a_info },
+	{ "si549b", (kernel_ulong_t)&clk_si549b_info },
+	{ "si549c", (kernel_ulong_t)&clk_si549c_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, si544_id);
 
 static const struct of_device_id clk_si544_of_match[] = {
-	{ .compatible = "silabs,si544a", .data = (void *)1500000000 },
-	{ .compatible = "silabs,si544b", .data = (void *)800000000 },
-	{ .compatible = "silabs,si544c", .data = (void *)350000000 },
+	{ .compatible = "silabs,si544a", .data = &clk_si544a_info },
+	{ .compatible = "silabs,si544b", .data = &clk_si544b_info },
+	{ .compatible = "silabs,si544c", .data = &clk_si544c_info },
+	{ .compatible = "silabs,si549a", .data = &clk_si549a_info },
+	{ .compatible = "silabs,si549b", .data = &clk_si549b_info },
+	{ .compatible = "silabs,si549c", .data = &clk_si549c_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, clk_si544_of_match);
-- 
2.53.0

