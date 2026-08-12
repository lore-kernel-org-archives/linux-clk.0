Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5C338643B
	for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 20:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786565713; cv=none; b=eyM6Zpqw1QVRbC5H+Pg6MBnwdg/OgjLqnip7galeMi6oceCUfotghlvMAo/CxzExlYtYkpzt/zndAhyHR6pkpy6gjOW1O3JmgolI/txmIDHupqdl69kI+3jm+1NIl3lkKl8CnOi6ivRpZyGsqqbrrOATyBnzTNgziAPMvXuIloE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786565713; c=relaxed/simple;
	bh=ECX11tFxOWG0FJjizgFuQNlSMkvWsuHAKzRE+ORui6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X7uEsKF7lb3QGywqPhTTeqVpucZbHbQd6Rsy1j38UhCftk2P/WEYIIOgt3ma3yhvdtlTavL1febVatcDFshTiIc6WXCM5bG+mcpuqJmCAudlPThXL6KvacciSqYuKbZBax6r3JI+Iinf5L+t43Q15VUFKGTgwQMMVA5K+WVbt4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QvX/0SpK; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QvX/0SpK"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7eb63dbd229so205615a34.1
        for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2026 13:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786565709; x=1787170509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2yss421pOFQ9jL8McJw1jGVeZX3JUo3yrK+bhiRFPy4=;
        b=QvX/0SpKkVl3WWcV+XS9KE2fZLVRwpRamUHq1VSEAZ36U/bP22zAqsVDFDPcBCWWBW
         LchF8allhdkvRmBBy70xYVftHoEN3ZmFwj5b6WfgEfhpkivuvrcMRKm3mwWHdyEXJJSq
         NOQAGwtFSaH8gR89Cc9u1unSWor1IZcEDbEJZk9J10I0tmcmZCKv5g88kzZWjP24te92
         IlzC4omtYf9URppgN18zXsRAQIh6LN0ttpxBFbdPNPfrjqfueflfTemtdYIqmWwzo0Q8
         If9NYYxx7RnAJ26O1NsF9y82xJG62QC2UntCAJDTVZ/vGS9qTkloLO+EOc58o9KwyDIa
         wglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786565709; x=1787170509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2yss421pOFQ9jL8McJw1jGVeZX3JUo3yrK+bhiRFPy4=;
        b=mMBu5lieDW/p8QdKGzDXOgIDdImrx4u2rGJ3bFd6Cjq0chnj4wILxpqfOu1LhwwB3E
         k6OylpqnMf74h5XFnKy5ERP/Id/9vn29t6t78bLe71aG5kD2L3Ekt3yaRbeAUka1AWzA
         VDOcW/UAlgZE3excvRULCZHCch9cwPP/cBZt9YKAEEw4HPEnEgr5kmICi37/SIVZMp0i
         9LNYGRPq0atgf4hTQS6M7O0W2NAdlN33CkKQIZw3VT33/ZuUOcN+9GKDv7pcQANF9057
         phSjQ7qVWcTQpe01Dac05V4CVLoIuQ7Gp5fDPvSZfr9j9ymmsvzX5WjddGlJkIfm3t/Y
         UJoQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq3BCH3XeFciuguSL6t0v69zs5jmMI0QpKbb6qd49owNTH08RAy1Pl3Jgbjd9lMZcORr462db9UH2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9dwqrMvgiCLw2aue7wcBygG8nzdG4+LieRlPiKa0aQsZlmAjA
	+CV2XZWwvnIEp82xZT8cSLwqWTuz0EdLO5OUGE0ARIHRZWfG9sCGyQ2H
