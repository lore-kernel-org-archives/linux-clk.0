Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-clk@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andi Shyti <andi.shyti@samsung.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] Documentation: clk: update file names containing referenced structures
Date: Fri, 12 Aug 2016 14:41:25 +0200
Message-Id: <1471005685-505-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

From: Andi Shyti <andi.shyti@samsung.com>

Commit 'b09d6d991' removes include/linux/clk-private.h and
re-arranges the clock related structures contained in it in
different files. The documentation has not been updated
accordingly, thus it wasn't anymore consistent.

Place the structures referenced by Documentation/clk.txt in the
correct files and update their contents to the latest status.

Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
[geert: Fix path to clk.c, whitespace, more clk_core, ...]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Take over from Andi,
  - Correct path to clk.c,
  - Drop whitespace changes,
  - Replace clk by clk_core where appropriate,
  - Update to_clk_gate(),
  - Drop final reference to clk-private.h.
---
 Documentation/clk.txt | 42 ++++++++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/Documentation/clk.txt b/Documentation/clk.txt
index 5c4bc4d01d0c3293..22f026aa2f342024 100644
--- a/Documentation/clk.txt
+++ b/Documentation/clk.txt
@@ -31,24 +31,25 @@ serve as a convenient shorthand for the implementation of the
 hardware-specific bits for the hypothetical "foo" hardware.
 
 Tying the two halves of this interface together is struct clk_hw, which
-is defined in struct clk_foo and pointed to within struct clk.  This
+is defined in struct clk_foo and pointed to within struct clk_core.  This
 allows for easy navigation between the two discrete halves of the common
 clock interface.
 
 	Part 2 - common data structures and api
 
-Below is the common struct clk definition from
-include/linux/clk-private.h, modified for brevity:
+Below is the common struct clk_core definition from
+drivers/clk/clk.c, modified for brevity:
 
-	struct clk {
+	struct clk_core {
 		const char		*name;
 		const struct clk_ops	*ops;
 		struct clk_hw		*hw;
-		char			**parent_names;
-		struct clk		**parents;
-		struct clk		*parent;
-		struct hlist_head	children;
-		struct hlist_node	child_node;
+		struct module		*owner;
+		struct clk_core		*parent;
+		const char		**parent_names;
+		struct clk_core		**parents;
+		u8			num_parents;
+		u8			new_parent_index;
 		...
 	};
 
@@ -56,16 +57,19 @@ The members above make up the core of the clk tree topology.  The clk
 api itself defines several driver-facing functions which operate on
 struct clk.  That api is documented in include/linux/clk.h.
 
-Platforms and devices utilizing the common struct clk use the struct
-clk_ops pointer in struct clk to perform the hardware-specific parts of
-the operations defined in clk.h:
+Platforms and devices utilizing the common struct clk_core use the struct
+clk_ops pointer in struct clk_core to perform the hardware-specific parts of
+the operations defined in clk-provider.h:
 
 	struct clk_ops {
 		int		(*prepare)(struct clk_hw *hw);
 		void		(*unprepare)(struct clk_hw *hw);
+		int		(*is_prepared)(struct clk_hw *hw);
+		void		(*unprepare_unused)(struct clk_hw *hw);
 		int		(*enable)(struct clk_hw *hw);
 		void		(*disable)(struct clk_hw *hw);
 		int		(*is_enabled)(struct clk_hw *hw);
+		void		(*disable_unused)(struct clk_hw *hw);
 		unsigned long	(*recalc_rate)(struct clk_hw *hw,
 						unsigned long parent_rate);
 		long		(*round_rate)(struct clk_hw *hw,
@@ -84,6 +88,8 @@ the operations defined in clk.h:
 					    u8 index);
 		unsigned long	(*recalc_accuracy)(struct clk_hw *hw,
 						unsigned long parent_accuracy);
+		int		(*get_phase)(struct clk_hw *hw);
+		int		(*set_phase)(struct clk_hw *hw, int degrees);
 		void		(*init)(struct clk_hw *hw);
 		int		(*debug_init)(struct clk_hw *hw,
 					      struct dentry *dentry);
@@ -91,7 +97,7 @@ the operations defined in clk.h:
 
 	Part 3 - hardware clk implementations
 
-The strength of the common struct clk comes from its .ops and .hw pointers
+The strength of the common struct clk_core comes from its .ops and .hw pointers
 which abstract the details of struct clk from the hardware-specific bits, and
 vice versa.  To illustrate consider the simple gateable clk implementation in
 drivers/clk/clk-gate.c:
@@ -107,7 +113,7 @@ struct clk_gate contains struct clk_hw hw as well as hardware-specific
 knowledge about which register and bit controls this clk's gating.
 Nothing about clock topology or accounting, such as enable_count or
 notifier_count, is needed here.  That is all handled by the common
-framework code and struct clk.
+framework code and struct clk_core.
 
 Let's walk through enabling this clk from driver code:
 
@@ -139,22 +145,18 @@ static void clk_gate_set_bit(struct clk_gate *gate)
 
 Note that to_clk_gate is defined as:
 
-#define to_clk_gate(_hw) container_of(_hw, struct clk_gate, clk)
+#define to_clk_gate(_hw) container_of(_hw, struct clk_gate, hw)
 
 This pattern of abstraction is used for every clock hardware
 representation.
 
 	Part 4 - supporting your own clk hardware
 
-When implementing support for a new type of clock it only necessary to
+When implementing support for a new type of clock it is only necessary to
 include the following header:
 
 #include <linux/clk-provider.h>
 
-include/linux/clk.h is included within that header and clk-private.h
-must never be included from the code which implements the operations for
-a clock.  More on that below in Part 5.
-
 To construct a clk hardware structure for your platform you must define
 the following:
 
-- 
1.9.1
