Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464C3208B4;
	Fri, 26 Jan 2024 18:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706293766; cv=none; b=qn+p6VEuoihQjMdSceXz1PuLBtoXHdubBpBzrnnxFjOF61vdAnKWY3wD3nB0V9PW0Au1DMsOMbqGf7/I5jBjs6kaClo+PkIiwHyiLZJRmBB28EczthL+kjfcjKX3qJVFj6aezWXuHFFw3569dJAInHX8HsY1hoH4RRgMjLuv6BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706293766; c=relaxed/simple;
	bh=1tPW8GrHlWUsQEkwO2MnvdVEo7+MHF/Flt6K9BKancg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GoG3lL/QhuW37EFpYCXHI9cu7OxGgoKA4QyQE+temX5FvY/E87wFM12SaQwQHBZXsMlruuiZS7uROFKLECID4NJUUawXgEXOFVzaeVJ4Q+vluPCrWp1PMZ+5QqFiWpprWhhrAPYlapgEi60O6mjM6k1/RkWW6ZOg6/ODxzLWZNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=J7sErgsD; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="J7sErgsD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706293762;
	bh=1tPW8GrHlWUsQEkwO2MnvdVEo7+MHF/Flt6K9BKancg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J7sErgsDAG0h0yxrGrUdIzhEq+mOEVIXb4RQ8p7cV19r8NpajMJ5cNc6PRizL2lMf
	 BiKPhxZtcot2NyPkjvHAjgye3rEDmDvUstdvCgEOEwg9sz3D4bocZoQpAMKjqzpevi
	 QEEw1+eU+uMsN+oLj2XQXSs6ND+MXyEe8z724BamplVByXguv/f2xWieBkXzLFfufz
	 /l3rKkctdUpCzCB/x3cp63rXlh8bMvtna+qBW5TNVzvq25Bxyeq3DC9YVmodtJ8wGo
	 YzauI3uQMu0MXgV65LaPt+oliZ1SY9deRHYcz9c+w+LfoSjrZ0iPWj3TZgWUl6JUyH
	 3LZKICTzTnZSQ==