X-Gm-Gg: AR+sD11TA4TfV3YZOsEbiW2RSWUpZepyHbAJZGIMlFZcd2C2Ew2dOX4qOoIWV86bvpG
	+C/JUcQqVTeX0anpIBkeSa6tA/zu9fFlIVdsUmo2IvqSETulvB9KSY+f4Pb0F/EnBJnFsYSx5gb
	7XTEF5pJqCb8A/JEaDi3WaJ2q3Y1f6auEDoATnAqUmKW3tY9mN4GCyhpR+p6jYgj5y2BhHyeW/D
	DIFPmqDj4kZN8lrNFE5ORyT0kjXsNFyio4ntD9SoQICXT9qSG6IRlcqTu/gecneuBh0LeX+kWDE
	XqoboMGPHT/pnSL0eetRVl3Tnvln4pPka3l/O0we+Pb82BB16URt9NDkX5aRa9zWsM+GQymeQQ9
	ZOi+atOyQc5v2Qe6aOdS9n/z8yITzHV/ocwQdrCeYqE1B08S+r+VHNE4rKgu2kWAa0Yc0jH5ET5
	UZ7NuEno8/PeRW5Er39saBgtiS+IBWGy8IxaCGpCzQyS63u+ySSzvUfHufntLUpD0cK6+pseBPq
	Q589pg7kn++XiWsbbAsgyilMFAehKu7kFvm5Dba
X-Received: by 2002:a05:6830:82f9:b0:7f3:9729:a9e3 with SMTP id 46e09a7af769-7f3cad7c2f8mr70427a34.7.1786565709452;
        Wed, 12 Aug 2026 13:15:09 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f3c9cf3b0csm256006a34.21.2026.08.12.13.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 13:15:08 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH RFT 2/2] clk: sunxi-ng: a523: use single-divider clock helpers
Date: Wed, 12 Aug 2026 16:15:02 -0400
Message-ID: <20260812201502.264919-3-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812201502.264919-1-enzo.adriano.code@gmail.com>
References: <20260723004856.55158e84@ryzen.lan>
 <20260812201502.264919-1-enzo.adriano.code@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A523 MBUS, IOMMU, and DRAM clocks have an M divider but no P
divider, while HSTIMER0-5 and R-TIMER0-2 have a P divider but no M
divider. They currently use the two-divider ccu_mp class by declaring
the missing field with width zero.

ccu_mp_set_rate() unconditionally masks both divider fields, so a zero
width forms an invalid GENMASK() range and can clear unrelated register
bits. The M-only clocks also require the hardware update bit, which
ccu_mp operations do not handle.

Use the single-divider M helper for MBUS, IOMMU, and DRAM, and the
power-of-two P helper for the timer clocks. Preserve the parents,
registers, real divider fields, muxes, gates, clock flags, and
update-bit features.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/r/20260722010926.0A8B01F000E9@smtp.kernel.org
Link: https://lore.kernel.org/r/20260712081341.9D1431F00A3D@smtp.kernel.org
Suggested-by: Chen-Yu Tsai <wens@kernel.org>
Fixes: 6702d17f54a8 ("clk: sunxi-ng: a523: add video mod clocks")
Fixes: 74b0443a0d0a ("clk: sunxi-ng: a523: add system mod clocks")
Fixes: 8cea339cfb81 ("clk: sunxi-ng: add support for the A523/T527 PRCM CCU")
Link: https://lore.kernel.org/r/CAGb2v67GDBTq8vdxNxBfNVSe=oStcgaJzm0ig2WAEXNQSkVa1g@mail.gmail.com
Link: https://lore.kernel.org/r/20260723004856.55158e84@ryzen.lan
Assisted-by: Codex:gpt-5
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
not tested on A523/T527 hardware; testing on actual hardware is needed.

 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c |  37 +++---
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c   | 136 +++++++++++------------
 2 files changed, 82 insertions(+), 91 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
