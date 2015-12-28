Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/16] clk: make sure parent is not NULL in clk_fetch_parent_index()
Date: Mon, 28 Dec 2015 19:10:27 +0900
Message-Id: <1451297429-21689-15-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1451297429-21689-1-git-send-email-yamada.masahiro@socionext.com>
References: <1451297429-21689-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

If parent is given with NULL, clk_fetch_parent_index() could return
a positive index value.

Currently, parent is checked by the callers of this function, but
it would be safer to do it in this function.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Fix a bug.  Return -EINVAL when parent _is_ NULL.

 drivers/clk/clk.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index efd093a..151cbe8 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1066,6 +1066,9 @@ static int clk_fetch_parent_index(struct clk_core *core,
 {
 	int i;
 
+	if (!parent)
+		return -EINVAL;
+
 	/*
 	 * find index of new parent clock using cached parent ptrs,
 	 * or if not yet cached, use string name comparison and cache
-- 
1.9.1

