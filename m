Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46422433030
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 18:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785176733; cv=none; b=etx84rkzCfDu7djR8RP0U0/IxaP5HPSIuqsRAl+NKtM+MAmwLEluoqfTlFV2Gc2SqopChnPQamlq2nj08hqSCWxZaVE6T49NiW5HSdC/cKY/J8DZ19rdmf1T5zbdI5i8f6Qqyvy0QgJwbZRezCVoiwc7NFLodo8F9oztN5V2eWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785176733; c=relaxed/simple;
	bh=Z0YfX8jUsZUimRbbgNY9xw3prHCkWNC3qnu0Cc2fWXk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nDaSlEX6TB3ywPhvgIiQCNGpMQJWQfxxSBi2qQBjSUc34qs1jMKaUsRyNhqGE4VcrUNZZcprIa/tOKMKehlawkcAqXvgVtuiV3npqh9xGco+IZYYFkebZqsBHfy3l0X8uCU+/nWQvWawVKFvqS13ojOTbTjMRUzqolqZtSCsifw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K8JOA3Ut; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K8JOA3Ut"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4954aff6088so25994255e9.3
        for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 11:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785176730; x=1785781530; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6MdKCtNkfinKWmrbT0g6/abtf3hr1i4RMWD/kXN9ElM=;
        b=K8JOA3UtuFz7wmY2QFY1LBuMBmeyqP9OmiCtx4j43oMi1Bv+XeYGVa2Ev/587/l//v
         2uoGSszh11mermIhdypoJzrn7pLlIHidDZZHmLlwpDTwAOd7c2ErpvPjwiWeNKpSfUiU
         ceKOnIN7hmHD8Jbg31w0LndBuKQlAq/NwxITHrOhUn2eY8IEEP46h6f0LPIKKNSe5Ok7
         vUj8RXNYsYN6URnK7OLO/mcH54JP/m8TJzvPrVMIwPS+Cph3RH4AdXopobYpJqOOhIdc
         yNQjoOqlZbBZvJdOHIHZSbpwVxNPALo7eP86QqaxOnJwYH572CbEHXIHHaTj+OTahY42
         TaCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785176730; x=1785781530;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6MdKCtNkfinKWmrbT0g6/abtf3hr1i4RMWD/kXN9ElM=;
        b=DeD8hAnz1X2MY5vcS76j/PyD0MbaAdAIiA0W6tL13Yc3XaA1lw2eUZMtkKJVFeuoAu
         70pni+DCB+rFlAAS1/tmiJAYGx5WyKSt34xUe+sAvL/vbBTWPta2esHh+qrpb+WO9CdD
         Zjja1w3Yrs9VEqboh9Zh9gxQIcXk5LAOPUfEPPR0AMsiygR8frxLmeXmWo3U2TT/kpTy
         3p4OXeSb/fTOPWMz/rzetF7Nx/2ZNYrzROOmX/pHcwmC0PDZWBfclcTSpKKu05usY/KR
         h/YtSQnNGpRzWBwpRvZnbYw1IrWdyCg78rpxfi9k90KbGJJk/6rr9fof6GQWsJypot3a
         OKkg==
X-Gm-Message-State: AOJu0YzWxV9EkIh6WsZhEpyyvdD7fpaAohn49d09bGrdkVhi219AxVEs
	skdRK2ZojBwD1m+5q4sgBlrbsy3f22kQvPMvIVe205gEedHXgWRcB3Vm
X-Gm-Gg: AR+sD10b1CzqqvsPYDId+AfqClQ/Wfu7ybAy2jUAXr2rLFoWVky7n5q1tEDXC04kEmA
	kc1gX3FqWtePufHiu0FH5GZlBgY1VWcyA/7RKtjY8AtSOdJdvWkPkF95q5ncznR7YJgux3tYTT/
	RH4XNcMFOgPJ8rL54pL23fBQd1UFLYy3mNoU+gcP/ihN/S1FHHDVV+LrrncnGiiOzoRGdXTs34C
	IE60FNzMzqiFeROj8dR909Vi8HffNEmV7whFvb+sxTVZhzZCzRGRudSrSkx56ec5hlJr8EalK1K
	vlfQV3e6cyeLRLo1NRTiml3NvEp/VL1BTxpmaioF7PvRA+A3GpXrCbcgdaiEBSFwHDvl5Z0cbWL
	C41vsOV1JP+JPNCXrGivCkhNXmg4qjiKKJYtN/QvlbuZlNBFthBePciZpETcQzTEI1BbZ3ecSmz
	ov81H3WX9QG7ZqjTb6qXOrY/c=
X-Received: by 2002:a05:600d:6405:10b0:495:518a:d95a with SMTP id 5b1f17b1804b1-496c4fd961bmr1777965e9.29.1785176730336;
        Mon, 27 Jul 2026 11:25:30 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c53052sm50689288f8f.18.2026.07.27.11.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 11:25:29 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Mon, 27 Jul 2026 21:24:19 +0300
