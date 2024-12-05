Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EDA229B00
	for <linux-clk@vger.kernel.org>; Thu,  5 Dec 2024 18:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733423435; cv=none; b=X8wdCUhs3lO7dW+YhBEP+3RGcxRkzY2G33GHP4zyicA4cGzvvIoYrYZjM1myGgUJoUSUdbYLXrPDtZU92USGpEQ2PDaiU5OCSVVDy9WQBb4riSd3jDbHGgDI43GTc83MZnecWC7aCkJZwxtcoTcIMBQHmk9WeL8PDjvrWU21FYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733423435; c=relaxed/simple;
	bh=ywTNg8/5ZwIso+ek5/ibrNAeaXrGW5XPSv4RyxxTzdo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A7zYd23kFxusiUyQPQN3RLW3ipjaBysJBVxOXXI+Q6v0s7i02ifIw1GXvsbBGYYiZ1r2uwkjtlUeClO3tP1VA1BPDOh+UM4sfkA9CSG23v2ZcHxZrH4UfrxewczTMH/kys6wqgDBnqRgiTbjmnRt1lku9gw7vylXTea7suQGGRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=KrHN/yPJ; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="KrHN/yPJ"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1733423431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Amz6hL2pw8x/SHWoLqNvQ1TRgfepZkFsNEB+hKs1uI=;
	b=KrHN/yPJZSIGemVuk010y1lAmWFREJjim9GC88LZepf3syOICcGH1lwV2+d+liZUYU6mtI
	J9WvE0qk+AvAflHJAfFNHXJkXVGvpN6AwgQLPVDb5QsyXMFiPCor473fBmUUOd3R53L3l/
	dX46Q8Te1EsaIItsGRbMhdedNF3HB1bEtYRcvW3Hqy6PMc9ojq9P38vLdTAlK+wPeVUosM
	DC5NIGw0yPnsKQxXDBDXMHC8tfpU3Ge2RQB+XKEII0fuAh/Pk/K2P1oyoMhQ/tT0GIqgcY
	w9SFpXN4acLzqINjZy9Da6T3+2ADrn6SB4v8FQHCk1oONC1juK10YdCWrs+7XA==
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] clk: rockchip: use PCLK_CIF0/1 clock IDs on RK3066
Date: Thu,  5 Dec 2024 15:29:36 -0300
Message-ID: <20241205182954.5346-2-val@packett.cool>
In-Reply-To: <20241205182954.5346-1-val@packett.cool>
References: <20241205182954.5346-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

RK3066 has two "CIF" video capture interface blocks, reference the
newly added IDs for their PCLK clocks.

Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/clk/rockchip/clk-rk3188.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3188.c b/drivers/clk/rockchip/clk-rk3188.c
index 684233e72105..81e94b338d0f 100644
--- a/drivers/clk/rockchip/clk-rk3188.c
+++ b/drivers/clk/rockchip/clk-rk3188.c
@@ -344,7 +344,7 @@ static struct rockchip_clk_branch common_clk_branches[] __initdata = {
 
 	GATE(0, "pclkin_cif0", "ext_cif0", 0,
 			RK2928_CLKGATE_CON(3), 3, GFLAGS),
-	INVERTER(0, "pclk_cif0", "pclkin_cif0",
+	INVERTER(PCLK_CIF0, "pclk_cif0", "pclkin_cif0",
 			RK2928_CLKSEL_CON(30), 8, IFLAGS),
 
 	FACTOR(0, "xin12m", "xin24m", 0, 1, 2),
@@ -602,7 +602,7 @@ static struct rockchip_clk_branch rk3066a_clk_branches[] __initdata = {
 
 	GATE(0, "pclkin_cif1", "ext_cif1", 0,
 			RK2928_CLKGATE_CON(3), 4, GFLAGS),
-	INVERTER(0, "pclk_cif1", "pclkin_cif1",
+	INVERTER(PCLK_CIF1, "pclk_cif1", "pclkin_cif1",
 			RK2928_CLKSEL_CON(30), 12, IFLAGS),
 
 	COMPOSITE(0, "aclk_gpu_src", mux_pll_src_cpll_gpll_p, 0,
-- 
2.47.1

