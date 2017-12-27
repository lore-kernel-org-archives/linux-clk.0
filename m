Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:46733 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751278AbdL0EZb (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 26 Dec 2017 23:25:31 -0500
Date: Wed, 27 Dec 2017 12:25:13 +0800
From: kbuild test robot <fengguang.wu@intel.com>
To: Sergej Sawazki <sergej@taudac.com>
Cc: kbuild-all@01.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Stephen Boyd <sboyd@codeaurora.org>
Subject: [RFC PATCH clk] clk: si5351: _si5351_clkout_reset_pll() can be static
Message-ID: <20171227042513.GA56372@ivb42>
References: <201712271259.pq3B6Kw4%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <201712271259.pq3B6Kw4%fengguang.wu@intel.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


Fixes: b26ff127c52c ("clk: si5351: Apply PLL soft reset before enabling the outputs")
Signed-off-by: Fengguang Wu <fengguang.wu@intel.com>
---
 clk-si5351.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
index 79b770f..fedaeb1 100644
--- a/drivers/clk/clk-si5351.c
+++ b/drivers/clk/clk-si5351.c
@@ -903,7 +903,7 @@ static int _si5351_clkout_set_disable_state(
 	return 0;
 }
 
-void _si5351_clkout_reset_pll(struct si5351_driver_data *drvdata, int num)
+static void _si5351_clkout_reset_pll(struct si5351_driver_data *drvdata, int num)
 {
 	u8 val = si5351_reg_read(drvdata, SI5351_CLK0_CTRL + num);
 
