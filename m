Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C688E31AF31
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 19:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776196458; cv=none; b=iBYHrFmxPUTDKDIFdEdatlvMZwAaqAlNsufMPsBhCQvbV99vxEeGL2xys7vcdVa1+HIi78uICTA0yMG/bR1iEtCUgKL99VpZAobemAkNoggEDDPuhSh3z3ZguvNLPZ1poVrgj7wn+GL2OAhlgJ7mnwlXn1stsjpJnLCHCO6koTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776196458; c=relaxed/simple;
	bh=HTSNxB0VLN3iwKGODJ3FXpLfMGanjlXryM4WhEdajys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iq37ZTW+F2+EgqorRlDbKeRLkie6+u61qO5hYt6R3jfgU70rch/nlHUyYZD/cVwvKBdMJOmNev42n/rif3tVAJ9KveGn2OjIjs7ihR0KvFnvNGcQIeBQO8dp1BFVxxEXINSGTBCtAUMtBhv6gN+NFWGNcxVdxBrqe3IdlO0JikM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YkxYcn3z; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YkxYcn3z"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43cfd832155so4135397f8f.1
        for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 12:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776196455; x=1776801255; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rKFuKgv0AEkRD4ZABJqA1y+s2HqCRJHpRMYf+DRn8zE=;
        b=YkxYcn3zy1W+tCyU1OJPaIYFQUzV9jDlcbaDeEMoi5sRobFIfxh55nC1CRwFTuxN0T
         YwZcs0sJ4b5RRPKWzI3BP1OxvvpeoxbkkbuYrH4+zmiIppaxyJdpbvbxHa4TqCri6hSw
         xkerHO92WMagiBgvTdzMNHMkL+FF02d8CE2fWyz3068072lEyLSOs6gqbAPFD3KF4gsP
         JN4OOi+1sqMNUhLd45KqGi6BN4dN9Ke6NkP/PNDZYZbJUFcK9lQTA8q3gezD1Pbq4WI9
         dSirfw/MH1KbrO9p9TL+48iJ4sq8vJf9wqm2vrlLXsqmHOCr6ORShbF9m1KRUkcdOtTt
         IEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776196455; x=1776801255;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rKFuKgv0AEkRD4ZABJqA1y+s2HqCRJHpRMYf+DRn8zE=;
        b=N0iiB++nsbvAWSUh5SVZCjbWVYuVZ69ZqRtdlUCP6PuY0IdqcfmCwdHrpHowIpr7nz
         UfnVZf1yb29GeyinS0VfDJbQsuj8nf0UHF/gv8Smjo+7Py0/94SS36B6O2gTlJfqAXOD
         NdGlew8OPOWBUXf7AQpltgMYAQA6rZOWCynLTsICWNx0MjuXpeT1tjvWxJRISxfjNbb8
         2r2UCuaU1KWw/YxUDs30v6xqXWf3uefRlV+/xt9bvNPghseRz6cBbGVTj0avzj6AbMMb
         q2YQWmJK1hUtt4jUbg7BtNIvOweOHcE3cqODO5WrCnP30CZBogFEWrL9xr0WxIGoyp9K
         fzNA==
X-Forwarded-Encrypted: i=1; AFNElJ+ai9AZni0tuWMkAT77CcF3vkdnYuMp6mWtctGNMhrjn8K0/rNf/s4xEF2E+BkR9O6z79SuykHYJIU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfwFjXrhDD6zSpwoE5ER4xWMXtJ6ng4lwtcFzhROp+aQyapaeL
	oKgHhjTr48QrcgAph7zf1bW6XPIVCmbgfVqHr6I2g3AVlKez35GJhcI8
