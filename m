Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793195978;
	b=wqCrx2FoiWXAirUjzrOlQH6tdXKFCMvbDtM67M1Xb5ghE/duXFsUsPYZaBfLbUiOoRo0
	 dWIV52eXesAV5jSXTjEudClL+hCG9O6UgXR7dn6s3mRNhFQCQnTzB08BH+5w65NRlrVST
	 jszSoeTt9sZn0L4t04VxbxuSGd/iZTHbMsdmPNlb3ESOBejHWwXqf887yAeXcwbi+Jkyq
	 mFr0cJjR2YtK4Eo0zi8B/LAIEWbo4e6BTQk49X77r1WNNngTjZrRDdZSoJw3dJOBNv6rs
	 x6pK6hkrfM3tUoWXKE8FHkPznM27Vkv0rV9a1S1CmttkMQeW0IBdQzue3UZFOYzq3Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793195978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RBz08268AVURbWerFfGZQvoJEMhx0Fe3EfTMgya6HMo=;
	b=N2/FXnQbhsSc7o0DbJ2ucYavjYIP+tj6ooE7QgoET5YE8u5Y72loRwYs7whzHOw5c3FF
	 vAP0RGcxDbgb8zZdiRGMERXKjYmYhgCk9bSHFMYu4gXhwG+wz+9jeNNu0QdNUjQmwWLxb
	 qvm9iG+EZeKJ/ZuTr6hUH2VcIg/4KRCM2SguFR8rV6sMRrg4LPYt6h6Aox/l/1H8dDR4t
	 Lmvuc711ifyYycTtADfrPQQmSgkJAo6Yn86+P5OMWYyrMQEAKYhjGC0DeGRzt0gHdBv1I
	 C9i/PjP+rkJOUjClzctTJTm9WZQQQ7M40w9nZYSlUDQPQjOzaT8plHa7Ji0lL7Q5dGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=QxoZI8sG;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC9D60A260A
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 13:59:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EC9D60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=QxoZI8sG
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48dfb76b304so169087f8f.2
        for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 06:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793195963; x=1793800763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RBz08268AVURbWerFfGZQvoJEMhx0Fe3EfTMgya6HMo=;
        b=QxoZI8sGgpfb3oMSDg0y3tzeghn/vzamTAXHa8vd34zrmrkTk8MxviZmBuitZF1Nn0
         Q/UlK2HOgEdQ0eAbklP8xYuqLcA0zqFU7o41POYppomi2vmcsfvCwasAIeqg08tkLKdN
         IFZmuqGqQ3fMMyIiTwGsdgyzM7ExnEuWwWNOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793195963; x=1793800763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RBz08268AVURbWerFfGZQvoJEMhx0Fe3EfTMgya6HMo=;
        b=PNzYQRNqh4KhDsADugmOvrAhT5s2L8xROAuZlTdrnYV1T03j3w2wjukavm2S4Ft6qG
         yNNIzszNaKc+0rVfxQ+zD0c3idDP+GMEfvDBPgFdyq8x/6W3bd1Lvnz6MFs8Lkag8N67
         2avmXErgcQ5CKDbaAR7MacyIQHa5lrwdXBBa5q9jWT5odl2yXKl2SVMZNyZ62sI6Tiau
         vUoWsgsHSp5zArmeDdiyDzXQ7/S91Mx8ayBrY1YrbZAkmqUXh3And4DxJcbYJELwOn7M
         3i3nB+Lav8vzXg4lkiA9QxxRC77WBpZtJFcT7FHYqxTwZd5l+qIoVb1Y2R4P/6LZRgy8
         39yg==
X-Forwarded-Encrypted: i=1; AKwUvBwUfoZJdMTjldHU65Agrg9F7idMH5q7O0uia73F4K2x9K8V0XbC8y4n/EFDupcDaFHyLOdcu2tp+wM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmqXbqv8OyaLmheoSj+QU0bQ2lzIZMnpM53V5wkqEri8aRlHpJ
	fC+mHorTaGMv+PWWbzrNHrvS5ltY0bAYqiejE+Ar0RRN+3y+LRkzbR7Z+oKYBTcHe/E=
