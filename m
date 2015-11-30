Return-Path: <yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-clk@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 12/16] clk: avoid circular clock topology
Date: Mon, 30 Nov 2015 16:34:49 +0900
Message-Id: <1448868893-4575-13-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1448868893-4575-1-git-send-email-yamada.masahiro@socionext.com>
References: <1448868893-4575-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

Currently, clk_register() never checks a circular parent looping,
but clock providers could register such an insane clock topology.
For example, "clk_a" could have "clk_b" as a parent, and vice versa.
In this case, clk_core_reparent() creates a circular parent list
and __clk_recalc_accuracies() calls itself recursively forever.

The core infrastructure should be kind enough to bail out, showing
an appropriate error message in such a case.  This helps to easily
find a bug in clock providers.  (uh, I made such a silly mistake
when I was implementing my clock providers first.  I was upset
because the kernel did not respond, without any error message.)

This commit adds a new helper function, __clk_is_ancestor().  It
returns true if the second argument is a possible ancestor of the
first one.  If a clock core is a possible ancestor of itself, it
would make a loop when it were registered.  That should be detected
as an error.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/clk/clk.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index ef6fedb..a1d046c 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2235,6 +2235,38 @@ static inline void clk_debug_unregister(struct clk_core *core)
 #endif
 
 /**
+ * __clk_is_ancestor - check if a clk_core is a possible ancestor of another
+ * @core: clock core
+ * @ancestor: ancestor clock core
+ *
+ * Returns true if there is a possibility that @ancestor can be an ancestor
+ * of @core, false otherwise.
+ *
+ * This function can be used against @core or @ancestor that has not been
+ * registered yet.
+ */
+static bool __clk_is_ancestor(struct clk_core *core, struct clk_core *ancestor)
+{
+	struct clk_core *parent;
+	int i;
+
+	for (i = 0; i < core->num_parents; i++) {
+		parent = clk_core_get_parent_by_index(core, i);
+		/*
+		 * If ancestor has not been added to clk_{root,orphan}_list
+		 * yet, clk_core_lookup() cannot find it.  If parent is NULL,
+		 * compare the name strings, too.
+		 */
+		if ((parent && (parent == ancestor ||
+				__clk_is_ancestor(parent, ancestor))) ||
+		    (!parent && !strcmp(core->parent_names[i], ancestor->name)))
+			return true;
+	}
+
+	return false;
+}
+
+/**
  * __clk_core_init - initialize the data structures in a struct clk_core
  * @core:	clk_core being initialized
  *
@@ -2297,6 +2329,14 @@ static int __clk_core_init(struct clk_core *core)
 				"%s: invalid NULL in %s's .parent_names\n",
 				__func__, core->name);
 
+	/* If core is an ancestor of itself, it would make a loop. */
+	if (__clk_is_ancestor(core, core)) {
+		pr_err("%s: %s would create circular parent\n", __func__,
+		       core->name);
+		ret = -EINVAL;
+		goto out;
+	}
+
 	core->parent = __clk_init_parent(core);
 
 	/*
-- 
1.9.1
