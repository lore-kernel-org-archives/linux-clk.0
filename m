Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-pl0-f66.google.com ([209.85.160.66]:44402 "EHLO
        mail-pl0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752257AbdKXG4D (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 Nov 2017 01:56:03 -0500
From: Arvind Yadav <arvind.yadav.cs@gmail.com>
To: sboyd@codeaurora.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, ysato@users.sourceforge.jp, vz@mleia.com,
        slemieux.tyco@gmail.com, vireshk@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/6] clk: SPEAr: pr_err() strings should end with newlines
Date: Fri, 24 Nov 2017 12:25:30 +0530
Message-Id: <03a5ce213323863375e1fb3f85c0c3cc8c921a41.1511505932.git.arvind.yadav.cs@gmail.com>
In-Reply-To: <cover.1511505932.git.arvind.yadav.cs@gmail.com>
References: <cover.1511505932.git.arvind.yadav.cs@gmail.com>
In-Reply-To: <cover.1511505932.git.arvind.yadav.cs@gmail.com>
References: <cover.1511505932.git.arvind.yadav.cs@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

pr_err() messages should end with a new-line to avoid other messages
being concatenated.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/clk/spear/clk-frac-synth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/spear/clk-frac-synth.c b/drivers/clk/spear/clk-frac-synth.c
index 58d678b..cbdf43a 100644
--- a/drivers/clk/spear/clk-frac-synth.c
+++ b/drivers/clk/spear/clk-frac-synth.c
@@ -131,7 +131,7 @@ struct clk *clk_register_frac(const char *name, const char *parent_name,
 	struct clk *clk;
 
 	if (!name || !parent_name || !reg || !rtbl || !rtbl_cnt) {
-		pr_err("Invalid arguments passed");
+		pr_err("Invalid arguments passed\n");
 		return ERR_PTR(-EINVAL);
 	}
 
-- 
1.9.1