X-Gm-Gg: AYBFou0mVnwxOSVSoirvm3xFNpP7nZf57kAVXqInlBobsa5yd7WD6/dakyBjh+MPRdj
	eZxZdNP/unp4W3DoHSTdn4TwkK8E6mvfUadEkmEuWUBCjusibwWLl+t8DY8hIJgRFMJTmmbiTtF
	AWvyFBnNAigeMx57yGFXx7UJ8UNcbZ+dtOnSqDsIttP9gVmCNlUvt+U1xFwIbUoa7Ed613+TLvV
	S1LgBVxzbiGZKI5PfHiRQN7atU9P7xqfObIWuxohTO4YjV0wyOoSnzQMV/Gn3fRdVMEOC4MHuGb
	rZmMhabMEWxJhfjAseqTx/rDMEOg4cFQwp3Pl3xmhoK2ejSWxIv7IgBVjMPuWToNe+AA+wCBAoL
	YiOjJy1xuYS45y3aRY+QN2SPXtyUv5YsnHG/1WdUa/WpbL3SPipIlXqx7W116y754AkvqKwxkng
	YnN24zhNcsoC5pJI9R4/zTQu7M5LNRpYkt7cYBGAUu7K5AX/WgzfWUsA+sKEl15aCL5ozRIk+9N
	tCyb387vrf1dOCkhjmzUwRCGBTs11T+COyU7oqxDQeod2RBduDgHouMdeoamLz+cCeE7PIHHRoE
	M5c8b3f2G1LKgI1saEkNFkqFvjP726udDnhuKt0qopqVW2yjifbVQ/tYNxa+zA94A1/a+zUDA8r
	Nf9uS9gmfYjqfkP7PjY6nwdH3Bqc40ZyGFtXWRlTNM67v+QLb
X-Received: by 2002:a05:600c:19c8:b0:4a1:d459:db4b with SMTP id 5b1f17b1804b1-4a966e2a979mr54893215e9.24.1793195963058;
        Wed, 28 Oct 2026 06:59:23 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94f05f168sm37077165e9.4.2026.10.28.06.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:59:22 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Marek Vasut <marex@nabladev.com>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RFC PATCH 2/4] clk: stm32: add STM32MP25 SYSCFG clock driver
Date: Wed, 28 Oct 2026 14:59:06 +0100
Message-ID: <20261028135915.2665857-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028135915.2665857-1-dario.binacchi@amarulasolutions.com>
References: <20261028135915.2665857-1-dario.binacchi@amarulasolutions.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On STM32MP25 the LTDC pixel clock is selected in the SYSCFG
DISPLAYCLKCR register among the DSI byte lane clock, the LVDS PHY pixel
clock (reset value) and the LTDC kernel clock, the latter being the one
needed by the RGB (DPI) output.

The SYSCFG node already provides this clock ("#clock-cells = <0>"),
referenced by the LTDC as "ref" clock, but no driver registers it, so
the selection is stuck at the reset value and a display connected to
the LTDC RGB output can't work.

Add a driver registering this clock as a mux. The SYSCFG node is
already bound to the STM32MP2 SYSCFG driver, so the clock driver is
bound to an auxiliary device created by the latter, which shares the
SYSCFG node and regmap.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/clk/stm32/Kconfig                |  12 +++
 drivers/clk/stm32/Makefile               |   1 +
 drivers/clk/stm32/clk-stm32mp25-syscfg.c | 111 +++++++++++++++++++++++
 3 files changed, 124 insertions(+)
 create mode 100644 drivers/clk/stm32/clk-stm32mp25-syscfg.c

diff --git a/drivers/clk/stm32/Kconfig b/drivers/clk/stm32/Kconfig
index 5dbd75cde657..906044aacaa1 100644
--- a/drivers/clk/stm32/Kconfig
+++ b/drivers/clk/stm32/Kconfig
@@ -39,5 +39,17 @@ config COMMON_CLK_STM32MP257
 	help
 	  Support for stm32mp25x SoC family clocks.
 
+config COMMON_CLK_STM32MP25_SYSCFG
+	tristate "Clock driver for stm32mp25x SYSCFG clocks"
+	depends on COMMON_CLK_STM32MP257
+	select AUXILIARY_BUS
+	select MFD_SYSCON
+	default COMMON_CLK_STM32MP257
+	help
+	  Support for the clocks provided by the stm32mp25x SYSCFG, i.e.
+	  the LTDC pixel clock source selection between the LTDC kernel
+	  clock (RGB output), the LVDS PHY pixel clock and the DSI byte
+	  lane clock.
+
 endif
 
diff --git a/drivers/clk/stm32/Makefile b/drivers/clk/stm32/Makefile
index e04727b59449..8088d172651f 100644
--- a/drivers/clk/stm32/Makefile
+++ b/drivers/clk/stm32/Makefile
@@ -2,3 +2,4 @@ obj-$(CONFIG_COMMON_CLK_STM32MP135)	+= clk-stm32mp13.o clk-stm32-core.o reset-st
 obj-$(CONFIG_COMMON_CLK_STM32MP157)	+= clk-stm32mp1.o reset-stm32.o
 obj-$(CONFIG_COMMON_CLK_STM32MP215)	+= clk-stm32mp21.o clk-stm32-core.o reset-stm32.o
 obj-$(CONFIG_COMMON_CLK_STM32MP257)	+= clk-stm32mp25.o clk-stm32-core.o reset-stm32.o
