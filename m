Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Gabriel Fernandez <gabriel.fernandez@st.com>
Subject: [PATCH 5/9] clk: st: Remove impossible check for of_clk_get_parent_count() < 0
Date: Mon, 22 Feb 2016 12:54:43 -0800
Message-Id: <1456174487-28397-6-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1456174487-28397-1-git-send-email-sboyd@codeaurora.org>
References: <1456174487-28397-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The checks for < 0 are impossible now that
of_clk_get_parent_count() returns an unsigned int. Simplify the
code and update the types.

Cc: Gabriel Fernandez <gabriel.fernandez@st.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/st/clk-flexgen.c | 4 ++--
 drivers/clk/st/clkgen-mux.c  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/st/clk-flexgen.c b/drivers/clk/st/clk-flexgen.c
index 24d99594c0b3..627267c7ec5c 100644
--- a/drivers/clk/st/clk-flexgen.c
+++ b/drivers/clk/st/clk-flexgen.c
@@ -244,10 +244,10 @@ static const char ** __init flexgen_get_parents(struct device_node *np,
 						       int *num_parents)
 {
 	const char **parents;
-	int nparents;
+	unsigned int nparents;
 
 	nparents = of_clk_get_parent_count(np);
-	if (WARN_ON(nparents <= 0))
+	if (WARN_ON(!nparents))
 		return NULL;
 
 	parents = kcalloc(nparents, sizeof(const char *), GFP_KERNEL);
diff --git a/drivers/clk/st/clkgen-mux.c b/drivers/clk/st/clkgen-mux.c
index 0d9a74b66ea3..b1e10ffe7a44 100644
--- a/drivers/clk/st/clkgen-mux.c
+++ b/drivers/clk/st/clkgen-mux.c
@@ -26,10 +26,10 @@ static const char ** __init clkgen_mux_get_parents(struct device_node *np,
 						       int *num_parents)
 {
 	const char **parents;
-	int nparents;
+	unsigned int nparents;
 
 	nparents = of_clk_get_parent_count(np);
-	if (WARN_ON(nparents <= 0))
+	if (WARN_ON(!nparents))
 		return ERR_PTR(-EINVAL);
 
 	parents = kcalloc(nparents, sizeof(const char *), GFP_KERNEL);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
