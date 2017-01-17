Return-Path: <mylene.josserand@free-electrons.com>
From: =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@free-electrons.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	maxime.ripard@free-electrons.com,
	wens@csie.org,
	mturquette@baylibre.com,
	sboyd@codeaurora.org,
	mark.rutland@arm.com,
	robh+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-sunxi@googlegroups.com,
	thomas.petazzoni@free-electrons.com,
	mylene.josserand@free-electrons.com,
	alexandre.belloni@free-electrons.com
Subject: [PATCH v2 02/10] clk: ccu-sun8i-a33: Add CLK_SET_RATE_PARENT to ac-dig
Date: Tue, 17 Jan 2017 15:02:22 +0100
Message-Id: <20170117140230.23142-3-mylene.josserand@free-electrons.com>
In-Reply-To: <20170117140230.23142-1-mylene.josserand@free-electrons.com>
References: <20170117140230.23142-1-mylene.josserand@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

The audio DAI needs to set the clock rates of the ac-dig clock.
To make it possible, the parent PLL audio clock rates should
also be changed. This is possible via "CLK_SET_RATE_PARENT" flag.

Signed-off-by: Mylène Josserand <mylene.josserand@free-electrons.com>
---
 drivers/clk/sunxi-ng/ccu-sun8i-a33.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-a33.c b/drivers/clk/sunxi-ng/ccu-sun8i-a33.c
index 9bd1f78a0547..3cd4190ccd59 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-a33.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-a33.c
@@ -440,7 +440,7 @@ static SUNXI_CCU_M_WITH_GATE(ve_clk, "ve", "pll-ve",
 			     0x13c, 16, 3, BIT(31), CLK_SET_RATE_PARENT);
 
 static SUNXI_CCU_GATE(ac_dig_clk,	"ac-dig",	"pll-audio",
-		      0x140, BIT(31), 0);
+		      0x140, BIT(31), CLK_SET_RATE_PARENT);
 static SUNXI_CCU_GATE(ac_dig_4x_clk,	"ac-dig-4x",	"pll-audio-4x",
 		      0x140, BIT(30), 0);
 static SUNXI_CCU_GATE(avs_clk,		"avs",		"osc24M",
-- 
2.11.0
