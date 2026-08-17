Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EE943E07C
	for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 19:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786994790; cv=none; b=GVUpWLOV6LJ1q/aiIzCJvW51jAny+MLVzA6/AVUVzzID6BguaejUpOgT4iWwVZYcL/WTdmeGyG/m6Gvq7Y1a+OS9ziRURYUjyv/3iqHwQ9Bpd6GwvMvuAtbAXRsvWrwM7VqoBXm7/rOPf0jYPttQlK0XKZimKpA+Xshx/b8oowA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786994790; c=relaxed/simple;
	bh=5Sea9MSDaveuQGC5x66kS1vUpcBCUa4zSrlhRTuadrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ARgI/WV7mvONAkb4cLZ+MX7af1vlo+qTje780jqFyJCIwuMjjUmY6X6MNLcZjzCPDEU0qtnrgl30v0KGSnEqBBCo0dZesNzYyuKw1AmczNn8cfxodwsqfZCCwjdMggLDjqNlut+isHKWrNFksDTOyMMAnPq/8RByomCQPIqY3kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pmcDscJD; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pmcDscJD"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d530328efbso33141855ad.0
        for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 12:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786994788; x=1787599588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e1c+ZIyIJcvcVaUrDb5n7yyU/XX4DNS072WISoEr2to=;
        b=pmcDscJDxLD2MhSOt3Su5/TRgyasd19vcf/Mp63Yf3ZcGYNEIzku9ayZvonWBB8RWO
         kygfAMCjLM8/ayG6xq0h3vqmlD7kbr2NQvV/VMX+dWepRTWY7625osbQuxLZrQBBJVhB
         vHR2CVm6bkIy1hi7khxNy6vA8ZOeYA61GKD19HN7Ghlr0sUuuxlKsyK5PTQ0+PgJv+CC
         ufowpPbb4zy4+JE0Ojlri+cnJ7VFYDnW8yISZkTyE3yFaAqVXPCQkqHTxsFDiO5bZfYj
         vsmFLAT5wYhgzFLaqT6l2zP3OB0YR71kH+DsNDIGnXy7QLu3IFD3TSw/QNNVr8QIYQSl
         e0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786994788; x=1787599588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e1c+ZIyIJcvcVaUrDb5n7yyU/XX4DNS072WISoEr2to=;
        b=o6ctrhksUdgTkTW6XiZjXglMW/681w2sBIg1exyk83SwcZU/DnOB0W9U+VHr8KTKHU
         xhQ5/36ooNNRq7kUUni1W05pvinLdi8ORyLiUhIbCkb7eQ3y+J5ucaYiZDw6y+HEARr0
         qXvLEiCkkBv9ynJ1ZmgF7794qGFWYuUt9E/JfZUlU/Cewz5NEem+gFpIFdfm2oc9Pbuu
         q20p33bzhbdeVU2Alg1mXc9qmQw4xk8lLA1re4517AfEGPh+szXX8jqNRDaOXXXxYtYs
         r2JL0nGOLTzP2tkIgrzfnX3n+FSNzABsvp+pb5/auZhVJb5pxx7qr0nTYHEFE82d3lTX
         5SkA==
X-Forwarded-Encrypted: i=1; AHgh+RquDb1/mjNTa2KO0CYqo8fKSWRikQyJ3EiXlA8koJ17aENod0R+Sv1Nczu2YWGzR0UCmFfR6eL+xLg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfmoKR8Q3/jU9FweSiMYFiklZIUU1lSTrwmLrvYallk0w7X1AP
	o2Oru7CNkJ82GaQy59WdCnAMhnEs3feug8NqmoVmj+qlsw/GDOIdjIiE
