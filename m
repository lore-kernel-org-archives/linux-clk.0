Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA2E24C06A;
	Sat, 20 Dec 2025 01:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766193108; cv=none; b=WW90Buu02k6sI81960tHZ4H/6ad6KhRPDIvEHRSkyX9FTjoCrpSqc6zUMTni0hxT2DwQkAEuk2ASFkQfjmtL/ZNGoB+EdcxLYUJPy3Uv0t10BL7eSfu6orNCjKLHPM9/WOt4oPfUkQavaSfCvwDqhsjN73A0T2HfySOv8H0brso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766193108; c=relaxed/simple;
	bh=vC0A71HZzR2oqXG966TnBLiH0QsoMAHuHxqGDks7SM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hx8hPCsITDX+zzrU2NWggo47rlRdtl+z4RRaZQmOUznNjdL9D0pux+ohqiqcsXf+0uffqAgYuHspMj6kkXzG41W/M/BbiweKtYFsj90fZ39BaxH/Rra6V/Niws0JxOOKkRxL1DfruwqlaqqIPEqYTpdYoGRfLpI+8AISKE2uURk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 6D8D9341051;
	Sat, 20 Dec 2025 01:11:42 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sat, 20 Dec 2025 09:11:19 +0800
Subject: [PATCH 1/2] clk: spacemit: extract common ccu functions
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251220-06-k1-clk-common-v1-1-df28a0a91621@gentoo.org>
References: <20251220-06-k1-clk-common-v1-0-df28a0a91621@gentoo.org>
In-Reply-To: <20251220-06-k1-clk-common-v1-0-df28a0a91621@gentoo.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Guodong Xu <guodong@riscstar.com>, 
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, Yao Zi <me@ziyao.cc>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=13643; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=vC0A71HZzR2oqXG966TnBLiH0QsoMAHuHxqGDks7SM0=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpRffDMmqozbXKr/nW2dl6e7qjQULfZXCE9VyTT
 f/F0TAQ0JWJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaUX3wxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0bOw/7B88ycMPdrgsz4sQ2xhcSwQ6JbU+hMPz/KCi+vEeGdpG6RwywqE6kW
 OrMUaGV20tWwAeNS6BwEI2cPXG1ucB/bvwU53QqZWtdZzUQbO1JWfjhPs1qr+idQTa/+HymPb3v
 /WnEpFEVa6tEVN1MhPBpaca40kLAivKan8rIQ8NIwi1ulIAKrCmN2EYrA6vrVoWj82vx556/Stp
 ilaNgVHRA3LAu9GAfPj23raE/YVsKK2LT8uoztI9Tld/Q5p1ZKstEzc35Eia0FfyTFPxF9YLHDF
 5Ah7+JOKHo2vH86C35g+cqVawxl0/jL4BYMEB4wjxkWqiNAjqlG98J/xAoN+Mo7DBFKC2gdOb1x
 JugUW0CuDs4tku+X3yhgziugYLLVKtj+M0RivXXtdhbX2Hxstv6FtrKbhFHYyPE/PFSRGcNbmVv
 dwJrAMukOKU4xMtOeMF4wkbXZh3Zyc33TlhfiSqcYq4GC4nLMzIZrjIbrpC4xxzoE+15SqCuyS1
 k8k41zjiToHZ/MnKX5teXuQ5dTWQNSg9EZhtOHVYOVvv9sNbWdmR6y4tAjZqOhf1LX2R3bp7aLB
 F6UDyOjDRaBqK7wIUhz1Ur2G56I+PrUXTg/dWQxa3PiGPcgrI/AwRWSI4Fbwcdgr5dFry/X35MX
 Kghm6vgA9hzis9fW4YaAlvNt0xSg74=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Refactor the probe function of SpacemiT's clock, and extract a common ccu
file, so new clock driver added in the future can share the same code,
which would lower the burden of maintenance. Since this commit changes the
module name where the auxiliary device registered, the auxiliary device id
need to be adjusted. Idea of the patch is come from review of K3 clock
driver, please refer this disucssion [1].

