Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD4A1CE6EC
	for <linux-clk@vger.kernel.org>; Thu, 22 Aug 2024 15:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724340520; cv=none; b=aW3JOk5sPKS9YoBAE6F/2uq7E3XpQj5f/gsQhwoD/W+a755pcZdUI7/OgcQywy4Wy8HPoSWP2cKCtwzCN8V2K3RIjaLXRCEDFzbdfbYpapUWDFiZioNo4+mD8r2P0uRQMgIICGhN4KlkPREEboE8dUSgFg++3yzuaEY9LbS89fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724340520; c=relaxed/simple;
	bh=e+aMAhnDBLszFLP58P9acFsRkrTnbYGFwK58/oU4n6s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=srF8I5J1zt3lmt5JaDGeJPkxBjqRXn+PH7Gmq7Ov/19MbwWC6ITB28fpGwxJx8wm+5c1ka9U66CAjO3kxwDJtsu8PEcY2Wrt5I14TRncn1rPgGsq+K0xj6jhFPD0GLvHpDf7kvs7Wg1OYqfm7gbqYxd5BjidJ84Gy9HlTpluwYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=qFQAMKlS; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="qFQAMKlS"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a8696e9bd24so68847766b.0
        for <linux-clk@vger.kernel.org>; Thu, 22 Aug 2024 08:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724340517; x=1724945317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MLN4pb77vJ4aC8LA9dpwq6n4qe80J5V8TVd+pDGU9bo=;
        b=qFQAMKlS4w8/sVJw3h0CVKxSpLK6adEqPHq/LDzpCxqbhzZ6GwL7KaQi0r3qTDDgpN
         cNmf1ca2t6ZMYIPEAizmy+8EKYdbmcxc3uJkEOgv6aMCfBaqigv6u8U3rAWM2EsKQxeu
         uX8NruKefCdKou94U1STpRfiFlkL04jNUfa8f5Br80wjsNzfY8LvkzIbrHwO6mJlJn+6
         Vu5VPtWMZpsFmNkYCMTLeJLeTCXeYhOA1XjvFKG0d0kK9adKv02J7khO3mB6VlVVtA9b
         q2gOTJ0g2ftLC8DAlmFIVuSJMDXm+EZCoNALrsjzGcU0NYiFKT1EF7cKwiW3AH2t+/eR
         LuhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724340517; x=1724945317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MLN4pb77vJ4aC8LA9dpwq6n4qe80J5V8TVd+pDGU9bo=;
        b=DP1bowwdR7GBIozm7QEzz5JEOQdorGYNfylzo4IPNL5lXMLbXga/fMq98nO+pn8MPE
         fsAtprGuwf28m8LzG/BNgZ0cbzTH0is7k2sz6gR4eZlQ/Y84sTBACJD1Kfby9U5dTrli
         5Sthp6E2MtLXSZxrrsAWgdlEja4cWTvNYnJp7AVWBrMZrOZwplQhQwtVmxeaQ1D7qOAV
         kQrmD1FltwDDWDx8cYb7J4wpkP3eM/HY6KdlEvgbd0bm3ziwXe3nOuIGC24BOcgB/Hhi
         1EcBRFvNSUf3KEES82FEt8KJuvBTcTlP5t3X6YGx74jwQ69wm+kTCInqRf+2CQ7PHAId
         NRww==
X-Forwarded-Encrypted: i=1; AJvYcCUGrt58X1uDHTXHWaQcwia2hkcV2L4eL0Zsg0/T/LmK1jzfhrJ4BcY3br5w0yXOA2TWX6DuI3gV+rg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVYr2MJnEHdsaDl16SdIb593whgXHY/Pz2OB/HrOZOdbohI2Hb
	6RM6TvFmDNtvF5U7eAHFFqvFIWO34GWcmMzZenq9TPcvNA4TDtvUKE8V0/fmg3M=
X-Google-Smtp-Source: AGHT+IEYrxA2bm8mmwSX01X2yZ3QhHyjhFNmbYyUH1245MQKOvJG+Mgyld3wrG6KhxZVhMAa/kKlOQ==
X-Received: by 2002:a17:907:2cc6:b0:a80:7c30:a836 with SMTP id a640c23a62f3a-a866f894098mr510823566b.56.1724340516716;
        Thu, 22 Aug 2024 08:28:36 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f484dc5sm134189166b.171.2024.08.22.08.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 08:28:35 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	gregkh@linuxfoundation.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	yoshihiro.shimoda.uh@renesas.com,
	biju.das.jz@bp.renesas.com,
	ulf.hansson@linaro.org
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 10/16] phy: renesas: rcar-gen3-usb2: Add support to initialize the bus
Date: Thu, 22 Aug 2024 18:27:55 +0300
Message-Id: <20240822152801.602318-11-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas RZ/G3S need to initialize the USB BUS before transferring data
due to hardware limitation. As the register that need to be touched for
this is in the address space of the USB PHY, and the UBS PHY need to be
initialized before any other USB drivers handling data transfer, add
support to initialize the USB BUS.

