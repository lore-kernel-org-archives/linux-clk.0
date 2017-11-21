Return-Path: <Chunyan.Zhang@spreadtrum.com>
From: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
To: Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette
	<mturquette@baylibre.com>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Cai Li
	<cai.li@spreadtrum.com>,
        Orson Zhai <orson.zhai@spreadtrum.com>,
        Chunyan
 Zhang <zhang.lyra@gmail.com>
Subject: [PATCH V2] clk: fix a panic error caused by accessing NULL pointer
Date: Tue, 21 Nov 2017 17:24:38 +0800
Message-ID: <20171121092438.19316-1-chunyan.zhang@spreadtrum.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

From: Cai Li <cai.li@spreadtrum.com>

In some cases the clock parent would be set NULL when doing re-parent,
it will cause a NULL pointer accessing if clk_set trace event is
enabled.

This patch sets the parent as "none" if the input parameter is NULL.

Fixes: dfc202ead312 (clk: Add tracepoints for hardware operations)
Signed-off-by: Cai Li <cai.li@spreadtrum.com>
Signed-off-by: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
---
Changes from v1:
Revised the tracepoint code instead of clk driver.
---
 include/trace/events/clk.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/trace/events/clk.h b/include/trace/events/clk.h
index 7586072..2cd4493 100644
--- a/include/trace/events/clk.h
+++ b/include/trace/events/clk.h
@@ -134,12 +134,12 @@ DECLARE_EVENT_CLASS(clk_parent,
 
 	TP_STRUCT__entry(
 		__string(        name,           core->name                )
-		__string(        pname,          parent->name              )
+		__string(        pname, parent ? parent->name : "none"     )
 	),
 
 	TP_fast_assign(
 		__assign_str(name, core->name);
-		__assign_str(pname, parent->name);
+		__assign_str(pname, parent ? parent->name : "none");
 	),
 
 	TP_printk("%s %s", __get_str(name), __get_str(pname))
-- 
2.7.4