X-Gm-Gg: AeBDievG2N783qsFVP2ZkCDI/xolhA64EPhO9zU8xl1q6TfAxE9If2wAB+LzK/ugjh3
	bMmPgkGgOsPgHY4TbtCbgBUCc5Ge8vdewgxp1ISNG+WEHOBwjweDjXCOxp2ikjINN4CW0DIMZvf
	l5LyMm1nCjLWvKliOQUz5781fTsUL0HdGt04UU5w6lELbrmCYl9VFVGDhEmu38rrL2UdAO2QCXX
	Obi/XjkKPLBunCsYo0BG16e5xDnEkz90B39prJjxSYLETxEdXnFWPkfGMcFI/nR/8wjN4TZG/PU
	Cye2+8uWOZ+3eR9U6CP0n0N6rs2Pd7m6IN/Ltfa/JC2y9SJtD41vRfS13jLcddk0/ODgOfXLlaG
	mAMRs3vVvcyPa67helQtj2mpFStc3uy1WBj6uYFWglAPeVsifyOzrwNuKgsj6EeIu0RSi0KHtHL
	+92Pr145JsKZIMooqgbCmE1qySTwjbACI3NMI1WW08bNdU3AdARkfV8xDAuba6xGjtM6MhqdFe8
	gaVDkQZAZwQIAWGiYd7jEa0JsLeVWwuVA==
X-Received: by 2002:a05:6000:b0a:b0:43d:6787:9924 with SMTP id ffacd0b85a97d-43d67879ad8mr17176548f8f.2.1776196454943;
        Tue, 14 Apr 2026 12:54:14 -0700 (PDT)