Subject: [PATCH v8 04/12] mfd: zx297520v3: Add a clock and reset MFD driver
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260727-zx29clk-v8-4-7a107b00f1dd@gmail.com>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
In-Reply-To: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7335;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=Z0YfX8jUsZUimRbbgNY9xw3prHCkWNC3qnu0Cc2fWXk=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqZ6J6GBIxStOP2KyOvFMZI3ZqqqrsPUzMx3rxf
 SkqpfwB9OKJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCameiehsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiL6Rg/9HKudFEBi38W18LPvABhw8mKMW7IIpAl
 0ILwg2qJQNrPOUHvHTotO9J0d73FuEL24iLg0pjmdx2nqQl4IMHfJkD5rwIwYP2OnL4X7J5s7DU
 E/0w72F4KOIHa2jvq5C+zgscFuOmvPGExZScfzTllSdBttx6LNnOtQaeBrXysVah9xEYy2ziNI8
 vcLk5b5dkO0B/Dw+XNmT4EbzwnMW87Ifk4RmvS5y4ZWNg39liSUlUF+xH001Eev9MEsw1mVBD3j
 dJBTup4bk5lSkq0cUUjUoliB2525m7vIOofytPv3Jym7NfhxC5P9iCMBgkc+PW4HWNwoMvm35xb
 WWWuagQV1IHkjR9DppainyzbZqw41o7M+NNX8UYlmmWVlkYWsJFFgLE+SzWc1qbJSJ6UEYnXC5h
 EBO0Z4XzLT6hJOoCIMpVhfZy8NEXExFX7Qji1OuTUwJHVQdxVzWE4Z9h5nvxvTXIZXdFq6bMrUA
 42k+ilf4pj2GcdfmcwWf7d+5YskRoEiUDlkLCbe2wrwLOsLMbWWhmCMbrAz31ltVMugVPnTVCKx
 MIIB/8AbIPvVInM3i8wRn49/syaaUTW9kbLbSEAcMB+eNNpFE/JpswhjY8LsJ9JhFQtZmjDd+Yd
 xk4ZdLBtk50Dj3SqPj26fmXeRWT58M+faR4fg2B+p5R45FAItZX0=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This driver registers child devices for the zx297520v3 clock and reset
controllers. The clk-zx297520v3 and reset-zte-zx297520v3 submitted in
the next patches will drive the respective functionalities.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

What I am still unsure about: How much sense does it make to have this
module-capable and able to unbind: In practice, the board doesn't work
without this driver and its clock and reset children.

Changes v8:
*) Remove .of_compatible from PHY mfd child

*) Move to drivers/mfd (Sashiko)

For me either soc/zte or mfd/ is fine. Note though that this MFD parent
is very specific to the zx297520v3 SoC. I don't expect this to be reused
anywhere else. There are two more MFD-ish devices in there: soc_sys at
0x140000, which I plan to handle in the same driver, and an i2c PMIC,
which would get its own host driver.

*) Use PLATFORM_DEVID_AUTO (Sashiko). NONE was intentional as I only
ever expect one instance, but I don't see any harm in doing the standard
thing and use AUTO

*) On the suggestion not to put the link to mfd_cells[] into match data:
I see that it is spelled out in Sashiko's mfd.md, written by Lee Jones,
the MFD maintainer. I would appreciate some education on the rationale
behind it: Putting a pointer into the void *data is a common pattern in
the kernel. I don't understand in which situation this can possibly
break?

Both structs are static const in the same compilation unit. data is a
const void *, not a uintptr_t or kernel_ulong_t, so it seems passing a
pointer is the intended use. What am I missing?

Changes v7:
Add phy MFD child

Changes v6: Make the ZTE SoC driver section depend on HAS_IOMEM
(Sashiko). The entire MFD section, which contains MFD_CORE, depends on
HAS_IOMEM even with COMPILE_TEST.

Add a NULL ptr check for of_device_get_match_data (Sashiko). While not
uniform, rave-sp, rohm-bd9576, atc260x, da9052-i2c protect against
incorrect manual attachment that way.

Add lspclk here as well in an attempt to satisfy both Conor Dooley, who
asks for MFD for top and matrix, and Philipp Zabel, who prefers aux but
at least wants the reset driver limited to one driver type.

Changes v5: Use MFD instead of Aux bus for top and matrix crm because of
extra functionality: Reboot in top, hwlock in Matrix.

LSP clocks stay with the aux bus and are thus not handled in this
driver. The clk driver will bind directly to the lspcrm node.
---
 MAINTAINERS                      |  1 +
 drivers/mfd/Kconfig              | 11 +++++
 drivers/mfd/Makefile             |  2 +
 drivers/mfd/zte-zx297520v3-crm.c | 98 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 112 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 05322672b9b5..b04e9d43cfb0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3883,6 +3883,7 @@ F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
