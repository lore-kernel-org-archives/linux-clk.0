Return-Path: <shawn.lin@rock-chips.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [RFC PATCH 3/3] Documentation: clk: Add clk phase callback comments
Date: Fri, 26 Feb 2016 13:09:06 +0800
Message-Id: <1456463346-3707-1-git-send-email-shawn.lin@rock-chips.com>
In-Reply-To: <1456463290-3581-1-git-send-email-shawn.lin@rock-chips.com>
References: <1456463290-3581-1-git-send-email-shawn.lin@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

This patch add get_phase, set_phase, round_phase and
determine_phase into the description of clk_ops.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 Documentation/clk.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/clk.txt b/Documentation/clk.txt
index 5c4bc4d..7f192f2 100644
--- a/Documentation/clk.txt
+++ b/Documentation/clk.txt
@@ -84,6 +84,11 @@ the operations defined in clk.h:
 					    u8 index);
 		unsigned long	(*recalc_accuracy)(struct clk_hw *hw,
 						unsigned long parent_accuracy);
+		int		(*get_phase)(struct clk_hw *hw);
+		int		(*set_phase)(struct clk_hw *hw, int degrees);
+		long		(*round_phase)(struct clk_hw *hw, int degrees);
+		int		(*determine_phase)(struct clk_hw *hw,
+						   struct clk_phase_request *req);
 		void		(*init)(struct clk_hw *hw);
 		int		(*debug_init)(struct clk_hw *hw,
 					      struct dentry *dentry);
-- 
2.3.7
