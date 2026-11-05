Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.92.40.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876855;
	b=iXyz/VfZ/pFdOyQ7sm09hWHk2b/gVQ0m64bWeiyU927n9NnuIBVWXUzSG49FxtJj2f57
	 Rp4d2FJLpU1B457IZ5DaIbSHoS5UshOND72d9Xq7CHF3uNKifVq2bEWcTs4JQ+/YjsCXW
	 ztpkoUl5CzpkXoJ8YWZwh1x7DyQ3VsFsPZn93tNic9uEpRzCrhYgJhSjkYBhFvC8DXhck
	 FJcpQHrEqmi+J8ykvGs7oxomyM2YACjFcZQGoRDxebkr5DLr3jw9+imRQ30slzqP9Afzx
	 5i8Fi5l/BJDXcKGH5spplSyuigbsz9Rkfe2L1sEU6kzoNA2QBjEnnuFwj/qjyj+2Czg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876855;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=mRRUdpq9Hnlldl1ks40nRkcpGt+ZeBk7f2xMo3n/DNU=;
	b=c1HzNVPKOeE4QDvhZmVV1DQ70k6sCtcoLus5/YlvbR42SzxevdHsl2erY1trxE2SGr1f
	 380rd+JNFvikHl9MJDboiV29eUETbO8E5XlsaTrrfGvvK5qQ3f7bm5Yw67LNzB0g0EFv6
	 6L0mzJWXJHY7Lp0wouAeT1PTkixKxXqgVGmN4V4ABMWPzupazIQPTqTtQ4tHU4/gr+G4t
	 AibSYpX70pX9JGN15h5CdAurOx28jWdHAf31wA03+wEEC3MZfWbkF6bDnS+qE8E/+CPYX
	 b0sQXrnkOqk9A3Iqkic/IqGYZNydQQDnyTn7cQ06NiMQK4+M91GzczKmgpll+P6LFlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=thorsis.com;
	spf=pass smtp.mailfrom=thorsis.com;
	dkim=pass header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=EnrhfrTJ;
	arc=none smtp.remote-ip=217.92.40.78
Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889B3606A333;
	Thu,  5 Nov 2026 11:07:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 889B3606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=EnrhfrTJ
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A0787149663D;
	Thu, 05 Nov 2026 12:08:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1793876887; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=mRRUdpq9Hnlldl1ks40nRkcpGt+ZeBk7f2xMo3n/DNU=;
	b=EnrhfrTJE/ucK1j+cc9FvoJvPQX15LbYagX3SfCvyhsCALuXCoL6OZWM5aIi8Oafm7eltZ
	N66lOPHB69x0pUet9SjkWTKRCPxIwbNViX8jEsD60CcdAsrCvgXAkgfwBdUW52tyY+Bu85
	u9kZbpAFPRfm9z+hktotfjoIZtTYDc6ifpEYaqh4VXZanteBoufta+ycaItgPlpW/4wpgv
	aikDaStfHCfnqwGpFxvVAk0woGtYVPBzRv/31/4Xir8S30Bl+9g0Ntx8bjFFdxrMDuwAaW
	IMmeGqvWy2SLwnA+RoUzLSn2aPKdcxlQfxkmfX2wTOTlfb37F/ap0OGzDRop8Q==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Mihai Sain <mihai.sain@microchip.com>,
	Manikandan Muralidharan <manikandan.m@microchip.com>,
	Durai Manickam KR <durai.manickamkr@microchip.com>
Subject: [PATCH v4 04/16] clk: at91: Use new per SoC PMC clock index definitions
Date: Thu,  5 Nov 2026 12:06:40 +0100
Message-ID: <20261105110715.2486432-5-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105110715.2486432-1-ada@thorsis.com>
References: <20261105110715.2486432-1-ada@thorsis.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Adding missing clocks for only some (more recent) SoCs got more and more
complex and confusing with the old common definitions, while there was
no actual need to have them common.

A splitup of the definitions in the bindings was prosoded and done per
SoC, before adding new array members for missing clocks.

Switch from the old common indexes to the new per SoC indexes.
No functional change.  Old defines can be removed later.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v4:
    - PMC_UTMI was renamed where appropriate according to datasheets
    
    v3:
    - extend to all SoC specific at91 clk drivers
    
    v2:
    - new patch, not present in v1

 drivers/clk/at91/at91rm9200.c  | 12 +++++------
 drivers/clk/at91/at91sam9260.c | 14 ++++++-------
 drivers/clk/at91/at91sam9g45.c | 12 +++++------
 drivers/clk/at91/at91sam9n12.c | 12 +++++------
 drivers/clk/at91/at91sam9rl.c  | 12 +++++------
 drivers/clk/at91/at91sam9x5.c  | 12 +++++------
 drivers/clk/at91/sam9x60.c     | 14 ++++++-------
 drivers/clk/at91/sam9x7.c      | 22 ++++++++++----------
 drivers/clk/at91/sama5d2.c     | 22 ++++++++++----------
 drivers/clk/at91/sama5d3.c     | 10 ++++-----
 drivers/clk/at91/sama5d4.c     | 12 +++++------
 drivers/clk/at91/sama7d65.c    | 38 +++++++++++++++++-----------------
 drivers/clk/at91/sama7g5.c     | 28 ++++++++++++-------------
 13 files changed, 110 insertions(+), 110 deletions(-)

diff --git a/drivers/clk/at91/at91rm9200.c b/drivers/clk/at91/at91rm9200.c
index 3f19e737ae4d2..6f5c758ab3ec6 100644
--- a/drivers/clk/at91/at91rm9200.c
+++ b/drivers/clk/at91/at91rm9200.c
@@ -3,7 +3,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/slab.h>
 
-#include <dt-bindings/clock/at91.h>
+#include <dt-bindings/clock/atmel,at91rm9200-pmc.h>
 
 #include "pmc.h"
 
@@ -100,7 +100,7 @@ static void __init at91rm9200_pmc_setup(struct device_node *np)
 	if (IS_ERR(regmap))
 		return;
 
