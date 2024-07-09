Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7819150989
	for <linux-clk@vger.kernel.org>; Tue,  9 Jul 2024 07:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720511377; cv=none; b=JQ1O5mhkY9v7ERj/iqGzNxPttDRtVskmgmSRlta3MeTTyLQKooAP0oJVOiULLGfRSWs5VcmvGOfghC+3KxSeZpvI7uucjGqPSQP9eORu1R8p9a4g2p4zuYl0WIJ8gBgtXV2YOMDgpZBlZK0dTRha8bqNyKktYCD517id9ZNut44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720511377; c=relaxed/simple;
	bh=v87KW29jKNMb19f0VNwf6ykPd1+bV0FEx87Zaao5tAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qjpY8dtllvF8Z7ZBH9zTG2T4MbxP+Fg/QfNQeNQI6IRQRVNkmC2ZvYIIQRdiUEBYWqcA/wcMfx/ly+TITVbEzPKsPi6uLPirvDEjeAdFxLV7E7ywIJ9dS+ZUDIMBY3iv5jg9E7OY4RL3B9hqWDZfcKx0u9b9EJHmsFktonfX5ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oN3LInob; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oN3LInob"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 636C4C32786;
	Tue,  9 Jul 2024 07:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720511377;
	bh=v87KW29jKNMb19f0VNwf6ykPd1+bV0FEx87Zaao5tAg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oN3LInobfeqAkQeS5xYXpCgNhHu9yPlmYVjMu79fjgxkJrj5WZHJvonPaKs790mNd
	 pxBwiREKmzu8vA3xoGtMSW3zqR19Nnt5RHK1VV7sF5eJstDzsYa1nAk5wE6fj+5Rd2
	 iqr50V8EaKKB/wF+Vg3UFqwi8Hg0x07Lsh9YkYQ5Qme57wjDih+zAgjLv6c0soou4e
	 JAQcPpvE5lEuDmx2QXGq4A8b7EeZwf8z84ab/+8Y/dUJk3i+vo8hipo6B4C9h15PNL
	 wQqmzBkjvzyUycykX2/27n52GYiBVTeWl0Bt0WGn76yUY50c1ilI6w09p6q1sSgZDR
	 rYBtKeBkuDzMQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	lorenzo.bianconi83@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	nbd@nbd.name,
	john@phrozen.org,
	upstream@airoha.com,
	angelogioacchino.delregno@collabora.com
Subject: [PATCH 2/2] clk: en7523: fix scuclk io region for upcoming pinctrl
Date: Tue,  9 Jul 2024 09:48:55 +0200
Message-ID: <f1c8e114fb1370b9a3a602e3ed3e9eeb5824c2e7.1720510991.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1720510991.git.lorenzo@kernel.org>
References: <cover.1720510991.git.lorenzo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

EN7581 clock driver shares the IO region with the upcoming pinctrl
driver for Airoha EN7581 SoC. Fix it by reducing the clk mapped
region to only used registers in order to not overlap with pinctrl
one. This change is not introducing any backward compatibility issue
since the EN7581 dts is not upstream yet.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/clk/clk-en7523.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index b20e56337a6b..d9ecbb6bf55a 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -31,7 +31,14 @@
 #define   REG_RESET_CONTROL_PCIE1	BIT(27)
 #define   REG_RESET_CONTROL_PCIE2	BIT(26)
 /* EN7581 */
-#define REG_CRYPTO_CLKSRC2		0x20c
+#define REG_GSW_CLK_DIV_SEL2		0x00
+#define REG_EMI_CLK_DIV_SEL2		0x04
+#define REG_BUS_CLK_DIV_SEL2		0x08
+#define REG_SPI_CLK_DIV_SEL2		0x10
+#define REG_SPI_CLK_FREQ_SEL2		0x14
+#define REG_NPU_CLK_DIV_SEL2		0x48
+#define REG_CRYPTO_CLKSRC2		0x58
+
 #define REG_PCIE0_MEM			0x00
 #define REG_PCIE0_MEM_MASK		0x04
 #define REG_PCIE1_MEM			0x08
@@ -203,7 +210,7 @@ static const struct en_clk_desc en7581_base_clks[] = {
 		.id = EN7523_CLK_GSW,
 		.name = "gsw",
 
-		.base_reg = REG_GSW_CLK_DIV_SEL,
+		.base_reg = REG_GSW_CLK_DIV_SEL2,
 		.base_bits = 1,
 		.base_shift = 8,
 		.base_values = gsw_base,
@@ -217,7 +224,7 @@ static const struct en_clk_desc en7581_base_clks[] = {
 		.id = EN7523_CLK_EMI,
 		.name = "emi",
 
-		.base_reg = REG_EMI_CLK_DIV_SEL,
+		.base_reg = REG_EMI_CLK_DIV_SEL2,
 		.base_bits = 2,
 		.base_shift = 8,
 		.base_values = emi7581_base,
@@ -231,7 +238,7 @@ static const struct en_clk_desc en7581_base_clks[] = {
 		.id = EN7523_CLK_BUS,
 		.name = "bus",
 
-		.base_reg = REG_BUS_CLK_DIV_SEL,
+		.base_reg = REG_BUS_CLK_DIV_SEL2,
 		.base_bits = 1,
 		.base_shift = 8,
 		.base_values = bus_base,
@@ -245,13 +252,13 @@ static const struct en_clk_desc en7581_base_clks[] = {
 		.id = EN7523_CLK_SLIC,
 		.name = "slic",
 
-		.base_reg = REG_SPI_CLK_FREQ_SEL,
+		.base_reg = REG_SPI_CLK_FREQ_SEL2,
 		.base_bits = 1,
 		.base_shift = 0,
 		.base_values = slic_base,
 		.n_base_values = ARRAY_SIZE(slic_base),
 
-		.div_reg = REG_SPI_CLK_DIV_SEL,
+		.div_reg = REG_SPI_CLK_DIV_SEL2,
 		.div_bits = 5,
 		.div_shift = 24,
 		.div_val0 = 20,
@@ -260,7 +267,7 @@ static const struct en_clk_desc en7581_base_clks[] = {
 		.id = EN7523_CLK_SPI,
 		.name = "spi",
 
-		.base_reg = REG_SPI_CLK_DIV_SEL,
+		.base_reg = REG_SPI_CLK_DIV_SEL2,
 
 		.base_value = 400000000,
 
@@ -272,7 +279,7 @@ static const struct en_clk_desc en7581_base_clks[] = {
 		.id = EN7523_CLK_NPU,
 		.name = "npu",
 
-		.base_reg = REG_NPU_CLK_DIV_SEL,
+		.base_reg = REG_NPU_CLK_DIV_SEL2,
 		.base_bits = 2,
 		.base_shift = 8,
 		.base_values = npu7581_base,
-- 
2.45.2