Link: https://lore.kernel.org/all/aTo8sCPpVM1o9PKX@pie/ [1]
Suggested-by: Yao Zi <me@ziyao.cc>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 drivers/clk/spacemit/ccu-k1.c     | 176 +-------------------------------------
 drivers/clk/spacemit/ccu_common.c | 171 ++++++++++++++++++++++++++++++++++++
 drivers/clk/spacemit/ccu_common.h |  10 +++
 include/soc/spacemit/ccu.h        |  21 +++++
 include/soc/spacemit/k1-syscon.h  |  12 +--
 5 files changed, 204 insertions(+), 186 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 01d9485b615d..8627a0c292e9 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -5,15 +5,10 @@
  */
 
 #include <linux/array_size.h>
-#include <linux/auxiliary_bus.h>
 #include <linux/clk-provider.h>
-#include <linux/delay.h>
-#include <linux/idr.h>
-#include <linux/mfd/syscon.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/slab.h>
 #include <soc/spacemit/k1-syscon.h>
 
 #include "ccu_common.h"
@@ -23,14 +18,6 @@
 
 #include <dt-bindings/clock/spacemit,k1-syscon.h>
 
-struct spacemit_ccu_data {
-	const char *reset_name;
-	struct clk_hw **hws;
-	size_t num;
-};
-
-static DEFINE_IDA(auxiliary_ids);
-
 /* APBS clocks start, APBS region contains and only contains all PLL clocks */
 
 /*
@@ -1001,167 +988,6 @@ static const struct spacemit_ccu_data k1_ccu_apbc2_data = {
 	.reset_name	= "apbc2-reset",
 };
 
-static int spacemit_ccu_register(struct device *dev,
-				 struct regmap *regmap,
-				 struct regmap *lock_regmap,
-				 const struct spacemit_ccu_data *data)
-{
-	struct clk_hw_onecell_data *clk_data;
-	int i, ret;
-
-	/* Nothing to do if the CCU does not implement any clocks */
-	if (!data->hws)
-		return 0;
-
-	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->num),
-				GFP_KERNEL);
-	if (!clk_data)
-		return -ENOMEM;
-
-	clk_data->num = data->num;
-
-	for (i = 0; i < data->num; i++) {
-		struct clk_hw *hw = data->hws[i];
-		struct ccu_common *common;
-		const char *name;
-
-		if (!hw) {
-			clk_data->hws[i] = ERR_PTR(-ENOENT);
-			continue;
-		}
-
-		name = hw->init->name;
-
-		common = hw_to_ccu_common(hw);
-		common->regmap		= regmap;
-		common->lock_regmap	= lock_regmap;
-
-		ret = devm_clk_hw_register(dev, hw);
-		if (ret) {
-			dev_err(dev, "Cannot register clock %d - %s\n",
-				i, name);
-			return ret;
-		}
-
-		clk_data->hws[i] = hw;
-	}
-
-	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
-	if (ret)
-		dev_err(dev, "failed to add clock hardware provider (%d)\n", ret);
-
-	return ret;
-}
-
-static void spacemit_cadev_release(struct device *dev)
-{
-	struct auxiliary_device *adev = to_auxiliary_dev(dev);
-
-	ida_free(&auxiliary_ids, adev->id);
-	kfree(to_spacemit_ccu_adev(adev));
-}
-
-static void spacemit_adev_unregister(void *data)
-{
-	struct auxiliary_device *adev = data;
-
-	auxiliary_device_delete(adev);
-	auxiliary_device_uninit(adev);
-}
-
-static int spacemit_ccu_reset_register(struct device *dev,
-				       struct regmap *regmap,
-				       const char *reset_name)
-{
-	struct spacemit_ccu_adev *cadev;
-	struct auxiliary_device *adev;
-	int ret;
-
-	/* Nothing to do if the CCU does not implement a reset controller */
-	if (!reset_name)
-		return 0;
-
-	cadev = kzalloc(sizeof(*cadev), GFP_KERNEL);
-	if (!cadev)
-		return -ENOMEM;
-
-	cadev->regmap = regmap;
-
-	adev = &cadev->adev;
-	adev->name = reset_name;
-	adev->dev.parent = dev;
-	adev->dev.release = spacemit_cadev_release;
-	adev->dev.of_node = dev->of_node;
-	ret = ida_alloc(&auxiliary_ids, GFP_KERNEL);
-	if (ret < 0)
-		goto err_free_cadev;
-	adev->id = ret;
-
-	ret = auxiliary_device_init(adev);
-	if (ret)
-		goto err_free_aux_id;
-
-	ret = auxiliary_device_add(adev);
-	if (ret) {
-		auxiliary_device_uninit(adev);
-		return ret;
-	}
-
-	return devm_add_action_or_reset(dev, spacemit_adev_unregister, adev);
-
-err_free_aux_id:
-	ida_free(&auxiliary_ids, adev->id);
-err_free_cadev:
-	kfree(cadev);
-
-	return ret;
-}
-
-static int k1_ccu_probe(struct platform_device *pdev)
-{
-	struct regmap *base_regmap, *lock_regmap = NULL;
-	const struct spacemit_ccu_data *data;
-	struct device *dev = &pdev->dev;
-	int ret;
-
-	base_regmap = device_node_to_regmap(dev->of_node);
-	if (IS_ERR(base_regmap))
-		return dev_err_probe(dev, PTR_ERR(base_regmap),
-				     "failed to get regmap\n");
-
-	/*
-	 * The lock status of PLLs locate in MPMU region, while PLLs themselves
-	 * are in APBS region. Reference to MPMU syscon is required to check PLL
-	 * status.
-	 */
-	if (of_device_is_compatible(dev->of_node, "spacemit,k1-pll")) {
-		struct device_node *mpmu = of_parse_phandle(dev->of_node,
-							    "spacemit,mpmu", 0);
-		if (!mpmu)
-			return dev_err_probe(dev, -ENODEV,
-					     "Cannot parse MPMU region\n");
-
-		lock_regmap = device_node_to_regmap(mpmu);
-		of_node_put(mpmu);
-
-		if (IS_ERR(lock_regmap))
-			return dev_err_probe(dev, PTR_ERR(lock_regmap),
-					     "failed to get lock regmap\n");
-	}
-
-	data = of_device_get_match_data(dev);
-
-	ret = spacemit_ccu_register(dev, base_regmap, lock_regmap, data);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to register clocks\n");
-
-	ret = spacemit_ccu_reset_register(dev, base_regmap, data->reset_name);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to register resets\n");
-
-	return 0;
-}
-
 static const struct of_device_id of_k1_ccu_match[] = {
 	{
 		.compatible	= "spacemit,k1-pll",
@@ -1200,7 +1026,7 @@ static struct platform_driver k1_ccu_driver = {
 		.name		= "spacemit,k1-ccu",
 		.of_match_table = of_k1_ccu_match,
 	},
-	.probe	= k1_ccu_probe,
+	.probe	= spacemit_ccu_probe,
 };
 module_platform_driver(k1_ccu_driver);
 
diff --git a/drivers/clk/spacemit/ccu_common.c b/drivers/clk/spacemit/ccu_common.c
index 4412c4104dab..f1a837aafb46 100644
--- a/drivers/clk/spacemit/ccu_common.c
+++ b/drivers/clk/spacemit/ccu_common.c
@@ -1,6 +1,177 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
+#include <linux/clk-provider.h>
+#include <linux/device/devres.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/of.h>
+#include <linux/slab.h>
+#include <soc/spacemit/ccu.h>
+
+#include "ccu_common.h"
+
+static DEFINE_IDA(auxiliary_ids);
+static int spacemit_ccu_register(struct device *dev,
+				 struct regmap *regmap,
+				 struct regmap *lock_regmap,
+				 const struct spacemit_ccu_data *data)
+{
+	struct clk_hw_onecell_data *clk_data;
+	int i, ret;
+
+	/* Nothing to do if the CCU does not implement any clocks */
+	if (!data->hws)
+		return 0;
+
+	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->num),
+				GFP_KERNEL);
+	if (!clk_data)
+		return -ENOMEM;
+
+	clk_data->num = data->num;
+
+	for (i = 0; i < data->num; i++) {
+		struct clk_hw *hw = data->hws[i];
+		struct ccu_common *common;
+		const char *name;
+
+		if (!hw) {
+			clk_data->hws[i] = ERR_PTR(-ENOENT);
+			continue;
+		}
+
+		name = hw->init->name;
+
+		common = hw_to_ccu_common(hw);
+		common->regmap		= regmap;
+		common->lock_regmap	= lock_regmap;
+
+		ret = devm_clk_hw_register(dev, hw);
+		if (ret) {
+			dev_err(dev, "Cannot register clock %d - %s\n",
+				i, name);
+			return ret;
+		}
+
+		clk_data->hws[i] = hw;
+	}
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
+	if (ret)
+		dev_err(dev, "failed to add clock hardware provider (%d)\n", ret);
+
+	return ret;
+}
+
+static void spacemit_cadev_release(struct device *dev)
+{
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+
+	ida_free(&auxiliary_ids, adev->id);
+	kfree(to_spacemit_ccu_adev(adev));
+}
+
+static void spacemit_adev_unregister(void *data)
+{
+	struct auxiliary_device *adev = data;
+
+	auxiliary_device_delete(adev);
+	auxiliary_device_uninit(adev);
+}
+
+static int spacemit_ccu_reset_register(struct device *dev,
+				       struct regmap *regmap,
+				       const char *reset_name)
+{
+	struct spacemit_ccu_adev *cadev;
+	struct auxiliary_device *adev;
+	int ret;
+
+	/* Nothing to do if the CCU does not implement a reset controller */
+	if (!reset_name)
+		return 0;
+
+	cadev = kzalloc(sizeof(*cadev), GFP_KERNEL);
+	if (!cadev)
+		return -ENOMEM;
+
+	cadev->regmap = regmap;
+
+	adev = &cadev->adev;
+	adev->name = reset_name;
+	adev->dev.parent = dev;
+	adev->dev.release = spacemit_cadev_release;
+	adev->dev.of_node = dev->of_node;
+	ret = ida_alloc(&auxiliary_ids, GFP_KERNEL);
+	if (ret < 0)
+		goto err_free_cadev;
+	adev->id = ret;
+
+	ret = auxiliary_device_init(adev);
+	if (ret)
+		goto err_free_aux_id;
+
+	ret = auxiliary_device_add(adev);
+	if (ret) {
+		auxiliary_device_uninit(adev);
+		return ret;
+	}
+
+	return devm_add_action_or_reset(dev, spacemit_adev_unregister, adev);
+
+err_free_aux_id:
+	ida_free(&auxiliary_ids, adev->id);
+err_free_cadev:
+	kfree(cadev);
+
+	return ret;
+}
+
+int spacemit_ccu_probe(struct platform_device *pdev)
+{
+	struct regmap *base_regmap, *lock_regmap = NULL;
+	const struct spacemit_ccu_data *data;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	base_regmap = device_node_to_regmap(dev->of_node);
+	if (IS_ERR(base_regmap))
+		return dev_err_probe(dev, PTR_ERR(base_regmap),
+				     "failed to get regmap\n");
+
+	/*
+	 * The lock status of PLLs locate in MPMU region, while PLLs themselves
+	 * are in APBS region. Reference to MPMU syscon is required to check PLL
+	 * status.
+	 */
+	if (of_device_is_compatible(dev->of_node, "spacemit,k1-pll")) {
+		struct device_node *mpmu = of_parse_phandle(dev->of_node,
+							    "spacemit,mpmu", 0);
+		if (!mpmu)
+			return dev_err_probe(dev, -ENODEV,
+					     "Cannot parse MPMU region\n");
+
+		lock_regmap = device_node_to_regmap(mpmu);
+		of_node_put(mpmu);
+
+		if (IS_ERR(lock_regmap))
+			return dev_err_probe(dev, PTR_ERR(lock_regmap),
+					     "failed to get lock regmap\n");
+	}
+
+	data = of_device_get_match_data(dev);
+
+	ret = spacemit_ccu_register(dev, base_regmap, lock_regmap, data);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register clocks\n");
+
+	ret = spacemit_ccu_reset_register(dev, base_regmap, data->reset_name);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register resets\n");
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(spacemit_ccu_probe, "CLK_SPACEMIT");
 
 MODULE_DESCRIPTION("SpacemiT CCU common clock driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/spacemit/ccu_common.h b/drivers/clk/spacemit/ccu_common.h
index da72f3836e0b..9b4ef24875e5 100644
--- a/drivers/clk/spacemit/ccu_common.h
+++ b/drivers/clk/spacemit/ccu_common.h
@@ -7,6 +7,8 @@
 #ifndef _CCU_COMMON_H_
 #define _CCU_COMMON_H_
 
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
 #include <linux/regmap.h>
 
 struct ccu_common {
@@ -36,6 +38,12 @@ static inline struct ccu_common *hw_to_ccu_common(struct clk_hw *hw)
 	return container_of(hw, struct ccu_common, hw);
 }
 
+struct spacemit_ccu_data {
+	const char *reset_name;
+	struct clk_hw **hws;
+	size_t num;
+};
+
 #define ccu_read(c, reg)						\
 	({								\
 		u32 tmp;						\
@@ -45,4 +53,6 @@ static inline struct ccu_common *hw_to_ccu_common(struct clk_hw *hw)
 #define ccu_update(c, reg, mask, val) \
 	regmap_update_bits((c)->regmap, (c)->reg_##reg, mask, val)
 
+int spacemit_ccu_probe(struct platform_device *pdev);
+
 #endif /* _CCU_COMMON_H_ */
diff --git a/include/soc/spacemit/ccu.h b/include/soc/spacemit/ccu.h
new file mode 100644
index 000000000000..84dcdecccc05
--- /dev/null
+++ b/include/soc/spacemit/ccu.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __SOC_SPACEMIT_CCU_H__
+#define __SOC_SPACEMIT_CCU_H__
+
+#include <linux/auxiliary_bus.h>
+#include <linux/regmap.h>
+
+/* Auxiliary device used to represent a CCU reset controller */
+struct spacemit_ccu_adev {
+	struct auxiliary_device adev;
+	struct regmap *regmap;
+};
+
+static inline struct spacemit_ccu_adev *
+to_spacemit_ccu_adev(struct auxiliary_device *adev)
+{
+	return container_of(adev, struct spacemit_ccu_adev, adev);
+}
+
+#endif /* __SOC_SPACEMIT_CCU_H__ */
diff --git a/include/soc/spacemit/k1-syscon.h b/include/soc/spacemit/k1-syscon.h
index 354751562c55..0be7a2e8d445 100644
--- a/include/soc/spacemit/k1-syscon.h
+++ b/include/soc/spacemit/k1-syscon.h
@@ -5,17 +5,7 @@
 #ifndef __SOC_K1_SYSCON_H__
 #define __SOC_K1_SYSCON_H__
 
-/* Auxiliary device used to represent a CCU reset controller */
-struct spacemit_ccu_adev {
-	struct auxiliary_device adev;
-	struct regmap *regmap;
-};
-
-static inline struct spacemit_ccu_adev *
-to_spacemit_ccu_adev(struct auxiliary_device *adev)
-{
-	return container_of(adev, struct spacemit_ccu_adev, adev);
-}
+#include "ccu.h"
 
 /* APBS register offset */
 #define APBS_PLL1_SWCR1			0x100

-- 
2.52.0

