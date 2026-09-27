Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE2F3BE650
	for <linux-clk@vger.kernel.org>; Sun, 27 Sep 2026 20:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790540053; cv=none; b=PbcjIll+Md4rw683BQ9pktdlpbJPzcAOImXecWVV9XZfTczAt1O9QcxXM6Og0Nmp7/dCm8Yns0reOeJB4Xbf5Ti1aVrNqDbWSg3I8E/fBBXZP4yg5uluS2/1kOpiDqRbrBxTwxPAizd00VKUOr13x9iH1bgAyP96BKXSXToKw4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790540053; c=relaxed/simple;
	bh=/no/lvHVLlUeWbGnAU42PbuF5Flsu1tg3CcL3JrVyrg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YPOEh5BICf6ef1LMSuyQbDw9lqqZvK9MFroa0sbyu9BjnpM7Z88g9fT0slY90+q6NiKkojhzwDcO4qz29vofvsN5nvHe2DxTtVuIdiXGpvnzD/oBXqQMwpSeNGJOD+pNhZ4HMfKupV2DlxvtbC1EWEI4j/G0eS/BKAy7vA2bKeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=REn2NDca; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="REn2NDca"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885d4825adso1385842f8f.0
        for <linux-clk@vger.kernel.org>; Sun, 27 Sep 2026 13:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790540050; x=1791144850; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gUceZn+ZYo9pcUVc5KdBZXypYMxcrBpVlO1tu/ti/Bs=;
        b=REn2NDca0noUNtr12PHxD1bZgFxIo8cfc2gc9gUv7D4VHk9LUvlI4rcT8b4E2pHXXg
         SwmwmqEPzcJ10FUFFCruymSPYyzWGOjBAbIW0MYid//7py92+Y/BbdxPf9kuBb64iPf7
         52Lt3KVomAWnpdEwqyrTaBTJt2R4pcjh9XU63Vqrx50lhLcUkJV6V93J+Bg1lT3cIolb
         BN85zSXqQeaIs5hrZa5gKOmDvepx8A8561QrG88DCfYAjEnSLNTq2IeUnfR6yUuQcotB
         LInkCm88V25CaZkJsutmiAWmQiXcgBKL+8Z5lXIRQhFI1m1rB7XppcPVQSQoCPxGJ0b+
         oE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790540050; x=1791144850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gUceZn+ZYo9pcUVc5KdBZXypYMxcrBpVlO1tu/ti/Bs=;
        b=RFmHJCRWLF7JKEsrSWYoEEXHLr8nrElL09yf8d2ryczEMYwxZYknXyma4BUloFH0HQ
         fRULqycIhcCQZTppRIRpgHwxmSsEf+posv4A0gD19kkODFZ1QWCot9kxszLedGyL6cMl
         s8NG6ergMtMmRUX4kUE6XuzBDn8QomQVzVCuXK/wFP6CuzpneWOYc3jNAsF047aaGmFL
         C2UrTu+jK+zSpkoafCuRKFivcJl3NSEEFwcHMrUk4uKMY9L2sm4oTna9JPoQduvaFDcI
         uJ6MVeXLvhWgykw5GbjEa4Eb4CnPwodgGRXRTbLyJhF61uUnTmsUtXf64gJFvxS9IEGJ
         9kHQ==
X-Gm-Message-State: AFq9FYJvnN8lwIYKdsKR+jkJwYQ6/swG8V5Q+vNRgAisHy92d5AkU1Mn
	GnXRNINnLgJAjeNhzWkIiEd515ctPywNHOOR2+td7oLO4AuDTmkj6qw1
