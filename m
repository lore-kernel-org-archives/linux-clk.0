Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35242FB968
	for <linux-clk@vger.kernel.org>; Sat, 15 Nov 2025 14:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763216060; cv=none; b=aZW0OyB6y8+kiuhtw/hEqIc6plBWWTqYc9isPB8wP6s1xKCGwUv+cFRLAtIfJJGV46eo1j4qQWjZEBH+80quznyLTdxKfhuHw56EYMwyXNGXVpREtkNVL+P97XZJUPF79jbgrqu5zQb1mAvAxq8tLTJLDydRZl3tmDC5aVA6z9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763216060; c=relaxed/simple;
	bh=GwnvL5vMWVsQ51UjbmyDs3QGAPhCZplv1N6Us1qfLHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e6yrK9/5Yzrkr4lOp6Qov7i07nQ9y0HLJVbnWl6G+6OO/H8gRhZQcd29V1rvfCRML9k/VbKWHkbJkxD4PH4MPnYcDqFWdv6EA8A33ZqWadUJXlM/j/OxdmjxRL+pZyRXwZ0C1mRpRTaAXKce2bVpU7PzxFIwyMZEi/kGQb1GP0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aUW0NWkb; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aUW0NWkb"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b6d402422c2so457592566b.2
        for <linux-clk@vger.kernel.org>; Sat, 15 Nov 2025 06:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763216057; x=1763820857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UciMie+UNtQ6Be5Ygq/FZ+wB93JKP9NGMjXOu78hOHU=;
        b=aUW0NWkbYhHNof6Y4L6JNctvdn+3Wv8vaFSaScuL4M3TpyUj6D5/vFgDHW5RxCjeZA
         8MYIoClQ62EZK6rUg6iOXV6VdpWayBEYqgY7KVHVE6qTNz82Zx0CdMZpEFGiXXjPhULp
         2PPdVZMDE0xFwxdqa8OVzbEzd6k1BNdAB6XXw1+HsXnk2YJaTFcPpMs5CTVRyl2SBiCj
         A/hMKcPCTAMDtsbTckeui0ev41ppayE66NGfTRrDZ7E3txYNlctUCEpZ0QuhkCefY3zw
         9246YuqKl505Hjz+TXZBuikXn/W0XJ0MD09UxCGbHqeEoLVWmyodBgcgRrlY2bwI4dKq
         8Piw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763216057; x=1763820857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UciMie+UNtQ6Be5Ygq/FZ+wB93JKP9NGMjXOu78hOHU=;
        b=l2JirqXwDqQ8wibTZYRGV9RCy8K3NglQ1cU3TfSqJxIiWOi4LCRXxgNCZ31HJ3/YIo
         9jmi4jIJ41w1N7yp6Q/lIddq+gfhVtLVR2nVWMc9k/HUqfDkxxuRBz4C1KfKDrvY9bfh
         OUxzbG1nTPsFGA/6A6i2VFhe8CKG1TmrIvLUK9IODsj4W3e62lkHYCErEsrJ7FRaUZes
         WIrasiGPcFY6qKveKs308tLaBJMw5nm14dolPNdLSxk1rzsP0Wt220wVRGCdyQM+sdMv
         rZ/hroxsJ2v2Gpu0ebQB1NxgPpEJJ7EMyQdih01fFz6j4sleLKUxHcKRJ7FpeQBrMAzx
         JdVA==
X-Forwarded-Encrypted: i=1; AJvYcCUsxqdulyiMDfU9O5J2/BCIxiMZ9X7ruaCivueFPIknnWRXewWpff5daAg0W2uPBlwd85xYl3ouZAk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHKfsBnJdlicKy/rM5ex86SX8gg5y300MKOcYXNOJ1TIHzImA2
	T8s4zmFADv041jN0fGd5k5ZXJsmDT0OMEBo7Q1OSp4knX6JKepfSsx/k
