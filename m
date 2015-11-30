Return-Path: <yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-clk@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 14/16] clk: make sure parent is not NULL in clk_fetch_parent_index()
Date: Mon, 30 Nov 2015 16:34:51 +0900
Message-Id: <1448868893-4575-15-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1448868893-4575-1-git-send-email-yamada.masahiro@socionext.com>
References: <1448868893-4575-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

If parent is given with NULL, clk_fetch_parent_index() could return
a positive index value.

Currently, parent is checked by the callers of this function, but
it would be safer to do it in this function.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/clk/clk.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index e3c6559..50b9b3d 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1066,6 +1066,9 @@ static int clk_fetch_parent_index(struct clk_core *core,
 {
 	int i;
 
+	if (parent)
+		return -EINVAL;
+
 	/*
 	 * find index of new parent clock using cached parent ptrs,
 	 * or if not yet cached, use string name comparison and cache
-- 
1.9.1
