Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED2C3A7F69
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 20:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783024126; cv=none; b=RQrrP+z0ubdF1jgrlaPvI6Ew0NXuhrqB2Qdyzcf1/X1/KlkHfUOKVCmUXqfPpOQGR7831IbqfmTyrx87qfGthXLkGlqsvMGpYEQbNCxNWzGQqeMT/+thn5pfmGUoiquCemsvUACmlXUQ2K546mU8fMYTdVrfDdFb1RRL0bpfEHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783024126; c=relaxed/simple;
	bh=SSMHO6cIUYBr1MVMkwR3oQf17fjQW/+JOMa33c7U35Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kjZTbUUX9WrlasC3FH+SJPylu+BT3JCVenF3jBxQ8tGloOg3VJh3k7GrXBbCf9ADmUSbYm+5PWXTVgCqltP/y8+97mhFv4XCPbKe/9M7FWvHlxQ1NfTUDHFSVZ6cN19Sddd4p7vyEWtTGrAg7U/IFmCDiKBmK+dkAEcFzcKQTHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mAM9DrM+; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mAM9DrM+"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so15694355e9.0
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 13:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783024123; x=1783628923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZOKT26jBGh68jPAdZ7KHiuveH8OGcC8aSvVaWD7EghE=;
        b=mAM9DrM+/lfT/JrE/TI1XLq3e6Q7+HH89jmcytDKr7fH0shHGcDIQhCNjSnfn+9LXy
         CEvnpVx3laBXxvML+VjlfPqiUISZjq2uU6irqvLRTKxjpKhFdlcWq8HQDeDJ4rkQBosY
         eRkFx4eU8cQSrvA042C+jS0s6kv58Gkn8dHl+nU3t/wKYLcjpW/uXZ0n/HrY2jYle23j
         aACbxNL/f/FdF3Lz+gIzqbmSJ4NzPpUn5zCOjh21MigzcciMfRR1mDVYxrMjrkaup/KO
         tcttQXRrlZKieAiVJAIA/qqWkOZKBU3JVmcqzOPuY3Z99S0F8yYr/+XXkg4QXvbsgW7O
         w1wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783024123; x=1783628923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZOKT26jBGh68jPAdZ7KHiuveH8OGcC8aSvVaWD7EghE=;
        b=HP8tEzE5SOBHSI+7uPWaKo/BNXVEEflM+RDQN1OD4gNsJGXZrMJK/L273A+wgJMZ6H
         bJVXGcWct80XTaD4oYav8U/Sdeiuv9C66lDCRYbN+N8YUtJHJxClMoF5/29D5PerUbxP
         b3lBtrhodCQj51EJU7nMP9Mkmr0Sua76tWCRtjEhgaYpRnJTZAHen7L9aG0tYBXiZ+rI
         40pF/w4/zBBBKnr5TR9gJT4LAziXqZp/RZSoL/8afOk1IRetLQWIz2CPGPNSbWHiS5JH
         T47RsFQQ+GrQw2WqDLuMIOJOFLIbZOZXBbNPX7z4Rwr4bEk7Wo3eAYifgqmmvL9lvIWG
         AxMw==
X-Gm-Message-State: AOJu0YwBSLIsdwuK3ZAsaPFkVa7wnXBZVyjlrgmocyNUfwQYfqbeSkfz
	WAYwumuL2JRraMhQTuMoxe31WgpplcB3saIjQjGXptXTRgwbTiM1em6l
X-Gm-Gg: AfdE7ck+80+3HoHZm1V8egWRDnQPKfBOyJPdNgatT56XQ8fg9K6Nsse8+ygLSS1/+uJ
	lyhVO0zckRVEEtlcKN+D0zvx+QVSkVOXwyw1T/wKOOPOeAuuLm8IvTo3EhUAM93Gwrb6Hhr4unu
	BbX3Qt5mHrT9naYQqoA+Vm4y25jt4muyAlCWhJFDnpuCuT6qwPGRGH7inMmJWW8Qz+6MrTbzytU
	bkFPNXF3LbX6/PraDhE5gvAIY1wk6oCFqNmovzMwUC8B0D41PY0vDbYOj3248OON4v3Tw221Mqt
	PSJ3aiM9lrVFOOnHbrEL0hLMvBKW8BUIV9wM4cvQCJuoZyMHjAIeHloEP2cy+PtGRm5kUrE3o7n
	8PpLl+DJh04zQ40/h81xSLxF4E0bK/vIYfeCx5FsMGwM9hQOQBE5lllsdknbjOebjo6ygaYbIDW
	FJuaQXIyk1rmdgustptW1GKm4=
