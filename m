Return-Path: <vz@mleia.com>
From: Vladimir Zapolskiy <vz@mleia.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org
Subject: [PATCH 1/3] clk: don't fetch parent index for non multi-parent clocks
Date: Thu,  7 Jan 2016 05:16:06 +0200
Message-Id: <1452136568-478-2-git-send-email-vz@mleia.com>
In-Reply-To: <1452136568-478-1-git-send-email-vz@mleia.com>
References: <1452136568-478-1-git-send-email-vz@mleia.com>
List-ID: <linux-clk.vger.kernel.org>

If clk_set_parent(clk, parent) is called when 'clk' is a root clock or
'clk' has a single parent different from 'parent' clock, a vain
attempt to find 'parent' index is still performed, which causes
either an allocation of 0-byte size lookup array or never used
sizeof(struct clk*) array.

Like in case of invalid clk_set_parent() of a multi-parent clock,
return -EINVAL in the cases described above without trying to allocate
a lookup table.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 drivers/clk/clk.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index b4db67a..129ac0a 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1794,8 +1794,13 @@ static int clk_core_set_parent(struct clk_core *core, struct clk_core *parent)
 	if (core->parent == parent)
 		goto out;
 
+	if (core->num_parents <= 1) {
+		ret = -EINVAL;
+		goto out;
+	}
+
 	/* verify ops for for multi-parent clks */
-	if ((core->num_parents > 1) && (!core->ops->set_parent)) {
+	if (!core->ops->set_parent) {
 		ret = -ENOSYS;
 		goto out;
 	}
-- 
2.1.4
