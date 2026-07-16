Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917F641F37A
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 12:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784205292; cv=none; b=YUznDgMmVfv/k8fq7T3Fm0DAWk60L6uZ/wzTffHHRnJh/RTjJYI1mlkpr2Ipy5XGi9ifBFKUU+U1vrsvurZmgXs8CrSBqNJ2Iuvd8L4Gjm4jdA40RE1jRQr+Ebc8Zmub6tTpJil4bLsV+nDY1fMg6A9iApuO0VJj7TgAtR9nzEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784205292; c=relaxed/simple;
	bh=OleyMyY1Ngy8vHEsSJPAvEUh6GQBkvNiZokJ7IehTwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qiNqXMsbC/EvvC8BzPMyBJ6G70dS7ZNji3hYeME80Sm6SoXEM8t3oX1E29NIVbg50nnpi8gnjuYIH4gPvAbK+bE/zyhpEfQ80vl8E8vMYJjdatmxHbXVI/FAzk89I080jJc30+P51Wxa2Nn7eQ3EzghB2JQ++CDwaox6lMi0n/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hz3FWF3Y; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hz3FWF3Y"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493ba701891so26651175e9.3
        for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 05:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784205287; x=1784810087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sxxTXB7roNmOyK7PgqwmCUC18cb+ypLbmMd2RPOlK6o=;
        b=hz3FWF3Y8rfPTMVqXZLKJz28ZZNJ9Zdseho8nPpF/Hztjx2RkdIbgeFZ0tMhxSuTfI
         8M3HAl2YKUfHtvjYexg9e15B5r2DMO6D1eOc18gVkbKRCc5wQcoBxS3Q0V0+BrdDmHli
         I5IQKw6Kg2K+IlD4bmYWU6SBdA1vw5VmVitNPN8u1u7bWwx4E+9DQGi9B/VVM+W512Mn
         OR9mV9Ivc1DCfw98o3saHWTAzkngVW42KFT86g3kZNdISq7+uHPi41Nzp3hlUemUNbEh
         0xGtIQ/UcBCac0KgUbOKqJjlf03EcWZSdhI/eTBWkEKKcXCfkGMlUgUIZ0jQZs0o9r8q
         J3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205287; x=1784810087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sxxTXB7roNmOyK7PgqwmCUC18cb+ypLbmMd2RPOlK6o=;
        b=VYUnGnTRxoViRQz29FFF9V5vdPVSsdkeYVDgoXDUpu0vKstR6Z79hqtCAV75eyq/Lb
         HEPuE9MoiCy2iGvpDK3IRaARZpaJApJmXB/MLv4XGA/EGIwlLGaXSpMskQHHdwexY4E/
         Dd7vNXrZR/FcoCfY28Moq+TUaA7YK3O/+w9nfk/6n2giFuOPv4N1mURBYMQqaXYNWGg3
         k1nPnQbht9fdMeLQDv18j6ScWHUXpkErOSe08NSd2Jqp1ITFehelOFF/0onmXSmbLHZl
         4uQ9HwC3gyCWhpK9Bpi731G/B2izrVzgZM9GTOpbZiuBrnqDSEM18fVTCdKdjq1bhcYy
         GUuw==
X-Forwarded-Encrypted: i=1; AHgh+RrWIVxn46tpmTM2vcTkUTrqO8SMm1BrDkCU5cAYEa4qEH55IYc97b0Rk938bjJl9VCtJD2tnrmBCpU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIDj2a/DbPLgK4wMFHVJ84WCSN0f3TkTwYJsBxn9uEzSAqZ+Zv
	2ScKL+y856O6skMjfceBE3BUBe7aFtfYuLRva2alNVNN40YJCERQHtZC
X-Gm-Gg: AfdE7ckk++CYt4hBXP8PIi2PnTbp0FZ1ehd1NjWmOZVreVuUBC4B4zWh41vwd1kx0uU
	WHlW/nkgmnttCojErR2j8xUtuh1ofEcmyBpw56rSVHsT5h3cMa1q+fRJqwcPHQHwU/y6K1wOJ0O
	0lsqx+n/aVRC/9tN9OiHhYN+Ue7ixWlC5M5uffVyWFcJNEVr12z3mdPbwkPdWSoZsrGcRzZ937s
	K8ho2I/Q0L89HgAFHZ5i/DlJEUIOzRL4pwCiXO9ye7PBJo8J7gRIAa5rUJF1PXeyr7K/zQ24aL4
	XxBgdPHq5s/E6a71av+JtcuzZNzROIck5967cRwtVFHnJ+pU9Ho7fp8/u6zsXjCn5dZgjOHv2G/
	ANphhDjPNppuWskAtW9EEf2bWuiNnnny5SCWZ0usbP/11rFLgvxH70hgXaE+5/NAtgpiuGgf8gt
	m02vdl00Ss9hdQ2nJkIwcv6xBU/Ix4bXEHvrxRAtIbZIuV6mHyrQcKbRMUsHasqDUC21ln/VyB8
	kWsCedfoIvVBCUT
X-Received: by 2002:a05:600c:4ed1:b0:494:ca0f:b7e9 with SMTP id 5b1f17b1804b1-494ca0fb80dmr149437205e9.10.1784205286659;
        Thu, 16 Jul 2026 05:34:46 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:4150:a2d7:2b6b:840e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541e83d05sm48582645e9.6.2026.07.16.05.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 05:34:46 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 6/8] watchdog: rzv2h: Add syscon support for WDTDCR
Date: Thu, 16 Jul 2026 13:34:32 +0100
Message-ID: <20260716123434.2576253-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260716123434.2576253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260716123434.2576253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
index 9f013d774897..9267fd74bfb2 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -1036,6 +1036,7 @@ config RENESAS_RZV2HWDT
 	depends on ARCH_RENESAS || COMPILE_TEST
 	depends on PM || COMPILE_TEST
 	select WATCHDOG_CORE
+	select MFD_SYSCON
 	help
 	  This driver adds watchdog support for the integrated watchdogs in the
 	  Renesas RZ/{G3E,V2H(P)} SoCs. These watchdogs can be used to reset a
diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 3c8739902ec4..58daa6b6e3e0 100644
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
@@ -281,17 +296,36 @@ static const struct regmap_config rzv2h_wdtdcr_regmap_config = {
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
2.54.0

