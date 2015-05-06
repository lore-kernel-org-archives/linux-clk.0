Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Alex Elder <elder@linaro.org>,
	Tim Kryger <tim.kryger@linaro.org>
Subject: [PATCH 04/19] clk: bcm/kona: Silence sparse warnings
Date: Wed,  6 May 2015 00:39:41 -0700
Message-Id: <1430897996-11597-5-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org>
References: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

drivers/clk/bcm/clk-kona.c:1243:16: warning: odd constant _Bool cast (ffffffffffffffea becomes 1)

Cc: Alex Elder <elder@linaro.org>
Cc: Tim Kryger <tim.kryger@linaro.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/bcm/clk-kona.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/bcm/clk-kona.c b/drivers/clk/bcm/clk-kona.c
index a0ef4f75d457..79a98506c433 100644
--- a/drivers/clk/bcm/clk-kona.c
+++ b/drivers/clk/bcm/clk-kona.c
@@ -1240,7 +1240,7 @@ static bool __kona_clk_init(struct kona_clk *bcm_clk)
 	default:
 		BUG();
 	}
-	return -EINVAL;
+	return false;
 }
 
 /* Set a CCU and all its clocks into their desired initial state */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
