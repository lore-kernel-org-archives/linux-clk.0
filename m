Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A9F1FC7E0
	for <linux-clk@vger.kernel.org>; Fri,  3 Jan 2025 16:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735922321; cv=none; b=kUjD3JuEknOVWdL8v217ppUcoPi9RIk+qaJ/Xor+g0i1pTIL6Xjlv8e6pNsnZh+6SLACVMtVsvNxMk4k71d6mSI4ASfVjvnJXLFAjRJxYgIHfn6ozTSFPhUi+Fflv2L/dmAlMmOye1reJrSw8rlyaCzBurk1SH8T7eJGnxffWyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735922321; c=relaxed/simple;
	bh=ed1nSj2/6ODoZSIgxzoGaGfEmusLx1u4UI33afkgvm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hoXlfOA+aaJFvbM4IQFYqWP18gqMw71g/cRTQ6uJkyJyv7jGc0IApF3vUzmYtR8dZOQ3/g7K9WzBgdK1brJAnqNqoblOJC2xihlpY/tFXS/HZ+Fm+SdQ2aGjhw3rUmouBoawC6FdZSRt1HtLhZMJUldgJljEDl1aNsnFjj1F9XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=LpAoo6Qc; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="LpAoo6Qc"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aa67ac42819so1755225166b.0
        for <linux-clk@vger.kernel.org>; Fri, 03 Jan 2025 08:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1735922316; x=1736527116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8GMhatKxsQop+YQYK/7e1h+i8uxI54IklqBBVCwti8U=;
        b=LpAoo6Qc6gzxvcEEOLPso7/t9ryONVbamq7M3cldqVwEe/tHmYGBbiJAODU5N2lBMW
         eov1cA222A/yyk+KJI5O2mqLec840OzVz2h1NToY1PuO5e7GIHM6o6xRT21B+YbVNYAz
         hkNEkdaa+1naEJZcTxOY3ID4VYnwrwQ0vlc9YgpUMFo3LIE+/0WX4F9ZKU0tow1hCTVE
         lyVWzA4fap/XaTzLh1kJXx1TrRBWlAjCJOOTCUOAxXirhBJKueykvFYI82wh7NlLITDX
         A4ityOejDBiWhb6SqmQpmdy8CWDczr9aIddQ/ZiTzVGrTqJ8ROLndvQvs+iKFzttdPJA
         NiEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735922316; x=1736527116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8GMhatKxsQop+YQYK/7e1h+i8uxI54IklqBBVCwti8U=;
        b=iOMLKEQPmI33skHwXC094OmE9tJ/lzIAu1zof7loLZPAG6Z/WttuoySMtD0ijR7dnr
         VBxdd/FhIInJ+gokQjzpHkqb2AVvDCKY6F+8L8vu3CRXZOS0ADcVEsXdilDZHa9zpERv
         ZaMPeeF/NB6YrZrGE5JjnETeA7IOQN/mNultamBGLyIQEUVKw8I8ldKgPozeZui0COg/
         G4D8LYuMvooaUkqJVF/tLM49xRBrGf8xIohYzrtGGgbr2sJjfa/LD5blTNtVDXS2RWMg
         HGaOZUGyqDZnuGV6lYFocrdI0kWrGPr8tWGZF8UKrt0NHUTg/B1vqBVQF+/9fRW9jgMY
         oQAA==
X-Forwarded-Encrypted: i=1; AJvYcCX5O/+hArPcFLEKGL8D4iv3i6ZLJZYUIkyaqKBV27xL93sevKLEVTOKsXY9rBCDQxnbvO6kgrXZnxk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSc0/N8F4wQQF1/R0YlO/Qr1HXbV1MtFDhKG4VwRpR2daxjIuQ
	ogemAPIQpHmr5eAhSb5UNj+8f4Pu7GuCUQ0YltAck7yI8c0v48qtSaCZkNscEDE=
X-Gm-Gg: ASbGncsRCxOe/k6OX2kKzbXgTDxh4jQVEZFvGZDJyDffx7lZ8ykrTU6/pZJ6Rn0vz7v
	zBIYvQcJtFmSuwRWCDVWcxLzIGwSHpohBI3H2vqtDhIT3H+WlrZScMC2KHldmKS8vA3xKHKuGUC
	J+2kpnxlxB5ArM1x+Pd6Wt4h2/ePzhYcmlJFza4r+lXhcC+/K6XpKMhyM0cIWmjHX/djver2N5+
	uRCEkcEtou1ys8UmBRpuw3kFRb95M6KYq/oo+hNTSQBXwJmrtHEegKmBaJRi87ieWQYWXfgbsIA
	6LmpYxHKHMs=
