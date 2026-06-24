Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20D6327C09;
	Wed, 24 Jun 2026 05:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782279918; cv=none; b=tjPBBjgg/ck4q0QuGsw4Oy7sW3XGfnpe5JUODTw3hFEe3Gh8dhHj1ARv8UMlezbhyx/paOU08Iv+jAb/0A2BFOZr7DbrozGewcRAhEsCOwH1effhnKrdqaKG9TU3G+11YG6zCDNtd8Q0Yrq5H++1HQn4Cu7SzmETq01qpn+roME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782279918; c=relaxed/simple;
	bh=JaGTBdxpHJ5fN4jX4hONzuI8SeSX32dT0OINEwJOlW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=tbE4LPSIYOOqH2D8aqXo4KeP03t+GWx2/MOI81Cx3R0heRu821VbL2geqIpZhF/QtR5Y0FtDnZMVdrCI7/9csuQgBvbTfRm2zTj408ZXj/+GeHjBAkoFtzoTuvaElPCfSCselnyKIQrVl+X1somBtVb0HZ6fQVK3f1lMjFBzgxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 24 Jun
 2026 13:45:01 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 24 Jun 2026 13:45:01 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Wed, 24 Jun 2026 13:45:00 +0800
Subject: [PATCH 2/2] clk: aspeed: add AST2700 PECI clock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260624-peci_clk-v1-2-ee28b92e22e9@aspeedtech.com>
References: <20260624-peci_clk-v1-0-ee28b92e22e9@aspeedtech.com>
In-Reply-To: <20260624-peci_clk-v1-0-ee28b92e22e9@aspeedtech.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782279900; l=2202;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=JaGTBdxpHJ5fN4jX4hONzuI8SeSX32dT0OINEwJOlW0=;
 b=wx53gZa51rQIOOSRp0P/kkRu9+ktuqQtS5K609XIMHAwbayPtB5QtVf4naHm8A0llGtrfkO95
 tE4mAvNyW87CL9CLtBeyFKTQlqTIJG7T9HFgER1nGU/HP8s2wgzxj01
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=

Register the SoC1 PECI clock as a mux selected by SCU1_CLK_SEL2 bit 16,
choosing between the 25MHz CLKIN and HPLL/4. Add the HPLL/4 fixed factor
clock to serve as the second mux parent.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 drivers/clk/aspeed/clk-ast2700.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/aspeed/clk-ast2700.c b/drivers/clk/aspeed/clk-ast2700.c
index 8b7b382f6f3e..5f499ec0e1d1 100644
--- a/drivers/clk/aspeed/clk-ast2700.c
+++ b/drivers/clk/aspeed/clk-ast2700.c
@@ -273,6 +273,13 @@ static const unsigned int sdclk_parent_ids[] = {
 
 static const struct clk_hw *sdclk_parent_hws[ARRAY_SIZE(sdclk_parent_ids)];
 
+static const unsigned int peciclk_parent_ids[] = {
+	SCU1_CLKIN,
+	SCU1_CLK_HPLL_DIV4
+};
+
+static const struct clk_hw *peciclk_parent_hws[ARRAY_SIZE(peciclk_parent_ids)];
+
 #define FIXED_CLK(_id, _name, _rate) \
 	{ \
 		.id = _id,	\
@@ -458,6 +465,7 @@ static const struct ast2700_clk_info ast2700_scu1_clk_info[] __initconst = {
 	PLL_CLK(SCU1_CLK_HPLL, CLK_PLL, "soc1-hpll", SCU1_CLKIN, SCU1_HPLL_PARAM),
 	PLL_CLK(SCU1_CLK_APLL, CLK_PLL, "soc1-apll", SCU1_CLKIN, SCU1_APLL_PARAM),
 	PLL_CLK(SCU1_CLK_DPLL, CLK_PLL, "soc1-dpll", SCU1_CLKIN, SCU1_DPLL_PARAM),
+	FIXED_FACTOR_CLK(SCU1_CLK_HPLL_DIV4, "soc1-hpll_div4", SCU1_CLK_HPLL, 1, 4),
 	FIXED_FACTOR_CLK(SCU1_CLK_APLL_DIV2, "soc1-apll_div2", SCU1_CLK_APLL, 1, 2),
 	FIXED_FACTOR_CLK(SCU1_CLK_APLL_DIV4, "soc1-apll_div4", SCU1_CLK_APLL, 1, 4),
 	FIXED_FACTOR_CLK(SCU1_CLK_CAN, "canclk", SCU1_CLK_APLL, 1, 10),
@@ -481,6 +489,8 @@ static const struct ast2700_clk_info ast2700_scu1_clk_info[] __initconst = {
 		uxclk_parent_hws, SCU1_CLK_SEL2, 0, 2),
 	MUX_CLK(SCU1_CLK_HUXCLK, "huxclk", uxclk_parent_ids, ARRAY_SIZE(uxclk_parent_ids),
 		uxclk_parent_hws, SCU1_CLK_SEL2, 3, 2),
+	MUX_CLK(SCU1_CLK_PECI, "peciclk", peciclk_parent_ids, ARRAY_SIZE(peciclk_parent_ids),
+		peciclk_parent_hws, SCU1_CLK_SEL2, 16, 1),
 	DIVIDER_CLK(SCU1_CLK_SDCLK, "sdclk", SCU1_CLK_SDMUX,
 		    SCU1_CLK_SEL1, 14, 3, ast2700_clk_div_table),
 	PLL_CLK(SCU1_CLK_UARTX, CLK_UART_PLL, "uartxclk", SCU1_CLK_UXCLK, SCU1_UXCLK_CTRL),

-- 
2.34.1

