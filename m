Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923B83C7DE8
	for <linux-clk@vger.kernel.org>; Sat,  9 May 2026 19:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778353226; cv=none; b=pW/2f9+ACEjbDLtTXmXPf8VisVsjZimx6Z+WicbBCKtSArcpvLZAHsEa5WSnMShSC93o64joiR9n7YzMQ4Ul4DFgqG+PVQ8vqcaI6l6HOWvJ3ROeHpXX5MqnAHwgm78Wo/iGSEMjqflmi37ZhL0HUnxc83oC7gIDJH92h7NXg38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778353226; c=relaxed/simple;
	bh=KhgjTTp6dPZIBaG0XSoEXqjWGKM14mBydZeI9l5lCjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aRXul4tCSEnmejRN++tNUCw5Qi7/5fqUo2ArZlSdPdYH2vZQSjWLbF6o9/RyWYoGVY6NXYOjHsh7tX+6rZpwzdB8c7nByyU1SUG/4C6ogDznshZDjfCzQRz5X/bVTztLGlBDz7LRNy646Oie69yzPtThIXdExzWrPFcYMwoRI+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SJYGZg5O; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SJYGZg5O"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43fe62837baso1515574f8f.3
        for <linux-clk@vger.kernel.org>; Sat, 09 May 2026 12:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778353223; x=1778958023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AdLAbqgwB3cbfBit4ZVDmF5fOX+Cth+Nq8mrAQRYaDE=;
        b=SJYGZg5O+LZcoCfsa8suNdh80X0a9dFi+AUUlAIzJ8RoHjXUs+sS7U12flW9XtQXSE
         LypxF2Vuf1UhTpbrSzMR9NLpk6xwmW2CAICJFjAGaQBcswpFiggk2CavBp8mmEFZWk59
         ADjk20AHdHbiNzsgm6cKjdgYrgRItXJuVuiL0COJjhVMUI/T2TGlhLrK3xBudo6Iklv+
         Q1VMUgVmtd84arN+tCEQy2YTJXeey4/fIJo54Esdkw4PWbhFnVaRPtnPk25Sre86aJJd
         7eM5zpltWXrHprKNZemKA/itjiQjkJg8W+iDqx6G3vkSszMebnunj1BvEhJq/aoT/qit
         4a+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778353223; x=1778958023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AdLAbqgwB3cbfBit4ZVDmF5fOX+Cth+Nq8mrAQRYaDE=;
        b=ipAzD5TuxT9NbioVks3HqphydW95VYLZAa8xAqiDG0PVAIc1i7xd68L+hRs/Hl9xxW
         Wy5jDfhs7lgOoDnLmfg/HdWH5RSgpiShWyEooI1MPPSX9ucRMB1J7B5/NyjUK6m2tF2J
         8pABhUVhezsiW8A+4nBGoVVxaxXnKHpb2eS++mhbRZneqWr73kIobMT+JnRXj+tn+ehk
         lyZaCwFwhqyHMXhAhwMxWySX+aV3wDG2zzAdHHHlBi6TwUEuAI82dn5+YuDYuXz1raiH
         1yPdNdzj1CjCG+Di0BHfTO06CXW1gvxpkFTcDmqzANRlW6XdrznjsQF5wq2lPPZTzFAG
         s/qA==
X-Forwarded-Encrypted: i=1; AFNElJ+58EwVGPAh51pQVe9HShWOSPcnO5j6qUj/nkK0Ti/SW1NjqqDKCSxKMJ6xfeyC0ndom/P6zERryBo=@vger.kernel.org
X-Gm-Message-State: AOJu0YweRXT0ZOXoC9d2Fn72uVovzmokzA/1ItKke0hDwDMeJz3Ohk7G
	qAW4L/BzCRSDGGVH9VNf5JwOLvDF/Gq1ovxkmE7XU6ZYqkm30EBPYGgh83465A==
