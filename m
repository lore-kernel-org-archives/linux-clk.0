Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3776A1F76D0;
	Wed,  8 Jan 2025 11:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736336832; cv=none; b=JZlvOJjCTeaYBA5k/5PhqrvmfGfkEj5C07aKnbSGMnPFlT+qsWmjhnJ0Tv8f6xZtKPAsuxcYKbKhSYwSHBT0p1YVzPg4aNYavKfPpQpqvWKOLgQ4+irOZdHkOsOAKJZvvmhHu0X9Q/KdFcl+gLjNHMqVllpKY26zyYMKCCjco2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736336832; c=relaxed/simple;
	bh=9v/ISjCq33hp5ht7KRd8VRiloInl0ViWAHs3kELKneI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V11r17fieuIFY3NrMqhMqgR/4D8rstcdv6KKMqPWE5fW841vtb6ZjhR2jXjp3TSUQCG77li7GxO1xR97fO/zAybPY9QvKp3cP9JwrOF+oZ9EerJcbkOyNCBowJh36eDaBr5TjP5ccp+YJH3ANV4EJGzUDGdfXPqKFss/F+iAmIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=bL2jhuTY; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="bL2jhuTY"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 236DF25C17;
	Wed,  8 Jan 2025 12:47:08 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3IACoKRnpENS; Wed,  8 Jan 2025 12:47:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1736336827; bh=9v/ISjCq33hp5ht7KRd8VRiloInl0ViWAHs3kELKneI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bL2jhuTYpp/OI664vmwSZcAl3l3VMgUtx9AMgX9Hs8/RFqpWNW2VnNVWr2KGPe/Sf
	 79dnIxCz9W4m80Z2HDK6eOfT4GMEToLyf8RXLq/cglFGbDuDrEm1qEQc68Dmy/gBha
	 2OdQaEi4qKbSw01XZWv8C0SSa5p8Ydj7evCs4Fqk4ruh3C3tAUIOJtrv9Jh5vU6FU2
	 BMV3Pn+F4pBKhuvgOlzLc3a8qHJO9XYrvn+Ir6NtBq0I2rIvjwRgC7Rmjgo2xClXN/
	 dfCefKQxY4mxRuj99IEFKGO6O9tMMG1Gd30wOf9eVRwebJlZcrNq/+4TthLu9MMMDJ
	 tAsRsoY5cZNpw==
From: Yao Zi <ziyao@disroot.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH v2 2/5] clk: rockchip: Add PLL flag ROCKCHIP_PLL_FIXED_MODE
Date: Wed,  8 Jan 2025 11:46:03 +0000
Message-ID: <20250108114605.1960-4-ziyao@disroot.org>
In-Reply-To: <20250108114605.1960-2-ziyao@disroot.org>
References: <20250108114605.1960-2-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RK3528 comes with a new PLL variant: its "PPLL", which mainly generates
clocks for the PCIe controller, operates in normal mode only. Let's
describe it with flag ROCKCHIP_PLL_FIXED_MODE and handle it in code.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 drivers/clk/rockchip/clk-pll.c | 10 ++++++----
 drivers/clk/rockchip/clk.h     |  2 ++
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pll.c
index fe76756e592e..2c2abb3b4210 100644
--- a/drivers/clk/rockchip/clk-pll.c
+++ b/drivers/clk/rockchip/clk-pll.c
@@ -204,10 +204,12 @@ static int rockchip_rk3036_pll_set_params(struct rockchip_clk_pll *pll,
 	rockchip_rk3036_pll_get_params(pll, &cur);
 	cur.rate = 0;
 
-	cur_parent = pll_mux_ops->get_parent(&pll_mux->hw);
-	if (cur_parent == PLL_MODE_NORM) {
-		pll_mux_ops->set_parent(&pll_mux->hw, PLL_MODE_SLOW);
-		rate_change_remuxed = 1;
+	if (!(pll->flags & ROCKCHIP_PLL_FIXED_MODE)) {
+		cur_parent = pll_mux_ops->get_parent(&pll_mux->hw);
+		if (cur_parent == PLL_MODE_NORM) {
+			pll_mux_ops->set_parent(&pll_mux->hw, PLL_MODE_SLOW);
+			rate_change_remuxed = 1;
+		}
 	}
 
 	/* update pll values */
diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
index f1957e1c1178..6efe0495dd37 100644
--- a/drivers/clk/rockchip/clk.h
+++ b/drivers/clk/rockchip/clk.h
@@ -444,6 +444,7 @@ struct rockchip_pll_rate_table {
  * Flags:
  * ROCKCHIP_PLL_SYNC_RATE - check rate parameters to match against the
  *	rate_table parameters and ajust them if necessary.
+ * ROCKCHIP_PLL_FIXED_MODE - the pll operates in normal mode only
  */
 struct rockchip_pll_clock {
 	unsigned int		id;
@@ -461,6 +462,7 @@ struct rockchip_pll_clock {
 };
 
 #define ROCKCHIP_PLL_SYNC_RATE		BIT(0)
+#define ROCKCHIP_PLL_FIXED_MODE		BIT(1)
 
 #define PLL(_type, _id, _name, _pnames, _flags, _con, _mode, _mshift,	\
 		_lshift, _pflags, _rtable)				\
-- 
2.47.1