X-Gm-Gg: AR+sD13yVG4IwbBP711uXylR/un/loP5H3dNk2ZOyDVl14zEancuT9QfgAyTk+gkGv2
	yQ3CY/S4SBeXlXskk6dkS1t2GH5zPbxebDzIBDupwUC3s+/jYRe9zJbYO6X9wpac3UYMf6MOiMi
	lwicuafAlbVklIgxPCIJKBa4vJi4L/9TpC024zt6h7XdRMO6UPxhJ2m+jnCgqXVTNA3NuzKncwM
	yanf2JWJNVy/1CwRvPzJPpplhMzpwZf6hCKfX/JV/mjKLyvDStMUMIXGYM3P0NUkZjSRevG9wQd
	7E1mdAsJQ96vwm9NtCftp+BsYD8n4wJ5R5rRO9iLKpX617aAarwECU9hYNQfvzIM/AXzybjcQys
	Mubn/v2G0EoPU4y8hrTS9sV7mhQIB9kzEUwGEVbLpvCNpgruTflnl67lfyjR65qacn2y1E/hnIB
	pUcXWl6zCJmG4g6hijJqhxtmflItmHSu8i1Zjm8eYSGAQ2uYEiIoR09hxQAB58YC72h3vtjo76Q
	0c3zYQWqH1pxx/M9igsRMc4+qpiG+uLUhdb9BFqo7UV0RZNZUzsN81nwKVBBZyR0JXOSthdpXez
	7XBGubtrUA==
X-Received: by 2002:a17:902:f64c:b0:2ce:b7b7:30e3 with SMTP id d9443c01a7336-2d5c53bf80amr23810365ad.17.1786994788023;
        Mon, 17 Aug 2026 12:26:28 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c06:2735:f886:32ae:1e17:ec13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-326798cb9f5sm10218757eec.13.2026.08.17.12.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 12:26:27 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 5/7] watchdog: rzv2h: Add syscon support for WDTDCR
Date: Mon, 17 Aug 2026 20:25:38 +0100
Message-ID: <20260817192540.423994-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

On RZ/T2H and RZ/N2H SoCs, the WDTDCR (WDT Debug Control Register) resides
in the second register region of the CPG/MSSR block. Since this
multi-function block is shared with other peripherals, it is exposed via a
syscon regmap interface.

Look up the SYSC regmap using the optional "renesas,sysc" property and
derive the WDTDCR offset from the watchdog instance index.

Retain the existing MMIO-based access method when the "renesas,sysc"
property is absent to preserve compatibility with existing DT's.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- No change

v2->v3:
- Made use of the new "renesas,sysc" phandle-array property to access the
  WDTDCR register via the CPG/MSSR syscon node.
- Updated commit message

v1->v2:
- No change.
---
 drivers/watchdog/Kconfig     |  1 +
 drivers/watchdog/rzv2h_wdt.c | 56 +++++++++++++++++++++++++++++-------
 2 files changed, 46 insertions(+), 11 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index f7d0a0c2c0ef..3c4fc9916d8c 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1046,6 +1046,7 @@ config RENESAS_RZV2HWDT
 	depends on ARCH_RENESAS || COMPILE_TEST
 	depends on PM || COMPILE_TEST
 	select WATCHDOG_CORE
+	select MFD_SYSCON
 	help
 	  This driver adds watchdog support for the integrated watchdogs in the
 	  Renesas RZ/{G3E,V2H(P)} SoCs. These watchdogs can be used to reset a
diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 8af2f33b5680..04ea962da837 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -8,6 +8,7 @@
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -44,6 +45,11 @@
 
 #define WDT_DEFAULT_TIMEOUT	60U
 
+#define RZT2H_WDT_MAX_INSTANCES	6
+
+#define RZT2H_SYS_BLOCK1(n)	(BIT(16) | (0x5100 + (n) * 4))
+#define RZT2H_WDTDCR_OFFSET(n)	RZT2H_SYS_BLOCK1(n)
+
 static bool nowayout = WATCHDOG_NOWAYOUT;
 module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
@@ -64,14 +70,19 @@ struct rzv2h_of_data {
 	bool wdtdcr;
 };
 
