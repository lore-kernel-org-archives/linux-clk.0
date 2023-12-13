Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="V3zNcfAc"
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [IPv6:2a00:1098:ed:100::25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA858E4;
	Wed, 13 Dec 2023 10:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702493477;
	bh=1tPW8GrHlWUsQEkwO2MnvdVEo7+MHF/Flt6K9BKancg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V3zNcfAc+AfL9Xk6uU6vu6E80lRQJaaKwqe7vA6o/BkIbG2aUx+cS8aWbHv9HRYgH
	 DWCkEtKZ3WYdOCHF3IhhgNwEf8Oe2X/Hti1/kI5fqecII1db7Wgs4ts7e2H5W5fBER
	 i9bew0gZ7gZ6Y/ZQPDzbiS+EBKE4qmU9M/g325viC3wlnRDD1qbrcuEsw+b/CyJ/yv
	 8GvOY/LZDblSc+NR4QqXN18hlXBWJk4X7photXFiymfhh5jNzvhRF8c1jlcDMzdKzV
	 zKLm+2iYoyrSt++rSJ1XTNZuphDgC/8O5lV7M+mZce9Nj6upSaSJNGigWIqLuGYwPJ
	 0u2sGDOekNEdQ==
Received: from jupiter.universe (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C3408378149E;
	Wed, 13 Dec 2023 18:51:16 +0000 (UTC)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 3A4DC480106; Wed, 13 Dec 2023 19:51:16 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Elaine Zhang <zhangqing@rock-chips.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: Kever Yang <kever.yang@rock-chips.com>,
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
Subject: [PATCH v7 4/7] clk: rockchip: rk3588: fix pclk_vo0grf and pclk_vo1grf
Date: Wed, 13 Dec 2023 19:46:49 +0100
Message-ID: <20231213185114.47565-5-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231213185114.47565-1-sebastian.reichel@collabora.com>
References: <20231213185114.47565-1-sebastian.reichel@collabora.com>
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

