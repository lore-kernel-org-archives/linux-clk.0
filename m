Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>,
	Quentin Schulz <quentin.schulz@free-electrons.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v5 01/10] clk: fix incorrect usage of ENOSYS
Date: Fri,  1 Dec 2017 22:51:51 +0100
Message-Id: <20171201215200.23523-2-jbrunet@baylibre.com>
In-Reply-To: <20171201215200.23523-1-jbrunet@baylibre.com>
References: <20171201215200.23523-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

ENOSYS is special and should only be used for incorrect syscall number.
It does not seem to be the case here.

Reported by checkpatch.pl while working on clock protection.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Tested-by: Quentin Schulz <quentin.schulz@free-electrons.com>
Tested-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Acked-by: Michael Turquette <mturquette@baylibre.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 647d056df88c..5fe9e63b15c6 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1888,7 +1888,7 @@ static int clk_core_set_parent(struct clk_core *core, struct clk_core *parent)
 
 	/* verify ops for for multi-parent clks */
 	if ((core->num_parents > 1) && (!core->ops->set_parent)) {
-		ret = -ENOSYS;
+		ret = -EPERM;
 		goto out;
 	}
 
-- 
2.14.3