X-Gm-Gg: ASbGncvqtIBUrdl5VVPjh9ny5s/O9Eh/yYSkrxbexrUkKx47HtktUK95zei15hiq0f2
	o/G78jICXibmAncxi9kb4cwZeq0XKBZNubTc/g/QgbwmvIQd2ejdDenCWNvS+sl/5vE2kCx3Myj
	ZmVo8uaPEaa4+x5tCb6pb/zdyWp0aE5ssMKYg/qDMgiamUmOVwQh0fwdj8b4Ddf0bEXEjXSHmtf
	Yk9GaBSnLPFvXp/EhZR6zA6uWtZuv5PxHZwaxuqqZcGlHKMSi1+YFIMOf0IkixZxj9CkzK+Hyas
	mdsliOZXvVyUMob2erhvUt80+1JpEZb6j+l2Rr3AKbPkp/cFOpxadi7sIioVJ4IfJS1QvIng5l3
	xqxNXCVJEdE5RAFDaxQeXFOVTjw8kpXjn5ujYLn3xVlDJcxPwegqV61ZupIF8dJ5eoVpGvxpZ8m
	mcluKEdp0k2LXRoG3yf6IJ09AJJd7lsESpQyCAAR07yr/Xbul7uTTpnPTT
X-Google-Smtp-Source: AGHT+IHK6phfJOgzf+aqpzFKPTHMjqJZ4C/vVBwN+Y+khMKq+c5K63YPI1+yGx5o9/adAsErm3Oq3Q==
X-Received: by 2002:a17:906:490c:b0:b73:6ca8:b81f with SMTP id a640c23a62f3a-b736ca8bbf7mr534553666b.51.1763216057167;
        Sat, 15 Nov 2025 06:14:17 -0800 (PST)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fda933fsm606189866b.56.2025.11.15.06.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 06:14:16 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org,
	samuel@sholland.org
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 3/7] clk: sunxi-ng: de2: Export register regmap for DE33
Date: Sat, 15 Nov 2025 15:13:43 +0100
Message-ID: <20251115141347.13087-4-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115141347.13087-1-jernej.skrabec@gmail.com>
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DE33 clock pre-set plane mapping, which is not something that we want
from clock driver. Export registers instead, so DRM driver can set them
properly.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 53 ++++++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
index a6cd0f988859..2841ec922025 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
@@ -6,9 +6,11 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/reset.h>
 
 #include "ccu_common.h"
@@ -250,6 +252,41 @@ static const struct sunxi_ccu_desc sun50i_h616_de33_clk_desc = {
 	.num_resets	= ARRAY_SIZE(sun50i_h5_de2_resets),
 };
 
+/*
+ * Add a regmap for the DE33 plane driver to access plane
+ * mapping registers.
+ * Only these registers are allowed to be written, to prevent
+ * overriding clock and reset configuration.
+ */
+
+#define SUN50I_DE33_CHN2CORE_REG 0x24
+#define SUN50I_DE33_PORT02CHN_REG 0x28
+#define SUN50I_DE33_PORT12CHN_REG 0x2c
+
+static bool sun8i_de2_ccu_regmap_accessible_reg(struct device *dev,
+						unsigned int reg)
+{
+	switch (reg) {
+	case SUN50I_DE33_CHN2CORE_REG:
+	case SUN50I_DE33_PORT02CHN_REG:
+	case SUN50I_DE33_PORT12CHN_REG:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_config sun8i_de2_ccu_regmap_config = {
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.max_register	= 0xe0,
+
+	/* other devices have no business accessing other registers */
+	.readable_reg	= sun8i_de2_ccu_regmap_accessible_reg,
+	.writeable_reg	= sun8i_de2_ccu_regmap_accessible_reg,
+};
+
 static int sunxi_de2_clk_probe(struct platform_device *pdev)
 {
 	struct clk *bus_clk, *mod_clk;
@@ -303,13 +340,23 @@ static int sunxi_de2_clk_probe(struct platform_device *pdev)
 	}
 
 	/*
-	 * The DE33 requires these additional (unknown) registers set
+	 * The DE33 requires these additional plane mapping registers set
 	 * during initialisation.
 	 */
 	if (of_device_is_compatible(pdev->dev.of_node,
 				    "allwinner,sun50i-h616-de33-clk")) {
-		writel(0, reg + 0x24);
-		writel(0x0000a980, reg + 0x28);
+		struct regmap *regmap;
+
+		regmap = devm_regmap_init_mmio(&pdev->dev, reg,
+					       &sun8i_de2_ccu_regmap_config);
+		if (IS_ERR(regmap)) {
+			ret = PTR_ERR(regmap);
+			goto err_assert_reset;
+		}
+
+		ret = of_syscon_register_regmap(pdev->dev.of_node, regmap);
+		if (ret)
+			goto err_assert_reset;
 	}
 
 	ret = devm_sunxi_ccu_probe(&pdev->dev, reg, ccu_desc);
-- 
2.51.2