X-Google-Smtp-Source: AGHT+IHvkBYCDNtkuQoboipJHaoUL6w4sk5iBfZsbglTc7vIk6YcMpGGuJWGPm5LzFye+zIDIa3xRA==
X-Received: by 2002:a17:907:2cc5:b0:aa6:8676:3b33 with SMTP id a640c23a62f3a-aac3464f929mr4112731566b.47.1735922316348;
        Fri, 03 Jan 2025 08:38:36 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e8953b6sm1932984066b.65.2025.01.03.08.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 08:38:35 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	ulf.hansson@linaro.org
Cc: claudiu.beznea@tuxon.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 4/6] thermal: renesas: rzg3s: Add thermal driver for the Renesas RZ/G3S SoC
Date: Fri,  3 Jan 2025 18:38:03 +0200
Message-ID: <20250103163805.1775705-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas RZ/G3S SoC features a Thermal Sensor Unit (TSU) that reports
the junction temperature. The temperature is reported through a dedicated
ADC channel. Add a driver for the Renesas RZ/G3S TSU.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 MAINTAINERS                             |   7 +
 drivers/thermal/renesas/Kconfig         |   8 +
 drivers/thermal/renesas/Makefile        |   1 +
 drivers/thermal/renesas/rzg3s_thermal.c | 301 ++++++++++++++++++++++++
 4 files changed, 317 insertions(+)
 create mode 100644 drivers/thermal/renesas/rzg3s_thermal.c

diff --git a/MAINTAINERS b/MAINTAINERS
index d2ab799a0659..0b5854dc2d5d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20131,6 +20131,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/potentiometer/renesas,x9250.yaml
 F:	drivers/iio/potentiometer/x9250.c
 
+RENESAS RZ/G3S THERMAL SENSOR UNIT DRIVER
+M:	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
+L:	linux-pm@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/thermal/renesas,r9a08g045-tsu.yaml
+F:	drivers/thermal/renesas/rzg3s_thermal.c
+
 RESET CONTROLLER FRAMEWORK
 M:	Philipp Zabel <p.zabel@pengutronix.de>
 S:	Maintained
diff --git a/drivers/thermal/renesas/Kconfig b/drivers/thermal/renesas/Kconfig
index dcf5fc5ae08e..566478797095 100644
--- a/drivers/thermal/renesas/Kconfig
+++ b/drivers/thermal/renesas/Kconfig
@@ -26,3 +26,11 @@ config RZG2L_THERMAL
 	help
 	  Enable this to plug the RZ/G2L thermal sensor driver into the Linux
 	  thermal framework.
+
+config RZG3S_THERMAL
+	tristate "Renesas RZ/G3S thermal driver"
+	depends on ARCH_R9A08G045 || COMPILE_TEST
+	depends on OF && IIO && RZG2L_ADC
+	help
+	  Enable this to plug the RZ/G3S thermal sensor driver into the Linux
+	  thermal framework.
diff --git a/drivers/thermal/renesas/Makefile b/drivers/thermal/renesas/Makefile
index bf9cb3cb94d6..1feb5ab78827 100644
--- a/drivers/thermal/renesas/Makefile
+++ b/drivers/thermal/renesas/Makefile
@@ -3,3 +3,4 @@
 obj-$(CONFIG_RCAR_GEN3_THERMAL)	+= rcar_gen3_thermal.o
 obj-$(CONFIG_RCAR_THERMAL)	+= rcar_thermal.o
 obj-$(CONFIG_RZG2L_THERMAL)	+= rzg2l_thermal.o
