Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36FA3A89BE;
	Fri, 16 Jan 2026 20:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768594066; cv=none; b=MlXMSf8gl3e3RFsKwWDtSVi+g2urfWy8c9roe0xnmMzaW2ZipVCCsV5t160XWifFy2yIxnKqkTZ2goJCB6H0o74d2ZZjvoXdziNP6EUNYBLVeRn+tvpMWQSCqbl3RTPKgAoW6NYksSq3iyu0jc/NSMZRjPVSh6APkG18aRXDhFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768594066; c=relaxed/simple;
	bh=HGKxUvj4jfbi7Q0zGZ98GiqkQgAgwIobvJTbwJ7/vCU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q3U2DRZgRMxk+mt/U/eCNOQl3GPdp1JGcjHmmvH+dyZS1597v3MpnPFJOnNb0WhyK9G/Cv85m8250swg9HsDGHwnZP24zHCJJ44PhD2m8jzJ7GXgyJbOA9i0JQsxeAfpXb9n7wHOeVF3ZnMGvpXQAbkZkQgSnQJksx+mXRihSjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=y0k4A/tC; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="y0k4A/tC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768594063; x=1800130063;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HGKxUvj4jfbi7Q0zGZ98GiqkQgAgwIobvJTbwJ7/vCU=;
  b=y0k4A/tCu/j4WiA8FW+Sh6IhSTEAmhAdzUYHN1tAmli9YiWxK7Pb4czp
   xIH6x48KzPAr9Zb8yJsMqWsv71mJA0eHZOc2dm5kpVMUGQ5oRKyXDAAtv
   2Oxjf7IkPI7r9DrUIFFz4Wtj3CGijGllQmimSrpcTK0/DInPHDF2rSok6
   HoZrdc7+f/80nrcKL1Cs0pCgtaZnYOFGntb1FYKeRGLE9k/+50jfRImx7
   80xMIWcqWzontgfFwcGNAT5Fz9DHWHHeowVU6ndHx1AEbU6OkeRTLl3GP
   3RYSJKuZ3Gbn4t0uNyS0rJ7LPvhnpdAeo6lh4LRfS/HrQ0JvuePk1xeMk
   w==;
X-CSE-ConnectionGUID: MqTcJu0RSESfeq27zLZvsQ==
X-CSE-MsgGUID: bB3piR/rQYil78T484gdtA==
X-IronPort-AV: E=Sophos;i="6.21,232,1763449200"; 
   d="scan'208";a="52013866"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Jan 2026 13:07:40 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 16 Jan 2026 13:07:07 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 16 Jan 2026 13:07:07 -0700
From: <ryan.wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <bmasney@redhat.com>,
	<alexander.sverdlin@gmail.com>, <varshini.rajendran@microchip.com>
CC: <cristian.birsan@microchip.com>,
	<balamanikandan.gunasundar@microchip.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 24/31] clk: at91: sama5d3: switch to parent_data and parent_hw
Date: Fri, 16 Jan 2026 13:07:17 -0700
Message-ID: <9431385f28f6a5fad9b4ee37086be58d87643856.1768512290.git.ryan.wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1768512290.git.ryan.wanner@microchip.com>
References: <cover.1768512290.git.ryan.wanner@microchip.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Claudiu Beznea <claudiu.beznea@tuxon.dev>

Switch SAMA5D3 clocks to use parent_data and parent_hw where possible.
Having parent_data instead of parent names improves to clock registration
speed and re-parenting. Update the clock registration functions to use
clk_hw.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/sama5d3.c | 104 +++++++++++++++++++++----------------
 1 file changed, 58 insertions(+), 46 deletions(-)

diff --git a/drivers/clk/at91/sama5d3.c b/drivers/clk/at91/sama5d3.c
index 8326bb6a291c..57f82c882e14 100644
--- a/drivers/clk/at91/sama5d3.c
+++ b/drivers/clk/at91/sama5d3.c
@@ -37,9 +37,9 @@ static const struct clk_pcr_layout sama5d3_pcr_layout = {
 	.div_mask = GENMASK(17, 16),
 };
 
