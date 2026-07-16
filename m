Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03A53C8717
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 21:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784237774; cv=none; b=aYMWABZH5ry3hMi7FHA8gsdlTlrtqE+LmO/MU2A3vcXrQNXRkF6cmVmN3GvevbqCjn9XskPiNDH6pOwGkHh6mc6XUR0CN8vgVrDHHAwSfOxlWce6AJihp0jhWWK5l4Ke3/ZgHJxhtFfMJj8cnnwAQxqKb4IcnVIflL+eWiL3xh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784237774; c=relaxed/simple;
	bh=2mYvcwfD2/84sfiGKwxlDrpz4RSNk3vhfW5QKBkhpwQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Klxia0X6kzN4sti4fZonH5lpzX/JX4UKehUpDeMJvRw4ANDSaXUERZRnsz/aHwhZtPxjdKZq85HNmfOPClMJ5e41AMbk+IhqSMKNld5gzgn8qsRCHl85BEBsYetuK8hnXwj77tVrQsyB5wD26STztdRQ1WCJn/D8vJ9Jw/Rx1a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sjdbQsm/; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sjdbQsm/"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4798bea72f9so3756898f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 14:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784237771; x=1784842571; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RGGKwNQS8rE2EFNG1SfW+LC4ffRUcLaY6ky+4U7wPJk=;
        b=sjdbQsm/9M9giToUHwTreDyfJkvd4ZrLoluKC5BSgKKoakyMZ5/osIlCpJ/LPTFhRU
         3cCPZ7VrMqQfj+s6GfK/j+WKHewV/Qm5fxLVl65PfEy380GFQyidg9NTsvoYLDnKns07
         +4aamLfXIt735wi+dv3BrI/KmFg2x7liTPaNroCRT6XMUOTFuIHudx2s4IRpFxn1TRj/
         s3cRjwqNiQkFurGDxYG514MoOMpRnh/jbgAtOE/NNAgnG3higtB9j+p2LBUPDSaXyw57
         tGWEoFCAwAycg98wp7gE3RIyKyHl9AviF4yaF4LVYXRBiVBosxQEEOwHmRmAYiXlFwAn
         VENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784237771; x=1784842571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RGGKwNQS8rE2EFNG1SfW+LC4ffRUcLaY6ky+4U7wPJk=;
        b=ed5N02hK6KpomtAsKKyyYuOF611Wu+MkV7+h7IjgVppenQh8CzhXZLEymnm0yTJMJO
         859FTfQpQrrqbE7NDbAM1jFLiVOfGg9Rz8aceT8Gu1JeHqn4w3hEGLnbFwaMtrhBrgq8
         Q34Td4TEh4bGHvcr675Hg+Td4eAqFMK1kkzG1bXB+KM/LhKbY8GwHcWXhEqdX2gBbnMo
         8znrpGr+z0HsZgxCwsAXGtX+dxE8qprkbaMIVslEvoC+woawI/4KnPsh3U9bLrmv8HVg
         GJ2Bfbt0s2UwSZbME6eQoRvXMbRLAA5X3CIsdpu+tBzcXPLpIglElTfgEpmTCrbci3ZD
         ZYrA==
X-Gm-Message-State: AOJu0Yx8r7OmSpXZ7U3xq92hIz1lHRClGCuN6IY3JN9bVmnaJ3n8eLPZ
	Lv00Ghw6eF2KwwRmZRyFjmknG2eIkyy7QM6rrV9wPcf6RaOwy7UVwNI/
X-Gm-Gg: AfdE7cmoozH+8PkOWztI5mj161wHFO3KjsnRjEVnv4HiatFOlVGRhdeMp4AzfH/1gMm
	bs/fmXt4QXTYOCyZAkgRP6K3WDfEHPYpfMiwqMXxK9sZ7DzYjQxlwziAXlmk2i22RByO5Rt/NUV
	3HHv+51wMGW6K2Q1uEbUeMcC68pXBDAdjdX+yi9HGohWCc7M0H+huoPvlNE0fthQyvAs87x/kXR
	nWbb91hcyKzjFnHrrRQ5Cywqy70x+4aA8tow9KEai8PX8pdYsqoy/w7Rjk+YDBeZwPCa3bP/G37
	U7E8JV/FIDPyQ3SXBtbFPM3ttwc2GXiVJpQean/xUOAqiNOavRBOSlsuG/TeWfi2mo90tFr/exv
	4k9y1Rrnwct0kSpu9BC17fKUWn8mhWZQ1VO9uHEGzxiozcmL5wubeDEdAAlyAhTX2yiamaC/qMU
	bRkGuK0wGYmUrE
X-Received: by 2002:a5d:5f55:0:b0:47f:5567:19b5 with SMTP id ffacd0b85a97d-47f55765ccfmr8162327f8f.29.1784237770976;
        Thu, 16 Jul 2026 14:36:10 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464b7f09sm27517548f8f.26.2026.07.16.14.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 14:36:10 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Fri, 17 Jul 2026 00:35:41 +0300
