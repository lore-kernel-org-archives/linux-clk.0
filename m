Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D143F2FF15B;
	Tue, 17 Feb 2026 09:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771320607; cv=none; b=A8aHB0VKbdmfDsaBnEpGy24aU46A3cNNh6hx55ySgdPGamMNiV/eYJTqeErCUpP/fm1YbMe2mjYrvOFuWw6nwOXEsKB6p+7sXSnyfq4QwnHpY7/YYXBy8ct6GuXwvJt3j2dTqmgaKhm4i9T+RuuBVuE+fHHfU1HiaFUlEj6ImOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771320607; c=relaxed/simple;
	bh=1k8IYuo7K3Yqw0fOXyGW+rdO/3WvYsWAMv00ZYTHAUU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R9Rz2eyfwLJkCF0y1zJVQVNf5QhKw7cwAi4UNiq2Lgut5W1rxx+s382l8Kgs7HR6YdNQDT3J4SCf1qtO8lPigjQdnYTZCEYknioBD2yUWlO8r2zM8bDBnMIwUV5mzOG4ejrRB0JI3NZB0+m5cb9jOepbXBy8UKv3xA178Nli+Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jsMehZnP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jsMehZnP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62695C4CEF7;
	Tue, 17 Feb 2026 09:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771320607;
	bh=1k8IYuo7K3Yqw0fOXyGW+rdO/3WvYsWAMv00ZYTHAUU=;
	h=From:To:Cc:Subject:Date:From;
	b=jsMehZnPdpzMgPFWtctXU1YG8FhPeOmx4M4tJrmXtZVI3nE9l30/bToxfUKgtCX5i
	 L9i10wGo++GP7vJ2pgHnxZ72Wy+fFOFJyedK6H3FwWbeo6WDLDREEDzkYEL/KoR5vU
	 i86UgarLbH6Ve3Gm3nBFuL255+rtCaHgKVBvtsbHnsmiQmmNd3a9fYbi7P+9TGGvAO
	 1tKtS3KwMOrPWsXmeLz6Z9mSEGlnR1qkn22VH9YWC+wnlaHE2O2m5WaTvgeKCqOfIC
	 OejKiGYBeffJfQ/a6rMHMmbZKYN84K5LUjwqca++QIp+tsrYjefa6TOt0ERSLtE4bT
	 8uF9egvqRI99Q==
Received: by wens.tw (Postfix, from userid 1000)
	id 554705FCAE; Tue, 17 Feb 2026 17:30:05 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: sunxi-ng: sun55i-a523-r: Add missing r-spi module clock
Date: Tue, 17 Feb 2026 17:30:03 +0800
Message-ID: <20260217093004.3239051-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the PRCM clk driver was added, somehow the r-spi module clock
was skipped over.

Add it so that r-spi can actually work.

Fixes: 8cea339cfb81 ("clk: sunxi-ng: add support for the A523/T527 PRCM CCU")
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
index 0339c4af0fe5..db0e36d8838e 100644
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
@@ -83,9 +83,22 @@ static SUNXI_CCU_MUX_DATA_WITH_GATE(r_pwmctrl_clk, "r-pwmctrl",
 static SUNXI_CCU_GATE_HW(bus_r_pwmctrl_clk, "bus-r-pwmctrl",
 			 &r_apb0_clk.common.hw, 0x13c, BIT(0), 0);
 
-/* SPI clock is /M/N (same as new MMC?) */
+static const struct clk_parent_data r_spi_parents[] = {
+	{ .fw_name = "hosc" },
+	{ .fw_name = "pll-periph" },
+	{ .name = "pll-periph0-300M" },
+	{ .name = "pll-periph1-300M" },
+	{ .name = "pll-audio" },
+};
+static SUNXI_CCU_DUALDIV_MUX_GATE(r_spi_clk, "r-spi", r_spi_parents, 0x150,
+				  0, 5,		/* M */
+				  8, 5,		/* P */
+				  24, 3,	/* mux */
+				  BIT(31),	/* gate */
+				  0);
 static SUNXI_CCU_GATE_HW(bus_r_spi_clk, "bus-r-spi",
 			 &r_ahb_clk.common.hw, 0x15c, BIT(0), 0);
+
 static SUNXI_CCU_GATE_HW(bus_r_spinlock_clk, "bus-r-spinlock",
 			 &r_ahb_clk.common.hw, 0x16c, BIT(0), 0);
 static SUNXI_CCU_GATE_HW(bus_r_msgbox_clk, "bus-r-msgbox",
@@ -138,6 +151,7 @@ static struct ccu_common *sun55i_a523_r_ccu_clks[] = {
 	&bus_r_twd_clk.common,
 	&r_pwmctrl_clk.common,
 	&bus_r_pwmctrl_clk.common,
+	&r_spi_clk.common,
 	&bus_r_spi_clk.common,
 	&bus_r_spinlock_clk.common,
 	&bus_r_msgbox_clk.common,
@@ -169,6 +183,7 @@ static struct clk_hw_onecell_data sun55i_a523_r_hw_clks = {
 		[CLK_BUS_R_TWD]		= &bus_r_twd_clk.common.hw,
 		[CLK_R_PWMCTRL]		= &r_pwmctrl_clk.common.hw,
 		[CLK_BUS_R_PWMCTRL]	= &bus_r_pwmctrl_clk.common.hw,
+		[CLK_R_SPI]		= &r_spi_clk.common.hw,
 		[CLK_BUS_R_SPI]		= &bus_r_spi_clk.common.hw,
 		[CLK_BUS_R_SPINLOCK]	= &bus_r_spinlock_clk.common.hw,
 		[CLK_BUS_R_MSGBOX]	= &bus_r_msgbox_clk.common.hw,
-- 
2.47.3