-static const struct {
+static struct {
 	char *n;
-	char *p;
+	struct clk_hw *parent_hw;
 	unsigned long flags;
 	u8 id;
 } sama5d3_systemck[] = {
@@ -47,14 +47,14 @@ static const struct {
 	 * ddrck feeds DDR controller and is enabled by bootloader thus we need
 	 * to keep it enabled in case there is no Linux consumer for it.
 	 */
-	{ .n = "ddrck", .p = "masterck_div", .id = 2, .flags = CLK_IS_CRITICAL },
-	{ .n = "lcdck", .p = "masterck_div", .id = 3 },
-	{ .n = "smdck", .p = "smdclk",       .id = 4 },
-	{ .n = "uhpck", .p = "usbck",        .id = 6 },
-	{ .n = "udpck", .p = "usbck",        .id = 7 },
-	{ .n = "pck0",  .p = "prog0",        .id = 8 },
-	{ .n = "pck1",  .p = "prog1",        .id = 9 },
-	{ .n = "pck2",  .p = "prog2",        .id = 10 },
+	{ .n = "ddrck", .id = 2, .flags = CLK_IS_CRITICAL },
+	{ .n = "lcdck", .id = 3 },
+	{ .n = "smdck", .id = 4 },
+	{ .n = "uhpck", .id = 6 },
+	{ .n = "udpck", .id = 7 },
+	{ .n = "pck0",  .id = 8 },
+	{ .n = "pck1",  .id = 9 },
+	{ .n = "pck2",  .id = 10 },
 };
 
 static const struct {
@@ -114,11 +114,12 @@ static const struct {
 
 static void __init sama5d3_pmc_setup(struct device_node *np)
 {
+	struct clk_hw *main_rc_hw, *main_osc_hw, *mainck_hw;
 	const char *slck_name, *mainxtal_name;
+	struct clk_hw *smdck_hw, *usbck_hw, *hw;
+	struct clk_parent_data parent_data[5];
 	struct pmc_data *sama5d3_pmc;
-	const char *parent_names[5];
 	struct regmap *regmap;
-	struct clk_hw *hw;
 	int i;
 	bool bypass;
 
@@ -143,54 +144,55 @@ static void __init sama5d3_pmc_setup(struct device_node *np)
 	if (!sama5d3_pmc)
 		return;
 
-	hw = at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 12000000,
-					   50000000);
-	if (IS_ERR(hw))
+	main_rc_hw = at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 12000000,
+						   50000000);
+	if (IS_ERR(main_rc_hw))
 		goto err_free;
 
 	bypass = of_property_read_bool(np, "atmel,osc-bypass");
 
-	hw = at91_clk_register_main_osc(regmap, "main_osc", mainxtal_name, NULL,
-					bypass);
-	if (IS_ERR(hw))
+	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
+						 &AT91_CLK_PD_NAME(mainxtal_name),
+						 bypass);
+	if (IS_ERR(main_osc_hw))
 		goto err_free;
 
-	parent_names[0] = "main_rc_osc";
-	parent_names[1] = "main_osc";
-	hw = at91_clk_register_sam9x5_main(regmap, "mainck", parent_names, NULL, 2);
-	if (IS_ERR(hw))
+	parent_data[0] = AT91_CLK_PD_HW(main_rc_hw);
+	parent_data[1] = AT91_CLK_PD_HW(main_osc_hw);
+	mainck_hw = at91_clk_register_sam9x5_main(regmap, "mainck", NULL, parent_data, 2);
+	if (IS_ERR(mainck_hw))
 		goto err_free;
 
-	hw = at91_clk_register_pll(regmap, "pllack", "mainck", NULL, 0,
+	hw = at91_clk_register_pll(regmap, "pllack", NULL, &AT91_CLK_PD_HW(mainck_hw), 0,
 				   &sama5d3_pll_layout, &plla_characteristics);
 	if (IS_ERR(hw))
 		goto err_free;
 
-	hw = at91_clk_register_plldiv(regmap, "plladivck", "pllack", NULL);
+	hw = at91_clk_register_plldiv(regmap, "plladivck", NULL, &AT91_CLK_PD_HW(hw));
 	if (IS_ERR(hw))
 		goto err_free;
 
 	sama5d3_pmc->chws[PMC_PLLACK] = hw;
 
-	hw = at91_clk_register_utmi(regmap, NULL, "utmick", "mainck", NULL);
+	hw = at91_clk_register_utmi(regmap, NULL, "utmick", NULL, &AT91_CLK_PD_HW(mainck_hw));
 	if (IS_ERR(hw))
 		goto err_free;
 
 	sama5d3_pmc->chws[PMC_UTMI] = hw;
 
-	parent_names[0] = slck_name;
-	parent_names[1] = "mainck";
-	parent_names[2] = "plladivck";
-	parent_names[3] = "utmick";
+	parent_data[0] = AT91_CLK_PD_NAME(slck_name);
+	parent_data[1] = AT91_CLK_PD_HW(mainck_hw);
+	parent_data[2] = AT91_CLK_PD_HW(sama5d3_pmc->chws[PMC_PLLACK]);
+	parent_data[3] = AT91_CLK_PD_HW(sama5d3_pmc->chws[PMC_UTMI]);
 	hw = at91_clk_register_master_pres(regmap, "masterck_pres", 4,
-					   parent_names, NULL,
+					   NULL, parent_data,
 					   &at91sam9x5_master_layout,
 					   &mck_characteristics, &mck_lock);
 	if (IS_ERR(hw))
 		goto err_free;
 
 	hw = at91_clk_register_master_div(regmap, "masterck_div",
-					  "masterck_pres", NULL,
+					  NULL, &AT91_CLK_PD_HW(hw),
 					  &at91sam9x5_master_layout,
 					  &mck_characteristics, &mck_lock,
 					  CLK_SET_RATE_GATE, 0);
@@ -199,28 +201,28 @@ static void __init sama5d3_pmc_setup(struct device_node *np)
 
 	sama5d3_pmc->chws[PMC_MCK] = hw;
 
-	parent_names[0] = "plladivck";
-	parent_names[1] = "utmick";
-	hw = at91sam9x5_clk_register_usb(regmap, "usbck", parent_names, NULL, 2);
-	if (IS_ERR(hw))
+	parent_data[0] = AT91_CLK_PD_HW(sama5d3_pmc->chws[PMC_PLLACK]);
+	parent_data[1] = AT91_CLK_PD_HW(sama5d3_pmc->chws[PMC_UTMI]);
+	usbck_hw = at91sam9x5_clk_register_usb(regmap, "usbck", NULL, parent_data, 2);
+	if (IS_ERR(usbck_hw))
 		goto err_free;
 
-	hw = at91sam9x5_clk_register_smd(regmap, "smdclk", parent_names, NULL, 2);
-	if (IS_ERR(hw))
+	smdck_hw = at91sam9x5_clk_register_smd(regmap, "smdclk", NULL, parent_data, 2);
+	if (IS_ERR(smdck_hw))
 		goto err_free;
 
-	parent_names[0] = slck_name;
-	parent_names[1] = "mainck";
-	parent_names[2] = "plladivck";
-	parent_names[3] = "utmick";
-	parent_names[4] = "masterck_div";
+	parent_data[0] = AT91_CLK_PD_NAME(slck_name);
+	parent_data[1] = AT91_CLK_PD_HW(mainck_hw);
+	parent_data[2] = AT91_CLK_PD_HW(sama5d3_pmc->chws[PMC_PLLACK]);
+	parent_data[3] = AT91_CLK_PD_HW(sama5d3_pmc->chws[PMC_UTMI]);
+	parent_data[4] = AT91_CLK_PD_HW(sama5d3_pmc->chws[PMC_MCK]);
 	for (i = 0; i < 3; i++) {
 		char name[6];
 
 		snprintf(name, sizeof(name), "prog%d", i);
 
 		hw = at91_clk_register_programmable(regmap, name,
-						    parent_names, NULL, 5, i,
+						    NULL, parent_data, 5, i,
 						    &at91sam9x5_programmable_layout,
 						    NULL);
 		if (IS_ERR(hw))
@@ -229,9 +231,18 @@ static void __init sama5d3_pmc_setup(struct device_node *np)
 		sama5d3_pmc->pchws[i] = hw;
 	}
 
+	/* Set systemck parent hws. */
+	sama5d3_systemck[0].parent_hw = sama5d3_pmc->chws[PMC_MCK];
+	sama5d3_systemck[1].parent_hw = sama5d3_pmc->chws[PMC_MCK];
+	sama5d3_systemck[2].parent_hw = smdck_hw;
+	sama5d3_systemck[3].parent_hw = usbck_hw;
+	sama5d3_systemck[4].parent_hw = usbck_hw;
+	sama5d3_systemck[5].parent_hw = sama5d3_pmc->pchws[0];
+	sama5d3_systemck[6].parent_hw = sama5d3_pmc->pchws[1];
+	sama5d3_systemck[7].parent_hw = sama5d3_pmc->pchws[2];
 	for (i = 0; i < ARRAY_SIZE(sama5d3_systemck); i++) {
-		hw = at91_clk_register_system(regmap, sama5d3_systemck[i].n,
-					      sama5d3_systemck[i].p, NULL,
+		hw = at91_clk_register_system(regmap, sama5d3_systemck[i].n, NULL,
+					      &AT91_CLK_PD_HW(sama5d3_systemck[i].parent_hw),
 					      sama5d3_systemck[i].id,
 					      sama5d3_systemck[i].flags);
 		if (IS_ERR(hw))
@@ -244,7 +255,8 @@ static void __init sama5d3_pmc_setup(struct device_node *np)
 		hw = at91_clk_register_sam9x5_peripheral(regmap, &pmc_pcr_lock,
 							 &sama5d3_pcr_layout,
 							 sama5d3_periphck[i].n,
-							 "masterck_div", NULL,
+							 NULL,
+							 &AT91_CLK_PD_HW(sama5d3_pmc->chws[PMC_MCK]),
 							 sama5d3_periphck[i].id,
 							 &sama5d3_periphck[i].r,
 							 INT_MIN,
-- 
2.43.0

