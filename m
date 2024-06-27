Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50805143C7D;
	Thu, 27 Jun 2024 11:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719486313; cv=none; b=dyPTeVgRllvsJQQT9GnJiNrKUG4+FtK7jqGpXhKOr2HDEhLZkIZoYyHltPxC8mGqSzJxc4gc11TgSaFzcbok8l3vhqTMFLMAcGbwyjS8+vdlXbKjGIEX2vvcbGdNDErVqliS34cH5fyQmDoxAl5fQM/EiSHKY2W/x49mLb0yUaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719486313; c=relaxed/simple;
	bh=CHPj1ScjgYdVyznC3pgzpXrR/68/AlaRg0dR6cJ7qLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J9JyBH5Wvi6cigocd9I8pjIlhEneF8XUu7+eUhKDBQ8fnpx44yJopLZ8iPZPtwlksy5XRk/0GJZ0zJpE/Mt4scaobnzL2EswWNzS91Elk9sQ3WxK+W7dvSw/RSdS6rOaqeuQKDnh+6DX9dZt6TTE8M3fFQevVIq0He05vPPUN84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T8XMc63r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T8XMc63r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D26D4C2BBFC;
	Thu, 27 Jun 2024 11:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719486313;
	bh=CHPj1ScjgYdVyznC3pgzpXrR/68/AlaRg0dR6cJ7qLc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T8XMc63rUSyUjf3w5SjrCw9rLNMNNrHG2wu4Ani4jr+NFkzmU9opOMAJd6YXCGKOY
	 UvksEtyOvS1wJLAQcfgHBim+uBvp7DCHS6036/foKPAO/2s3htlsSNV42V8G1NCuSz
	 00nZ9axcC2P6SAOQj0qaUl5R+tWd9ovzz3eyJ0R66mRdK3+zAZMyPEBxluF+UNR/ke
	 o2YH4vdA7+f2Uxe6zFyPTj0kd/eiR7i5N9QKJxHrVcp5aGS4wG9ORZewWd050RCtK/
	 qVTIuXIW8AN3Od9Nwb9X1miOZCgoIjjxEh0vsVrwjAm7xzJ1la5QIuTPWOtp0Bh9OJ
	 TwaVRgqFCPDkg==
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
Subject: [PATCH v4 4/4] clk: en7523: Remove PCIe reset open drain configuration for EN7581
Date: Thu, 27 Jun 2024 13:04:25 +0200
Message-ID: <43276af5f08a554b4ab2e52e8d437fff5c06a732.1719485847.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1719485847.git.lorenzo@kernel.org>
References: <cover.1719485847.git.lorenzo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PCIe reset open drain configuration will be managed by pinctrl driver.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/clk/clk-en7523.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index b134821b23c1..e10c73c29ee2 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -37,8 +37,6 @@
 #define REG_PCIE1_MEM_MASK		0x0c
 #define REG_PCIE2_MEM			0x10
 #define REG_PCIE2_MEM_MASK		0x14
-#define REG_PCIE_RESET_OPEN_DRAIN	0x018c
-#define REG_PCIE_RESET_OPEN_DRAIN_MASK	GENMASK(2, 0)
 #define REG_NP_SCU_PCIC			0x88
 #define REG_NP_SCU_SSTR			0x9c
 #define REG_PCIE_XSI0_SEL_MASK		GENMASK(14, 13)
@@ -85,8 +83,7 @@ struct en_clk_soc_data {
 		const u16 *idx_map;
 		u16 idx_map_nr;
 	} reset;
-	int (*hw_init)(struct platform_device *pdev, void __iomem *base,
-		       void __iomem *np_base);
+	int (*hw_init)(struct platform_device *pdev, void __iomem *np_base);
 };
 
 static const u32 gsw_base[] = { 400000000, 500000000 };
@@ -411,7 +408,6 @@ static void en7581_pci_disable(struct clk_hw *hw)
 }
 
 static int en7581_clk_hw_init(struct platform_device *pdev,
-			      void __iomem *base,
 			      void __iomem *np_base)
 {
 	void __iomem *pb_base;
@@ -434,10 +430,6 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
 	writel(0x28000000, pb_base + REG_PCIE2_MEM);
 	writel(0xfc000000, pb_base + REG_PCIE2_MEM_MASK);
 
-	val = readl(base + REG_PCIE_RESET_OPEN_DRAIN);
-	writel(val | REG_PCIE_RESET_OPEN_DRAIN_MASK,
-	       base + REG_PCIE_RESET_OPEN_DRAIN);
-
 	return 0;
 }
 
@@ -577,7 +569,7 @@ static int en7523_clk_probe(struct platform_device *pdev)
 
 	soc_data = device_get_match_data(&pdev->dev);
 	if (soc_data->hw_init) {
-		r = soc_data->hw_init(pdev, base, np_base);
+		r = soc_data->hw_init(pdev, np_base);
 		if (r)
 			return r;
 	}
-- 
2.45.2

