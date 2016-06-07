Return-Path: <lee.jones@linaro.org>
Return-Path: <lee.jones@linaro.org>
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: kernel@stlinux.com,
	maxime.coquelin@st.com,
	patrice.chotard@st.com,
	mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-clk@vger.kernel.org,
	Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 1/1] clk: Remove unused variable
Date: Tue,  7 Jun 2016 13:25:02 +0100
Message-Id: <20160607122502.32168-1-lee.jones@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/clk/clk.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index d584004..8a815a1 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1501,7 +1501,6 @@ static int clk_core_set_rate_nolock(struct clk_core *core,
 {
 	struct clk_core *top, *fail_clk;
 	unsigned long rate = req_rate;
-	int ret = 0;
 
 	if (!core)
 		return 0;
@@ -1532,7 +1531,7 @@ static int clk_core_set_rate_nolock(struct clk_core *core,
 
 	core->req_rate = req_rate;
 
-	return ret;
+	return 0;
 }
 
 /**
-- 
2.8.3