Subject: [PATCH v7 05/13] mfd: zx297520v3: Add a clock and reset MFD driver
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260717-zx29clk-v7-5-408411cfcf36@gmail.com>
References: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
In-Reply-To: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6631;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=2mYvcwfD2/84sfiGKwxlDrpz4RSNk3vhfW5QKBkhpwQ=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqWU6xjOd7pc5cdAkEb0DBDo3qus4da37vTAruc
 GGmlJG9IXmJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCallOsRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKGHRAAoS2DLKD2/vbCxKerpZKCDtshILMZB7C
 oHbpCgwrJFOqpFTY+SgxgovJnf52uLrH9S2mkq54vEp1Alqvsx9mrb0V30xi53hvCNhd+TC82zv
 0Toqnqe1BlZ3Q/U9r4cron+6lM3gG8ZB9osO79lpAnct+c+qvsJX0W0e16zktj7IcfwjyLabapf
 LoOU77cCV1zY4pcuzxJ/zgfRS8RM0+tpU3sX8c+dX6dVFlx4lbooVt0/lY10GoDU/xQaDoqdP/1
 rgL4oRqmmygZr9dabI++hf00epfRgqxnUzJydnDy9Gncd38mwIFwbs3ROb6uqWFOlNlTX2CwpFt
 d3BXDf78VW4Y0vlJ3YVltScH2kNCsvJyC1MV6htlSsivYbx2YPmKENfBB88bXa7/s3912BvkmHs
 r9VTd6p30jSH/3MXSHXkFSw6jRVroRAqxVgywOfFWHPGQPa22QA5C3cb/HzRGQB+cwqPovATMuX
 V8YVPm9I8eZI7N8luqqQsbpAwzFjXVnpjW6iUgqH9Fug3iMWYDyMQKrYetsNEL10S53Za34O06B
 9wXyy6U0qCWBOIC9IRUD9dF0/Ze4b9DOWSf4vNbCnxvoxOJdkzvhu2Hv0ktQrx7vCYh0Hkvcahl
 fa8OoLIPgM2j16fnDKtRKBjbpn002VphYs3OAZNMz+asrd0Q5w0I=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This driver registers child devices for the zx297520v3 clock and reset
controllers. The clk-zx297520v3 and reset-zte-zx297520v3 submitted in
the next patches will drive the respective functionalities.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

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
 drivers/soc/Kconfig              |  1 +
 drivers/soc/Makefile             |  1 +
 drivers/soc/zte/Kconfig          | 20 ++++++++
 drivers/soc/zte/Makefile         |  3 ++
 drivers/soc/zte/zx297520v3-crm.c | 99 ++++++++++++++++++++++++++++++++++++++++
 6 files changed, 125 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a135ec070314..6ca3312aa746 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3884,6 +3884,7 @@ F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
 F:	Documentation/devicetree/bindings/phy/zte,zx297520v3-usb-phy.yaml
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
+F:	drivers/soc/zte/
 F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
 F:	include/dt-bindings/phy/phy-zte-zx297520v3-usb.h
 F:	include/dt-bindings/reset/zte,zx297520v3-reset.h
diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index a2d65adffb80..5cc1ade4ce52 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -31,5 +31,6 @@ source "drivers/soc/ux500/Kconfig"
 source "drivers/soc/versatile/Kconfig"
 source "drivers/soc/vt8500/Kconfig"
 source "drivers/soc/xilinx/Kconfig"
+source "drivers/soc/zte/Kconfig"
 
 endmenu
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index c9e689080ceb..63b3f340256c 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -37,3 +37,4 @@ obj-$(CONFIG_ARCH_U8500)	+= ux500/
 obj-y				+= versatile/
 obj-y				+= vt8500/
 obj-y				+= xilinx/
+obj-y				+= zte/
diff --git a/drivers/soc/zte/Kconfig b/drivers/soc/zte/Kconfig
new file mode 100644
index 000000000000..0e954e6ce2a9
--- /dev/null
+++ b/drivers/soc/zte/Kconfig
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+if HAS_IOMEM && (ARCH_ZTE || COMPILE_TEST)
+
+menu "ZTE SoC drivers"
+
+config ZTE_ZX297520V3_CRM
+	tristate "ZTE zx297520v3 Clock and Reset Manager"
+	select MFD_CORE
+	default SOC_ZX297520V3
+	help
+	  Say yes here to enable the driver for the ZTE zx297520v3 clock and
+	  reset manager MFD driver. This driver provides the host device for
+	  the clock and reset drivers and is required to boot the SoC. You
+	  will also need to enable CLK_ZTE_ZX297520V3 and RESET_ZTE_ZX297520V3
+	  to build the actual clock and reset submodule drivers.
+
+endmenu
+
+endif
diff --git a/drivers/soc/zte/Makefile b/drivers/soc/zte/Makefile
new file mode 100644
index 000000000000..090ba8aa06c1
--- /dev/null
+++ b/drivers/soc/zte/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_ZTE_ZX297520V3_CRM) += zx297520v3-crm.o
diff --git a/drivers/soc/zte/zx297520v3-crm.c b/drivers/soc/zte/zx297520v3-crm.c
new file mode 100644
index 000000000000..8b82ccba4e90
--- /dev/null
+++ b/drivers/soc/zte/zx297520v3-crm.c
@@ -0,0 +1,99 @@
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
+		.of_compatible = "zte,zx297520v3-usb-phy",
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
+	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE, data->cells,
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