+F:	drivers/mfd/zte-zx297520v3-crm.c
 F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
 F:	include/dt-bindings/phy/zte,zx297520v3-topcrm.h
 F:	include/dt-bindings/reset/zte,zx297520v3-reset.h
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 35f6e9b76d05..c0c7e83487f4 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -2572,5 +2572,16 @@ config MFD_MAX7360
 	  additional drivers must be enabled in order to use the functionality
 	  of the device.
 
+config MFD_ZTE_ZX297520V3_CRM
+	tristate "ZTE zx297520v3 Clock and Reset Manager"
+	select MFD_CORE
+	default SOC_ZX297520V3
+	help
+	  Say yes here to enable the driver for the ZTE zx297520v3 clock and
+	  reset manager MFD driver. This driver provides the host device for
+	  the clock and reset drivers and is required to boot the SoC. You
+	  will also need to enable CLK_ZTE_ZX297520V3 and RESET_ZTE_ZX297520V3
+	  to build the actual clock and reset child drivers.
+
 endmenu
 endif
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index dd4bb7e77c33..4f6a78170ac5 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -303,3 +303,5 @@ obj-$(CONFIG_MFD_RSMU_SPI)	+= rsmu_spi.o rsmu_core.o
 obj-$(CONFIG_MFD_UPBOARD_FPGA)	+= upboard-fpga.o
 
 obj-$(CONFIG_MFD_LOONGSON_SE)	+= loongson-se.o
+
+obj-$(CONFIG_MFD_ZTE_ZX297520V3_CRM)	+= zte-zx297520v3-crm.o
diff --git a/drivers/mfd/zte-zx297520v3-crm.c b/drivers/mfd/zte-zx297520v3-crm.c
new file mode 100644
index 000000000000..3a4f6cd0756e
--- /dev/null
+++ b/drivers/mfd/zte-zx297520v3-crm.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Stefan Dösinger
+ */
+
+#include <linux/platform_device.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/errno.h>
+#include <linux/of.h>
+
+struct zx297520v3_crm_data {
+	const struct mfd_cell *cells;
+	unsigned int num_cells;
+};
+
+static const struct mfd_cell zx297520v3_topcrm_devs[] = {
+	{
+		.name = "zx297520v3-topclk",
+	},
+	{
+		.name = "zx297520v3-topreset",
+	},
+	{
+		.name = "syscon-reboot",
+		.of_compatible = "syscon-reboot",
+	},
+	{
+		.name = "zx297520v3-usb-phy",
+	},
+};
+
+static const struct zx297520v3_crm_data zx297520v3_topcrm_data = {
+	.cells = zx297520v3_topcrm_devs,
+	.num_cells = ARRAY_SIZE(zx297520v3_topcrm_devs),
+};
+
+static const struct mfd_cell zx297520v3_matrixcrm_devs[] = {
+	{
+		.name = "zx297520v3-matrixclk",
+	},
+	{
+		.name = "zx297520v3-matrixreset",
+	},
+	/* A set of hwlock controllers is found here as well, but no driver is implemented yet */
+};
+
+static const struct zx297520v3_crm_data zx297520v3_matrixcrm_data = {
+	.cells = zx297520v3_matrixcrm_devs,
+	.num_cells = ARRAY_SIZE(zx297520v3_matrixcrm_devs),
+};
+
+static const struct mfd_cell zx297520v3_lspcrm_devs[] = {
+	{
+		.name = "zx297520v3-lspclk",
+	},
+	{
+		.name = "zx297520v3-lspreset",
+	},
+};
+
+static const struct zx297520v3_crm_data zx297520v3_lspcrm_data = {
+	.cells = zx297520v3_lspcrm_devs,
+	.num_cells = ARRAY_SIZE(zx297520v3_lspcrm_devs),
+};
+
+static int zx297520v3_crm_probe(struct platform_device *pdev)
+{
+	const struct zx297520v3_crm_data *data;
+
+	data = of_device_get_match_data(&pdev->dev);
+	if (!data)
+		return -ENODEV;
+
+	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, data->cells,
+				    data->num_cells, NULL, 0, NULL);
+}
+
+static const struct of_device_id of_match_zx297520v3_crm[] = {
+	{ .compatible = "zte,zx297520v3-topcrm", .data = &zx297520v3_topcrm_data },
+	{ .compatible = "zte,zx297520v3-matrixcrm", .data = &zx297520v3_matrixcrm_data },
+	{ .compatible = "zte,zx297520v3-lspcrm", .data = &zx297520v3_lspcrm_data },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, of_match_zx297520v3_crm);
+
+static struct platform_driver zx297520v3_crm = {
+	.probe = zx297520v3_crm_probe,
+	.driver = {
+		.name = "zx297520v3-crm",
+		.of_match_table = of_match_zx297520v3_crm,
+	},
+};
+module_platform_driver(zx297520v3_crm);
+
+MODULE_AUTHOR("Stefan Dösinger <stefandoesinger@gmail.com>");
+MODULE_DESCRIPTION("ZTE zx297520v3 CRM MFD host driver");
+MODULE_LICENSE("GPL");

-- 
2.54.0

