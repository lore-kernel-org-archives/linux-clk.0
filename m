Return-Path: <dan.carpenter@oracle.com>
Date: Sat, 12 Dec 2015 15:43:46 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
        Jens Kuske <jenskuske@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [patch] clk: sunxi: signedness bug in sun8i_h3_bus_gates_init()
Message-ID: <20151212124346.GC21408@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-clk.vger.kernel.org>

"index" needs to be signed for the error handling to work.

Fixes: ab6e23a4e388 ('clk: sunxi: Add H3 clocks support')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/clk/sunxi/clk-sun8i-bus-gates.c b/drivers/clk/sunxi/clk-sun8i-bus-gates.c
index 7ab60c5..b8c7753 100644
--- a/drivers/clk/sunxi/clk-sun8i-bus-gates.c
+++ b/drivers/clk/sunxi/clk-sun8i-bus-gates.c
@@ -40,7 +40,7 @@ static void __init sun8i_h3_bus_gates_init(struct device_node *node)
 	const __be32 *p;
 	int number, i;
 	u8 clk_bit;
-	u32 index;
+	int index;
 
 	reg = of_io_request_and_map(node, 0, of_node_full_name(node));
 	if (IS_ERR(reg))
