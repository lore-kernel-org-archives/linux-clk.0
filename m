Received: from mo-csw.securemx.jp (mo-csw1800.securemx.jp [210.130.202.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7617419F137;
	Fri, 14 Nov 2025 07:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.130.202.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763104246; cv=none; b=roKou4So18LWAXFb/Fczu2ZrV8cf9+Y9PIK2JyeQBDzsLmHhN3H3OTXlD1e9NonRXVMCzgygzwfJxZ2LY51kbzSpv5Ovc8bPrNkZjNl5bsvmLgXCO7K7172g53wCInfxiRQZkwxY3JTYEb/V3IUV+xsK8zavBJN4EMsFKu4kiuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763104246; c=relaxed/simple;
	bh=uyWDTT5Qzgj8cOZjeCwqz0etC3fK34trFjI06n30ClI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k9AZL5z6oUCINvk98WpokEgQcl6ztd8gxDbJIIFXY77a3cgXKpE5VbGpQRDCi4aU919h7/ym6wpMJCAJQgCm9S9eVt45rVvj9ySa/XpFMdFGxE5hbTFQc6cJVn3w4c/kP7APRTrCxetmOZCpheHAXCtWViifO6OQDDMzmBfhku8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b=Dt7m0Ost; arc=none smtp.client-ip=210.130.202.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b="Dt7m0Ost"
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:Cc
	:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding;i=yuji2.ishikawa@toshiba.co.jp;s=key1.smx;t=
	1763104224;x=1764313824;bh=uyWDTT5Qzgj8cOZjeCwqz0etC3fK34trFjI06n30ClI=;b=Dt7
	m0Ost/UPZ7og/0Uh3HXt38IvLmGv1Ew7am/yQvov3RDESgC0Ba42hjO49MsbaYFlj2bRF9qDz574L
	qB/Oet1KscJts+ggO+hbMeyDvt9wcKHqUJYHPbxLe9RaddVFTwkBFvKJnMIcHNpwKg9owzVtyH+V+
	S593Z1FNS6Hdp0H5uST6DjO3UABvmnv5yiUrbro9PRx8nux1vd712xcNbAo4ht4H383KcnHMWuYwE
	V1kDb6d2ZzBN3pAT9CgBQFjW+DHSn7qzBaLRG+hEbhH/b5D1r5H7v8q26HU1j+JRWrKp6D1VSYE9b
	wqXINfS28xr+DYzFZappPq/CimYQ9wg==;
Received: by mo-csw.securemx.jp (mx-mo-csw1800) id 5AE7AOLN2598032; Fri, 14 Nov 2025 16:10:24 +0900
X-Iguazu-Qid: 2yAaYMbrhVHeI7VuQb
X-Iguazu-QSIG: v=2; s=0; t=1763104223; q=2yAaYMbrhVHeI7VuQb; m=QaraEwnfXhxxAX3DUjX5cSTi+AckGHwlF3AaidYZ69o=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4d77ZQ4W2fzyPZ; Fri, 14 Nov 2025 16:10:22 +0900 (JST)
X-SA-MID: 54823656
From: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Subject: [PATCH v3 2/2] clk: visconti: Add VIIF clocks
Date: Fri, 14 Nov 2025 16:05:12 +0900
X-TSB-HOP2: ON
Message-Id: <20251114070512.855008-3-yuji2.ishikawa@toshiba.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114070512.855008-1-yuji2.ishikawa@toshiba.co.jp>
References: <20251114070512.855008-1-yuji2.ishikawa@toshiba.co.jp>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the control sequence of register bits to handle the clocks and the
resets of Video Input Interface.

Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
---
Changelog v2:
- Update clk_gate_tables to reflect changes in bindings identifiers.

Changelog v3:
- Obtain the number of clocks in the driver source.
---
 drivers/clk/visconti/clkc-tmpv770x.c | 75 +++++++++++++++++++++++++++-
 1 file changed, 73 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/visconti/clkc-tmpv770x.c b/drivers/clk/visconti/clkc-tmpv770x.c
index 94a736da6..1e2e8d643 100644
--- a/drivers/clk/visconti/clkc-tmpv770x.c
+++ b/drivers/clk/visconti/clkc-tmpv770x.c
@@ -18,8 +18,8 @@
 #include "reset.h"
 
 /* Must be equal to the last clock/reset ID increased by one */
-#define CLKS_NR	(TMPV770X_CLK_BUSLCK + 1)
-#define RESETS_NR	(TMPV770X_RESET_SBUSCLK + 1)
+#define CLKS_NR	(TMPV770X_CLK_VIIFBS1_PROC + 1)
+#define RESETS_NR	(TMPV770X_RESET_VIIFBS1_L1ISP + 1)
 
 static DEFINE_SPINLOCK(tmpv770x_clk_lock);
 static DEFINE_SPINLOCK(tmpv770x_rst_lock);
@@ -32,6 +32,10 @@ static const struct clk_parent_data pietherplls_parent_data[] = {
 	{ .fw_name = "pietherpll", .name = "pietherpll", },
 };
 
+static const struct clk_parent_data pidnnplls_parent_data[] = {
+	{ .fw_name = "pidnnpll", .name = "pidnnpll", },
+};
+
 static const struct visconti_fixed_clk fixed_clk_tables[] = {
 	/* PLL1 */
 	/* PICMPT0/1, PITSC, PIUWDT, PISWDT, PISBUS, PIPMU, PIGPMU, PITMU */
@@ -68,6 +72,41 @@ static const struct visconti_clk_gate_table pietherpll_clk_gate_tables[] = {
 		TMPV770X_RESET_PIETHER_125M, },
 };
 
+static const struct visconti_clk_gate_table pidnnpll_clk_gate_tables[] = {
+	{ TMPV770X_CLK_VIIFBS0, "viifbs0",
+		pidnnplls_parent_data, ARRAY_SIZE(pidnnplls_parent_data),
+		0, 0x58, 0x158, 1, 1,
+		NO_RESET, },
+	{ TMPV770X_CLK_VIIFBS0_PROC, "viifbs0_proc",
+		pidnnplls_parent_data, ARRAY_SIZE(pidnnplls_parent_data),
+		0, 0x58, 0x158, 18, 1,
+		NO_RESET, },
+	{ TMPV770X_CLK_VIIFBS0_L1ISP, "viifbs0_l1isp",
+		pidnnplls_parent_data, ARRAY_SIZE(pidnnplls_parent_data),
+		0, 0x58, 0x158, 17, 1,
+		NO_RESET, },
+	{ TMPV770X_CLK_VIIFBS0_L2ISP, "viifbs0_l2isp",
+		pidnnplls_parent_data, ARRAY_SIZE(pidnnplls_parent_data),
+		0, 0x58, 0x158, 16, 1,
+		NO_RESET, },
+	{ TMPV770X_CLK_VIIFBS1, "viifbs1",
+		pidnnplls_parent_data, ARRAY_SIZE(pidnnplls_parent_data),
+		0, 0x58, 0x158, 5, 1,
+		NO_RESET, },
+	{ TMPV770X_CLK_VIIFBS1_PROC, "viifbs1_proc",
+		pidnnplls_parent_data, ARRAY_SIZE(pidnnplls_parent_data),
+		0, 0x58, 0x158, 22, 1,
+		NO_RESET, },
+	{ TMPV770X_CLK_VIIFBS1_L1ISP, "viifbs1_l1isp",
+		pidnnplls_parent_data, ARRAY_SIZE(pidnnplls_parent_data),
+		0, 0x58, 0x158, 21, 1,
+		NO_RESET, },
+	{ TMPV770X_CLK_VIIFBS1_L2ISP, "viifbs1_l2isp",
+		pidnnplls_parent_data, ARRAY_SIZE(pidnnplls_parent_data),
+		0, 0x58, 0x158, 20, 1,
+		NO_RESET, },
+};
+
 static const struct visconti_clk_gate_table clk_gate_tables[] = {
 	{ TMPV770X_CLK_HOX, "hox",
 		clks_parent_data, ARRAY_SIZE(clks_parent_data),
@@ -189,6 +228,22 @@ static const struct visconti_clk_gate_table clk_gate_tables[] = {
 		clks_parent_data, ARRAY_SIZE(clks_parent_data),
 		0, 0x14, 0x114, 0, 4,
 		TMPV770X_RESET_SBUSCLK, },
+	{ TMPV770X_CLK_VIIF0_CFGCLK, "csi2rx0cfg",
+		clks_parent_data, ARRAY_SIZE(clks_parent_data),
+		0, 0x58, 0x158, 0, 24,
+		NO_RESET, },
+	{ TMPV770X_CLK_VIIF0_APBCLK, "csi2rx0apb",
+		clks_parent_data, ARRAY_SIZE(clks_parent_data),
+		0, 0x58, 0x158, 2, 4,
+		NO_RESET, },
+	{ TMPV770X_CLK_VIIF1_CFGCLK, "csi2rx1cfg",
+		clks_parent_data, ARRAY_SIZE(clks_parent_data),
+		0, 0x58, 0x158, 4, 24,
+		NO_RESET, },
+	{ TMPV770X_CLK_VIIF1_APBCLK, "csi2rx1apb",
+		clks_parent_data, ARRAY_SIZE(clks_parent_data),
+		0, 0x58, 0x158, 6, 4,
+		NO_RESET, },
 };
 
 static const struct visconti_reset_data clk_reset_data[] = {
@@ -224,6 +279,14 @@ static const struct visconti_reset_data clk_reset_data[] = {
 	[TMPV770X_RESET_PIPCMIF]	= { 0x464, 0x564, 0, },
 	[TMPV770X_RESET_PICKMON]	= { 0x410, 0x510, 8, },
 	[TMPV770X_RESET_SBUSCLK]	= { 0x414, 0x514, 0, },
+	[TMPV770X_RESET_VIIFBS0]	= { 0x458, 0x558, 0, },
+	[TMPV770X_RESET_VIIFBS0_APB]	= { 0x458, 0x558, 1, },
+	[TMPV770X_RESET_VIIFBS0_L2ISP]	= { 0x458, 0x558, 16, },
+	[TMPV770X_RESET_VIIFBS0_L1ISP]	= { 0x458, 0x558, 17, },
+	[TMPV770X_RESET_VIIFBS1]	= { 0x458, 0x558, 4, },
+	[TMPV770X_RESET_VIIFBS1_APB]	= { 0x458, 0x558, 5, },
+	[TMPV770X_RESET_VIIFBS1_L2ISP]	= { 0x458, 0x558, 20, },
+	[TMPV770X_RESET_VIIFBS1_L1ISP]	= { 0x458, 0x558, 21, },
 };
 
 static int visconti_clk_probe(struct platform_device *pdev)
@@ -276,6 +339,14 @@ static int visconti_clk_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = visconti_clk_register_gates(ctx, pidnnpll_clk_gate_tables,
+				    ARRAY_SIZE(pidnnpll_clk_gate_tables),
+				    clk_reset_data, &tmpv770x_clk_lock);
+	if (ret) {
+		dev_err(dev, "Failed to register pidnnpll clock gate: %d\n", ret);
+		return ret;
+	}
+
 	return of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &ctx->clk_data);
 }
 
-- 
2.34.1


