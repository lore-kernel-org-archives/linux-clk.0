Received: from mxb.seznam.cz (mxb.seznam.cz [77.75.78.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4816235E1B0;
	Wed,  1 Jul 2026 14:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.75.78.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782917529; cv=none; b=LVi0T7uNWwb5D69Xi7JdsVpU4ncjEpBSLTrxxw1DVrDgb0pRB7BVxI+AUFXbtpKMrNCxrMAyQtiFx0wSwQLOKy9hs5CFrizvSnVeQ3WH3+g1dgavp/fEH63lxhhHuJEA31x6vKj3bPtrQD+W4fcYK6RuIjGJZuCTPMqluEwuaPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782917529; c=relaxed/simple;
	bh=M79GvozQKZfPB1EJpICJVa9r+AklpUe3D99k0M6Uy+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dw1ZdwAHrp9mc9PoffFSR37j0FDI6kmyvitc5x81c6LP51Fuo58H2g2tf85qcJIjvn30LIaXuyPe6ZKmpB3NK9+v6m+UCbAeDBSvM7rGzHbnuwZ8nihWJ9aH91fVPi/at8SPpZVk3jGjPhCFOCFR87Xf/wg6XXbAY4uVqoqqxzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loebl.cz; spf=none smtp.mailfrom=loebl.cz; dkim=pass (2048-bit key) header.d=emailprofi.seznam.cz header.i=@emailprofi.seznam.cz header.b=IbjlxOcm; arc=none smtp.client-ip=77.75.78.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loebl.cz
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=loebl.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=emailprofi.seznam.cz header.i=@emailprofi.seznam.cz header.b="IbjlxOcm"
Received: from email.seznam.cz
	by smtpc-mxb-579c757c7c-4fm9l
	(smtpc-mxb-579c757c7c-4fm9l [2a02:598:128:8a00::1000:908])
	id 4ac7d07551555da14e2269f7;
	Wed, 01 Jul 2026 16:51:53 +0200 (CEST)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=emailprofi.seznam.cz; s=szn1; t=1782917513;
	bh=O0Qcya2QLwQEux4J7WYYOqbEh3L/fuWTdFmIDjXcR+k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=IbjlxOcmsRs+oDhx1nzNnt+RivC4MH/nlCKE+M619lJUoaIB2ekMgYDE7Qg1/Jimv
	 ybGyZ3mTR6AmEOv7TxFlX/v0/Xe8xAHBmcf2NyDiNIar1wJIDGJZiyPuIPC4X6qGpi
	 1hYIu7yugBUoPWOMRQgEvsdw0mtmECEIExqJYP3PnxxKI1Yh92Q1s0Rfghq90SWMyJ
	 MH8cUTLN/UG8rXJmz7g8nOfJaXedLDLN/sZdtG0PmVSEEAA3tFE7QylqB//sFz2KYu
	 V/xYqyrbh9SGimhtM3rdG5zcI2KatKFs4Lk+JNYdV+sRkeXmQD0DgyhteW/T70beYA
	 cu2+Ra9maEcjA==
Received: from localhost (109-81-118-98.rct.o2.cz [109.81.118.98])
	by smtpd-relay-f8b496c7c-c6rvl (szn-email-smtpd/2.0.76) with ESMTPA
	id 29a8e998-04a4-4daf-a220-0527b7a9d403;
	Wed, 01 Jul 2026 16:51:48 +0200
From: =?UTF-8?q?Pavel=20L=C3=B6bl?= <pavel@loebl.cz>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	=?UTF-8?q?Pavel=20L=C3=B6bl?= <pavel@loebl.cz>
Subject: [PATCH v2 2/2] clk: si544: add support for si549
Date: Wed,  1 Jul 2026 16:51:01 +0200
Message-ID: <20260701145101.3932655-3-pavel@loebl.cz>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260701145101.3932655-1-pavel@loebl.cz>
References: <20260701145101.3932655-1-pavel@loebl.cz>
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
 drivers/clk/Kconfig     |  6 +--
 drivers/clk/clk-si544.c | 82 ++++++++++++++++++++++++++++++++---------
 2 files changed, 68 insertions(+), 20 deletions(-)

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
index 09c06ecec1a5..b13aeead9c02 100644
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
@@ -56,11 +58,16 @@
 #define DELTA_M_FRAC_NUM	19
 #define DELTA_M_FRAC_DEN	20000
 
+struct si544_clk_desc {
+	unsigned long max_freq;
+	unsigned long xo_freq;
+};
+
 struct clk_si544 {
 	struct clk_hw hw;
 	struct regmap *regmap;
 	struct i2c_client *i2c_client;
-	unsigned long  max_freq;
+	const struct si544_clk_desc *chip_info;
 };
 #define to_clk_si544(_hw)	container_of(_hw, struct clk_si544, hw)
 
@@ -79,6 +86,7 @@ struct clk_si544_muldiv {
 	u16 hs_div;
 	u8 ls_div_bits;
 	s32 delta_m;
+	u32 xo_freq;
 };
 
 /* Enables or disables the output driver */
@@ -145,6 +153,8 @@ static int si544_get_muldiv(struct clk_si544 *data,
 	settings->delta_m = reg[0] << 8 | reg[1] << 16 | reg[2] << 24;
 	settings->delta_m >>= 8;
 
+	settings->xo_freq = data->chip_info->xo_freq;
+
 	return 0;
 }
 
@@ -193,7 +203,7 @@ static bool is_valid_frequency(const struct clk_si544 *data,
 	if (frequency < SI544_MIN_FREQ)
 		return false;
 
-	return frequency <= data->max_freq;
+	return frequency <= data->chip_info->max_freq;
 }
 
 /* Calculate divider settings for a given frequency */
@@ -201,6 +211,7 @@ static int si544_calc_muldiv(struct clk_si544_muldiv *settings,
 	unsigned long frequency)
 {
 	u64 vco;
+	u32 fxo = settings->xo_freq;
 	u32 ls_freq;
 	u32 tmp;
 	u8 res;
@@ -238,13 +249,13 @@ static int si544_calc_muldiv(struct clk_si544_muldiv *settings,
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
@@ -258,15 +269,16 @@ static unsigned long si544_calc_center_rate(
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
@@ -446,7 +458,7 @@ static int si544_probe(struct i2c_client *client)
 	init.num_parents = 0;
 	data->hw.init = &init;
 	data->i2c_client = client;
-	data->max_freq = (uintptr_t)i2c_get_match_data(client);
+	data->chip_info = i2c_get_match_data(client);
 
 	if (of_property_read_string(client->dev.of_node, "clock-output-names",
 			&init.name))
@@ -478,18 +490,54 @@ static int si544_probe(struct i2c_client *client)
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

