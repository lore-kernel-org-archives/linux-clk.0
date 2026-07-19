Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E56E311959
	for <linux-clk@vger.kernel.org>; Sun, 19 Jul 2026 21:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784495631; cv=none; b=Yd3y1pRDSqYMWbmVMCvgBqqba0zFIZfFIT8FxKSFyqhErahaYK5EIKbltdOFDHtEA0BgKMqOgw/s5v2EG0ZAqlQNxUC1JKhxzv1r6RPuK+OjElL5GZGHWV02oD5SYBm+nssQiwu0DTozG1kAP0TnFv+LPn+9mh4q0igXRG3iNsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784495631; c=relaxed/simple;
	bh=OIQ9wV1fytaPWVFvAnMGv/HqNSfH3VqUaIN7P0RyrC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F52QS2iot9bTifCy0g3yn/VkT+jC5tldRKKMLVsOuAmkDmpghM2BlJ9lm5rnNgDdC00xR1P3D2JdXnXsGlSqH3DvusrAshKWLUZLrr4RgL3TC85q02YacadtT/RenWsaHf/75AF6i9yjNav2YJJ75QrfIY7GBUxea9C1bbCl2lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=caseWbBq; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="caseWbBq"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493b966dd74so38968605e9.3
        for <linux-clk@vger.kernel.org>; Sun, 19 Jul 2026 14:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784495628; x=1785100428; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P704jdG4dY1gYMag6CkafUUs1KoIwLh9colggYiL2Zk=;
        b=caseWbBqCcUik727+uEQYMDg1FZoCcOtzsM6uXIKLfSOGQTusk4CE12rpt1oYaMGL8
         pZU408xGBa7VToIeZgapSf72ilg+Xzp4KD5ZAE9jtEoy5bQmK9usZoUbinfitBGlogUp
         3OzyH6/2itYhg1gPpu3aViU0Q1cevgcBaDExF1si4X00G7SLbzB6IBXaZbFHBOYtOa8b
         1anULh7PGrB+YGgsa3QxfeCys2Umufn6ODI8ybRuo0mty/KsNRENaC1E5D+F8VpW+Mua
         q6kqzUXJP4iDz8pMi6Kp2KBHtLqvaJss3P6D2ULjlPAqL+aKawhVRowpDMNCCWVvEzN/
         bYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784495628; x=1785100428;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P704jdG4dY1gYMag6CkafUUs1KoIwLh9colggYiL2Zk=;
        b=Tp/XMQGRiRZ08LeMwZsAF7yISpOeG1LBQ+XV59ungWR2aGv1Ibf6S+jEEQ1lsa6k9s
         eI7FlZIbj6mDwZ9ScRH904vAFHU/3r07+xqYzUnMMgmX/NlZjgfgBsCznsG1H8MGX3pl
         G6YH3jaZkMibSwnNcQThv0CeOv0EDozHZ+WMqOlmiuriNX86k5HGY9HJfe8zZSVcWhsr
         6OIccGlg/OFTi2NAybn4niFEUypT5bSPja/o5OvvLydx1fllGCPjGiiC1dVI7BInqfWU
         lDQUUIYSq89uE60ii6ztcWr0F+tICoA1DPbLtHxORz/Y9YhI6aX9Q/2n2EkMm/6JKN2j
         No4w==
X-Forwarded-Encrypted: i=1; AHgh+Rp9liHAZ5QStCdm4BInDuE5fUcnhCn2zE0rsyMo+Ar6jHoWuAVsU7eBvabYjqC5rQ52tUGCWIZocV4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnbHdHrjU2cKFb0/M7EMR31/FGqJbiIwwco4Brbkc4ZVOIclHy
	KDV1BXyCdcqNm9deAQxZXMGqVZa60UCMw1eo7rSObgLuvzlC+QV8a9/M
X-Gm-Gg: AfdE7cm5hxNa++UsIOp9RGcNPLtzh2enFtZeJZicaiO0e5oqWJ+FUiMVmgyrLsKov/O
	buSnB1T8EYS/n1frd2P5oqUVh+YVVURNnwrN9KU7KzI+F7Q3gb5b06MVpkyN25pgVGHE9QpsQ5Q
	5iJe1KC7ClscWo8/qojNlITLDKgkTdTOPgVZ/Q4nDHsQUff64xfT5OMUoI5aL6G6Y4xLzTW9soZ
	qd2xWuNGdPMhMPNLjm1nz74xtmUbaU4FKJrUumABocUOlHSW/1O96QSVejUJJnj1RwRZZki98Fg
	DLcmvNwJPaQBOpIdZxaRbEdLoVICMPHRUUWP0wNvpyxY5HzJ9i5n+kciH3j/IDkFE6tTcluuQLM
	OxHPAhclO/Sx9OvcMUAsjNcRa9NRFQLQgLMIZ/atNu0AYZ1PlpQLXP6Bf/tWNbugt5pkIxN18o0
	KCvPZOp4XwjODdxZHjHKV/s0lV8TRQCcFTNfvpvUpv4lSUB64=
X-Received: by 2002:a05:600c:3b8e:b0:495:4bf3:2150 with SMTP id 5b1f17b1804b1-4954bf3216amr129364555e9.8.1784495627377;
        Sun, 19 Jul 2026 14:13:47 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:3344:2841:7708:a101:2b8a:f76:a00f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a3e2a9sm224108815e9.4.2026.07.19.14.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:13:46 -0700 (PDT)
