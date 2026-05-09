Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1723C0607
	for <linux-clk@vger.kernel.org>; Sat,  9 May 2026 19:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778353224; cv=none; b=ACou3ZAW0z/s0OwurVTx2j4xBKmoexoMVVmFqSqMe9GcLZLPvcIwWUei5eW609b4rDf5mssrK0WK7IVaY+sQOaJ8y7Ty3zyYlDJqv/7C5H13MMzgsbk7pZHc7NjmtlUiv4vQ42H8QQbIC7ecoQ3VjsR4f5I9CuctBzXGgTGFPY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778353224; c=relaxed/simple;
	bh=+SgYs8Hj6grWe0pXXV62TelA6SnR62JorpH+u34niZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uj1zJQ9r5IKJLv1gTkw7+W9QpE0DFCptpUe1CfrZvaCY6g/3iyNZq0eLUVfaHwYHef7wmqS7AVwM4oq6bHOmmhkJG1ibXQUDy6VA5abhBvE8P4Ut7lRaduVn9I7+BswqAPnzX47nV2gTcWOYdz1dCjbzckiO8VGBdZwjQ4mBMaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s4/naHhz; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s4/naHhz"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48d102471a4so29910325e9.2
        for <linux-clk@vger.kernel.org>; Sat, 09 May 2026 12:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778353222; x=1778958022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F3EJ0517xJNtY9t4icYdcJ6JRwvMjYIpIptqEEIrShg=;
        b=s4/naHhz00t359VQkDNR1RWSQl8jNXCe54zfgFk3viAOAQzvB3WE+k9pp7c39Ek+Wg
         HNj2YDYI0CzHWFE31bJU9J8deW5i3GbWp1/eqot0vm5Vpgo5JlvgvIPTdw+1BAqC7OoH
         AFdckF0HreuUIy+E5VjarzQY0KKjb8ZlQAGAZwRF/jPiyOoUgU/W0SzW3Xw0CWkcdPWW
         WEUYrh5hzO4h5y+5HFdGWog3qLkpoQClkt5K/5ZR6GcnVVKOjnzMGL/Kx/znHZ1Ldqk2
         INhx6Dlvjf35+yL9VyI6oNJwgUQoWIs31E5+xqTB7kQT6u5wYxuDBdKCJazy8iyXDU+0
         xFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778353222; x=1778958022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F3EJ0517xJNtY9t4icYdcJ6JRwvMjYIpIptqEEIrShg=;
        b=PEekzFjKL4k+S2R6u11sH0pnPQ62vU/xiXLv58PJpB8jc8AnbVwNQfV/NrDL1Bw4Pk
         +1k/ERiCRIoYIb089r6+xi7b8u1zIzc+rL/BIC3IArBdN/788ylbDAKFQ6vNKUV1QMQ1
         KkCi2GSMoUxNu/7RGCuUPAXlwfXpXgbzVYF0h7r4DxhzCi/EQPAg1rIRBX0fvJHptIlw
         F2axmrFwDRQVfeHYeb5SF90OuGnaGfjLFBWjwtoV0jIZnjem6qvyA8xJz1OL7LsCmDQd
         yszpvcB9ZNYJzUU8Z5lnOrxtfVx2xydJInFKD3+vrMzqivZup3/lzDZqgOzAFE7FFkHf
         D2kA==
X-Forwarded-Encrypted: i=1; AFNElJ/26kFDvPGX1VtHP4jljkgnWrpP+5ipz1YqplHgk36eQBhGc+p41Y8dVJIoNoGySE7VjTjGtLGbSXM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvoWBRocVv6HFUPp0I9GcPzaFTHD5DLL7I7ILYIL9GNsgK8+il
	rl8XuzEnrGpBXekRg09wacmATmF5LoalYatCx49tsAIMoYe/CT16/3ww
X-Gm-Gg: Acq92OHefnWH1Wbl4C0wESonbL1OD6ROyizQfX/IyR7XHG6+cnHsw7pF5XNzSMvoprn
	VFNFpWYW0pRxYlyn2WldfOoh7n/97vi6kP720/6KJxmiuUKYrbePpNkeZWqYqKEgQyUX2yRwnDi
	mKdjr5pBZ/jUmSb0aGE+0gI7bmPBnLIqQl+tLtQCkD8/cxWo3csBHE4Eb6d7nUxWgfMTc7iS/tu
	PJvYPIxCFZJ7KtLrWy5h8mzCzMnuX+WACKMRa8dVaTRVjywY+3qEtuvY4lC8u9/kNgm75aEwmMf
	qWEW2WmYDQHflDBamaoE2NAodC62uVFk3sx+XRyAqUOsIodzOF/uCYEI/AqK1hPzb8ZgeCF695U
	Gm2wnt/1UoK7ASXCwCVpQ4clhysYpNwP3Mh56+zsex4hwxx6EyL7Ea/p3ITZTHh6J/66jwZPqZc
	2/MBMd2+7jjTovH+dc8PcdGlWgnNuSR+E4n0NKYtI+jMMsaTLD8INjyJQjJHzBzOixMoU=
X-Received: by 2002:a05:600c:1e0f:b0:48e:51f5:2764 with SMTP id 5b1f17b1804b1-48e676c0353mr137860975e9.27.1778353221568;
        Sat, 09 May 2026 12:00:21 -0700 (PDT)