X-Gm-Gg: Acq92OGYKVexKLaC+MtmuFA2Cr75gnMPl/oU8OjHh1jSEWswP6w7u/BsweJxXi06e34
	uHnDBELmGYgFKKA3/WePLvWp3Y1X+8pREg8L1xB8UqKtyjxiOiTxs45hRE+UMmYABZpbqaFgzXU
	VPAxZ4ihbPj4aiIzt+luYQIHfqzhLDNSEJndBOFtoKaF6ImzehLFCYhMVzYPkLI7/FtyjueKPmj
	b4ucNzhc3qdTwoZsbLo3ZkOh2mR3mdFPHQndVA0E6HhImiletUOrQjGW12g4PYmkW0T7LKqwNVT
	Qt1YAUdZ4/nYEUEt4CP5m9vDVFFiMvZOBHA84fU7lo2iskXRYFBMQhbVbs2d4SbU5RQWCnrdn31
	T1m/JcvkNLWSGh9K8DtskmipD9hXnTjFtsTSQzx2qCq5zzIEUAAqcrSIODQgZyYi09Yfw6m+UI7
	OluBNQnriIR98uNeROMlMhSLCAvps2hLY0J32v2trZdWbkfI/ncVmUgIctc5qhTR4qpeA=
X-Received: by 2002:a5d:5f90:0:b0:451:ccc:a6e5 with SMTP id ffacd0b85a97d-4515d5c68d1mr27318999f8f.30.1778353222950;
        Sat, 09 May 2026 12:00:22 -0700 (PDT)
Received: from jernej-laptop (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454913049ecsm13254407f8f.19.2026.05.09.12.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 12:00:22 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
X-Google-Original-From: Jernej Skrabec <jernej.skrabec@siol.net>
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
	jernej.skrabec@gmail.com
Subject: [PATCH v2 2/8] clk: sunxi-ng: de2: Export register regmap for DE33
Date: Sat,  9 May 2026 21:00:09 +0200
Message-ID: <20260509190015.79086-3-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260509190015.79086-1-jernej.skrabec@siol.net>
References: <20260509190015.79086-1-jernej.skrabec@siol.net>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jernej Skrabec <jernej.skrabec@gmail.com>

DE33 clock pre-set plane mapping, which is not something that we want
from clock driver. Export registers instead, so DRM driver can set them
properly.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes from v1:
- used access tables instead of functions
- used macro for max register
- used dev_of_node() instead of open coding

 drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 48 ++++++++++++++++++++++++++--
 1 file changed, 45 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
index 6ec6c0dc4c26..26d8abd5fac6 100644
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
@@ -283,6 +285,36 @@ static const struct sunxi_ccu_desc sun50i_h616_de33_clk_desc = {
 	.num_resets	= ARRAY_SIZE(sun50i_h616_de33_resets),
 };
 
+/*
+ * Add a regmap for the DE33 plane driver to access plane
+ * mapping registers.
+ * Only these registers are allowed to be written, to prevent
+ * overriding clock and reset configuration.
+ */
+
+#define SUN50I_DE33_CHN2CORE_REG 0x24
+#define SUN50I_DE33_PORT12CHN_REG 0x2c
+
+static const struct regmap_range sun8i_de2_ccu_regmap_accessible_ranges[] = {
+	regmap_reg_range(SUN50I_DE33_CHN2CORE_REG, SUN50I_DE33_PORT12CHN_REG),
+};
+
+static const struct regmap_access_table sun8i_de2_ccu_regmap_accessible_table = {
+	.yes_ranges = sun8i_de2_ccu_regmap_accessible_ranges,
+	.n_yes_ranges = ARRAY_SIZE(sun8i_de2_ccu_regmap_accessible_ranges),
+};
+
+static const struct regmap_config sun8i_de2_ccu_regmap_config = {
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.max_register	= SUN50I_DE33_PORT12CHN_REG,
+
+	/* other devices have no business accessing other registers */
+	.wr_table	= &sun8i_de2_ccu_regmap_accessible_table,
+	.rd_table	= &sun8i_de2_ccu_regmap_accessible_table,
+};
+
 static int sunxi_de2_clk_probe(struct platform_device *pdev)
 {
 	struct clk *bus_clk, *mod_clk;
@@ -336,13 +368,23 @@ static int sunxi_de2_clk_probe(struct platform_device *pdev)
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
+		ret = of_syscon_register_regmap(dev_of_node(&pdev->dev), regmap);
+		if (ret)
+			goto err_assert_reset;
 	}
 
 	ret = devm_sunxi_ccu_probe(&pdev->dev, reg, ccu_desc);
-- 
2.54.0

