Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Keita Kobayashi <keita.kobayashi.ym@renesas.com>,
	Gaku Inami <gaku.inami.xw@bp.renesas.com>,
	Dien Pham <dien.pham.ry@rvc.renesas.com>,
	Takeshi Kihara <takeshi.kihara.df@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] clk: renesas: r8a7795: Add IIC-DVFS clock
Date: Wed, 25 Jan 2017 12:19:33 +0100
Message-Id: <1485343174-16973-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1485343174-16973-1-git-send-email-geert+renesas@glider.be>
References: <1485343174-16973-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

From: Keita Kobayashi <keita.kobayashi.ym@renesas.com>

This patch adds DVFS clock for R8A7795 SoC.

Signed-off-by: Keita Kobayashi <keita.kobayashi.ym@renesas.com>
Signed-off-by: Gaku Inami <gaku.inami.xw@bp.renesas.com>
Signed-off-by: Dien Pham <dien.pham.ry@rvc.renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a7795-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index 50698a7d90745447..bfffdb00df972547 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -221,6 +221,7 @@ enum clk_ids {
 	DEF_MOD("can-if0",		 916,	R8A7795_CLK_S3D4),
 	DEF_MOD("i2c6",			 918,	R8A7795_CLK_S3D2),
 	DEF_MOD("i2c5",			 919,	R8A7795_CLK_S3D2),
+	DEF_MOD("i2c-dvfs",		 926,	R8A7795_CLK_CP),
 	DEF_MOD("i2c4",			 927,	R8A7795_CLK_S3D2),
 	DEF_MOD("i2c3",			 928,	R8A7795_CLK_S3D2),
 	DEF_MOD("i2c2",			 929,	R8A7795_CLK_S3D2),
-- 
1.9.1