+struct rzv2h_sysc_wdtdcr {
+	struct regmap *regmap;
+	unsigned int offset;
+};
+
 struct rzv2h_wdt_priv {
 	void __iomem *base;
-	struct regmap *wdtdcr_regmap;
 	struct clk *pclk;
 	struct clk *oscclk;
 	struct reset_control *rstc;
 	struct watchdog_device wdev;
 	const struct rzv2h_of_data *of_data;
+	struct rzv2h_sysc_wdtdcr sysc;
 };
 
 static int rzv2h_wdt_ping(struct watchdog_device *wdev)
@@ -90,12 +101,16 @@ static int rzv2h_wdt_ping(struct watchdog_device *wdev)
 
 static int rzt2h_wdt_wdtdcr_count_stop(struct rzv2h_wdt_priv *priv)
 {
-	return regmap_set_bits(priv->wdtdcr_regmap, WDTDCR, WDTDCR_WDTSTOPCTRL);
+	struct rzv2h_sysc_wdtdcr *sysc = &priv->sysc;
+
+	return regmap_set_bits(sysc->regmap, sysc->offset, WDTDCR_WDTSTOPCTRL);
 }
 
 static int rzt2h_wdt_wdtdcr_count_start(struct rzv2h_wdt_priv *priv)
 {
-	return regmap_clear_bits(priv->wdtdcr_regmap, WDTDCR, WDTDCR_WDTSTOPCTRL);
+	struct rzv2h_sysc_wdtdcr *sysc = &priv->sysc;
+
+	return regmap_clear_bits(sysc->regmap, sysc->offset, WDTDCR_WDTSTOPCTRL);
 }
 
 static void rzv2h_wdt_setup(struct watchdog_device *wdev, u16 wdtcr)
@@ -284,17 +299,36 @@ static const struct regmap_config rzv2h_wdtdcr_regmap_config = {
 static int rzt2h_wdt_wdtdcr_init(struct platform_device *pdev,
 				 struct rzv2h_wdt_priv *priv)
 {
-	void __iomem *wdtdcr;
+	struct device_node *np = pdev->dev.of_node;
+	bool syscon_present = of_property_present(np, "renesas,sysc");
+	struct rzv2h_sysc_wdtdcr *sysc = &priv->sysc;
 	int ret;
 
-	wdtdcr = devm_platform_ioremap_resource(pdev, 1);
-	if (IS_ERR(wdtdcr))
-		return PTR_ERR(wdtdcr);
+	if (syscon_present) {
+		unsigned int wdt_index;
 
-	priv->wdtdcr_regmap = devm_regmap_init_mmio(&pdev->dev, wdtdcr,
-						    &rzv2h_wdtdcr_regmap_config);
-	if (IS_ERR(priv->wdtdcr_regmap))
-		return PTR_ERR(priv->wdtdcr_regmap);
+		sysc->regmap = syscon_regmap_lookup_by_phandle_args(np, "renesas,sysc",
+								    1, &wdt_index);
+		if (IS_ERR(sysc->regmap))
+			return PTR_ERR(sysc->regmap);
+
+		if (wdt_index >= RZT2H_WDT_MAX_INSTANCES)
+			return -EINVAL;
+
+		sysc->offset = RZT2H_WDTDCR_OFFSET(wdt_index);
+	} else {
+		void __iomem *wdtdcr;
+
+		wdtdcr = devm_platform_ioremap_resource(pdev, 1);
+		if (IS_ERR(wdtdcr))
+			return PTR_ERR(wdtdcr);
+
+		sysc->regmap = devm_regmap_init_mmio(&pdev->dev, wdtdcr,
+						     &rzv2h_wdtdcr_regmap_config);
+		if (IS_ERR(sysc->regmap))
+			return PTR_ERR(sysc->regmap);
+		sysc->offset = WDTDCR;
+	}
 
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret)
-- 
2.43.0

