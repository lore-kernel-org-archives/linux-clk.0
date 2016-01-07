Return-Path: <vz@mleia.com>
From: Vladimir Zapolskiy <vz@mleia.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org
Subject: [PATCH 2/3] clk: simplify array allocation of clock parents for lookup
Date: Thu,  7 Jan 2016 05:16:07 +0200
Message-Id: <1452136568-478-3-git-send-email-vz@mleia.com>
In-Reply-To: <1452136568-478-1-git-send-email-vz@mleia.com>
References: <1452136568-478-1-git-send-email-vz@mleia.com>
List-ID: <linux-clk.vger.kernel.org>

The change intends to centralize allocation of clock's clk_core
parents array on clock registration, originally is done from multiple
places:
* __clk_init()
* __clk_init_parent()
* clk_fetch_parent_index()

The original approach historically was needed, but at the moment
all assumptions supporting it are wrong:

1) GFP_KERNEL heap is available at the time of a clock registration,
   for example it is used to dynamically allocate struct clk_core,
   clock name and clock parent names, if allocation fails, return
   -ENOMEM as usual instead of repeating attempts to allocate the
   array in future,

2) due to the layering scheme clk_core parents can not be defined
   statically by the drivers, instead the drivers provide string
   arrays of clock parent names and clock parents for a lookup array
   are always obtained from that data.

To ensure that there is no need to check for allocated status of the
parent lookup table and/or allocate the table from other places within
the common clock framework, don't register a clock, if there is no
enough memory.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 drivers/clk/clk.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 129ac0a..2fb0dae 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2371,27 +2371,25 @@ static int __clk_init(struct device *dev, struct clk *clk_user)
 
 	/*
 	 * Allocate an array of struct clk *'s to avoid unnecessary string
-	 * look-ups of clk's possible parents.  This can fail for clocks passed
-	 * in to clk_init during early boot; thus any access to core->parents[]
-	 * must always check for a NULL pointer and try to populate it if
-	 * necessary.
-	 *
-	 * If core->parents is not NULL we skip this entire block.  This allows
-	 * for clock drivers to statically initialize core->parents.
+	 * look-ups of clk's possible parents.
 	 */
-	if (core->num_parents > 1 && !core->parents) {
+	if (core->num_parents > 1) {
 		core->parents = kcalloc(core->num_parents, sizeof(struct clk *),
 					GFP_KERNEL);
+		if (!core->parents) {
+			ret = -ENOMEM;
+			goto out;
+		}
+
 		/*
 		 * clk_core_lookup returns NULL for parents that have not been
 		 * clk_init'd; thus any access to clk->parents[] must check
 		 * for a NULL pointer.  We can always perform lazy lookups for
 		 * missing parents later on.
 		 */
-		if (core->parents)
-			for (i = 0; i < core->num_parents; i++)
-				core->parents[i] =
-					clk_core_lookup(core->parent_names[i]);
+		for (i = 0; i < core->num_parents; i++)
+			core->parents[i] =
+				clk_core_lookup(core->parent_names[i]);
 	}
 
 	core->parent = __clk_init_parent(core);
-- 
2.1.4
