Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EE516DEBB;
	Sat, 31 Aug 2024 07:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725088753; cv=none; b=Zwk6FT9pgNZi9Whcr0JiRNicGDuinl5ARXMQSx/GfQZm8p0TWhqBe2yp+oITcuP8w8jTh8SCt7sMnhg3oGL+pYma9qV2/fTAW2ON/5Nwc6Lr2XhVAyJYG4unoqKhVZB+KRkru4zw1JlQiuCb2NoDkpmTBvWMGK6o2FDkRek4urQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725088753; c=relaxed/simple;
	bh=WN8qnYso/OqQzZPqMv9ygjMnLiv6+Y8d2xbdKSe1W/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Aiyp2TIg2u9o6Rg4cSrim3o+30ynmRWpndMQ+/kBG8K8hmSW2iyPPf+GkB1z3qaSAn7QzR2PzQDbbQveuukUb58XnDbGNiSkTNx9JlZmUItb2IooANjanXe2smsKIYAo5CfVKzTnPrWatqgry3whGy0yJ9IHZdjONZOPvt4XK4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t6PXy+Ra; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t6PXy+Ra"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F2A7C4CEC0;
	Sat, 31 Aug 2024 07:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725088753;
	bh=WN8qnYso/OqQzZPqMv9ygjMnLiv6+Y8d2xbdKSe1W/Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=t6PXy+RaWEXj3ftmXfbGo7QdQn0lTK+GhJ9CETel+/4gQaT/7yoEhzpyPXH49LqKU
	 UzVJtuHIcLRvaV8EgC0RsX5y0+ME+ze6+P4K7Kb9yZd4YMS5cuT43lc9ls9CX8VDXW
	 uI2InafjZg676bqlrtaqAoerOTEwinzcd7aTPK/F4M9O29KmMEagbqgiEG5YDzfNd2
	 QvpDzpiOPT/asSbzn2ZsNWbvxbzp8t8pEbSgXyf4PiWO5L6Yux7qbuspGQ/6+sUtzC
	 fZFXxhfXKAj2uCzZuF57F/Zre/8RX16NfIYFpPX4tZUT7MbEB4bKSgZHbABi4zb4Mf
	 UM9D93iYshvgQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 31 Aug 2024 09:18:44 +0200
Subject: [PATCH 2/7] clk: en7523: set REG_PCIE*_{MEM,MEM_MASK} via syscon
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240831-clk-en7581-syscon-v1-2-5c2683541068@kernel.org>
References: <20240831-clk-en7581-syscon-v1-0-5c2683541068@kernel.org>
In-Reply-To: <20240831-clk-en7581-syscon-v1-0-5c2683541068@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 upstream@airoha.com, angelogioacchino.delregno@collabora.com, 
 linux-arm-kernel@lists.infradead.org, lorenzo.bianconi83@gmail.com, 
 ansuelsmth@gmail.com, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.1

REG_PCIE*_MEM and REG_PCIE*_MEM_MASK memory regions (PBUS_CSR) are not
part of the scu block on the EN7581 SoC, so configure them via a dedicated
syscon node. This patch does not introduce any backward incompatibility
since the dts for EN7581 SoC is not public yet.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/clk/clk-en7523.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 22fbea61c3dc..2bc1bf4afbed 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -3,8 +3,10 @@
 #include <linux/delay.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
+#include <linux/mfd/syscon.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/regmap.h>
 #include <linux/reset-controller.h>
 #include <dt-bindings/clock/en7523-clk.h>
 #include <dt-bindings/reset/airoha,en7581-reset.h>
@@ -415,25 +417,25 @@ static void en7581_pci_disable(struct clk_hw *hw)
 static int en7581_clk_hw_init(struct platform_device *pdev,
 			      void __iomem *np_base)
 {
-	void __iomem *pb_base;
+	struct regmap *map;
 	u32 val;
 
-	pb_base = devm_platform_ioremap_resource(pdev, 3);
-	if (IS_ERR(pb_base))
-		return PTR_ERR(pb_base);
-
 	val = readl(np_base + REG_NP_SCU_SSTR);
 	val &= ~(REG_PCIE_XSI0_SEL_MASK | REG_PCIE_XSI1_SEL_MASK);
 	writel(val, np_base + REG_NP_SCU_SSTR);
 	val = readl(np_base + REG_NP_SCU_PCIC);
 	writel(val | 3, np_base + REG_NP_SCU_PCIC);
 
-	writel(0x20000000, pb_base + REG_PCIE0_MEM);
-	writel(0xfc000000, pb_base + REG_PCIE0_MEM_MASK);
-	writel(0x24000000, pb_base + REG_PCIE1_MEM);
-	writel(0xfc000000, pb_base + REG_PCIE1_MEM_MASK);
-	writel(0x28000000, pb_base + REG_PCIE2_MEM);
-	writel(0xfc000000, pb_base + REG_PCIE2_MEM_MASK);
+	map = syscon_regmap_lookup_by_compatible("airoha,en7581-pbus-csr");
+	if (IS_ERR(map))
+		return PTR_ERR(map);
+
+	regmap_write(map, REG_PCIE0_MEM, 0x20000000);
+	regmap_write(map, REG_PCIE0_MEM_MASK, 0xfc000000);
+	regmap_write(map, REG_PCIE1_MEM, 0x24000000);
+	regmap_write(map, REG_PCIE1_MEM_MASK, 0xfc000000);
+	regmap_write(map, REG_PCIE2_MEM, 0x28000000);
+	regmap_write(map, REG_PCIE2_MEM_MASK, 0xfc000000);
 
 	return 0;
 }

-- 
2.46.0

