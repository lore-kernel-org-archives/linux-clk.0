Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FB0525A60
	for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 18:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790188185; cv=none; b=IpQkFnouw6UeQR3QllzaR+R1Vp+vKlAzt9N2Tm1F32YK72Cv54mN2s+oq4snDqv59moO71WGXv/5N8JWC9Uhu6ktkP7fEFCmQrnpE//dJC/aZ4lVLXkK+CmgmxKKh+Y+mlMc1kbeuTdzv7bLawRA39f3LQD62DQAhhdB+7kO+CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790188185; c=relaxed/simple;
	bh=s5HodUNMsgVfadsLU+kfwam1IXupbWUWoFUS3o1DP+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ULL2ug5eKbwtWVYYmaNVIgnXi5DqI7zB+JF8OobQjon76eSdM7ndujkUwwZIODaD9L7gvRcV/JTm3EBWXL6o8AFoCr9G6yltFJNr7kP5Y6VYHwnZ71cm1+Q29wVlEQRzm06PonTh8ywyTLHgvyXz4O1Qkd0ezkqRk1BgCKmG9PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=erED7kON; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="erED7kON"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so6506725e9.1
        for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 11:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790188176; x=1790792976; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PdyX3EEf30yF/3DPJtb+gbDDLL1RLvfzlS4iMTV7KW8=;
        b=erED7kONpBRv7MhWcQzvTNgvRxB5P1dFx6Gyw4bpjTdPmh9W2QxfPOaWSFvq48nYad
         fYhNQbK9ZHsmOA40zpHfu2nhkv3KUcTffrsu8BPe83o43g2A2jXlu1zCHpecWZSOoKtQ
         vhXbabiS9KsjyjNWVVbVMeNrw6BlJWHuaxw+IQEtES5fTgqdYJ7sGoVjDQYL53ROPUzw
         eEtTB18QEZdETkfp1T1Vk0zEmeh6+XIrjesZjlVn2BVW4LG28jgiJdfJ27WiifIM+cDB
         Hu2e3kN8Eqqrpd1Nf6WnKPcfmDdroXftXOQm5WO+4YyOdxGia1ullHy6PMNuu/XzsoYL
         KiCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790188176; x=1790792976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PdyX3EEf30yF/3DPJtb+gbDDLL1RLvfzlS4iMTV7KW8=;
        b=kJ1yzhwRO//8HUAMWZTS3XfF05BpfR/3+FNRv+J8cw2Nh6r16TVI/XrKIG4pM4XEMV
         XIMHLPx96XNW/jMtGdcviBmkU1QvOsHlNYE2VSQh+eXRxBWt2XN62nfraxmNw8WLZSGS
         wdn46iO/nrqOciVmlwMecWJcKXBdjOvXPBWycscgvG4Nfh1PvBPQCL75WFtcQ/2zytid
         5jb6+RuFvAMyP/2IQBjaan4fOmVYtFbL5MjJwMXx3P5YMypHO6d92Y/EqfoDAT9dq+Ax
         wvvpuWXz2OPnB98LtqIPY7HxS9NrKtUu4xnc4g0Mn9/wuQBO74Fp/47PcLaCidj+FnEK
         CfcQ==
X-Gm-Message-State: AFuF++n2u+M5g2aP5Nw+MY3TViHJw3oZMkDTMxLfWQV1RxXKoEFDfWU7
	Vy4Qgwqp7iencg2kgf3FtqTzB9WOoncGqfcIEgEc7kxTC1fzqi7SYVFf
X-Gm-Gg: AYBFou3XiRpBcCr4WooYHHzoNUlbCRUuY/SHEiV5iWugJiKNJ0qSSbnPy6r0OBGDqug
	4QhNv/TTYATdEpWsOqzqmTWoitt7MVGkMPddy/auBrEkWJ5t4o9LEOGdIagTJwJq8x+0MBppXT+
	bbur28QE/mN3mK4xQchLAQoNQkZ+BEjhk9nHch0QgKgXKABzqqV9vW/Tm5Ao78J4McpUkCBKjCQ
	EHzoIoI9rLycRuG+eDu1y3Y9FaDGFY8SOfH3G3FvKnU1Okc9Kbj9pBkRqniywM/8SqIn7OZRrW5
	sL6ClP1qUOz30IOraZ4DyMt94Db6tYyIXaVxCnPiwIAfSpzyXf/+aYujKbyGuS6k2nBo+NDcHm7
	yLak7lufH+ELHdGeJmG1gpf1oTqCGVVShm7G14VP+kNAMRvz2NGkIxvdKExGyugut6mmiJ4+hw8
	fsD+uTEISZvAesDcvmTQIK+4Y6zqDDsXqGmpqP699oWTPDQXhGL0ylrG3yQAAG/u8LcoI3E+mg6
	jEXRE7+NJJgngSvstKZtXgHNko=