As the USB PHY is probed before any other USB drivers that enables
clocks and de-assert the reset signals and the BUS initialization is done
in the probe phase, we need to add code to de-assert reset signal and
runtime resume the device (which enables its clocks) before accessing
the registers.

As the reset signals are not required by the USB PHY driver for the other
USB PHY hardware variants, the reset signals and runtime PM was handled
only in the function that initialize the USB BUS.

The PHY initialization was done right after runtime PM enable to have
all in place when the PHYs are registered.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 50 ++++++++++++++++++++++--
 1 file changed, 47 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 7594f64eb737..cf4299cea579 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -19,12 +19,14 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <linux/reset.h>
 #include <linux/string.h>
 #include <linux/usb/of.h>
 #include <linux/workqueue.h>
 
 /******* USB2.0 Host registers (original offset is +0x200) *******/
 #define USB2_INT_ENABLE		0x000
+#define USB2_AHB_BUS_CTR	0x008
 #define USB2_USBCTR		0x00c
 #define USB2_SPD_RSM_TIMSET	0x10c
 #define USB2_OC_TIMSET		0x110
@@ -40,6 +42,10 @@
 #define USB2_INT_ENABLE_USBH_INTB_EN	BIT(2)	/* For EHCI */
 #define USB2_INT_ENABLE_USBH_INTA_EN	BIT(1)	/* For OHCI */
 
+/* AHB_BUS_CTR */
+#define USB2_AHB_BUS_CTR_MBL_MASK	GENMASK(1, 0)
+#define USB2_AHB_BUS_CTR_MBL_INCR4	2
+
 /* USBCTR */
 #define USB2_USBCTR_DIRPD	BIT(2)
 #define USB2_USBCTR_PLL_RST	BIT(1)
@@ -111,6 +117,7 @@ struct rcar_gen3_chan {
 	struct extcon_dev *extcon;
 	struct rcar_gen3_phy rphys[NUM_OF_PHYS];
 	struct regulator *vbus;
+	struct reset_control *rstc;
 	struct work_struct work;
 	struct mutex lock;	/* protects rphys[...].powered */
 	enum usb_dr_mode dr_mode;
@@ -125,6 +132,7 @@ struct rcar_gen3_chan {
 struct rcar_gen3_phy_drv_data {
 	const struct phy_ops *phy_usb2_ops;
 	bool no_adp_ctrl;
+	bool init_bus;
 };
 
 /*
@@ -650,6 +658,35 @@ static enum usb_dr_mode rcar_gen3_get_dr_mode(struct device_node *np)
 	return candidate;
 }
 
+static int rcar_gen3_phy_usb2_init_bus(struct rcar_gen3_chan *channel)
+{
+	struct device *dev = channel->dev;
+	int ret;
+	u32 val;
+
+	channel->rstc = devm_reset_control_array_get_shared(dev);
+	if (IS_ERR(channel->rstc))
+		return PTR_ERR(channel->rstc);
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return ret;
+
+	ret = reset_control_deassert(channel->rstc);
+	if (ret)
+		goto rpm_put;
+
+	val = readl(channel->base + USB2_AHB_BUS_CTR);
+	val &= ~USB2_AHB_BUS_CTR_MBL_MASK;
+	val |= USB2_AHB_BUS_CTR_MBL_INCR4;
+	writel(val, channel->base + USB2_AHB_BUS_CTR);
+
+rpm_put:
+	pm_runtime_put(dev);
+
+	return ret;
+}
+
 static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 {
 	const struct rcar_gen3_phy_drv_data *phy_data;
@@ -703,6 +740,15 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 		goto error;
 	}
 
+	platform_set_drvdata(pdev, channel);
+	channel->dev = dev;
+
+	if (phy_data->init_bus) {
+		ret = rcar_gen3_phy_usb2_init_bus(channel);
+		if (ret)
+			goto error;
+	}
+
 	channel->soc_no_adp_ctrl = phy_data->no_adp_ctrl;
 	if (phy_data->no_adp_ctrl)
 		channel->obint_enable_bits = USB2_OBINT_IDCHG_EN;
@@ -733,9 +779,6 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 		channel->vbus = NULL;
 	}
 
-	platform_set_drvdata(pdev, channel);
-	channel->dev = dev;
-
 	provider = devm_of_phy_provider_register(dev, rcar_gen3_phy_usb2_xlate);
 	if (IS_ERR(provider)) {
 		dev_err(dev, "Failed to register PHY provider\n");
@@ -762,6 +805,7 @@ static void rcar_gen3_phy_usb2_remove(struct platform_device *pdev)
 	if (channel->is_otg_channel)
 		device_remove_file(&pdev->dev, &dev_attr_role);
 
+	reset_control_assert(channel->rstc);
 	pm_runtime_disable(&pdev->dev);
 };
 
-- 
2.39.2