+obj-$(CONFIG_COMMON_CLK_STM32MP25_SYSCFG)	+= clk-stm32mp25-syscfg.o
diff --git a/drivers/clk/stm32/clk-stm32mp25-syscfg.c b/drivers/clk/stm32/clk-stm32mp25-syscfg.c
new file mode 100644
index 000000000000..1cb2459f0370
--- /dev/null
+++ b/drivers/clk/stm32/clk-stm32mp25-syscfg.c
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * STM32MP25 SYSCFG clocks
+ *
+ * Copyright (C) 2026 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+
+#define SYSCFG_DISPLAYCLKCR		0x5000
+#define DISPLAYCLKCR_DPIVSLVDS		GENMASK(1, 0)
+
+/*
+ * The LTDC pixel clock source is selected in SYSCFG_DISPLAYCLKCR among
+ * the DSI byte lane clock, the LVDS PHY pixel clock (reset value) and
+ * the LTDC kernel clock, which is used with the RGB (DPI) output.
+ */
+static const char * const clk_pix_ltdc_parents[] = {
+	"txbyteclk", "clk_pix_lvds", "ck_ker_ltdc",
+};
+
+struct stm32mp25_syscfg_mux {
+	struct clk_hw hw;
+	struct regmap *regmap;
+};
+
+static inline struct stm32mp25_syscfg_mux *to_syscfg_mux(struct clk_hw *hw)
+{
+	return container_of(hw, struct stm32mp25_syscfg_mux, hw);
+}
+
+static u8 stm32mp25_syscfg_mux_get_parent(struct clk_hw *hw)
+{
+	struct stm32mp25_syscfg_mux *mux = to_syscfg_mux(hw);
+	unsigned int val;
+
+	regmap_read(mux->regmap, SYSCFG_DISPLAYCLKCR, &val);
+
+	return FIELD_GET(DISPLAYCLKCR_DPIVSLVDS, val);
+}
+
+static int stm32mp25_syscfg_mux_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct stm32mp25_syscfg_mux *mux = to_syscfg_mux(hw);
+
+	return regmap_update_bits(mux->regmap, SYSCFG_DISPLAYCLKCR,
+				  DISPLAYCLKCR_DPIVSLVDS,
+				  FIELD_PREP(DISPLAYCLKCR_DPIVSLVDS, index));
+}
+
+static const struct clk_ops stm32mp25_syscfg_mux_ops = {
+	.get_parent = stm32mp25_syscfg_mux_get_parent,
+	.set_parent = stm32mp25_syscfg_mux_set_parent,
+	.determine_rate = clk_hw_determine_rate_no_reparent,
+};
+
+static int stm32mp25_syscfg_clk_probe(struct auxiliary_device *adev,
+				      const struct auxiliary_device_id *id)
+{
+	struct device *dev = &adev->dev;
+	struct clk_init_data init = { };
+	struct stm32mp25_syscfg_mux *mux;
+	int ret;
+
+	mux = devm_kzalloc(dev, sizeof(*mux), GFP_KERNEL);
+	if (!mux)
+		return -ENOMEM;
+
+	mux->regmap = syscon_node_to_regmap(dev->of_node);
+	if (IS_ERR(mux->regmap))
+		return dev_err_probe(dev, PTR_ERR(mux->regmap),
+				     "failed to get the SYSCFG regmap\n");
+
+	init.name = "clk_pix_ltdc";
+	init.ops = &stm32mp25_syscfg_mux_ops;
+	init.parent_names = clk_pix_ltdc_parents;
+	init.num_parents = ARRAY_SIZE(clk_pix_ltdc_parents);
+	init.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT;
+	mux->hw.init = &init;
+
+	ret = devm_clk_hw_register(dev, &mux->hw);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register %s\n",
+				     init.name);
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &mux->hw);
+}
+
+static const struct auxiliary_device_id stm32mp25_syscfg_clk_ids[] = {
+	{ .name = "stm32mp2_syscfg.clk" },
+	{ }
+};
+MODULE_DEVICE_TABLE(auxiliary, stm32mp25_syscfg_clk_ids);
+
+static struct auxiliary_driver stm32mp25_syscfg_clk_driver = {
+	.probe = stm32mp25_syscfg_clk_probe,
+	.id_table = stm32mp25_syscfg_clk_ids,
+};
+module_auxiliary_driver(stm32mp25_syscfg_clk_driver);
+
+MODULE_AUTHOR("Dario Binacchi <dario.binacchi@amarulasolutions.com>");
+MODULE_DESCRIPTION("STM32MP25 SYSCFG clock driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0

