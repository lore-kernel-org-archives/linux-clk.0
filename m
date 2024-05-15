Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F341484DFD;
	Wed, 15 May 2024 12:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715777957; cv=none; b=BBVx908sNtbW0T8wWzHvS76zXWBLOfeG3q1VLrZxdiJc4lnG4pd8EFMcibJD16bkwS2Rta2wIudC3a8R8TQle+ZsD4Gp5hC2kzn47cAOEcJzE3Zzeb5M2IHR1hQm/wJblxapOLHyYXKK5Lt8wIsrMpVkkFW8xaxFmP8QAhIHQY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715777957; c=relaxed/simple;
	bh=ZB9eG4dWLioh04ljT5vudxJJ7ZSncKp0nvhSMD6GfbY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ktbh97WuN5AfaprA704zCVSsrsEAxZ/D3j31iRD6Cg235WUIOdHZVGKCVYtGMUHyohk476Sd+qsPFb+owjdGre9XHeS76hNDCyiKFIQN6YTDH0XMCMaEKYI9qyFTl7kIXYhpx3qFy1sjKFQhSsNQALrpgLwrZua54r8JyY9VXd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BgsSv0R+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BgsSv0R+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28DD5C116B1;
	Wed, 15 May 2024 12:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715777956;
	bh=ZB9eG4dWLioh04ljT5vudxJJ7ZSncKp0nvhSMD6GfbY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BgsSv0R+UAeBF4s5d+GGRT3As0GHu/wHBU9I7oN/rR9rReCFxBfSeYqreSDv+/q9l
	 VSK56uIYPAxwwKmLfZPAgBUWX6CuPeCojHKga0YfdFLCczRT6sHTJ/4vXzCogVfAL6
	 A9EmoJMbO9PmPCoKAiqJHPss6bFduiQ7RwjI+dWlzwDABB164XldGNqT1jDa+YzF2s
	 9Z+P6VQWLZgpkcK1SwMb8+iM9F2/JGYyGJUvMwNL50bBCBogFsA8Xr3xTlxZYLVajr
	 6swcosSU90tQWDCe50mJG8uO9ZKx1vrpfCE+bq6BIKpFVLrmWpHOkebwTDDUhHMh4f
	 f7eFqz7tVmCyg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: linux-clk@vger.kernel.org
Cc: p.zabel@pengutronix.de,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	lorenzo.bianconi83@gmail.com,
	conor@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	nbd@nbd.name,
	john@phrozen.org,
	dd@embedd.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	upstream@airoha.com,
	angelogioacchino.delregno@collabora.com
Subject: [PATCH 4/5] clk: en7523: Add reset-controller support for EN7581 SoC
Date: Wed, 15 May 2024 14:58:50 +0200
Message-ID: <0f7b04c2101db1a974dc45017bee285ffb25d80f.1715777643.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <cover.1715777643.git.lorenzo@kernel.org>
References: <cover.1715777643.git.lorenzo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce reset API support to EN7581 clock driver.

Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/clk/clk-en7523.c | 96 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 94 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 381605be333f..18798b692b68 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -6,6 +6,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/reset-controller.h>
 #include <dt-bindings/clock/en7523-clk.h>
 
 #define REG_PCI_CONTROL			0x88
@@ -65,8 +66,18 @@ struct en_clk_gate {
 	struct clk_hw hw;
 };
 
+#define RST_NR_PER_BANK		32
+struct en_reset_data {
+	void __iomem *mem_base;
+	struct reset_controller_dev rcdev;
+};
+
 struct en_clk_soc_data {
 	const struct clk_ops pcie_ops;
+	struct {
+		u32 base_addr;
+		u16 n_banks;
+	} reset_data;
 	int (*hw_init)(struct platform_device *pdev, void __iomem *base,
 		       void __iomem *np_base);
 };
@@ -424,6 +435,81 @@ static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 	clk_data->num = EN7523_NUM_CLOCKS;
 }
 
+static int en7523_reset_update(struct reset_controller_dev *rcdev,
+			       unsigned long id, bool assert)
+{
+	int offset = id % RST_NR_PER_BANK;
+	int bank = id / RST_NR_PER_BANK;
+	struct en_reset_data *rst_data;
+	u32 val;
+
+	rst_data = container_of(rcdev, struct en_reset_data, rcdev);
+	val = readl(rst_data->mem_base + bank * sizeof(u32));
+	if (assert)
+		val |= BIT(offset);
+	else
+		val &= ~BIT(offset);
+	writel(val, rst_data->mem_base + bank * sizeof(u32));
+
+	return 0;
+}
+
+static int en7523_reset_assert(struct reset_controller_dev *rcdev,
+			       unsigned long id)
+{
+	return en7523_reset_update(rcdev, id, true);
+}
+
+static int en7523_reset_deassert(struct reset_controller_dev *rcdev,
+				 unsigned long id)
+{
+	return en7523_reset_update(rcdev, id, false);
+}
+
+static int en7523_reset_status(struct reset_controller_dev *rcdev,
+			       unsigned long id)
+{
+	int offset = id % RST_NR_PER_BANK;
+	int bank = id / RST_NR_PER_BANK;
+	struct en_reset_data *rst_data;
+	u32 val;
+
+	rst_data = container_of(rcdev, struct en_reset_data, rcdev);
+	val = readl(rst_data->mem_base + bank * sizeof(u32));
+
+	return !!(val & BIT(offset));
+}
+
+static const struct reset_control_ops en7523_reset_ops = {
+	.assert = en7523_reset_assert,
+	.deassert = en7523_reset_deassert,
+	.status = en7523_reset_status,
+};
+
+static int en7523_reset_register(struct device *dev, void __iomem *base,
+				 const struct en_clk_soc_data *soc_data)
+{
+	u32 nr_resets = soc_data->reset_data.n_banks * RST_NR_PER_BANK;
+	struct en_reset_data *rst_data;
+
+	/* no reset lines available */
+	if (!nr_resets)
+		return 0;
+
+	rst_data = devm_kzalloc(dev, sizeof(*rst_data), GFP_KERNEL);
+	if (!rst_data)
+		return -ENOMEM;
+
+	rst_data->mem_base = base + soc_data->reset_data.base_addr;
+	rst_data->rcdev.owner = THIS_MODULE;
+	rst_data->rcdev.ops = &en7523_reset_ops;
+	rst_data->rcdev.of_node = dev->of_node;
+	rst_data->rcdev.dev = dev;
+	rst_data->rcdev.nr_resets = nr_resets;
+
+	return devm_reset_controller_register(dev, &rst_data->rcdev);
+}
+
 static int en7523_clk_probe(struct platform_device *pdev)
 {
 	struct device_node *node = pdev->dev.of_node;
@@ -456,12 +542,14 @@ static int en7523_clk_probe(struct platform_device *pdev)
 	en7523_register_clocks(&pdev->dev, clk_data, base, np_base);
 
 	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
+	if (r) {
 		dev_err(&pdev->dev,
 			"could not register clock provider: %s: %d\n",
 			pdev->name, r);
+		return r;
+	}
 
-	return r;
+	return en7523_reset_register(&pdev->dev, np_base, soc_data);
 }
 
 static const struct en_clk_soc_data en7523_data = {
@@ -480,6 +568,10 @@ static const struct en_clk_soc_data en7581_data = {
 		.unprepare = en7581_pci_unprepare,
 		.disable = en7581_pci_disable,
 	},
+	.reset_data = {
+		.base_addr = REG_RESET_CONTROL2,
+		.n_banks = 2,
+	},
 	.hw_init = en7581_clk_hw_init,
 };
 
-- 
2.45.0