X-Received: by 2002:a05:600c:8711:b0:493:c601:3e23 with SMTP id 5b1f17b1804b1-493c6013fa3mr56713115e9.5.1783024123156;
        Thu, 02 Jul 2026 13:28:43 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6369488sm80321145e9.9.2026.07.02.13.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 13:28:42 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Thu, 02 Jul 2026 23:27:59 +0300
Subject: [PATCH v6 04/12] mfd: zx297520v3: Add a clock and reset MFD
 driver.
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260702-zx29clk-v6-4-377b704f80c4@gmail.com>
References: <20260702-zx29clk-v6-0-377b704f80c4@gmail.com>
In-Reply-To: <20260702-zx29clk-v6-0-377b704f80c4@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6371;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=SSMHO6cIUYBr1MVMkwR3oQf17fjQW/+JOMa33c7U35Q=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqRsnpp25shHN23zDaD4knL0t0kuIWpSE3VKLoP
 RainhirECGJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCakbJ6RsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLpXQ//XTRKq91sFRNozddijKFECPHezy7iQwt
 WtWPmjZ6+BmkrQZxfM30XZUu4XCpQBCkq5EOAWUf937GwwxaFSTb2k56fomOL8anJGIqnttD+jB
 L/lTC65BpCcSbOmx9LpAJ4AEVr+Ta81Zb0go2rvdfxD3KLVZMrCBH3u8mZGejxP4+ZfylSIsHwW
 s0i+bNzQeztIKnjbFHJllYuYrZAXCKgP5ig/4138gWI3Cz5PR2IAVp63TErvg30gwlw6sabr8G2
 mImfwnI/tP7jCrf4hWDLeqSFvJHjG6UydM0taefaPG2gr2SXgLvYmddt0O3K53N9ACU8meZ+Ej2
 eYL3vFui2bo01Qpy9kw2keIqy50wTeCSLKkHB4Wv2K3R9RmD7/8QpqYUMH4il71S/ij4EDyNSwE
 SS34YYqHD7mecOQUUlwaXdZo/nUhtzD6FFFwh/SN+YmiDt5eyn6FxpOgBQ/2Gl4bLRhTuYekWUA
 sCWSJPWcGV1qFtSGwYwz43PHQjIFhZkC4Qt5U6PHYWvCA0Sf+MMlBRIidJZuls9sX8eUKLzTVYr
 T//qx6uPksmrARjtP+1zfEzAbA0DFxs2iUsZvlr9O4luwF1iThkArZ3JjfeIt5paXds0aS1RJxX
 3md6p8bgI8+bOZ7HbvFqGoir82Ig5BkoZK/CR0VxFiOCE5WqTUpM=
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
or at least use only one type.

Changes v5: Use MFD instead of Aux bus for top and matrix crm because of
extra functionality: Reboot in top, hwlock in Matrix.

LSP clocks stay with the aux bus and are thus not handled in this
driver. The clk driver will bind directly to the lspcrm node.
---
 MAINTAINERS                      |  1 +
 drivers/soc/Kconfig              |  1 +
 drivers/soc/Makefile             |  1 +
 drivers/soc/zte/Kconfig          | 20 +++++++++
 drivers/soc/zte/Makefile         |  3 ++
 drivers/soc/zte/zx297520v3-crm.c | 95 ++++++++++++++++++++++++++++++++++++++++
 6 files changed, 121 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ceedfa359d47..6502d343fe44 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3882,6 +3882,7 @@ F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml
 F:	Documentation/devicetree/bindings/soc/zte/
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
+F:	drivers/soc/zte/
 F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
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
index 000000000000..9d0790b9350b
--- /dev/null
+++ b/drivers/soc/zte/zx297520v3-crm.c
@@ -0,0 +1,95 @@
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
+};
+
+static const struct zx297520v3_crm_data zx297520v3_topcrm_data = {
+	zx297520v3_topcrm_devs,
+	ARRAY_SIZE(zx297520v3_topcrm_devs),
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
+	zx297520v3_matrixcrm_devs,
+	ARRAY_SIZE(zx297520v3_matrixcrm_devs),
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
+	zx297520v3_lspcrm_devs,
+	ARRAY_SIZE(zx297520v3_lspcrm_devs),
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

