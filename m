Return-Path: <maxime.coquelin@st.com>
From: Maxime Coquelin <maxime.coquelin@st.com>
To: Mike Turquette <mturquette@linaro.org>,
        Stephen Boyd
	<sboyd@codeaurora.org>, <linux-clk@vger.kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <kernel@stlinux.com>, <maxime.coquelin@st.com>
Subject: [PATCH] clk: Move debug_node field under DEBUG_FS flag in struct clk_core
Date: Wed, 10 Jun 2015 13:28:27 +0200
Message-ID: <1433935707-3621-1-git-send-email-maxime.coquelin@st.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

The debug_node field is only used when DEBUG_FS config is selected,
so declare it only if DEBUG_FS is selected.

Signed-off-by: Maxime Coquelin <maxime.coquelin@st.com>
---
 drivers/clk/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 459ce9d..afbaa73 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -68,11 +68,11 @@ struct clk_core {
 	int			phase;
 	struct hlist_head	children;
 	struct hlist_node	child_node;
-	struct hlist_node	debug_node;
 	struct hlist_head	clks;
 	unsigned int		notifier_count;
 #ifdef CONFIG_DEBUG_FS
 	struct dentry		*dentry;
+	struct hlist_node	debug_node;
 #endif
 	struct kref		ref;
 };
-- 
1.9.1
