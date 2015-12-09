Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from regular2.263xmail.com ([211.157.152.4]:37300 "EHLO
	regular2.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753516AbbLIJEm (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 9 Dec 2015 04:04:42 -0500
Received: from regular1.263xmail.com (unknown [192.168.165.182])
	by regular2.263xmail.com (Postfix) with ESMTP id F3B4E18EBF6
	for <linux-clk@vger.kernel.org>; Wed,  9 Dec 2015 17:04:38 +0800 (CST)
From: Jeffy Chen <jeffy.chen@rock-chips.com>
To: heiko@sntech.de, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Jeffy Chen <jeffy.chen@rock-chips.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
Subject: [PATCH v1 5/8] clk: rockchip: allow more than 2 parents for cpuclk
Date: Wed,  9 Dec 2015 17:04:10 +0800
Message-Id: <1449651853-1667-6-git-send-email-jeffy.chen@rock-chips.com>
In-Reply-To: <1449651853-1667-1-git-send-email-jeffy.chen@rock-chips.com>
References: <1449651853-1667-1-git-send-email-jeffy.chen@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

RK3228's armclk has 3 parents, so allow cpuclk to have
more than 2 parents.

Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
---

 drivers/clk/rockchip/clk-cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/rockchip/clk-cpu.c b/drivers/clk/rockchip/clk-cpu.c
index 330870a..d07374f 100644
--- a/drivers/clk/rockchip/clk-cpu.c
+++ b/drivers/clk/rockchip/clk-cpu.c
@@ -242,8 +242,8 @@ struct clk *rockchip_clk_register_cpuclk(const char *name,
 	struct clk *clk, *cclk;
 	int ret;
 
-	if (num_parents != 2) {
-		pr_err("%s: needs two parent clocks\n", __func__);
+	if (num_parents < 2) {
+		pr_err("%s: needs at least two parent clocks\n", __func__);
 		return ERR_PTR(-EINVAL);
 	}
 
-- 
2.1.4


