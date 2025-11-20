Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C95B372AD8;
	Thu, 20 Nov 2025 13:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763644548; cv=none; b=qtpTMgd/++1rtFFlalDCwvuu+PGxEkNhZ2/EWYbG+lcv5gAyPpwx3J8cdkX8gBpNQLb7srRkU6zofw4j7TuRDeowS4lLyvD0UWGaoeiqyC+aAuDL+87p1rev/PgFe5xaPebE5CaNcwLcm2SO8cWS3FweO5f9MhtPDgv7EZjOh9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763644548; c=relaxed/simple;
	bh=ryFSKJJYAQEuIhfDnfaPdlN0e3PPj9IXfbwSk6AoBpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WKapchTvZ5wcKkhfkZw8Dcu1kNPI2l46wQhJgg+Gu6FmPnp9uibpy7gbuth+byR3VMNScL9Z33PxE2JKial10IIbPtpQKTevNqagpTE47kb4Q0EXYT2BMa+pWli8HJ65fYXsb7AWvaaN20yLrzpu+JDcoZl+WvUi0fr/XyFoixI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=TGDzjodr; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="TGDzjodr"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id AD35722FD2;
	Thu, 20 Nov 2025 14:15:45 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cPPvRQRZVFl5; Thu, 20 Nov 2025 14:15:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1763644545; bh=ryFSKJJYAQEuIhfDnfaPdlN0e3PPj9IXfbwSk6AoBpg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TGDzjodrR1emmTiX70eqbr3bcJW1Dwk36Jx9wAgiBJSGlG75bylJyWlsdIHNbtj2z
	 TA/DIhStw85lnIpe/4b1BTjQgOssV9wlI+9des4yRYZmUkOASnHkcNM8BcLOWjrQaY
	 YATCb1NZZXQNm+3ttq2OH/rioX20txzZoJe4kEnO0qRp4AR31Dx8dXv/ZqR+llPGxu
	 3ksyOsprr39MOGZRbNYR0kz1Pvbei43gEhyEYU/CtvGk3LfHSSr2/qjUpaN5Z1ot2P
	 HCiS4TBtaJiDGbk+r35++gPTSSPyuztCdvE/j/PX+kjgz/rXwHdXN1deu6ujZLeogc
	 UiLSfUGGUvoxw==
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Icenowy Zheng <uwu@icenowy.me>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH 3/7] clk: thead: th1520-ap: Add C910 bus clock
Date: Thu, 20 Nov 2025 13:14:12 +0000
Message-ID: <20251120131416.26236-4-ziyao@disroot.org>
In-Reply-To: <20251120131416.26236-1-ziyao@disroot.org>
References: <20251120131416.26236-1-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This divider takes c910_clk as parent and is essential for the C910
cluster to operate, thus is marked as CLK_IS_CRITICAL.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 drivers/clk/thead/clk-th1520-ap.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index d870f0c665f8..b820d47387bb 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -539,6 +539,20 @@ static struct ccu_mux c910_clk = {
 	.mux	= TH_CCU_MUX("c910", c910_parents, 0, 1),
 };
 
+static struct ccu_div c910_bus_clk = {
+	.enable		= BIT(7),
+	.div_en		= BIT(11),
+	.div		= TH_CCU_DIV_FLAGS(8, 3, 0),
+	.common		= {
+		.clkid		= CLK_C910_BUS,
+		.cfg0		= 0x100,
+		.hw.init	= CLK_HW_INIT_HW("c910-bus",
+						 &c910_clk.mux.hw,
+						 &ccu_div_ops,
+						 CLK_IS_CRITICAL),
+	},
+};
+
 static const struct clk_parent_data ahb2_cpusys_parents[] = {
 	{ .hw = &gmac_pll_clk.common.hw },
 	{ .index = 0 }
@@ -1051,6 +1065,7 @@ static struct ccu_common *th1520_pll_clks[] = {
 };
 
 static struct ccu_common *th1520_div_clks[] = {
+	&c910_bus_clk.common,
 	&ahb2_cpusys_hclk.common,
 	&apb3_cpusys_pclk.common,
 	&axi4_cpusys2_aclk.common,
@@ -1194,7 +1209,7 @@ static const struct th1520_plat_data th1520_ap_platdata = {
 	.th1520_mux_clks = th1520_mux_clks,
 	.th1520_gate_clks = th1520_gate_clks,
 
-	.nr_clks = CLK_UART_SCLK + 1,
+	.nr_clks = CLK_C910_BUS + 1,
 
 	.nr_pll_clks = ARRAY_SIZE(th1520_pll_clks),
 	.nr_div_clks = ARRAY_SIZE(th1520_div_clks),
-- 
2.51.2

