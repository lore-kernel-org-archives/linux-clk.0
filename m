Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA7A22B65A
	for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 10:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729853796; cv=none; b=W8RGHwbJ7rWz8m3nHuM7G+rN4TCFzLNngIF3fEsTkul9uKYpJG10TJimLJFIWvD2dsGZxW7J/MO+jBSEQDdktbKoYxkFOx6AQdQ8DNfPY4E3mNYt1ACJu/DkcXzFjLmnwKlyPKNnquJUB0BY9Nk505ZvO1zvGqsZOpss+l5edis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729853796; c=relaxed/simple;
	bh=5pRNV6rdcmQHE6v7/2eWZywn6ZacDgDKdX75ovzo2GQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Hhtu2MMhiElrdDEYIfP85naWcYT5PKEnCu3NIKkwMxbLPnRoHSvkVv9dLkvKD57ILRXE8kYcn41f1+kWm8eW2wlTr1f1iOVFFMt7Mrcd90Ab6hISJ0I50IOMK5XiCCegYMTpoU1ebqP5YXSK4rybmPAWY26sreQOMO8w2n1VjEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B65E4339;
	Fri, 25 Oct 2024 03:57:03 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.101.20])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 347AA3F73B;
	Fri, 25 Oct 2024 03:56:32 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Philippe Simons <simons.philippe@gmail.com>
Subject: [RFC PATCH] clk: sunxi-ng: h616: Reparent CPU clock during frequency changes
Date: Fri, 25 Oct 2024 11:56:20 +0100
Message-Id: <20241025105620.1891596-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The H616 user manual recommends to re-parent the CPU clock during
frequency changes of the PLL, and recommends PLL_PERI0(1X), which runs
at 600 MHz. Also it asks to disable and then re-enable the PLL lock bit,
after the factor changes have been applied.

Add clock notifiers for the PLL and the CPU mux clock, using the existing
notifier callbacks, and tell them to use mux 4 (the PLL_PERI0(1X) source),
and bit 29 (the LOCK_ENABLE) bit. The existing code already follows the
correct algorithms.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
Hi,

the manual states that those changes would be needed to safely change
the CPU_PLL frequency during DVFS operation. On my H618 boards it works
fine without them, but Philippe reported problems on his H700 board.
Posting this for reference at this point, to see if it helps people.
I am not sure we should change this without it fixing any real issues.

The same algorithm would apply to the A100/A133 (and the upcoming A523)
as well.

Cheers,
Andre

 drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 28 ++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
index 84e406ddf9d12..85eea196f25e3 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
@@ -1095,11 +1095,24 @@ static const u32 usb2_clk_regs[] = {
 	SUN50I_H616_USB3_CLK_REG,
 };
 
+static struct ccu_mux_nb sun50i_h616_cpu_nb = {
+	.common		= &cpux_clk.common,
+	.cm		= &cpux_clk.mux,
+	.delay_us	= 1, /* manual doesn't really say */
+	.bypass_index	= 4, /* PLL_PERI0@600MHz, as recommended by manual */
+};
+
+static struct ccu_pll_nb sun50i_h616_pll_cpu_nb = {
+	.common		= &pll_cpux_clk.common,
+	.enable		= BIT(29),	/* LOCK_ENABLE */
+	.lock		= BIT(28),
+};
+
 static int sun50i_h616_ccu_probe(struct platform_device *pdev)
 {
 	void __iomem *reg;
 	u32 val;
-	int i;
+	int ret, i;
 
 	reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(reg))
@@ -1152,7 +1165,18 @@ static int sun50i_h616_ccu_probe(struct platform_device *pdev)
 	val |= BIT(24);
 	writel(val, reg + SUN50I_H616_HDMI_CEC_CLK_REG);
 
-	return devm_sunxi_ccu_probe(&pdev->dev, reg, &sun50i_h616_ccu_desc);
+	ret = devm_sunxi_ccu_probe(&pdev->dev, reg, &sun50i_h616_ccu_desc);
+	if (ret)
+		return ret;
+
+	/* Reparent CPU during CPU PLL rate changes */
+	ccu_mux_notifier_register(pll_cpux_clk.common.hw.clk,
+				  &sun50i_h616_cpu_nb);
+
+	/* Re-lock the CPU PLL after any rate changes */
+	ccu_pll_notifier_register(&sun50i_h616_pll_cpu_nb);
+
+	return 0;
 }
 
 static const struct of_device_id sun50i_h616_ccu_ids[] = {
-- 
2.25.1