From: =?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
Subject: [PATCH v1 2/4] clk: sunxi-ng: sun55i-a523: GPU clock divider is fractional, not linear
Date: Sun, 19 Jul 2026 23:13:17 +0200
Message-ID: <20260719211319.982285-3-juanmanuellopezcarrillo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260719211319.982285-1-juanmanuellopezcarrillo@gmail.com>
References: <20260719211319.982285-1-juanmanuellopezcarrillo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The GPU mod clock (0x670) was modelled as a linear M+1 divider, but the
M factor of this register is a cycle-masking divider: GPU_CLK = Clock
Source * ((16-M)/16) (T527 user manual v0.92, section 2.7.6.58).

With the linear model every OPP that needed M > 0 silently ran the GPU
faster than requested.  Measured on an Orange Pi 4A (T527) with the
Mali cycle counter against the programmed register:

	OPP request	programmed	real rate
	150 MHz		600M, M=3	487.5 MHz
	200 MHz		800M, M=3	650   MHz
	300 MHz		600M, M=1	562.5 MHz
	400 MHz		800M, M=1	750   MHz
	600 MHz		600M, M=0	600   MHz

i.e. the "400 MHz" OPP ran the GPU at 750 MHz, 25% above the vendor
ceiling of 600 MHz, at the low-OPP voltage.  Thermal throttling to
"400 MHz" actually overclocked the GPU.

Switch the clock to the maskdiv type.  With least-masking preference
the vendor OPP set now resolves to 600/400/300/200 MHz taken undivided
from their periph outputs and 150 MHz = pll-periph0-200M * 12/16, all
verified exact on hardware with the same cycle-counter method.

Drop pll-periph0-800M from the selectable parents (the mux table skips
hardware index 1): the vendor BSP removed it from its parent list with
the comment "If GPU use pll-peri0-800m, gpu will occur job fault", and
with the masking semantics every vendor OPP matches exactly from the
800M parent first, so it would otherwise always be chosen.

Also drop CLK_SET_RATE_PARENT: every OPP is reachable from the fixed
pll-periph0 outputs, and pll-gpu must never be reprogrammed through this
mux.  Once the GPU moves off pll-gpu the PLL is no longer prepared, so
it loses the rate protection of CLK_SET_RATE_GATE; a propagated rate
request would then reprogram the PLL while its gate is off (the lock
bit never asserts, 70 ms poll timeout per transition) and switch the
running GPU onto it before it locks.

Fixes: 6702d17f54a8 ("clk: sunxi-ng: a523: add video mod clocks")
Signed-off-by: Juan Manuel López Carrillo <juanmanuellopezcarrillo@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 32 +++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
index 20dad06b3..979e53e63 100644
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
@@ -21,6 +21,7 @@
 
 #include "ccu_div.h"
 #include "ccu_gate.h"
+#include "ccu_maskdiv.h"
 #include "ccu_mp.h"
 #include "ccu_mult.h"
 #include "ccu_nk.h"
@@ -442,18 +443,37 @@ static SUNXI_CCU_GATE_HWS(bus_g2d_clk, "bus-g2d", ahb_hws, 0x63c, BIT(0), 0);
 
 static const struct clk_hw *gpu_parents[] = {
 	&pll_gpu_clk.common.hw,
-	&pll_periph0_800M_clk.common.hw,
 	&pll_periph0_600M_clk.hw,
 	&pll_periph0_400M_clk.hw,
 	&pll_periph0_300M_clk.hw,
 	&pll_periph0_200M_clk.hw,
 };
 
-static SUNXI_CCU_M_HW_WITH_MUX_GATE(gpu_clk, "gpu", gpu_parents, 0x670,
-				    0, 4,	/* M */
-				    24, 3,	/* mux */
-				    BIT(31),	/* gate */
-				    CLK_SET_RATE_PARENT);
+/*
+ * Mux index 1 (pll-periph0-800M) is skipped: the vendor BSP removed it
+ * from the parent list ("If GPU use pll-peri0-800m, gpu will occur job
+ * fault"), and with the masking divider every OPP would match exactly
+ * from it first.
+ */
+static const u8 gpu_mux_table[] = { 0, 2, 3, 4, 5 };
+
+/*
+ * The M factor is a cycle-masking (fractional) divider, not a linear
+ * one: rate = source * (16 - M) / 16 (T527 manual, GPU_CLK_REG).
+ *
+ * No CLK_SET_RATE_PARENT: every GPU OPP is reachable from the fixed
+ * pll-periph0 outputs, and pll-gpu must never be reprogrammed through this mux.
+ * Once the GPU moves off pll-gpu the PLL is no longer prepared, so it loses
+ * the rate protection of CLK_SET_RATE_GATE; a propagated rate request would
+ * then reprogram the PLL while its gate is off (the lock bit never asserts,
+ * 70 ms timeout) and switch the running GPU onto it before it locks.
+ */
+static SUNXI_CCU_MASKDIV_HW_WITH_MUX_TABLE_GATE(gpu_clk, "gpu", gpu_parents,
+						gpu_mux_table, 0x670,
+						0, 4,	/* M */
+						24, 3,	/* mux */
+						BIT(31),	/* gate */
+						0);
 
 static SUNXI_CCU_GATE_HWS(bus_gpu_clk, "bus-gpu", ahb_hws, 0x67c, BIT(0), 0);
 
-- 
2.47.3

