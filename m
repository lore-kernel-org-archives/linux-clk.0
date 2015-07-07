Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-bl2on0053.outbound.protection.outlook.com ([65.55.169.53]:61478
	"EHLO na01-bl2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753939AbbGGEF2 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Tue, 7 Jul 2015 00:05:28 -0400
From: <dinguyen@opensource.altera.com>
To: <sboyd@codeaurora.org>, <mturquette@linaro.org>
CC: <dinh.linux@gmail.com>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	Dinh Nguyen <dinguyen@opensource.altera.com>,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCHv2 4/6] clk: st: make use of of_clk_parent_fill helper function
Date: Mon, 6 Jul 2015 22:59:04 -0500
Message-ID: <1436241546-16731-5-git-send-email-dinguyen@opensource.altera.com>
In-Reply-To: <1436241546-16731-1-git-send-email-dinguyen@opensource.altera.com>
References: <1436241546-16731-1-git-send-email-dinguyen@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Dinh Nguyen <dinguyen@opensource.altera.com>

Use of_clk_parent_fill to fill in the parent clock names' array.

Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
Tested-by Gabriel Fernandez <gabriel.fernandez@st.com>
Cc: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/clk/st/clk-flexgen.c |    6 ++----
 drivers/clk/st/clkgen-mux.c  |    7 ++-----
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/st/clk-flexgen.c b/drivers/clk/st/clk-flexgen.c
index 657ca14..ed0696c 100644
--- a/drivers/clk/st/clk-flexgen.c
+++ b/drivers/clk/st/clk-flexgen.c
@@ -243,7 +243,7 @@ static const char ** __init flexgen_get_parents(struct device_node *np,
 						       int *num_parents)
 {
 	const char **parents;
-	int nparents, i;
+	int nparents;
 
 	nparents = of_clk_get_parent_count(np);
 	if (WARN_ON(nparents <= 0))
@@ -253,10 +253,8 @@ static const char ** __init flexgen_get_parents(struct device_node *np,
 	if (!parents)
 		return NULL;
 
-	for (i = 0; i < nparents; i++)
-		parents[i] = of_clk_get_parent_name(np, i);
+	*num_parents = of_clk_parent_fill(np, parents, nparents);
 
-	*num_parents = nparents;
 	return parents;
 }
 
diff --git a/drivers/clk/st/clkgen-mux.c b/drivers/clk/st/clkgen-mux.c
index 4fbe6e0..b83654a 100644
--- a/drivers/clk/st/clkgen-mux.c
+++ b/drivers/clk/st/clkgen-mux.c
@@ -24,7 +24,7 @@ static const char ** __init clkgen_mux_get_parents(struct device_node *np,
 						       int *num_parents)
 {
 	const char **parents;
-	int nparents, i;
+	int nparents;
 
 	nparents = of_clk_get_parent_count(np);
 	if (WARN_ON(nparents <= 0))
@@ -34,10 +34,7 @@ static const char ** __init clkgen_mux_get_parents(struct device_node *np,
 	if (!parents)
 		return ERR_PTR(-ENOMEM);
 
-	for (i = 0; i < nparents; i++)
-		parents[i] = of_clk_get_parent_name(np, i);
-
-	*num_parents = nparents;
+	*num_parents = of_clk_parent_fill(np, parents, nparents);
 	return parents;
 }
 
-- 
1.7.9.5

