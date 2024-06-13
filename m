Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EE31E49B;
	Thu, 13 Jun 2024 12:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718282874; cv=none; b=QGKvHKQ64b3G0bWPvyJuP7YJpw1/FPUKSwyKjJJDUNu2i5XSF1W5P8u3aH0ZramdAh0PEznzvS2C84X3CfRGprTjTB3Hp08yP5qO4SNag5G5e4ZBLsShqtLlCcKdzrLum2yLkodJXNfnrcSaVo50mq7OT1F+hn0Zue6K5KPyXDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718282874; c=relaxed/simple;
	bh=S6lUckfLeB0DNVN+ciQdJA86RnrUZzC0QD5OQ0XRMQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lwVyPENSMKMF6ZrODSaUv+12zowxNAnwQclL/Z9ymXkZLQEOsWDixKSNNe+cqk3f4OZZ/klxN5u8oZCWRyFnellhhMeUyo5jayKXP4+CnSpLJ+rXEmNE+TPdV5do4DaHZkQhPBmSWoCkj2STkJYVbj3b9d9aFnw2E1JebtgvoPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TRXBKenE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TRXBKenE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1011C4AF1A;
	Thu, 13 Jun 2024 12:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718282874;
	bh=S6lUckfLeB0DNVN+ciQdJA86RnrUZzC0QD5OQ0XRMQw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TRXBKenEX9+k3PReXyruTVjZJAnBvKrryeGC52ULGTyVxKxgpjDQnQyoBs/YpfVcE
	 CuBWgoEWMegQznKdP+rY6waDKmwjIvjbrVe8wOKmiK60mDqWIOLB7HkFcCvhyc/Se5
	 8LaJJbBXf07A+CiJgaYnFFQjMhDjG6WTDCqqX/SfAKsbYXSqZhcMId7pDbDjMsLiKJ
	 ge+Krm3tFxCnCfiowjrJGo8uxp01a1mH+O0okS2shlmoJAJ+sdyeqPE1E9TSEv6CZ5
	 lofTNK1vlZQP4xhNHqBqu3eaXCKKL3lGWQGrVMHwr7tyXpYeSDJUCZjLj8gNMWKCxf
	 /WfXizPV5vjaQ==
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
Subject: [PATCH v3 4/4] clk: en7523: remove pcie reset open drain configuration for EN7581
Date: Thu, 13 Jun 2024 14:47:06 +0200
Message-ID: <af02d142d069015376506dd05215f30f0606039f.1718282056.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1718282056.git.lorenzo@kernel.org>
References: <cover.1718282056.git.lorenzo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PCIE reset open drain configuration will be managed by pinctrl driver.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/clk/clk-en7523.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index ad8a4d1ad62c..9757023601c5 100644
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
 
@@ -584,7 +576,7 @@ static int en7523_clk_probe(struct platform_device *pdev)
 
 	soc_data = device_get_match_data(&pdev->dev);
 	if (soc_data->hw_init) {
-		r = soc_data->hw_init(pdev, base, np_base);
+		r = soc_data->hw_init(pdev, np_base);
 		if (r)
 			return r;
 	}
-- 
2.45.1

