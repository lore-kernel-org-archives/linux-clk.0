Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EFE51BE23B
	for <linux-clk@vger.kernel.org>; Tue,  1 Oct 2024 10:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727779825; cv=none; b=mGHO5opv7MMERIy/QXOFlmIYOrt7fboyjuc0LI6280A3rcyyfbqVXin7B3ESkbuNFDlyBKfrqvdDKJxp04zGePPezwNpjPE46J9XxzrUx3+PysX8YHXdhygi/DPGolpBCw/7YBEOyUWdsL+fN89WbxlHcf8Bz7nIMLnPDJAH08k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727779825; c=relaxed/simple;
	bh=1G3LMez02c5t95GOUk4Fetsv+HHSqHBWtJzivVVscXE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CYRzWGuikJnIbWMwy81IpAzqRON42MC3WQQxqxhKGcgx+L22PBLEdZLllLyeJPPMux+hbAYwgU1BYOZJfmlwfzV65TL67IokO35MC1c3RjPhsBXDQ78wRHDnL2V+LDolub6mo+Z8BccLmn4dKPMANv3AeEDWoyv5Q9MrmYbx7AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47DB0339;
	Tue,  1 Oct 2024 03:50:52 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.101.20])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F21F3F587;
	Tue,  1 Oct 2024 03:50:21 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] clk: sunxi-ng: d1: Fix PLL_AUDIO0 preset
Date: Tue,  1 Oct 2024 11:50:16 +0100
Message-Id: <20241001105016.1068558-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To work around a limitation in our clock modelling, we try to force two
bits in the AUDIO0 PLL to 0, in the CCU probe routine.
However the ~ operator only applies to the first expression, and does
not cover the second bit, so we end up clearing only bit 1.

Group the bit-ORing with parentheses, to make it both clearer to read
and actually correct.

Fixes: 35b97bb94111 ("clk: sunxi-ng: Add support for the D1 SoC clocks")
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
Hi,

this should double that PLL's frequency by 0, since we drop the unwanted
divider. Not sure if anyone has spotted the problem before, and maybe
worked around it?
If that extra divider is correct, the comment should be adjusted
instead.

Cheers,
Andre

 drivers/clk/sunxi-ng/ccu-sun20i-d1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun20i-d1.c b/drivers/clk/sunxi-ng/ccu-sun20i-d1.c
index 9b5cfac2ee70c..3f095515f54f9 100644
--- a/drivers/clk/sunxi-ng/ccu-sun20i-d1.c
+++ b/drivers/clk/sunxi-ng/ccu-sun20i-d1.c
@@ -1371,7 +1371,7 @@ static int sun20i_d1_ccu_probe(struct platform_device *pdev)
 
 	/* Enforce m1 = 0, m0 = 0 for PLL_AUDIO0 */
 	val = readl(reg + SUN20I_D1_PLL_AUDIO0_REG);
-	val &= ~BIT(1) | BIT(0);
+	val &= ~(BIT(1) | BIT(0));
 	writel(val, reg + SUN20I_D1_PLL_AUDIO0_REG);
 
 	/* Force fanout-27M factor N to 0. */
-- 
2.25.1

