Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A8D191475
	for <linux-clk@vger.kernel.org>; Mon, 17 Jun 2024 09:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718616356; cv=none; b=qliTmJEl3FlFmwQgeZ0LHI5plaO89bK4garaa3rFa8n7D5Plnsm+0ejvLxQ0FEvAseMkNpxJfJJAVWyGntdDSKaXf40RyLzD2s/pg//kLM01Xo+eTzVjtiraiQPnSn/3VNpn7dqRbbOT4KpJCbLYEQjIGEgxU2JuwQzHUiN379A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718616356; c=relaxed/simple;
	bh=1jxzhJIYvkT/WxCnVH/1bPAPoB4pVyrYe9iMSSE8TZM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cp7cHMexWyQG8c8yeQUQtUIN9dBkQiHCg4qELCsFDopeeqjf+ICvKgGUZom8pRnIJsQeTdTd372e78lcOaRwoiImpC2m34lI22/6XSMyK6Ghk6szrN1gYGTYX+YXKvu1US1YPp7bDuu3xxLOnp7E80hV/aKFtR4ZsySB5ak7Hcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m4tLuLmx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m4tLuLmx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 671F1C2BD10;
	Mon, 17 Jun 2024 09:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718616355;
	bh=1jxzhJIYvkT/WxCnVH/1bPAPoB4pVyrYe9iMSSE8TZM=;
	h=From:To:Cc:Subject:Date:From;
	b=m4tLuLmxLE/YYsegkxbf+9/zv3OtNcHDcWjlfkA6etjMFPX+q6s4QaAREMVRBr4h5
	 Wx7TDzJbSjuAgIrDOgc8HGmrgj6ge6Vfn2sqIDFebdLdpvptMTkYBGc/C7fCNyLrrz
	 Rn9uwUW4jRcu6XZPRO6X3H5n2PrncJE5EDjcYV81MUoQiMtba8rZrzOgjcWFRfjnY5
	 40x4qWkRKCt/6g0Xh5W3sg4fK3rllQ1ZWEQNPN3esg8W0qqKULi/H/ZWM8oynlwhIC
	 Cfhn9FTeau5P/mbSuF9UNe2uIXf94urDfk92Zy9t7JpOMxwBAF62lcTwPIx1qg8fOb
	 t4nwIE5jyC9JQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: linux-clk@vger.kernel.org
Cc: p.zabel@pengutronix.de,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	lorenzo.bianconi83@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	nbd@nbd.name,
	john@phrozen.org,
	upstream@airoha.com,
	angelogioacchino.delregno@collabora.com
Subject: [PATCH] clk: en7523: fix rate divider for slic and spi clocks
Date: Mon, 17 Jun 2024 11:25:49 +0200
Message-ID: <c491bdea05d847f1f1294b94f14725d292eb95d0.1718615934.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce div_offset field in en_clk_desc struct in order to fix rate
divider estimation in en7523_get_div routine for slic and spi fixed
rate clocks.
Moreover, fix base_shift for crypto clock.

Fixes: 1e6273179190 ("clk: en7523: Add clock driver for Airoha EN7523 SoC")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/clk/clk-en7523.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 9757023601c5..9804fce7872d 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -62,6 +62,7 @@ struct en_clk_desc {
 	u8 div_shift;
 	u16 div_val0;
 	u8 div_step;
+	u8 div_offset;
 };
 
 struct en_clk_gate {
@@ -106,6 +107,7 @@ static const struct en_clk_desc en7523_base_clks[] = {
 		.div_bits = 3,
 		.div_shift = 0,
 		.div_step = 1,
+		.div_offset = 1,
 	}, {
 		.id = EN7523_CLK_EMI,
 		.name = "emi",
@@ -119,6 +121,7 @@ static const struct en_clk_desc en7523_base_clks[] = {
 		.div_bits = 3,
 		.div_shift = 0,
 		.div_step = 1,
+		.div_offset = 1,
 	}, {
 		.id = EN7523_CLK_BUS,
 		.name = "bus",
@@ -132,6 +135,7 @@ static const struct en_clk_desc en7523_base_clks[] = {
 		.div_bits = 3,
 		.div_shift = 0,
 		.div_step = 1,
+		.div_offset = 1,
 	}, {
 		.id = EN7523_CLK_SLIC,
 		.name = "slic",
@@ -172,13 +176,14 @@ static const struct en_clk_desc en7523_base_clks[] = {
 		.div_bits = 3,
 		.div_shift = 0,
 		.div_step = 1,
+		.div_offset = 1,
 	}, {
 		.id = EN7523_CLK_CRYPTO,
 		.name = "crypto",
 
 		.base_reg = REG_CRYPTO_CLKSRC,
 		.base_bits = 1,
-		.base_shift = 8,
+		.base_shift = 0,
 		.base_values = emi_base,
 		.n_base_values = ARRAY_SIZE(emi_base),
 	}
@@ -281,7 +286,7 @@ static u32 en7523_get_div(void __iomem *base, int i)
 	if (!val && desc->div_val0)
 		return desc->div_val0;
 
-	return (val + 1) * desc->div_step;
+	return (val + desc->div_offset) * desc->div_step;
 }
 
 static int en7523_pci_is_enabled(struct clk_hw *hw)
-- 
2.45.1