-	at91rm9200_pmc = pmc_data_allocate(PMC_PLLBCK + 1,
+	at91rm9200_pmc = pmc_data_allocate(AT91RM9200_PMC_PLLBCK + 1,
 					    nck(at91rm9200_systemck),
 					    nck(at91rm9200_periphck), 0, 4);
 	if (!at91rm9200_pmc)
@@ -117,7 +117,7 @@ static void __init at91rm9200_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	at91rm9200_pmc->chws[PMC_MAIN] = hw;
+	at91rm9200_pmc->chws[AT91RM9200_PMC_MAIN] = hw;
 
 	hw = at91_clk_register_pll(regmap, "pllack", "mainck", 0,
 				   &at91rm9200_pll_layout,
@@ -125,7 +125,7 @@ static void __init at91rm9200_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	at91rm9200_pmc->chws[PMC_PLLACK] = hw;
+	at91rm9200_pmc->chws[AT91RM9200_PMC_PLLACK] = hw;
 
 	hw = at91_clk_register_pll(regmap, "pllbck", "mainck", 1,
 				   &at91rm9200_pll_layout,
@@ -133,7 +133,7 @@ static void __init at91rm9200_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	at91rm9200_pmc->chws[PMC_PLLBCK] = hw;
+	at91rm9200_pmc->chws[AT91RM9200_PMC_PLLBCK] = hw;
 
 	parent_names[0] = slowxtal_name;
 	parent_names[1] = "mainck";
@@ -155,7 +155,7 @@ static void __init at91rm9200_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	at91rm9200_pmc->chws[PMC_MCK] = hw;
+	at91rm9200_pmc->chws[AT91RM9200_PMC_MCK] = hw;
 
 	hw = at91rm9200_clk_register_usb(regmap, "usbck", "pllbck", usb_div);
 	if (IS_ERR(hw))
diff --git a/drivers/clk/at91/at91sam9260.c b/drivers/clk/at91/at91sam9260.c
index 0799a13060ea4..492114c13e40d 100644
--- a/drivers/clk/at91/at91sam9260.c
+++ b/drivers/clk/at91/at91sam9260.c
@@ -3,7 +3,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/slab.h>
 
-#include <dt-bindings/clock/at91.h>
+#include <dt-bindings/clock/atmel,at91sam9260-pmc.h>
 
 #include "pmc.h"
 
@@ -354,7 +354,7 @@ static void __init at91sam926x_pmc_setup(struct device_node *np,
 	if (IS_ERR(regmap))
 		return;
 
-	at91sam9260_pmc = pmc_data_allocate(PMC_PLLBCK + 1,
+	at91sam9260_pmc = pmc_data_allocate(AT91SAM9260_PMC_PLLBCK + 1,
 					    ndck(data->sck, data->num_sck),
 					    ndck(data->pck, data->num_pck),
 					    0, data->num_progck);
@@ -372,7 +372,7 @@ static void __init at91sam926x_pmc_setup(struct device_node *np,
 	if (IS_ERR(hw))
 		goto err_free;
 
-	at91sam9260_pmc->chws[PMC_MAIN] = hw;
+	at91sam9260_pmc->chws[AT91SAM9260_PMC_MAIN] = hw;
 
 	if (data->has_slck) {
 		hw = clk_hw_register_fixed_rate_with_accuracy(NULL,
@@ -389,7 +389,7 @@ static void __init at91sam926x_pmc_setup(struct device_node *np,
 		if (IS_ERR(hw))
 			goto err_free;
 
-		at91sam9260_pmc->chws[PMC_SLOW] = hw;
+		at91sam9260_pmc->chws[AT91SAM9260_PMC_SLOW] = hw;
 		slck_name = "slck";
 	} else {
 		slck_name = slowxtal_name;
@@ -401,7 +401,7 @@ static void __init at91sam926x_pmc_setup(struct device_node *np,
 	if (IS_ERR(hw))
 		goto err_free;
 
-	at91sam9260_pmc->chws[PMC_PLLACK] = hw;
+	at91sam9260_pmc->chws[AT91SAM9260_PMC_PLLACK] = hw;
 
 	hw = at91_clk_register_pll(regmap, "pllbck", "mainck", 1,
 				   data->pllb_layout,
@@ -409,7 +409,7 @@ static void __init at91sam926x_pmc_setup(struct device_node *np,
 	if (IS_ERR(hw))
 		goto err_free;
 
-	at91sam9260_pmc->chws[PMC_PLLBCK] = hw;
+	at91sam9260_pmc->chws[AT91SAM9260_PMC_PLLBCK] = hw;
 
 	parent_names[0] = slck_name;
 	parent_names[1] = "mainck";
@@ -432,7 +432,7 @@ static void __init at91sam926x_pmc_setup(struct device_node *np,
 	if (IS_ERR(hw))
 		goto err_free;
 
-	at91sam9260_pmc->chws[PMC_MCK] = hw;
+	at91sam9260_pmc->chws[AT91SAM9260_PMC_MCK] = hw;
 
 	hw = at91rm9200_clk_register_usb(regmap, "usbck", "pllbck", usb_div);
 	if (IS_ERR(hw))
diff --git a/drivers/clk/at91/at91sam9g45.c b/drivers/clk/at91/at91sam9g45.c
index f45a7b80f7d8b..d665cbf1a37ac 100644
--- a/drivers/clk/at91/at91sam9g45.c
+++ b/drivers/clk/at91/at91sam9g45.c
@@ -3,7 +3,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/slab.h>
 
-#include <dt-bindings/clock/at91.h>
+#include <dt-bindings/clock/atmel,at91sam9g45-pmc.h>
 
 #include "pmc.h"
 
@@ -115,7 +115,7 @@ static void __init at91sam9g45_pmc_setup(struct device_node *np)
 	if (IS_ERR(regmap))
 		return;
 
-	at91sam9g45_pmc = pmc_data_allocate(PMC_PLLACK + 1,
+	at91sam9g45_pmc = pmc_data_allocate(AT91SAM9G45_PMC_PLLACK + 1,
 					    nck(at91sam9g45_systemck),
 					    nck(at91sam9g45_periphck), 0, 2);
 	if (!at91sam9g45_pmc)
@@ -132,7 +132,7 @@ static void __init at91sam9g45_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	at91sam9g45_pmc->chws[PMC_MAIN] = hw;
+	at91sam9g45_pmc->chws[AT91SAM9G45_PMC_MAIN] = hw;
 
 	hw = at91_clk_register_pll(regmap, "pllack", "mainck", 0,
 				   &at91rm9200_pll_layout, &plla_characteristics);
@@ -143,13 +143,13 @@ static void __init at91sam9g45_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	at91sam9g45_pmc->chws[PMC_PLLACK] = hw;
+	at91sam9g45_pmc->chws[AT91SAM9G45_PMC_PLLACK] = hw;
 
 	hw = at91_clk_register_utmi(regmap, NULL, "utmick", "mainck", NULL);
 	if (IS_ERR(hw))
 		goto err_free;
 
-	at91sam9g45_pmc->chws[PMC_UTMI] = hw;
+	at91sam9g45_pmc->chws[AT91SAM9G45_PMC_UPLLCK] = hw;
 
 	parent_names[0] = slck_name;
 	parent_names[1] = "mainck";
@@ -172,7 +172,7 @@ static void __init at91sam9g45_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	at91sam9g45_pmc->chws[PMC_MCK] = hw;
+	at91sam9g45_pmc->chws[AT91SAM9G45_PMC_MCK] = hw;
 
 	parent_names[0] = "plladivck";
 	parent_names[1] = "utmick";
diff --git a/drivers/clk/at91/at91sam9n12.c b/drivers/clk/at91/at91sam9n12.c
index 751786184ae2b..f6210fac26f39 100644
--- a/drivers/clk/at91/at91sam9n12.c
+++ b/drivers/clk/at91/at91sam9n12.c
@@ -3,7 +3,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/slab.h>
 
-#include <dt-bindings/clock/at91.h>
+#include <dt-bindings/clock/atmel,at91sam9n12-pmc.h>
 
 #include "pmc.h"
 
@@ -135,7 +135,7 @@ static void __init at91sam9n12_pmc_setup(struct device_node *np)
 	if (IS_ERR(regmap))
 		return;
 
-	at91sam9n12_pmc = pmc_data_allocate(PMC_PLLBCK + 1,
+	at91sam9n12_pmc = pmc_data_allocate(AT91SAM9N12_PMC_PLLBCK + 1,
 					   nck(at91sam9n12_systemck), 31, 0, 2);
 	if (!at91sam9n12_pmc)
 		return;
@@ -158,7 +158,7 @@ static void __init at91sam9n12_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	at91sam9n12_pmc->chws[PMC_MAIN] = hw;
+	at91sam9n12_pmc->chws[AT91SAM9N12_PMC_MAIN] = hw;
 
 	hw = at91_clk_register_pll(regmap, "pllack", "mainck", 0,
 				   &at91rm9200_pll_layout, &plla_characteristics);
@@ -169,14 +169,14 @@ static void __init at91sam9n12_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	at91sam9n12_pmc->chws[PMC_PLLACK] = hw;
+	at91sam9n12_pmc->chws[AT91SAM9N12_PMC_PLLACK] = hw;
 
 	hw = at91_clk_register_pll(regmap, "pllbck", "mainck", 1,
 				   &at91rm9200_pll_layout, &pllb_characteristics);
 	if (IS_ERR(hw))
 		goto err_free;
 
-	at91sam9n12_pmc->chws[PMC_PLLBCK] = hw;
+	at91sam9n12_pmc->chws[AT91SAM9N12_PMC_PLLBCK] = hw;
 
 	parent_names[0] = slck_name;
 	parent_names[1] = "mainck";
@@ -199,7 +199,7 @@ static void __init at91sam9n12_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	at91sam9n12_pmc->chws[PMC_MCK] = hw;
+	at91sam9n12_pmc->chws[AT91SAM9N12_PMC_MCK] = hw;
 
 	hw = at91sam9n12_clk_register_usb(regmap, "usbck", "pllbck");
 	if (IS_ERR(hw))
diff --git a/drivers/clk/at91/at91sam9rl.c b/drivers/clk/at91/at91sam9rl.c
index 969f809e7d65a..4664e4afc69cf 100644
--- a/drivers/clk/at91/at91sam9rl.c
+++ b/drivers/clk/at91/at91sam9rl.c
@@ -3,7 +3,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/slab.h>
 
-#include <dt-bindings/clock/at91.h>
+#include <dt-bindings/clock/atmel,at91sam9rl-pmc.h>
 
 #include "pmc.h"
 
@@ -89,7 +89,7 @@ static void __init at91sam9rl_pmc_setup(struct device_node *np)
 	if (IS_ERR(regmap))
 		return;
 
-	at91sam9rl_pmc = pmc_data_allocate(PMC_PLLACK + 1,
+	at91sam9rl_pmc = pmc_data_allocate(AT91SAM9RL_PMC_PLLACK + 1,
 					   nck(at91sam9rl_systemck),
 					   nck(at91sam9rl_periphck), 0, 2);
 	if (!at91sam9rl_pmc)
@@ -99,7 +99,7 @@ static void __init at91sam9rl_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	at91sam9rl_pmc->chws[PMC_MAIN] = hw;
+	at91sam9rl_pmc->chws[AT91SAM9RL_PMC_MAIN] = hw;
 
 	hw = at91_clk_register_pll(regmap, "pllack", "mainck", 0,
 				   &at91rm9200_pll_layout,
@@ -107,13 +107,13 @@ static void __init at91sam9rl_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	at91sam9rl_pmc->chws[PMC_PLLACK] = hw;
+	at91sam9rl_pmc->chws[AT91SAM9RL_PMC_PLLACK] = hw;
 
 	hw = at91_clk_register_utmi(regmap, NULL, "utmick", "mainck", NULL);
 	if (IS_ERR(hw))
 		goto err_free;
 
-	at91sam9rl_pmc->chws[PMC_UTMI] = hw;
+	at91sam9rl_pmc->chws[AT91SAM9RL_PMC_UTMI] = hw;
 
 	parent_names[0] = slck_name;
 	parent_names[1] = "mainck";
@@ -135,7 +135,7 @@ static void __init at91sam9rl_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	at91sam9rl_pmc->chws[PMC_MCK] = hw;
+	at91sam9rl_pmc->chws[AT91SAM9RL_PMC_MCK] = hw;
 
 	parent_names[0] = slck_name;
 	parent_names[1] = "mainck";
diff --git a/drivers/clk/at91/at91sam9x5.c b/drivers/clk/at91/at91sam9x5.c
index 3b801d12fac0d..2dec7bf9c0d4f 100644
--- a/drivers/clk/at91/at91sam9x5.c
+++ b/drivers/clk/at91/at91sam9x5.c
@@ -3,7 +3,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/slab.h>
 
-#include <dt-bindings/clock/at91.h>
+#include <dt-bindings/clock/atmel,at91sam9x5-pmc.h>
 
 #include "pmc.h"
 
@@ -157,7 +157,7 @@ static void __init at91sam9x5_pmc_setup(struct device_node *np,
 	if (IS_ERR(regmap))
 		return;
 
-	at91sam9x5_pmc = pmc_data_allocate(PMC_PLLACK + 1,
+	at91sam9x5_pmc = pmc_data_allocate(AT91SAM9X5_PMC_PLLACK + 1,
 					   nck(at91sam9x5_systemck), 31, 0, 2);
 	if (!at91sam9x5_pmc)
 		return;
@@ -180,7 +180,7 @@ static void __init at91sam9x5_pmc_setup(struct device_node *np,
 	if (IS_ERR(hw))
 		goto err_free;
 
-	at91sam9x5_pmc->chws[PMC_MAIN] = hw;
+	at91sam9x5_pmc->chws[AT91SAM9X5_PMC_MAIN] = hw;
 
 	hw = at91_clk_register_pll(regmap, "pllack", "mainck", 0,
 				   &at91rm9200_pll_layout, &plla_characteristics);
@@ -191,13 +191,13 @@ static void __init at91sam9x5_pmc_setup(struct device_node *np,
 	if (IS_ERR(hw))
 		goto err_free;
 
-	at91sam9x5_pmc->chws[PMC_PLLACK] = hw;
+	at91sam9x5_pmc->chws[AT91SAM9X5_PMC_PLLACK] = hw;
 
 	hw = at91_clk_register_utmi(regmap, NULL, "utmick", "mainck", NULL);
 	if (IS_ERR(hw))
 		goto err_free;
 
-	at91sam9x5_pmc->chws[PMC_UTMI] = hw;
+	at91sam9x5_pmc->chws[AT91SAM9X5_PMC_UPLLCK] = hw;
 
 	parent_names[0] = slck_name;
 	parent_names[1] = "mainck";
@@ -218,7 +218,7 @@ static void __init at91sam9x5_pmc_setup(struct device_node *np,
 	if (IS_ERR(hw))
 		goto err_free;
 
-	at91sam9x5_pmc->chws[PMC_MCK] = hw;
+	at91sam9x5_pmc->chws[AT91SAM9X5_PMC_MCK] = hw;
 
 	parent_names[0] = "plladivck";
 	parent_names[1] = "utmick";
diff --git a/drivers/clk/at91/sam9x60.c b/drivers/clk/at91/sam9x60.c
index 18baf4a256f47..eba6e8c16044d 100644
--- a/drivers/clk/at91/sam9x60.c
+++ b/drivers/clk/at91/sam9x60.c
@@ -3,7 +3,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/slab.h>
 
-#include <dt-bindings/clock/at91.h>
+#include <dt-bindings/clock/microchip,sam9x60-pmc.h>
 
 #include "pmc.h"
 
@@ -216,7 +216,7 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 	if (IS_ERR(regmap))
 		return;
 
-	sam9x60_pmc = pmc_data_allocate(PMC_PLLACK + 1,
+	sam9x60_pmc = pmc_data_allocate(SAM9X60_PMC_PLLACK + 1,
 					nck(sam9x60_systemck),
 					nck(sam9x60_periphck),
 					nck(sam9x60_gck), 8);
@@ -239,10 +239,10 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	sam9x60_pmc->chws[PMC_MAIN] = hw;
+	sam9x60_pmc->chws[SAM9X60_PMC_MAIN] = hw;
 
 	hw = sam9x60_clk_register_frac_pll(regmap, &pmc_pll_lock, "pllack_fracck",
-					   "mainck", sam9x60_pmc->chws[PMC_MAIN],
+					   "mainck", sam9x60_pmc->chws[SAM9X60_PMC_MAIN],
 					   0, &plla_characteristics,
 					   &pll_frac_layout,
 					   /*
@@ -265,7 +265,7 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	sam9x60_pmc->chws[PMC_PLLACK] = hw;
+	sam9x60_pmc->chws[SAM9X60_PMC_PLLACK] = hw;
 
 	hw = sam9x60_clk_register_frac_pll(regmap, &pmc_pll_lock, "upllck_fracck",
 					   "main_osc", main_osc_hw, 1,
@@ -283,7 +283,7 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	sam9x60_pmc->chws[PMC_UTMI] = hw;
+	sam9x60_pmc->chws[SAM9X60_PMC_UPLLCK] = hw;
 
 	parent_names[0] = md_slck_name;
 	parent_names[1] = "mainck";
@@ -301,7 +301,7 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	sam9x60_pmc->chws[PMC_MCK] = hw;
+	sam9x60_pmc->chws[SAM9X60_PMC_MCK] = hw;
 
 	parent_names[0] = "pllack_divck";
 	parent_names[1] = "upllck_divck";
diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index 8b52da194849f..1fc4b01a04abf 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -12,7 +12,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/slab.h>
 
-#include <dt-bindings/clock/at91.h>
+#include <dt-bindings/clock/microchip,sam9x7-pmc.h>
 
 #include "pmc.h"
 
@@ -225,7 +225,7 @@ static const struct {
 			.t = PLL_TYPE_DIV,
 			/* This feeds CPU. It should not be disabled */
 			.f = CLK_IS_CRITICAL | CLK_SET_RATE_GATE,
-			.eid = PMC_PLLACK,
+			.eid = SAM9X7_PMC_PLLACK,
 			.c = &plla_characteristics,
 		},
 	},
@@ -247,7 +247,7 @@ static const struct {
 			.t = PLL_TYPE_DIV,
 			.f = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
 			     CLK_SET_RATE_PARENT,
-			.eid = PMC_UTMI,
+			.eid = SAM9X7_PMC_UPLLCK,
 			.c = &upll_characteristics,
 		},
 	},
@@ -269,7 +269,7 @@ static const struct {
 			.f = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
 			     CLK_SET_RATE_PARENT,
 			.c = &audiopll_characteristics,
-			.eid = PMC_AUDIOPMCPLL,
+			.eid = SAM9X7_PMC_AUDIOPMCPLL,
 			.t = PLL_TYPE_DIV,
 		},
 
@@ -280,7 +280,7 @@ static const struct {
 			.f = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
 			     CLK_SET_RATE_PARENT,
 			.c = &audiopll_characteristics,
-			.eid = PMC_AUDIOIOPLL,
+			.eid = SAM9X7_PMC_AUDIOIOPLL,
 			.t = PLL_TYPE_DIV,
 		},
 	},
@@ -302,7 +302,7 @@ static const struct {
 			.f = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
 			     CLK_SET_RATE_PARENT,
 			.c = &lvdspll_characteristics,
-			.eid = PMC_LVDSPLL,
+			.eid = SAM9X7_PMC_LVDSPLL,
 			.t = PLL_TYPE_DIV,
 		},
 	},
@@ -318,7 +318,7 @@ static const struct {
 			 */
 			.f = CLK_IS_CRITICAL | CLK_SET_RATE_GATE,
 			.c = &plladiv2_characteristics,
-			.eid = PMC_PLLADIV2,
+			.eid = SAM9X7_PMC_PLLADIV2,
 			.t = PLL_TYPE_DIV,
 		},
 	},
@@ -746,7 +746,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 	if (IS_ERR(regmap))
 		return;
 
-	sam9x7_pmc = pmc_data_allocate(PMC_LVDSPLL + 1,
+	sam9x7_pmc = pmc_data_allocate(SAM9X7_PMC_LVDSPLL + 1,
 				       nck(sam9x7_systemck),
 				       nck(sam9x7_periphck),
 				       nck(sam9x7_gck), 8);
@@ -775,7 +775,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	sam9x7_pmc->chws[PMC_MAIN] = hw;
+	sam9x7_pmc->chws[SAM9X7_PMC_MAIN] = hw;
 
 	for (i = 0; i < PLL_ID_MAX; i++) {
 		for (j = 0; j < 3; j++) {
@@ -787,7 +787,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 			switch (sam9x7_plls[i][j].t) {
 			case PLL_TYPE_FRAC:
 				if (!strcmp(sam9x7_plls[i][j].p, "mainck"))
-					parent_hw = sam9x7_pmc->chws[PMC_MAIN];
+					parent_hw = sam9x7_pmc->chws[SAM9X7_PMC_MAIN];
 				else if (!strcmp(sam9x7_plls[i][j].p, "main_osc"))
 					parent_hw = main_osc_hw;
 				else
@@ -843,7 +843,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	sam9x7_pmc->chws[PMC_MCK] = hw;
+	sam9x7_pmc->chws[SAM9X7_PMC_MCK] = hw;
 
 	parent_names[0] = "plla_divpmcck";
 	parent_names[1] = "upll_divpmcck";
diff --git a/drivers/clk/at91/sama5d2.c b/drivers/clk/at91/sama5d2.c
index c16594fce90c9..ea8e9a8da4da2 100644
--- a/drivers/clk/at91/sama5d2.c
+++ b/drivers/clk/at91/sama5d2.c
@@ -3,7 +3,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/slab.h>
 
-#include <dt-bindings/clock/at91.h>
+#include <dt-bindings/clock/atmel,sama5d2-pmc.h>
 
 #include "pmc.h"
 
@@ -188,7 +188,7 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
 	if (IS_ERR(regmap))
 		return;
 
-	sama5d2_pmc = pmc_data_allocate(PMC_AUDIOPINCK + 1,
+	sama5d2_pmc = pmc_data_allocate(SAMA5D2_PMC_AUDIOPINCK + 1,
 					nck(sama5d2_systemck),
 					nck(sama5d2_periph32ck),
 					nck(sama5d2_gck), 3);
@@ -213,7 +213,7 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	sama5d2_pmc->chws[PMC_MAIN] = hw;
+	sama5d2_pmc->chws[SAMA5D2_PMC_MAIN] = hw;
 
 	hw = at91_clk_register_pll(regmap, "pllack", "mainck", 0,
 				   &sama5d3_pll_layout, &plla_characteristics);
@@ -224,7 +224,7 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	sama5d2_pmc->chws[PMC_PLLACK] = hw;
+	sama5d2_pmc->chws[SAMA5D2_PMC_PLLACK] = hw;
 
 	hw = at91_clk_register_audio_pll_frac(regmap, "audiopll_fracck",
 					      "mainck");
@@ -236,14 +236,14 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	sama5d2_pmc->chws[PMC_AUDIOPINCK] = hw;
+	sama5d2_pmc->chws[SAMA5D2_PMC_AUDIOPINCK] = hw;
 
 	hw = at91_clk_register_audio_pll_pmc(regmap, "audiopll_pmcck",
 					     "audiopll_fracck");
 	if (IS_ERR(hw))
 		goto err_free;
 
-	sama5d2_pmc->chws[PMC_AUDIOPLLCK] = hw;
+	sama5d2_pmc->chws[SAMA5D2_PMC_AUDIOPLLCK] = hw;
 
 	regmap_sfr = syscon_regmap_lookup_by_compatible("atmel,sama5d2-sfr");
 	if (IS_ERR(regmap_sfr))
@@ -253,7 +253,7 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	sama5d2_pmc->chws[PMC_UTMI] = hw;
+	sama5d2_pmc->chws[SAMA5D2_PMC_UPLLCK] = hw;
 
 	parent_names[0] = slck_name;
 	parent_names[1] = "mainck";
@@ -274,13 +274,13 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	sama5d2_pmc->chws[PMC_MCK] = hw;
+	sama5d2_pmc->chws[SAMA5D2_PMC_MCK] = hw;
 
 	hw = at91_clk_register_h32mx(regmap, "h32mxck", "masterck_div");
 	if (IS_ERR(hw))
 		goto err_free;
 
-	sama5d2_pmc->chws[PMC_MCK2] = hw;
+	sama5d2_pmc->chws[SAMA5D2_PMC_MCK2] = hw;
 
 	parent_names[0] = "plladivck";
 	parent_names[1] = "utmick";
@@ -376,7 +376,7 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
 		if (IS_ERR(hw))
 			goto err_free;
 
-		sama5d2_pmc->chws[PMC_I2S0_MUX] = hw;
+		sama5d2_pmc->chws[SAMA5D2_PMC_I2S0_MUX] = hw;
 
 		parent_names[0] = "i2s1_clk";
 		parent_names[1] = "i2s1_gclk";
@@ -385,7 +385,7 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
 		if (IS_ERR(hw))
 			goto err_free;
 
-		sama5d2_pmc->chws[PMC_I2S1_MUX] = hw;
+		sama5d2_pmc->chws[SAMA5D2_PMC_I2S1_MUX] = hw;
 	}
 
 	of_clk_add_hw_provider(np, of_clk_hw_pmc_get, sama5d2_pmc);
diff --git a/drivers/clk/at91/sama5d3.c b/drivers/clk/at91/sama5d3.c
index 522ce60314464..6d7bb26e08731 100644
--- a/drivers/clk/at91/sama5d3.c
+++ b/drivers/clk/at91/sama5d3.c
@@ -3,7 +3,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/slab.h>
 
-#include <dt-bindings/clock/at91.h>
+#include <dt-bindings/clock/atmel,sama5d3-pmc.h>
 
 #include "pmc.h"
 
@@ -137,7 +137,7 @@ static void __init sama5d3_pmc_setup(struct device_node *np)
 	if (IS_ERR(regmap))
 		return;
 
-	sama5d3_pmc = pmc_data_allocate(PMC_PLLACK + 1,
+	sama5d3_pmc = pmc_data_allocate(SAMA5D3_PMC_PLLACK + 1,
 					nck(sama5d3_systemck),
 					nck(sama5d3_periphck), 0, 3);
 	if (!sama5d3_pmc)
@@ -170,13 +170,13 @@ static void __init sama5d3_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	sama5d3_pmc->chws[PMC_PLLACK] = hw;
+	sama5d3_pmc->chws[SAMA5D3_PMC_PLLACK] = hw;
 
 	hw = at91_clk_register_utmi(regmap, NULL, "utmick", "mainck", NULL);
 	if (IS_ERR(hw))
 		goto err_free;
 
-	sama5d3_pmc->chws[PMC_UTMI] = hw;
+	sama5d3_pmc->chws[SAMA5D3_PMC_UPLLCK] = hw;
 
 	parent_names[0] = slck_name;
 	parent_names[1] = "mainck";
@@ -197,7 +197,7 @@ static void __init sama5d3_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	sama5d3_pmc->chws[PMC_MCK] = hw;
+	sama5d3_pmc->chws[SAMA5D3_PMC_MCK] = hw;
 
 	parent_names[0] = "plladivck";
 	parent_names[1] = "utmick";
diff --git a/drivers/clk/at91/sama5d4.c b/drivers/clk/at91/sama5d4.c
index 160c0bddb6a3b..87e3c30a0c313 100644
--- a/drivers/clk/at91/sama5d4.c
+++ b/drivers/clk/at91/sama5d4.c
@@ -3,7 +3,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/slab.h>
 
-#include <dt-bindings/clock/at91.h>
+#include <dt-bindings/clock/atmel,sama5d4-pmc.h>
 
 #include "pmc.h"
 
@@ -152,7 +152,7 @@ static void __init sama5d4_pmc_setup(struct device_node *np)
 	if (IS_ERR(regmap))
 		return;
 
-	sama5d4_pmc = pmc_data_allocate(PMC_PLLACK + 1,
+	sama5d4_pmc = pmc_data_allocate(SAMA5D4_PMC_PLLACK + 1,
 					nck(sama5d4_systemck),
 					nck(sama5d4_periph32ck), 0, 3);
 	if (!sama5d4_pmc)
@@ -185,13 +185,13 @@ static void __init sama5d4_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	sama5d4_pmc->chws[PMC_PLLACK] = hw;
+	sama5d4_pmc->chws[SAMA5D4_PMC_PLLACK] = hw;
 
 	hw = at91_clk_register_utmi(regmap, NULL, "utmick", "mainck", NULL);
 	if (IS_ERR(hw))
 		goto err_free;
 
-	sama5d4_pmc->chws[PMC_UTMI] = hw;
+	sama5d4_pmc->chws[SAMA5D4_PMC_UPLLCK] = hw;
 
 	parent_names[0] = slck_name;
 	parent_names[1] = "mainck";
@@ -212,13 +212,13 @@ static void __init sama5d4_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	sama5d4_pmc->chws[PMC_MCK] = hw;
+	sama5d4_pmc->chws[SAMA5D4_PMC_MCK] = hw;
 
 	hw = at91_clk_register_h32mx(regmap, "h32mxck", "masterck_div");
 	if (IS_ERR(hw))
 		goto err_free;
 
-	sama5d4_pmc->chws[PMC_MCK2] = hw;
+	sama5d4_pmc->chws[SAMA5D4_PMC_MCK2] = hw;
 
 	parent_names[0] = "plladivck";
 	parent_names[1] = "utmick";
diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
index ba8ff413fa2c6..0b5356467fa52 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -11,7 +11,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/slab.h>
 
-#include <dt-bindings/clock/at91.h>
+#include <dt-bindings/clock/microchip,sama7d65-pmc.h>
 
 #include "pmc.h"
 
@@ -225,7 +225,7 @@ static struct sama7d65_pll {
 			.t = PLL_TYPE_DIV,
 			/* This feeds CPU. It should not be disabled. */
 			.f = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
-			.eid = PMC_CPUPLL,
+			.eid = SAMA7D65_PMC_CPUPLL,
 			/*
 			 * Safe div=15 should be safe even for switching b/w 1GHz and
 			 * 90MHz (frac pll might go up to 1.2GHz).
@@ -260,7 +260,7 @@ static struct sama7d65_pll {
 			 * Therefore it should not be disabled.
 			 */
 			.f = CLK_IS_CRITICAL | CLK_SET_RATE_GATE,
-			.eid = PMC_SYSPLL,
+			.eid = SAMA7D65_PMC_SYSPLL,
 		},
 	},
 
@@ -328,7 +328,7 @@ static struct sama7d65_pll {
 			.t = PLL_TYPE_DIV,
 			.f = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
 			     CLK_SET_RATE_PARENT,
-			.eid = PMC_BAUDPLL,
+			.eid = SAMA7D65_PMC_BAUDPLL,
 		},
 	},
 
@@ -350,7 +350,7 @@ static struct sama7d65_pll {
 			.t = PLL_TYPE_DIV,
 			.f = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
 			     CLK_SET_RATE_PARENT,
-			.eid = PMC_AUDIOPMCPLL,
+			.eid = SAMA7D65_PMC_AUDIOPMCPLL,
 		},
 
 		[PLL_COMPID_DIV1] = {
@@ -361,7 +361,7 @@ static struct sama7d65_pll {
 			.t = PLL_TYPE_DIV,
 			.f = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
 			     CLK_SET_RATE_PARENT,
-			.eid = PMC_AUDIOIOPLL,
+			.eid = SAMA7D65_PMC_AUDIOIOPLL,
 		},
 	},
 
@@ -383,7 +383,7 @@ static struct sama7d65_pll {
 			.t = PLL_TYPE_DIV,
 			.f = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
 			     CLK_SET_RATE_PARENT,
-			.eid = PMC_ETHPLL,
+			.eid = SAMA7D65_PMC_ETHPLL,
 		},
 	},
 
@@ -405,7 +405,7 @@ static struct sama7d65_pll {
 			.t = PLL_TYPE_DIV,
 			.f = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
 			     CLK_SET_RATE_PARENT,
-			.eid = PMC_LVDSPLL,
+			.eid = SAMA7D65_PMC_LVDSPLL,
 		},
 	},
 
@@ -427,7 +427,7 @@ static struct sama7d65_pll {
 			.t = PLL_TYPE_DIV,
 			.f = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
 			     CLK_SET_RATE_PARENT,
-			.eid = PMC_UTMI,
+			.eid = SAMA7D65_PMC_USBPLL,
 		},
 	},
 };
@@ -470,7 +470,7 @@ static struct {
 	  .ep_mux_table = { 5, },
 	  .ep_count = 1,
 	  .ep_chg_id = INT_MIN,
-	  .eid = PMC_MCK1,
+	  .eid = SAMA7D65_PMC_MCK1,
 	  .c = 1, },
 
 	{ .n = "mck2",
@@ -487,7 +487,7 @@ static struct {
 	  .ep_mux_table = { 5, 6, },
 	  .ep_count = 2,
 	  .ep_chg_id = INT_MIN,
-	  .eid = PMC_MCK3,
+	  .eid = SAMA7D65_PMC_MCK3,
 	  .c = 1, },
 
 	{ .n = "mck4",
@@ -504,7 +504,7 @@ static struct {
 	  .ep_mux_table = { 5, },
 	  .ep_count = 1,
 	  .ep_chg_id = INT_MIN,
-	  .eid = PMC_MCK5,
+	  .eid = SAMA7D65_PMC_MCK5,
 	  .c = 1, },
 
 	{ .n = "mck6",
@@ -1154,7 +1154,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	sama7d65_pmc->chws[PMC_MAIN] = hw;
+	sama7d65_pmc->chws[SAMA7D65_PMC_MAIN] = hw;
 
 	for (i = 0; i < PLL_ID_MAX; i++) {
 		for (j = 0; j < PLL_COMPID_MAX; j++) {
@@ -1167,7 +1167,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 			case PLL_TYPE_FRAC:
 				switch (sama7d65_plls[i][j].p) {
 				case SAMA7D65_PLL_PARENT_MAINCK:
-					parent_hw = sama7d65_pmc->chws[PMC_MAIN];
+					parent_hw = sama7d65_pmc->chws[SAMA7D65_PMC_MAIN];
 					break;
 				case SAMA7D65_PLL_PARENT_MAIN_XTAL:
 					parent_hw = main_xtal_hw;
@@ -1216,12 +1216,12 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	sama7d65_pmc->chws[PMC_MCK] = hw;
+	sama7d65_pmc->chws[SAMA7D65_PMC_MCK0] = hw;
 	sama7d65_mckx[PCK_PARENT_HW_MCK0].hw = hw;
 
 	parent_hws[0] = md_slck_hw;
 	parent_hws[1] = td_slck_hw;
-	parent_hws[2] = sama7d65_pmc->chws[PMC_MAIN];
+	parent_hws[2] = sama7d65_pmc->chws[SAMA7D65_PMC_MAIN];
 	for (i = PCK_PARENT_HW_MCK1; i < ARRAY_SIZE(sama7d65_mckx); i++) {
 		u8 num_parents = 3 + sama7d65_mckx[i].ep_count;
 		struct clk_hw *tmp_parent_hws[8];
@@ -1270,7 +1270,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 
 	parent_hws[0] = md_slck_hw;
 	parent_hws[1] = td_slck_hw;
-	parent_hws[2] = sama7d65_pmc->chws[PMC_MAIN];
+	parent_hws[2] = sama7d65_pmc->chws[SAMA7D65_PMC_MAIN];
 	parent_hws[3] = sama7d65_plls[PLL_ID_SYS][PLL_COMPID_DIV0].hw;
 	parent_hws[4] = sama7d65_plls[PLL_ID_DDR][PLL_COMPID_DIV0].hw;
 	parent_hws[5] = sama7d65_plls[PLL_ID_GPU][PLL_COMPID_DIV0].hw;
@@ -1321,8 +1321,8 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
 
 	parent_hws[0] = md_slck_hw;
 	parent_hws[1] = td_slck_hw;
-	parent_hws[2] = sama7d65_pmc->chws[PMC_MAIN];
-	parent_hws[3] = sama7d65_pmc->chws[PMC_MCK1];
+	parent_hws[2] = sama7d65_pmc->chws[SAMA7D65_PMC_MAIN];
+	parent_hws[3] = sama7d65_pmc->chws[SAMA7D65_PMC_MCK1];
 	for (i = 0; i < ARRAY_SIZE(sama7d65_gck); i++) {
 		u8 num_parents = 4 + sama7d65_gck[i].pp_count;
 		struct clk_hw *tmp_parent_hws[8];
diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index 1340c2b006192..99b4c1d9bdcca 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -12,7 +12,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/slab.h>
 
-#include <dt-bindings/clock/at91.h>
+#include <dt-bindings/clock/microchip,sama7g5-pmc.h>
 
 #include "pmc.h"
 
@@ -183,7 +183,7 @@ static struct sama7g5_pll {
 			.t = PLL_TYPE_DIV,
 			/* This feeds CPU. It should not be disabled. */
 			.f = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
-			.eid = PMC_CPUPLL,
+			.eid = SAMA7G5_PMC_CPUPLL,
 			/*
 			 * Safe div=15 should be safe even for switching b/w 1GHz and
 			 * 90MHz (frac pll might go up to 1.2GHz).
@@ -218,7 +218,7 @@ static struct sama7g5_pll {
 			 * Therefore it should not be disabled.
 			 */
 			.f = CLK_IS_CRITICAL | CLK_SET_RATE_GATE,
-			.eid = PMC_SYSPLL,
+			.eid = SAMA7G5_PMC_SYSPLL,
 		},
 	},
 
@@ -306,7 +306,7 @@ static struct sama7g5_pll {
 			.t = PLL_TYPE_DIV,
 			.f = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
 			     CLK_SET_RATE_PARENT,
-			.eid = PMC_AUDIOPMCPLL,
+			.eid = SAMA7G5_PMC_AUDIOPMCPLL,
 		},
 
 		[PLL_COMPID_DIV1] = {
@@ -317,7 +317,7 @@ static struct sama7g5_pll {
 			.t = PLL_TYPE_DIV,
 			.f = CLK_SET_RATE_GATE | CLK_SET_PARENT_GATE |
 			     CLK_SET_RATE_PARENT,
-			.eid = PMC_AUDIOIOPLL,
+			.eid = SAMA7G5_PMC_AUDIOIOPLL,
 		},
 	},
 
@@ -381,7 +381,7 @@ static struct {
 	  .ep_mux_table = { 5, },
 	  .ep_count = 1,
 	  .ep_chg_id = INT_MIN,
-	  .eid = PMC_MCK1,
+	  .eid = SAMA7G5_PMC_MCK1,
 	  .c = 1, },
 
 	{ .n = "mck2",
@@ -997,7 +997,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 	if (IS_ERR(regmap))
 		return;
 
-	sama7g5_pmc = pmc_data_allocate(PMC_MCK1 + 1,
+	sama7g5_pmc = pmc_data_allocate(SAMA7G5_PMC_MCK1 + 1,
 					nck(sama7g5_systemck),
 					nck(sama7g5_periphck),
 					nck(sama7g5_gck), 8);
@@ -1030,7 +1030,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	sama7g5_pmc->chws[PMC_MAIN] = hw;
+	sama7g5_pmc->chws[SAMA7G5_PMC_MAIN] = hw;
 
 	for (i = 0; i < PLL_ID_MAX; i++) {
 		for (j = 0; j < PLL_COMPID_MAX; j++) {
@@ -1043,7 +1043,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 			case PLL_TYPE_FRAC:
 				switch (sama7g5_plls[i][j].p) {
 				case SAMA7G5_PLL_PARENT_MAINCK:
-					parent_hw = sama7g5_pmc->chws[PMC_MAIN];
+					parent_hw = sama7g5_pmc->chws[SAMA7G5_PMC_MAIN];
 					break;
 				case SAMA7G5_PLL_PARENT_MAIN_XTAL:
 					parent_hw = main_xtal_hw;
@@ -1092,11 +1092,11 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	sama7g5_mckx[PCK_PARENT_HW_MCK0].hw = sama7g5_pmc->chws[PMC_MCK] = hw;
+	sama7g5_mckx[PCK_PARENT_HW_MCK0].hw = sama7g5_pmc->chws[SAMA7G5_PMC_MCK0] = hw;
 
 	parent_hws[0] = md_slck_hw;
 	parent_hws[1] = td_slck_hw;
-	parent_hws[2] = sama7g5_pmc->chws[PMC_MAIN];
+	parent_hws[2] = sama7g5_pmc->chws[SAMA7G5_PMC_MAIN];
 	for (i = PCK_PARENT_HW_MCK1; i < ARRAY_SIZE(sama7g5_mckx); i++) {
 		u8 num_parents = 3 + sama7g5_mckx[i].ep_count;
 		struct clk_hw *tmp_parent_hws[8];
@@ -1138,11 +1138,11 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 	if (IS_ERR(hw))
 		goto err_free;
 
-	sama7g5_pmc->chws[PMC_UTMI] = hw;
+	sama7g5_pmc->chws[SAMA7G5_PMC_UTMI] = hw;
 
 	parent_hws[0] = md_slck_hw;
 	parent_hws[1] = td_slck_hw;
-	parent_hws[2] = sama7g5_pmc->chws[PMC_MAIN];
+	parent_hws[2] = sama7g5_pmc->chws[SAMA7G5_PMC_MAIN];
 	parent_hws[3] = sama7g5_plls[PLL_ID_SYS][PLL_COMPID_DIV0].hw;
 	parent_hws[4] = sama7g5_plls[PLL_ID_DDR][PLL_COMPID_DIV0].hw;
 	parent_hws[5] = sama7g5_plls[PLL_ID_IMG][PLL_COMPID_DIV0].hw;
@@ -1192,7 +1192,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 
 	parent_hws[0] = md_slck_hw;
 	parent_hws[1] = td_slck_hw;
-	parent_hws[2] = sama7g5_pmc->chws[PMC_MAIN];
+	parent_hws[2] = sama7g5_pmc->chws[SAMA7G5_PMC_MAIN];
 	for (i = 0; i < ARRAY_SIZE(sama7g5_gck); i++) {
 		u8 num_parents = 3 + sama7g5_gck[i].pp_count;
 		struct clk_hw *tmp_parent_hws[8];
-- 
2.47.3