index db0e36d8838e74..349230e28c1c3a 100644
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
@@ -43,27 +43,24 @@ static SUNXI_CCU_M_DATA_WITH_MUX(r_apb1_clk, "r-apb1",
 				 24, 3,	/* mux */
 				 0);
 
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(r_cpu_timer0, "r-timer0",
-				       r_ahb_apb_parents, 0x100,
-				       0, 0,	/* no M */
-				       1, 3,	/* P */
-				       4, 3,	/* mux */
-				       BIT(0),
+static SUNXI_CCU_P_DATA_WITH_MUX_GATE(r_cpu_timer0, "r-timer0",
+				      r_ahb_apb_parents, 0x100,
+				      1, 3,	/* P */
+				      4, 3,	/* mux */
+				      BIT(0),
+				      0);
+static SUNXI_CCU_P_DATA_WITH_MUX_GATE(r_cpu_timer1, "r-timer1",
+				      r_ahb_apb_parents, 0x104,
+				      1, 3,	/* P */
+				      4, 3,	/* mux */
+				      BIT(0),
+				      0);
+static SUNXI_CCU_P_DATA_WITH_MUX_GATE(r_cpu_timer2, "r-timer2",
+				      r_ahb_apb_parents, 0x108,
+				      1, 3,	/* P */
+				      4, 3,	/* mux */
+				      BIT(0),
 				      0);
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(r_cpu_timer1, "r-timer1",
-				       r_ahb_apb_parents, 0x104,
-				       0, 0,	/* no M */
-				       1, 3,	/* P */
-				       4, 3,	/* mux */
-				       BIT(0),
-				       0);
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(r_cpu_timer2, "r-timer2",
-				       r_ahb_apb_parents, 0x108,
-				       0, 0,	/* no M */
-				       1, 3,	/* P */
-				       4, 3,	/* mux */
-				       BIT(0),
-				       0);
 
 static SUNXI_CCU_GATE_HW(bus_r_timer_clk, "bus-r-timer", &r_ahb_clk.common.hw,
 			 0x11c, BIT(0), 0);
diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
index 20dad06b37ca31..5c632e475aaa04 100644
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
@@ -380,14 +380,14 @@ static const struct clk_parent_data mbus_parents[] = {
 	{ .hw = &pll_periph1_150M_clk.hw },
 	{ .fw_name = "hosc" },
 };
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT(mbus_clk, "mbus", mbus_parents,
-					    0x540,
-					    0, 5,		/* M */
-					    0, 0,		/* no P */
-					    24, 3,	/* mux */
-					    BIT(31),	/* gate */
-					    CLK_IS_CRITICAL,
-					    CCU_FEATURE_UPDATE_BIT);
+
+static SUNXI_CCU_M_DATA_WITH_MUX_GATE_FEAT(mbus_clk, "mbus", mbus_parents,
+					   0x540,
+					   0, 5,	/* M */
+					   24, 3,	/* mux */
+					   BIT(31),	/* gate */
+					   CLK_IS_CRITICAL,
+					   CCU_FEATURE_UPDATE_BIT);
 
 static const struct clk_hw *mbus_hws[] = { &mbus_clk.common.hw };
 
@@ -513,58 +513,53 @@ static const struct clk_parent_data hstimer_parents[] = {
 	{ .fw_name = "losc" },
 	{ .hw = &pll_periph0_200M_clk.hw },
 };
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer0_clk, "hstimer0",
-				       hstimer_parents, 0x730,
-				       0, 0,	/* M */
-				       0, 3,	/* P */
-				       24, 3,	/* mux */
-				       BIT(31),	/* gate */
-				       0);
 
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer1_clk, "hstimer1",
-				       hstimer_parents,
-				       0x734,
-				       0, 0,	/* M */
-				       0, 3,	/* P */
-				       24, 3,	/* mux */
-				       BIT(31),	/* gate */
-				       0);
+static SUNXI_CCU_P_DATA_WITH_MUX_GATE(hstimer0_clk, "hstimer0",
+				      hstimer_parents, 0x730,
+				      0, 3,	/* P */
+				      24, 3,	/* mux */
+				      BIT(31),	/* gate */
+				      0);
 
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer2_clk, "hstimer2",
-				       hstimer_parents,
-				       0x738,
-				       0, 0,	/* M */
-				       0, 3,	/* P */
-				       24, 3,	/* mux */
-				       BIT(31),	/* gate */
-				       0);
+static SUNXI_CCU_P_DATA_WITH_MUX_GATE(hstimer1_clk, "hstimer1",
+				      hstimer_parents,
+				      0x734,
+				      0, 3,	/* P */
+				      24, 3,	/* mux */
+				      BIT(31),	/* gate */
+				      0);
 
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer3_clk, "hstimer3",
-				       hstimer_parents,
-				       0x73c,
-				       0, 0,	/* M */
-				       0, 3,	/* P */
-				       24, 3,	/* mux */
-				       BIT(31),	/* gate */
-				       0);
+static SUNXI_CCU_P_DATA_WITH_MUX_GATE(hstimer2_clk, "hstimer2",
+				      hstimer_parents,
+				      0x738,
+				      0, 3,	/* P */
+				      24, 3,	/* mux */
+				      BIT(31),	/* gate */
+				      0);
 
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer4_clk, "hstimer4",
-				       hstimer_parents,
-				       0x740,
-				       0, 0,	/* M */
-				       0, 3,	/* P */
-				       24, 3,	/* mux */
-				       BIT(31),	/* gate */
-				       0);
+static SUNXI_CCU_P_DATA_WITH_MUX_GATE(hstimer3_clk, "hstimer3",
+				      hstimer_parents,
+				      0x73c,
+				      0, 3,	/* P */
+				      24, 3,	/* mux */
+				      BIT(31),	/* gate */
+				      0);
 
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(hstimer5_clk, "hstimer5",
-				       hstimer_parents,
-				       0x744,
-				       0, 0,	/* M */
-				       0, 3,	/* P */
-				       24, 3,	/* mux */
-				       BIT(31),	/* gate */
-				       0);
+static SUNXI_CCU_P_DATA_WITH_MUX_GATE(hstimer4_clk, "hstimer4",
+				      hstimer_parents,
+				      0x740,
+				      0, 3,	/* P */
+				      24, 3,	/* mux */
+				      BIT(31),	/* gate */
+				      0);
+
+static SUNXI_CCU_P_DATA_WITH_MUX_GATE(hstimer5_clk, "hstimer5",
+				      hstimer_parents,
+				      0x744,
+				      0, 3,	/* P */
+				      24, 3,	/* mux */
+				      BIT(31),	/* gate */
+				      0);
 
 static SUNXI_CCU_GATE_HWS(bus_hstimer_clk, "bus-hstimer", ahb_hws, 0x74c,
 			  BIT(0), 0);