X-Gm-Gg: AYBFou39SOvn6u05Wc4F7Bnr06uEuH+iDG4pmJKO1VU3LchAzAbYEdfMfhDSJOTpZtb
	RGdK7d8OL+l1zJo6ALuG3e1uYzGm8CBoYegLABGOKDlrjsBid4ZXDl8S7JxOKT4sk5h5DttPL0i
	6/pytw0h6Gj3cws7SJbZo1c5zf4dLJpLhu+Y9UVBJiOw9NnJp6lPRCRBZzDuOqs64a1OZhHegtb
	ZCezn8bbOhpK9k3/4pJl78RL6zG4wTrKh4/ieldWY1l3wJykdbGSAP9V1skYuGGXZuOahd1rFSw
	lFZ64BYTBKm21zX3y15oJTDs34f5bqbdXr0TkFX+h45s92WTXP6bUvIvspJeIl8gvXr1GqIs+IK
	OdnAcpo+Pk9Z0q6Trt1JE4tD+VtI9Na7H3K5O4rxsVXmveSgr1OqhyvjrRt7I6GoE9QKW7U6gsP
	OUY1nq0jOGapaKve6DeoEaQbX1RKe/JAv6gl0m2A/Gwf7wftRAq6nS1gqTTjpa0QVBvTtRdxgxT
	QOjPILN
X-Received: by 2002:a05:6000:41cd:b0:487:11e1:cab2 with SMTP id ffacd0b85a97d-48871770959mr20219237f8f.49.1790540049588;
        Sun, 27 Sep 2026 13:14:09 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.96.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a570sm21781514f8f.13.2026.09.27.13.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 13:14:09 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 27 Sep 2026 23:13:32 +0300
Subject: [PATCH v13 04/13] mfd: zx297520v3: Add a clock and reset MFD
 driver
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260927-zx29clk-v13-4-70d8f673386c@gmail.com>
References: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
In-Reply-To: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8980;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=/no/lvHVLlUeWbGnAU42PbuF5Flsu1tg3CcL3JrVyrg=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBquXj0QNoX0bL63wDmSkceKLeek0stm0x6V3s69
 TBoK7EkItKJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCarl49BsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJxWQ//XKrkasQ8YHRwe4KgOUdIdG2jjoKtOJZ
 PVGNYax3DmGwp26f7jpencxIgUzrpsOCUdA1mC3FOyn3mExcTKhKRKk541/ZX3brYFTo99xI9UY
 prO/q08JBDERLdiNC3OPXk3t2VQJ3da09n7P5WF0A9cgMmCSi3R126qONV7HCzAMUA0DxI51AZy
 FgfmarQIjksqanVdVxhQH8DQvvGHwDBoyNhRpRSqsMOwZmbr+iXCAAEbbMPpbln5vMilhuf29zi
 8+M9CapoBof/1C+oe4ja+VzXLd7ZXXQEhB1DAGxD6rbXoOmlWmOwsvxvhOY0OemjpzAM/0Ud5TB
 MBUjpu2dbIwH2/Guk7kwJQDy0tCRFRu0mcQs2YbI2uGirGJcd/0e7FhTR+dcnYyF4rKRrEKSs2r
 k5Q2yGMCrG6B1Q31JeUEIPpTvRJAT9FnfA1HDGQQguoXVebUNJb6kU0HpQiIZ0LNbs4R2z0UjjV
 Pa8LRWtBlQFHZupcDGjKLXxtin0fgwi0AG4kbmkBdB5YnCejDbdCo941jdNOxielJpoRk85hbst
 IHZ5CwXLvxfGsFaEY/v8ETQXrpCpbN6KCR+U36COPVGb2jbT0zVay+ALT4/ybrR4hVm8EvfHSqQ
 uVPth0snLfebuqNc+ZqcWzWz7AQWh1WdZ7hS+LsDp9U71VffS8xQ=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This driver registers child devices for the zx297520v3 clock and reset
controllers. The clk-zx297520v3 and reset-zte-zx297520v3 submitted in
the next patches will drive the respective functionalities.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

v13: Break out the MAINTAINERS change so Lee can selectively apply this
patch. I made sure it compiles without the DT binding headers.

Lee, if you prefer, I can send this patch with the MAINTAINERS change
folded in stand-alone (or as a pull request). It'll have to tricke into
the clk tree before I can PR the bindings and clk driver though.

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
 drivers/mfd/Kconfig              |  12 +++++
 drivers/mfd/Makefile             |   2 +
 drivers/mfd/zte-zx297520v3-crm.c | 111 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 125 insertions(+)

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