+obj-$(CONFIG_RZG3S_THERMAL)	+= rzg3s_thermal.o
diff --git a/drivers/thermal/renesas/rzg3s_thermal.c b/drivers/thermal/renesas/rzg3s_thermal.c
new file mode 100644
index 000000000000..6719f9ca05eb
--- /dev/null
+++ b/drivers/thermal/renesas/rzg3s_thermal.c
@@ -0,0 +1,301 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/G3S TSU Thermal Sensor Driver
+ *
+ * Copyright (C) 2024 Renesas Electronics Corporation
+ */
+
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/iio/consumer.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+#include <linux/thermal.h>
+#include <linux/units.h>
+
+#include "../thermal_hwmon.h"
+
+#define TSU_SM			0x0
+#define TSU_SM_EN		BIT(0)
+#define TSU_SM_OE		BIT(1)
+#define OTPTSUTRIM_REG(n)	(0x18 + (n) * 0x4)
+#define OTPTSUTRIM_EN_MASK	BIT(31)
+#define OTPTSUTRIM_MASK		GENMASK(11, 0)
+
+#define TSU_READ_STEPS		8
+
+/* Default calibration values, if FUSE values are missing. */
+#define SW_CALIB0_VAL		1297
+#define SW_CALIB1_VAL		751
+
+#define MCELSIUS(temp)		((temp) * MILLIDEGREE_PER_DEGREE)
+
+/**
+ * struct rzg3s_thermal_priv - RZ/G3S thermal private data structure
+ * @base: TSU base address
+ * @dev: device pointer
+ * @tz: thermal zone pointer
+ * @rstc: reset control
+ * @channel: IIO channel to read the TSU
+ * @mode: current device mode
+ * @calib0: calibration value
+ * @calib1: calibration value
+ */
+struct rzg3s_thermal_priv {
+	void __iomem *base;
+	struct device *dev;
+	struct thermal_zone_device *tz;
+	struct reset_control *rstc;
+	struct iio_channel *channel;
+	enum thermal_device_mode mode;
+	u16 calib0;
+	u16 calib1;
+};
+
+static int rzg3s_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
+{
+	struct rzg3s_thermal_priv *priv = thermal_zone_device_priv(tz);
+	struct device *dev = priv->dev;
+	u32 ts_code_ave = 0;
+	int ret, val;
+
+	if (priv->mode != THERMAL_DEVICE_ENABLED)
+		return -EAGAIN;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return ret;
+
+	for (u8 i = 0; i < TSU_READ_STEPS; i++) {
+		ret = iio_read_channel_raw(priv->channel, &val);
+		if (ret < 0)
+			goto rpm_put;
+
+		ts_code_ave += val;
+		/*
+		 * According to the HW manual (section 40.4.4 Procedure for Measuring the
+		 * Temperature) we need to wait here at leat 3us.
+		 */
+		usleep_range(5, 10);
+	}
+
+	ret = 0;
+	ts_code_ave = DIV_ROUND_CLOSEST(ts_code_ave, TSU_READ_STEPS);
+
+	/*
+	 * According to the HW manual (section 40.4.4 Procedure for Measuring the Temperature)
+	 * the computation formula is as follows:
+	 *
+	 * Tj = (ts_code_ave - priv->calib1) * 165 / (priv->calib0 - priv->calib1) - 40
+	 */
+	*temp = DIV_ROUND_CLOSEST((ts_code_ave - priv->calib1) * 165,
+				  (priv->calib0 - priv->calib1)) - 40;
+
+	/* Report it in mili degrees Celsius and round it up to 0.5 degrees Celsius. */
+	*temp = roundup(MCELSIUS(*temp), 500);
+
+rpm_put:
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	return ret;
+}
+
+static void rzg3s_thermal_set_mode(struct rzg3s_thermal_priv *priv,
+				   enum thermal_device_mode mode)
+{
+	struct device *dev = priv->dev;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return;
+
+	if (mode == THERMAL_DEVICE_DISABLED) {
+		writel(0, priv->base + TSU_SM);
+	} else {
+		writel(TSU_SM_EN, priv->base + TSU_SM);
+		/*
+		 * According to the HW manual (section 40.4.1 Procedure for
+		 * Starting the TSU) we need to wait here 30us or more.
+		 */
+		usleep_range(30, 40);
+
+		writel(TSU_SM_OE | TSU_SM_EN, priv->base + TSU_SM);
+		/*
+		 * According to the HW manual (section 40.4.1 Procedure for
+		 * Starting the TSU) we need to wait here 50us or more.
+		 */
+		usleep_range(50, 60);
+	}
+
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+}
+
+static int rzg3s_thermal_change_mode(struct thermal_zone_device *tz,
+				     enum thermal_device_mode mode)
+{
+	struct rzg3s_thermal_priv *priv = thermal_zone_device_priv(tz);
+
+	if (priv->mode == mode)
+		return 0;
+
+	rzg3s_thermal_set_mode(priv, mode);
+	priv->mode = mode;
+
+	return 0;
+}
+
+static const struct thermal_zone_device_ops rzg3s_tz_of_ops = {
+	.get_temp = rzg3s_thermal_get_temp,
+	.change_mode = rzg3s_thermal_change_mode,
+};
+
+static int rzg3s_thermal_read_calib(struct rzg3s_thermal_priv *priv)
+{
+	struct device *dev = priv->dev;
+	u32 val;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return ret;
+
+	val = readl(priv->base + OTPTSUTRIM_REG(0));
+	if (val & OTPTSUTRIM_EN_MASK)
+		priv->calib0 = FIELD_GET(OTPTSUTRIM_MASK, val);
+	else
+		priv->calib0 = SW_CALIB0_VAL;
+
+	val = readl(priv->base + OTPTSUTRIM_REG(1));
+	if (val & OTPTSUTRIM_EN_MASK)
+		priv->calib1 = FIELD_GET(OTPTSUTRIM_MASK, val);
+	else
+		priv->calib1 = SW_CALIB1_VAL;
+
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	return 0;
+}
+
+static int rzg3s_thermal_probe(struct platform_device *pdev)
+{
+	struct rzg3s_thermal_priv *priv;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	priv->channel = devm_iio_channel_get(dev, "tsu");
+	if (IS_ERR(priv->channel))
+		return dev_err_probe(dev, PTR_ERR(priv->channel), "Failed to get IIO channel!\n");
+
+	priv->rstc = devm_reset_control_get_exclusive_deasserted(dev, NULL);
+	if (IS_ERR(priv->rstc))
+		return dev_err_probe(dev, PTR_ERR(priv->rstc), "Failed to get reset!\n");
+
+	priv->dev = dev;
+	priv->mode = THERMAL_DEVICE_DISABLED;
+	platform_set_drvdata(pdev, priv);
+
+	pm_runtime_set_autosuspend_delay(dev, 300);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_enable(dev);
+
+	ret = rzg3s_thermal_read_calib(priv);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to read calibration data!\n");
+		goto rpm_disable;
+	}
+
+	priv->tz = thermal_of_zone_register(dev->of_node, 0, priv, &rzg3s_tz_of_ops);
+	if (IS_ERR(priv->tz)) {
+		dev_err_probe(dev, PTR_ERR(priv->tz), "Failed to register thermal zone!\n");
+		goto rpm_disable;
+	}
+
+	ret = thermal_add_hwmon_sysfs(priv->tz);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to add hwmon sysfs!\n");
+		goto tz_unregister;
+	}
+
+	return 0;
+
+tz_unregister:
+	thermal_of_zone_unregister(priv->tz);
+rpm_disable:
+	pm_runtime_disable(dev);
+	pm_runtime_dont_use_autosuspend(dev);
+	return ret;
+}
+
+static void rzg3s_thermal_remove(struct platform_device *pdev)
+{
+	struct rzg3s_thermal_priv *priv = dev_get_drvdata(&pdev->dev);
+
+	thermal_remove_hwmon_sysfs(priv->tz);
+	thermal_of_zone_unregister(priv->tz);
+	pm_runtime_disable(priv->dev);
+	pm_runtime_dont_use_autosuspend(priv->dev);
+}
+
+static int rzg3s_thermal_suspend(struct device *dev)
+{
+	struct rzg3s_thermal_priv *priv = dev_get_drvdata(dev);
+
+	rzg3s_thermal_set_mode(priv, THERMAL_DEVICE_DISABLED);
+
+	return reset_control_assert(priv->rstc);
+}
+
+static int rzg3s_thermal_resume(struct device *dev)
+{
+	struct rzg3s_thermal_priv *priv = dev_get_drvdata(dev);
+	int ret;
+
+	ret = reset_control_deassert(priv->rstc);
+	if (ret)
+		return ret;
+
+	if (priv->mode != THERMAL_DEVICE_DISABLED)
+		rzg3s_thermal_set_mode(priv, priv->mode);
+
+	return 0;
+}
+
+static const struct dev_pm_ops rzg3s_thermal_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(rzg3s_thermal_suspend, rzg3s_thermal_resume)
+};
+
+static const struct of_device_id rzg3s_thermal_dt_ids[] = {
+	{ .compatible = "renesas,r9a08g045-tsu" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, rzg3s_thermal_dt_ids);
+
+static struct platform_driver rzg3s_thermal_driver = {
+	.driver = {
+		.name = "rzg3s_thermal",
+		.of_match_table = rzg3s_thermal_dt_ids,
+		.pm = pm_ptr(&rzg3s_thermal_pm_ops),
+	},
+	.probe = rzg3s_thermal_probe,
+	.remove = rzg3s_thermal_remove,
+};
+module_platform_driver(rzg3s_thermal_driver);
+
+MODULE_DESCRIPTION("Renesas RZ/G3S Thermal Sensor Unit Driver");
+MODULE_AUTHOR("Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>");
+MODULE_LICENSE("GPL");
-- 
2.43.0