Received: from jupiter.universe (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 18DA43782080;
	Fri, 26 Jan 2024 18:29:22 +0000 (UTC)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 992A4482AC5; Fri, 26 Jan 2024 19:29:21 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: Elaine Zhang <zhangqing@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	huangtao@rock-chips.com,
	andy.yan@rock-chips.com,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	kernel@collabora.com
Subject: [PATCH v8 4/7] clk: rockchip: rk3588: fix pclk_vo0grf and pclk_vo1grf
Date: Fri, 26 Jan 2024 19:18:25 +0100
Message-ID: <20240126182919.48402-5-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126182919.48402-1-sebastian.reichel@collabora.com>
References: <20240126182919.48402-1-sebastian.reichel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently pclk_vo1grf is not exposed, but it should be referenced
from the vo1_grf syscon, which needs it enabled. That syscon is
required for HDMI RX and TX functionality among other things.

Apart from that pclk_vo0grf and pclk_vo1grf are both linked gates
and need the VO's hclk enabled in addition to their parent clock.

No Fixes tag has been added, since the logic requiring these clocks
is not yet upstream anyways.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/clk/rockchip/clk-rk3588.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-rk3588.c
index 0b60ae78f9d8..26330d655159 100644
--- a/drivers/clk/rockchip/clk-rk3588.c
+++ b/drivers/clk/rockchip/clk-rk3588.c
@@ -1851,8 +1851,6 @@ static struct rockchip_clk_branch rk3588_clk_branches[] __initdata = {
 			RK3588_CLKGATE_CON(56), 0, GFLAGS),
 	GATE(PCLK_TRNG0, "pclk_trng0", "pclk_vo0_root", 0,
 			RK3588_CLKGATE_CON(56), 1, GFLAGS),
-	GATE(PCLK_VO0GRF, "pclk_vo0grf", "pclk_vo0_root", CLK_IGNORE_UNUSED,
-			RK3588_CLKGATE_CON(55), 10, GFLAGS),
 	COMPOSITE(CLK_I2S4_8CH_TX_SRC, "clk_i2s4_8ch_tx_src", gpll_aupll_p, 0,
 			RK3588_CLKSEL_CON(118), 5, 1, MFLAGS, 0, 5, DFLAGS,
 			RK3588_CLKGATE_CON(56), 11, GFLAGS),
@@ -1998,8 +1996,6 @@ static struct rockchip_clk_branch rk3588_clk_branches[] __initdata = {
 			RK3588_CLKGATE_CON(60), 9, GFLAGS),
 	GATE(PCLK_TRNG1, "pclk_trng1", "pclk_vo1_root", 0,
 			RK3588_CLKGATE_CON(60), 10, GFLAGS),
-	GATE(0, "pclk_vo1grf", "pclk_vo1_root", CLK_IGNORE_UNUSED,
-			RK3588_CLKGATE_CON(59), 12, GFLAGS),
 	GATE(PCLK_S_EDP0, "pclk_s_edp0", "pclk_vo1_s_root", 0,
 			RK3588_CLKGATE_CON(59), 14, GFLAGS),
 	GATE(PCLK_S_EDP1, "pclk_s_edp1", "pclk_vo1_s_root", 0,
@@ -2447,12 +2443,14 @@ static struct rockchip_clk_branch rk3588_clk_branches[] __initdata = {
 	GATE_LINK(HCLK_RKVDEC1_PRE, "hclk_rkvdec1_pre", "hclk_rkvdec1_root", "hclk_vdpu_root", 0, RK3588_CLKGATE_CON(41), 4, GFLAGS),
 	GATE_LINK(ACLK_RKVDEC1_PRE, "aclk_rkvdec1_pre", "aclk_rkvdec1_root", "aclk_vdpu_root", 0, RK3588_CLKGATE_CON(41), 5, GFLAGS),
 	GATE_LINK(ACLK_HDCP0_PRE, "aclk_hdcp0_pre", "aclk_vo0_root", "aclk_vop_low_root", 0, RK3588_CLKGATE_CON(55), 9, GFLAGS),
-	GATE_LINK(HCLK_VO0, "hclk_vo0", "hclk_vo0_root", "hclk_vop_root", 0, RK3588_CLKGATE_CON(55), 5, GFLAGS),
+	GATE_LINK(HCLK_VO0, "hclk_vo0", "hclk_vo0_root", "hclk_vop_root", RK3588_LINKED_CLK, RK3588_CLKGATE_CON(55), 5, GFLAGS),
 	GATE_LINK(ACLK_HDCP1_PRE, "aclk_hdcp1_pre", "aclk_hdcp1_root", "aclk_vo1usb_top_root", 0, RK3588_CLKGATE_CON(59), 6, GFLAGS),
-	GATE_LINK(HCLK_VO1, "hclk_vo1", "hclk_vo1_root", "hclk_vo1usb_top_root", 0, RK3588_CLKGATE_CON(59), 9, GFLAGS),
+	GATE_LINK(HCLK_VO1, "hclk_vo1", "hclk_vo1_root", "hclk_vo1usb_top_root", RK3588_LINKED_CLK, RK3588_CLKGATE_CON(59), 9, GFLAGS),
 	GATE_LINK(ACLK_AV1_PRE, "aclk_av1_pre", "aclk_av1_root", "aclk_vdpu_root", 0, RK3588_CLKGATE_CON(68), 1, GFLAGS),
 	GATE_LINK(PCLK_AV1_PRE, "pclk_av1_pre", "pclk_av1_root", "hclk_vdpu_root", 0, RK3588_CLKGATE_CON(68), 4, GFLAGS),
 	GATE_LINK(HCLK_SDIO_PRE, "hclk_sdio_pre", "hclk_sdio_root", "hclk_nvm", 0, RK3588_CLKGATE_CON(75), 1, GFLAGS),
+	GATE_LINK(PCLK_VO0GRF, "pclk_vo0grf", "pclk_vo0_root", "hclk_vo0", CLK_IGNORE_UNUSED, RK3588_CLKGATE_CON(55), 10, GFLAGS),
+	GATE_LINK(PCLK_VO1GRF, "pclk_vo1grf", "pclk_vo1_root", "hclk_vo1", CLK_IGNORE_UNUSED, RK3588_CLKGATE_CON(59), 12, GFLAGS),
 };
 
 static void __init rk3588_clk_init(struct device_node *np)
-- 
2.43.0