Received: from jernej-laptop (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454913049ecsm13254407f8f.19.2026.05.09.12.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 12:00:21 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
X-Google-Original-From: Jernej Skrabec <jernej.skrabec@siol.net>
To: wens@csie.org,
	samuel@sholland.org
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	jernej.skrabec@gmail.com
Subject: [PATCH v2 1/8] clk: sunxi-ng: de2: Fix Display Engine 3.3 definitions
Date: Sat,  9 May 2026 21:00:08 +0200
Message-ID: <20260509190015.79086-2-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260509190015.79086-1-jernej.skrabec@siol.net>
References: <20260509190015.79086-1-jernej.skrabec@siol.net>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jernej Skrabec <jernej.skrabec@gmail.com>

Positions of clocks and resets changed when version 3.3 was introduced.
However, old positions still work, just by luck.

Fix Display Engine 3.3 resets and clocks according vendor driver.

Fixes: be0e9a372787 ("clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes from v1:
- new patch

 drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 39 +++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
index a6cd0f988859..6ec6c0dc4c26 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
@@ -36,6 +36,13 @@ static SUNXI_CCU_GATE(wb_clk,		"wb",		"wb-div",
 static SUNXI_CCU_GATE(rot_clk,		"rot",		"rot-div",
 		      0x00, BIT(3), CLK_SET_RATE_PARENT);
 
+static SUNXI_CCU_GATE(mixer0_h616_clk,	"mixer0",	"de",
+		      0x04, BIT(0), CLK_SET_RATE_PARENT);
+static SUNXI_CCU_GATE(mixer1_h616_clk,	"mixer1",	"de",
+		      0x04, BIT(1), CLK_SET_RATE_PARENT);
+static SUNXI_CCU_GATE(wb_h616_clk,	"wb",		"de",
+		      0x04, BIT(4), CLK_SET_RATE_PARENT);
+
 static SUNXI_CCU_M(mixer0_div_clk, "mixer0-div", "de", 0x0c, 0, 4,
 		   CLK_SET_RATE_PARENT);
 static SUNXI_CCU_M(mixer1_div_clk, "mixer1-div", "de", 0x0c, 4, 4,
@@ -54,6 +61,9 @@ static SUNXI_CCU_M(wb_div_a83_clk, "wb-div", "pll-de", 0x0c, 8, 4,
 static SUNXI_CCU_M(rot_div_a83_clk, "rot-div", "pll-de", 0x0c, 0x0c, 4,
 		   CLK_SET_RATE_PARENT);
 
+static SUNXI_CCU_GATE(bus_mixer0_h616_clk, "bus-mixer0", "bus-de",
+		      0x08, BIT(0), 0);
+
 static struct ccu_common *sun8i_de2_ccu_clks[] = {
 	&mixer0_clk.common,
 	&mixer1_clk.common,
@@ -74,6 +84,12 @@ static struct ccu_common *sun8i_de2_ccu_clks[] = {
 	&mixer1_div_a83_clk.common,
 	&wb_div_a83_clk.common,
 	&rot_div_a83_clk.common,
+
+	&mixer0_h616_clk.common,
+	&mixer1_h616_clk.common,
+	&wb_h616_clk.common,
+
+	&bus_mixer0_h616_clk.common
 };
 
 static struct clk_hw_onecell_data sun8i_a83t_de2_hw_clks = {
@@ -147,6 +163,17 @@ static struct clk_hw_onecell_data sun50i_a64_de2_hw_clks = {
 	.num	= CLK_NUMBER_WITH_ROT,
 };
 
+static struct clk_hw_onecell_data sun50i_h616_de33_hw_clks = {
+	.hws	= {
+		[CLK_MIXER0]		= &mixer0_h616_clk.common.hw,
+		[CLK_MIXER1]		= &mixer1_h616_clk.common.hw,
+		[CLK_WB]		= &wb_h616_clk.common.hw,
+
+		[CLK_BUS_MIXER0]	= &bus_mixer0_h616_clk.common.hw,
+	},
+	.num	= CLK_NUMBER_WITHOUT_ROT,
+};
+
 static const struct ccu_reset_map sun8i_a83t_de2_resets[] = {
 	[RST_MIXER0]	= { 0x08, BIT(0) },
 	/*
@@ -180,6 +207,12 @@ static const struct ccu_reset_map sun50i_h5_de2_resets[] = {
 	[RST_WB]	= { 0x08, BIT(2) },
 };
 
+static const struct ccu_reset_map sun50i_h616_de33_resets[] = {
+	[RST_MIXER0]	= { 0x00, BIT(0) },
+	[RST_MIXER1]	= { 0x00, BIT(1) },
+	[RST_WB]	= { 0x00, BIT(4) },
+};
+
 static const struct sunxi_ccu_desc sun8i_a83t_de2_clk_desc = {
 	.ccu_clks	= sun8i_de2_ccu_clks,
 	.num_ccu_clks	= ARRAY_SIZE(sun8i_de2_ccu_clks),
@@ -244,10 +277,10 @@ static const struct sunxi_ccu_desc sun50i_h616_de33_clk_desc = {
 	.ccu_clks	= sun8i_de2_ccu_clks,
 	.num_ccu_clks	= ARRAY_SIZE(sun8i_de2_ccu_clks),
 
-	.hw_clks	= &sun8i_h3_de2_hw_clks,
+	.hw_clks	= &sun50i_h616_de33_hw_clks,
 
-	.resets		= sun50i_h5_de2_resets,
-	.num_resets	= ARRAY_SIZE(sun50i_h5_de2_resets),
+	.resets		= sun50i_h616_de33_resets,
+	.num_resets	= ARRAY_SIZE(sun50i_h616_de33_resets),
 };
 
 static int sunxi_de2_clk_probe(struct platform_device *pdev)
-- 
2.54.0

