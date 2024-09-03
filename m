Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B571C62C5;
	Tue,  3 Sep 2024 21:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725399616; cv=none; b=KIREcC4eqFTZZZr21UxI917Sswlo7Q3bVVE5awGs5uCF4U2BZQTTgK4iDHUHNatW1hWTBjRgFmzgN7CjkCJPLaHcwuQEwaUxznTf6GbdMUiz9entsTndICUjYwtrfrxr679o0WeJ9GadLjElmiOk9th6L0sj2D0NB5v342eBFAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725399616; c=relaxed/simple;
	bh=cGV5szsD+4z0z0sEdE3fe/LJ1oug+CG6EBmlovNucZo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iw8TvUWlCJyF6ZlNhB1kFkVg70jFbPAXAx3EtAZisN4l6kSipAIL4s4cWUgJJ7vfwIQuGbBs2TXe/NF8kdGYv92mOFpjJINGFTmSdQzyRSXInCnaRWSfvxSFFg3JoRQbLx6GE2F4VsQWhbmF+HD0/zKax1ui0PIDGc623a3ihDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RnlwPQE4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RnlwPQE4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BE56C4CEC7;
	Tue,  3 Sep 2024 21:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725399616;
	bh=cGV5szsD+4z0z0sEdE3fe/LJ1oug+CG6EBmlovNucZo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RnlwPQE4WIP8cB21O/+sbHvXFbBuusAQEkIvC3DPSg6bKQUPM29Vw0knufz17EzTZ
	 yoa7+AgoLJQqu7GWfPQOMSEz57S9KjlGWL8u1jvJyI5dACNC3cfYDfrytYGDLquhym
	 i4QKwhzCHVuYzPetWNlTFvh7JGRsptdqvPxoZNXyl1tCbw1R9E/9o2783uastdwXlG
	 sqysILn+W6mP+Tu1gnVuMQhddYSbqYxbH+f528rzup6TDmHEkQ8hOyN0EUCKAm9i3o
	 0RkOabdAaIbMjuU8YEgTwL6DIDdzaEUxyEptvpS88bc2/fyH60NSOgL+1+q8p4F6SV
	 sdXEtgGWwNlDA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 03 Sep 2024 23:39:46 +0200
Subject: [PATCH v2 2/7] clk: en7523: remove REG_PCIE*_{MEM,MEM_MASK}
 configuration
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-clk-en7581-syscon-v2-2-86fbe2fc15c3@kernel.org>
References: <20240903-clk-en7581-syscon-v2-0-86fbe2fc15c3@kernel.org>
In-Reply-To: <20240903-clk-en7581-syscon-v2-0-86fbe2fc15c3@kernel.org>
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

REG_PCIE*_MEM and REG_PCIE*_MEM_MASK regs (PBUS_CSR memory region) are not
part of the scu block on the EN7581 SoC and they are used to select the
PCIE ports on the PBUS, so remove this configuration from the clock driver
and set these registers in the PCIE host driver instead.
This patch does not introduce any backward incompatibility since the dts
for EN7581 SoC is not upstream yet.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/clk/clk-en7523.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 22fbea61c3dc..ec6716844fdc 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -31,12 +31,6 @@
 #define   REG_RESET_CONTROL_PCIE1	BIT(27)
 #define   REG_RESET_CONTROL_PCIE2	BIT(26)
 /* EN7581 */
-#define REG_PCIE0_MEM			0x00
-#define REG_PCIE0_MEM_MASK		0x04
-#define REG_PCIE1_MEM			0x08
-#define REG_PCIE1_MEM_MASK		0x0c
-#define REG_PCIE2_MEM			0x10
-#define REG_PCIE2_MEM_MASK		0x14
 #define REG_NP_SCU_PCIC			0x88
 #define REG_NP_SCU_SSTR			0x9c
 #define REG_PCIE_XSI0_SEL_MASK		GENMASK(14, 13)
@@ -415,26 +409,14 @@ static void en7581_pci_disable(struct clk_hw *hw)
 static int en7581_clk_hw_init(struct platform_device *pdev,
 			      void __iomem *np_base)
 {
-	void __iomem *pb_base;
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
-
 	return 0;
 }
 

-- 
2.46.0