Received: from [127.0.1.1] (93-143-58-160.adsl.net.t-com.hr. [93.143.58.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d7400708dsm25595266f8f.25.2026.04.14.12.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 12:54:14 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Tue, 14 Apr 2026 21:51:51 +0200
Subject: [PATCH 2/4] clk: mmp: pxa1908-apbc: Add reset cells
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260414-pxa1908-clk-reset-v1-2-94bae5f3a8cf@dujemihanovic.xyz>
References: <20260414-pxa1908-clk-reset-v1-0-94bae5f3a8cf@dujemihanovic.xyz>
In-Reply-To: <20260414-pxa1908-clk-reset-v1-0-94bae5f3a8cf@dujemihanovic.xyz>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Karel Balej <balejk@matfyz.cz>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5428;
 i=duje@dujemihanovic.xyz; s=20260328; h=from:subject:message-id;
 bh=y12V/0MXZNM4V87Nu8AZ7/dxPVLqCzcuUl4Cuce0an4=;
 b=owGbwMvMwCW2z0j3+uHIyKOMp9WSGDLvzU589HF5hHZ6jMYS244ulq95DUmxvfesJ4gqdRiEV
 O9Y92pNRykLgxgXg6yYIgvzUrlLfKnhEx2KbJNg5rAygQxh4OIUgIkILmZk6JyutO+Th3oDh8DM
 UFUOYcsnV8q/Lao6OGvb3+O/9bm+LGdkuO2RvXP96akb7s5mWBW/UX9jyJ9zJep7N+yLW/Xod5T
 sSRYA
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=9BD463017690089DAA8DC266275F544B3B1B4792

From: Duje Mihanović <duje@dujemihanovic.xyz>

It has been concluded by comparing the gate clock masks and vendor code
between PXA1908/28 that PXA1908's APBC, similarly to PXA1928's APBC, has
controllable reset lines. Describe these in the driver for correctness.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 drivers/clk/mmp/clk-pxa1908-apbc.c | 58 +++++++++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/mmp/clk-pxa1908-apbc.c b/drivers/clk/mmp/clk-pxa1908-apbc.c
index 3fd7b5e644f3..438ece4f047d 100644
--- a/drivers/clk/mmp/clk-pxa1908-apbc.c
+++ b/drivers/clk/mmp/clk-pxa1908-apbc.c
@@ -7,6 +7,7 @@
 #include <dt-bindings/clock/marvell,pxa1908.h>
 
 #include "clk.h"
+#include "reset.h"
 
 #define APBC_UART0		0x0
 #define APBC_UART1		0x4
@@ -44,22 +45,25 @@ static const char * const uart_parent_names[] = {"pll1_117", "uart_pll"};
 static const char * const ssp_parent_names[] = {"pll1_d16", "pll1_d48", "pll1_d24", "pll1_d12"};
 
 static struct mmp_param_gate_clk apbc_gate_clks[] = {
-	{PXA1908_CLK_TWSI0, "twsi0_clk", "pll1_32", CLK_SET_RATE_PARENT, APBC_TWSI0, 0x7, 3, 0, 0, NULL},
-	{PXA1908_CLK_TWSI1, "twsi1_clk", "pll1_32", CLK_SET_RATE_PARENT, APBC_TWSI1, 0x7, 3, 0, 0, NULL},
-	{PXA1908_CLK_TWSI3, "twsi3_clk", "pll1_32", CLK_SET_RATE_PARENT, APBC_TWSI3, 0x7, 3, 0, 0, NULL},
-	{PXA1908_CLK_GPIO, "gpio_clk", "vctcxo", CLK_SET_RATE_PARENT, APBC_GPIO, 0x7, 3, 0, 0, NULL},
-	{PXA1908_CLK_KPC, "kpc_clk", "clk32", CLK_SET_RATE_PARENT, APBC_KPC, 0x7, 3, 0, MMP_CLK_GATE_NEED_DELAY, NULL},
-	{PXA1908_CLK_RTC, "rtc_clk", "clk32", CLK_SET_RATE_PARENT, APBC_RTC, 0x87, 0x83, 0, MMP_CLK_GATE_NEED_DELAY, NULL},
+	{PXA1908_CLK_TWSI0, "twsi0_clk", "pll1_32", CLK_SET_RATE_PARENT, APBC_TWSI0, 0x3, 3, 0, 0, NULL},
+	{PXA1908_CLK_TWSI1, "twsi1_clk", "pll1_32", CLK_SET_RATE_PARENT, APBC_TWSI1, 0x3, 3, 0, 0, NULL},
+	{PXA1908_CLK_TWSI3, "twsi3_clk", "pll1_32", CLK_SET_RATE_PARENT, APBC_TWSI3, 0x3, 3, 0, 0, NULL},
+	{PXA1908_CLK_GPIO, "gpio_clk", "vctcxo", CLK_SET_RATE_PARENT, APBC_GPIO, 0x3, 3, 0, 0, NULL},
+	{PXA1908_CLK_KPC, "kpc_clk", "clk32", CLK_SET_RATE_PARENT, APBC_KPC, 0x3, 3, 0, MMP_CLK_GATE_NEED_DELAY, NULL},
+	{PXA1908_CLK_RTC, "rtc_clk", "clk32", CLK_SET_RATE_PARENT, APBC_RTC, 0x83, 0x83, 0, MMP_CLK_GATE_NEED_DELAY, NULL},
+	{PXA1908_CLK_PWM1, "pwm1_clk", "pwm01_apb_share", CLK_SET_RATE_PARENT, APBC_PWM1, 0x2, 2, 0, 0, NULL},
+	{PXA1908_CLK_PWM3, "pwm3_clk", "pwm23_apb_share", CLK_SET_RATE_PARENT, APBC_PWM3, 0x2, 2, 0, 0, NULL},
+	{PXA1908_CLK_UART0, "uart0_clk", "uart0_mux", CLK_SET_RATE_PARENT, APBC_UART0, 0x3, 3, 0, 0, &uart0_lock},
+	{PXA1908_CLK_UART1, "uart1_clk", "uart1_mux", CLK_SET_RATE_PARENT, APBC_UART1, 0x3, 3, 0, 0, &uart1_lock},
+	{PXA1908_CLK_THERMAL, "thermal_clk", NULL, 0, APBC_THERMAL, 0x3, 3, 0, 0, NULL},
+	{PXA1908_CLK_IPC_RST, "ipc_clk", NULL, 0, APBC_IPC_RST, 0x3, 3, 0, 0, NULL},
+	{PXA1908_CLK_SSP0, "ssp0_clk", "ssp0_mux", 0, APBC_SSP0, 0x3, 3, 0, 0, NULL},
+	{PXA1908_CLK_SSP2, "ssp2_clk", "ssp2_mux", 0, APBC_SSP2, 0x3, 3, 0, 0, NULL},
+};
+
+static struct mmp_param_gate_clk apbc_gate_no_reset_clks[] = {
 	{PXA1908_CLK_PWM0, "pwm0_clk", "pwm01_apb_share", CLK_SET_RATE_PARENT, APBC_PWM0, 0x2, 2, 0, 0, &pwm0_lock},
-	{PXA1908_CLK_PWM1, "pwm1_clk", "pwm01_apb_share", CLK_SET_RATE_PARENT, APBC_PWM1, 0x6, 2, 0, 0, NULL},
 	{PXA1908_CLK_PWM2, "pwm2_clk", "pwm23_apb_share", CLK_SET_RATE_PARENT, APBC_PWM2, 0x2, 2, 0, 0, NULL},
-	{PXA1908_CLK_PWM3, "pwm3_clk", "pwm23_apb_share", CLK_SET_RATE_PARENT, APBC_PWM3, 0x6, 2, 0, 0, NULL},
-	{PXA1908_CLK_UART0, "uart0_clk", "uart0_mux", CLK_SET_RATE_PARENT, APBC_UART0, 0x7, 3, 0, 0, &uart0_lock},
-	{PXA1908_CLK_UART1, "uart1_clk", "uart1_mux", CLK_SET_RATE_PARENT, APBC_UART1, 0x7, 3, 0, 0, &uart1_lock},
-	{PXA1908_CLK_THERMAL, "thermal_clk", NULL, 0, APBC_THERMAL, 0x7, 3, 0, 0, NULL},
-	{PXA1908_CLK_IPC_RST, "ipc_clk", NULL, 0, APBC_IPC_RST, 0x7, 3, 0, 0, NULL},
-	{PXA1908_CLK_SSP0, "ssp0_clk", "ssp0_mux", 0, APBC_SSP0, 0x7, 3, 0, 0, NULL},
-	{PXA1908_CLK_SSP2, "ssp2_clk", "ssp2_mux", 0, APBC_SSP2, 0x7, 3, 0, 0, NULL},
 };
 
 static struct mmp_param_mux_clk apbc_mux_clks[] = {
@@ -89,6 +93,30 @@ static void pxa1908_apb_periph_clk_init(struct pxa1908_clk_unit *pxa_unit)
 			ARRAY_SIZE(apbc_mux_clks));
 	mmp_register_gate_clks(unit, apbc_gate_clks, pxa_unit->base,
 			ARRAY_SIZE(apbc_gate_clks));
+	mmp_register_gate_clks(unit, apbc_gate_no_reset_clks, pxa_unit->base,
+			ARRAY_SIZE(apbc_gate_no_reset_clks));
+}
+
+/* Taken from clk-of-pxa1928.c */
+static void pxa1908_clk_reset_init(struct device_node *np,
+				   struct pxa1908_clk_unit *pxa_unit)
+{
+	struct mmp_clk_reset_cell *cells;
+	int nr_cells = ARRAY_SIZE(apbc_gate_clks);
+
+	cells = kzalloc_objs(*cells, nr_cells);
+	if (!cells)
+		return;
+
+	for (int i = 0; i < nr_cells; i++) {
+		cells[i].clk_id = apbc_gate_clks[i].id;
+		cells[i].reg = pxa_unit->base + apbc_gate_clks[i].offset;
+		cells[i].bits = BIT(2);
+		cells[i].flags = 0;
+		cells[i].lock = apbc_gate_clks[i].lock;
+	};
+
+	mmp_clk_reset_register(np, cells, nr_cells);
 }
 
 static int pxa1908_apbc_probe(struct platform_device *pdev)
@@ -107,6 +135,8 @@ static int pxa1908_apbc_probe(struct platform_device *pdev)
 
 	pxa1908_apb_periph_clk_init(pxa_unit);
 
+	pxa1908_clk_reset_init(pdev->dev.of_node, pxa_unit);
+
 	return 0;
 }
 

-- 
2.53.0