@@ -584,14 +579,13 @@ static const struct clk_parent_data iommu_parents[] = {
 	{ .fw_name = "hosc" },
 };
 
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT(iommu_clk, "iommu", iommu_parents,
-					    0x7b0,
-					    0, 5,	/* M */
-					    0, 0,	/* no P */
-					    24, 3,	/* mux */
-					    BIT(31),	/* gate */
-					    CLK_SET_RATE_PARENT,
-					    CCU_FEATURE_UPDATE_BIT);
+static SUNXI_CCU_M_DATA_WITH_MUX_GATE_FEAT(iommu_clk, "iommu", iommu_parents,
+					   0x7b0,
+					   0, 5,	/* M */
+					   24, 3,	/* mux */
+					   BIT(31),	/* gate */
+					   CLK_SET_RATE_PARENT,
+					   CCU_FEATURE_UPDATE_BIT);
 
 static SUNXI_CCU_GATE_HWS(bus_iommu_clk, "bus-iommu", apb0_hws, 0x7bc,
 			  BIT(0), 0);
@@ -603,14 +597,14 @@ static const struct clk_parent_data dram_parents[] = {
 	{ .hw = &pll_periph0_400M_clk.hw },
 	{ .hw = &pll_periph0_150M_clk.hw },
 };
-static SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT(dram_clk, "dram", dram_parents,
-					    0x800,
-					    0, 5,	/* M */
-					    0, 0,	/* no P */
-					    24, 3,	/* mux */
-					    BIT(31),	/* gate */
-					    CLK_IS_CRITICAL,
-					    CCU_FEATURE_UPDATE_BIT);
+
+static SUNXI_CCU_M_DATA_WITH_MUX_GATE_FEAT(dram_clk, "dram", dram_parents,
+					   0x800,
+					   0, 5,	/* M */
+					   24, 3,	/* mux */
+					   BIT(31),	/* gate */
+					   CLK_IS_CRITICAL,
+					   CCU_FEATURE_UPDATE_BIT);
 
 static SUNXI_CCU_GATE_HWS(mbus_dma_clk, "mbus-dma", mbus_hws,
 			  0x804, BIT(0), 0);
-- 
2.53.0
