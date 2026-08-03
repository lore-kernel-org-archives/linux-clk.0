Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67C5438010
	for <linux-clk@vger.kernel.org>; Mon,  3 Aug 2026 18:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785780487; cv=none; b=Ch8CltrQAZJPeD85JkaRRktq+BmOrC7Q61m53DQhak6UIV5FAuQLzCO45JkLJA/WeMNINUj7KlagixKKBl3nYdP47pkkhLE+TL7cjUkKq1CaGDKBo9JOFihEhBvuP33f/csurNQdqnOX8KwtWJZAC4XEbw5ysV/Mtv1Ip7SVUlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785780487; c=relaxed/simple;
	bh=oiNY1UIn6YQNbReVM+ZIKN2X4hpTZ/t+jCzScRipcW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EgBtyUyI2zOcq2DEknFehX1G8Cv0s1VZkxhhEucgnGzVgaD2b0U96XQL8wlNwAK37S+b3u7RY18+CU0KxY2ltYTqn8iGG9HxD0Ug4qGa/g9N6szXmrzc20QJ9GjE87azdNIvlRIoOGux4nO1FIrw2OF71lg3LPOiHyrL7ag7tug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IPrXrAxX; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IPrXrAxX"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47fdcdfceb6so1160932f8f.3
        for <linux-clk@vger.kernel.org>; Mon, 03 Aug 2026 11:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785780484; x=1786385284; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+eQVck/8/EmRztvhd8Uz87RWfrINzUZUMP2w+5sPTpA=;
        b=IPrXrAxXs52I+ZbZoMMWhj6Cu+Yc7cFNtSvXru5GkgtjJwDtN2taggxA5q1aDPiav0
         sPvyd2JQmJ7gqs0i70G3errDdMtwE28erkqj8m94SdkQaUoYnDBa7Rz6VEZite0mYW39
         azugXaxrVkh2IgFJ71iuLexh9QT4o7j1drMdiVvgQgfFsBx/tlZfRYR6chwCs3aB0lt7
         VbmDqdjrDZ0aqPTfLBaM3hJCKAWtAK0Q1XIf/X8/m+/o0R7MZwm9IEfE5S6DN6NXwOpG
         dvsBhkbz/ohy2pl5WbEuetQKIWvZvjkDlOtHNOfEC66Gca9jn362WwoCiQ1S4X0GDKwL
         UA3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785780484; x=1786385284;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+eQVck/8/EmRztvhd8Uz87RWfrINzUZUMP2w+5sPTpA=;
        b=Uumd7bfrFGtIq5hSeUkIapjDjLI0GCf467C30BHBWuAHH9+dfr46/x1QVqs9Nxi9ls
         olVDK5pE4ByZnH8D+KfDciLJ5ogIBUb7CAI4TgWcz1GTx5Tbpp7CE06TpaMRNy7rX3IL
         mmJ8kEVajwYr1GnRdvVvWkYBQvF4ThbA6y3nn56Gb5+zladYzu2ZYVokk5Wgb2Tnczx9
         fMzPl4TUHOeYkNRgfwy9Ta7aNESyZGp92IlMq++A+582llOBojKyceg0pkJ3IeHc2H7d
         UfUkGe52uHRFzpoCTwDOJ6GtWqztyBvy9Vhq0/sYGNkwpgCi4ruK/y5N/KmQYo4Vl+FM
         FTpw==
X-Forwarded-Encrypted: i=1; AHgh+RppdZL1UrnKymvuXRangX7lESZXHeqMiaMWY/3QLS2g/Gy9A1TwXUQJmc71I47U+VuilQTTRGyrURg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC3ZUOHZc+zq46sBrtw/NGm1UtnhtmEpBCzirKGIrrgN2FRAQB
	fqTERbEj6guukUvoUxP3jKtSeWl066uYOmqVRk7XsUq5dgtJ+R+nDvRL
X-Gm-Gg: AR+sD10asg1nK5BJu41nuc7Q8lhxgpbbL7PxpDF1wsBAs2Pe/Ea3aewC3KlG9FlyOh3
	OcDraJcKy7cqVMU0pwKHEJ+Fo0Olm4LqsPgaUzk3CcAcQXhaOY43Pe7Ci6t3pPeUm5kqxPCN8+y
	SOCeGcAflM/EaH9wmGmhNhGQroIeI1weOuz4TX2Wgmh9TieaUHHcQYxdyMvz/mwn8ewQTpe4zi2
	/JyaLVEBSowI300xOXeWP7mrC1WhnzcmzrQebb9Ny0UmYZmw4VhvafJsEZSrxREZRhCdszUZmTj
	MG3xBv63hHSlXZ8AWig4WCCg4HlujAz6/uBoLpSbbCo1gOIlS1PXfQCRxW25SDy6dLWOFRhU88T
	NutoupGbrjn313FE0ruxXCiiLcz7NDHlgcVrA5vHHutpHjN41tfAPaXJpCEDAAbz6G4ayJ7ZKrb
	k5eRpYjttMhDYos7QTgPlT/AFkyZd51G0SYhUkD96rsuASkbemlCj3cPquHZNIDBfAkP0gVxqm0
	ZNsMbIqkTM7LugMIuOeJQeY
X-Received: by 2002:adf:e90f:0:b0:47f:9d0e:f8f with SMTP id ffacd0b85a97d-47fd72e6079mr24242189f8f.26.1785780483886;
        Mon, 03 Aug 2026 11:08:03 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:3344:2841:7708:a101:2b8a:f76:a00f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd42d91b3sm37950955f8f.14.2026.08.03.11.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 11:08:03 -0700 (PDT)
From: =?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andre.przywara@arm.com,
	bmasney@redhat.com,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
Subject: [PATCH v2 2/3] clk: sunxi-ng: sun55i-a523: GPU clock divider is fractional, not linear
Date: Mon,  3 Aug 2026 20:07:54 +0200
Message-ID: <20260803180755.288793-3-juanmanuellopezcarrillo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260803180755.288793-1-juanmanuellopezcarrillo@gmail.com>
References: <20260803180755.288793-1-juanmanuellopezcarrillo@gmail.com>
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
index 20dad06b37ca..979e53e63522 100644
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