X-Received: by 2002:a05:600c:35d1:b0:49f:e441:d61f with SMTP id 5b1f17b1804b1-49fe66eb27cmr1339885e9.21.1790188175962;
        Wed, 23 Sep 2026 11:29:35 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd3d5csm4711835e9.14.2026.09.23.11.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 11:29:35 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 23 Sep 2026 21:28:50 +0300
Subject: [PATCH v12 04/12] mfd: zx297520v3: Add a clock and reset MFD
 driver
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260923-zx29clk-v12-4-9c243796b6d2@gmail.com>
References: <20260923-zx29clk-v12-0-9c243796b6d2@gmail.com>
In-Reply-To: <20260923-zx29clk-v12-0-9c243796b6d2@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9208;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=s5HodUNMsgVfadsLU+kfwam1IXupbWUWoFUS3o1DP+I=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqtBpt1ByKJAE9q1EduahR0o+Q4jdQQ5IANZ1Z0
 qo43IQbqpGJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCarQabRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJXkg/8CwRN66JobMfslLxMkaj/shxoPv0Hz4+
 dQE7Nm/6oEQ5OYK7QvniGDKnpBXl5D+dxEg4mxngE5G+0TcjR2lYsuIsKuFg91swzsLSRF8pSvl
 vovQIYeCmk/mpl6McTalFBbl/LljtcmfoGXYazWup9fjurUK8RPwAGMs9uOQ7gFZCgQtn9KnoVh
 hkCcQLHAyilMerz4mpCLob9qx7Qn5T6AdADPswG4KZn1RxsWsv/aPWBSJsGIHcj8d6ufnEpMxhQ
 rGYywFVDACH2134tUPFImYUPqUzNCTL0Z55vp6+xHPCDKOBqBpVXR8lUlLOP4HhTzQm/fiilLO6
 PC63yaTmhx2LQEz4ATbzlC6HRkxQpKDT/dcclkTXstNngP7ib5wIBddMK13Zw5/H6hVtZN8tziD
 WFJuiHVNisH5cbbna4KlZePs+A0Qsq2tQocbLZWpAwVzBs4Kn2ZHhmM7XYGf7ehG4Vsntctl3H8
 oFbVDuey5JNqcwoVv6h4iNLMQiAfP5hgEfYNyPQx8Azpbd2zbHB+Hq0mXAWM+lbIJLR9pqTtz+W
 yw/CCYz+/LXUsfQt9Wi1GH2knyG1YJq99Tv5wHJ5f1q56CnzRrAWP467b+9ZC6bGwLO4I4t/xAU
 p5Wto9d3FlPDBt2/0cMfzNOA9h/evatbWApVD6AvHBxYzRUQjsco=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This driver registers child devices for the zx297520v3 clock and reset
controllers. The clk-zx297520v3 and reset-zte-zx297520v3 submitted in
the next patches will drive the respective functionalities.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Changes v12:
Added comments elaborating on the role of the driver and the hardware.

Regarding the names: zx297520v3 is the SoC's name (chip marking, boot
messages). TOPCRM, MATRIXCRM, LSPCRM are ZTE's names for the MMIO blocks
in their downstream sources. Sadly no datasheet is available. "clk",
"reset" names for the child nodes are mine.

Regarding personal copyright: I am not affiliated with ZTE nor paid by
them. This is my personal hobby project. I am using knowledge extracted
from ZTE's kernel dumps, but not code.

Changes v10 (All Lee Jones):
*) drop "select REGMAP_MMIO"
*) Drop comment about unimplemented hwlocks
*) Use MFD_CELL_[NAME|OF]
*) Renamed the device type enum and its values
*) Use device_get_match_data instead of the of_ variant
*) Improved debug messages

Changes v9:
Deassert the LSP reset and enable the LSP pclk here. In practice the
boot rom needs to do that because it prints to an LSP-connected UART and
reads the boot policy from the LSP connected flash chip.

In doing so, I migrated the match data to an enum as mfd.md suggests.

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
 MAINTAINERS                      |   1 +
 drivers/mfd/Kconfig              |  12 +++++
 drivers/mfd/Makefile             |   2 +
 drivers/mfd/zte-zx297520v3-crm.c | 111 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 126 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 06dbf9305518..41c287316d0e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3927,6 +3927,7 @@ F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
+F:	drivers/mfd/zte-zx297520v3-crm.c
 F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
 F:	include/dt-bindings/phy/zte,zx297520v3-topcrm.h
 F:	include/dt-bindings/reset/zte,zx297520v3-reset.h
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 857ca3bb0d5b..b30600f6ff0c 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -2580,5 +2580,17 @@ config MFD_MAX7360
 	  additional drivers must be enabled in order to use the functionality
 	  of the device.
 
+config MFD_ZTE_ZX297520V3_CRM
+	tristate "ZTE zx297520v3 Clock and Reset Manager"
+	depends on ARCH_ZTE || COMPILE_TEST
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
index 72d3944b0ad8..ab0cba2042a2 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -304,3 +304,5 @@ obj-$(CONFIG_MFD_RSMU_SPI)	+= rsmu_spi.o rsmu_core.o
 obj-$(CONFIG_MFD_UPBOARD_FPGA)	+= upboard-fpga.o
 
 obj-$(CONFIG_MFD_LOONGSON_SE)	+= loongson-se.o
+
+obj-$(CONFIG_MFD_ZTE_ZX297520V3_CRM)	+= zte-zx297520v3-crm.o
diff --git a/drivers/mfd/zte-zx297520v3-crm.c b/drivers/mfd/zte-zx297520v3-crm.c
new file mode 100644
index 000000000000..d896261a4d40
--- /dev/null
+++ b/drivers/mfd/zte-zx297520v3-crm.c
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Stefan Dösinger
+ *
+ * This driver splits the ZTE zx297520v3 SoC's clock and reset management devices into MFD child
+ * nodes that are managed by independent drivers in their respective subsystems.
+ *
+ * ZTE's downstream kernel names the mmio regions "topcrm", "matrixcrm" and "lspcrm". For an
+ * explanation of how the controllers relate please see the DT binding documentation found in
+ * Documentation/devicetree/bindings/clock/zte,zx297520v3-*yaml.
+ *
+ * The controllers are primarily clock controllers, but they all have reset controls as well. Top
+ * and Matrix controllers have further auxiliary functions.
+ */
+
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/reset.h>
+
+enum zx_device_type {
+	TYPE_INVALID = 0,
+	TYPE_TOPCRM,
+	TYPE_MATRIXCRM,
+	TYPE_LSPCRM,
+};
+
+static const struct mfd_cell zx297520v3_topcrm_cells[] = {
+	MFD_CELL_NAME("zx297520v3-topclk"),
+	MFD_CELL_NAME("zx297520v3-topreset"),
+	MFD_CELL_OF("reboot", NULL, NULL, 0, 0, "syscon-reboot"),
+	MFD_CELL_NAME("zx297520v3-usb-phy"),
+};
+
+static const struct mfd_cell zx297520v3_matrixcrm_cells[] = {
+	MFD_CELL_NAME("zx297520v3-matrixclk"),
+	MFD_CELL_NAME("zx297520v3-matrixreset"),
+};
+
+static const struct mfd_cell zx297520v3_lspcrm_cells[] = {
+	MFD_CELL_NAME("zx297520v3-lspclk"),
+	MFD_CELL_NAME("zx297520v3-lspreset"),
+};
+
+static int zx297520v3_crm_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	const struct mfd_cell *cells;
+	struct reset_control *reset;
+	enum zx_device_type type;
+	unsigned int num_cells;
+	struct clk *pclk;
+
+	type = (enum zx_device_type)(kernel_ulong_t)device_get_match_data(dev);
+	switch (type) {
+	case TYPE_TOPCRM:
+		cells = zx297520v3_topcrm_cells;
+		num_cells = ARRAY_SIZE(zx297520v3_topcrm_cells);
+		break;
+
+	case TYPE_MATRIXCRM:
+		cells = zx297520v3_matrixcrm_cells;
+		num_cells = ARRAY_SIZE(zx297520v3_matrixcrm_cells);
+		break;
+
+	case TYPE_LSPCRM:
+		cells = zx297520v3_lspcrm_cells;
+		num_cells = ARRAY_SIZE(zx297520v3_lspcrm_cells);
+
+		pclk = devm_clk_get_enabled(dev, "pclk");
+		if (IS_ERR(pclk))
+			return dev_err_probe(dev, PTR_ERR(pclk), "Could not get 'pclk'\n");
+
+		reset = devm_reset_control_get_exclusive_deasserted(dev, NULL);
+		if (IS_ERR(reset))
+			return dev_err_probe(dev, PTR_ERR(reset),
+					     "Failed to deassert reset control\n");
+		break;
+
+	default:
+		return -ENODEV;
+	}
+
+	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, cells, num_cells, NULL, 0, NULL);
+}
+
+static const struct of_device_id of_match_zx297520v3_crm[] = {
+	{ .compatible = "zte,zx297520v3-topcrm", .data = (void *)TYPE_TOPCRM },
+	{ .compatible = "zte,zx297520v3-matrixcrm", .data = (void *)TYPE_MATRIXCRM },
+	{ .compatible = "zte,zx297520v3-lspcrm", .data = (void *)TYPE_LSPCRM },
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
+MODULE_DESCRIPTION("ZTE zx297520v3 CRM driver");
+MODULE_LICENSE("GPL");

-- 
2.55.0

