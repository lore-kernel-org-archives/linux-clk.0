Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 3/4] clk: Show symbolic clock flags in debugfs
Date: Wed,  3 Jan 2018 12:06:16 +0100
Message-Id: <1514977577-11854-4-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1514977577-11854-1-git-send-email-geert+renesas@glider.be>
References: <1514977577-11854-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

Currently the virtual "clk_flags" file in debugfs shows the numeric
value of the top-level framework flags for the specified clock.
Hence the user must manually interpret these values.

Moreover, on big-endian 64-bit systems, the wrong half of the value is
shown, due to the cast from "unsigned long *" to "u32 *".

Fix both issues by showing the symbolic flag names instead.
Any non-standard flags are shown as a hex number.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 drivers/clk/clk.c            | 54 ++++++++++++++++++++++++++++++++++++++++++--
 include/linux/clk-provider.h |  2 ++
 2 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 240b1d427fadab66..7cb5143c654cd78f 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2559,6 +2559,56 @@ static const struct file_operations clk_dump_fops = {
 	.release	= single_release,
 };
 
+static const struct {
+	unsigned long flag;
+	const char *name;
+} clk_flags[] = {
+	{ CLK_SET_RATE_GATE,		"CLK_SET_RATE_GATE",		},
+	{ CLK_SET_PARENT_GATE,		"CLK_SET_PARENT_GATE",		},
+	{ CLK_SET_RATE_PARENT,		"CLK_SET_RATE_PARENT",		},
+	{ CLK_IGNORE_UNUSED,		"CLK_IGNORE_UNUSED",		},
+	{ CLK_IS_BASIC,			"CLK_IS_BASIC",			},
+	{ CLK_GET_RATE_NOCACHE,		"CLK_GET_RATE_NOCACHE",		},
+	{ CLK_SET_RATE_NO_REPARENT,	"CLK_SET_RATE_NO_REPARENT",	},
+	{ CLK_GET_ACCURACY_NOCACHE,	"CLK_GET_ACCURACY_NOCACHE",	},
+	{ CLK_RECALC_NEW_RATES,		"CLK_RECALC_NEW_RATES",		},
+	{ CLK_SET_RATE_UNGATE,		"CLK_SET_RATE_UNGATE",		},
+	{ CLK_IS_CRITICAL,		"CLK_IS_CRITICAL",		},
+	{ CLK_OPS_PARENT_ENABLE,	"CLK_OPS_PARENT_ENABLE",	},
+};
+
+static int clk_flags_dump(struct seq_file *s, void *data)
+{
+	struct clk_core *core = s->private;
+	unsigned long flags = core->flags;
+	unsigned int i;
+
+	for (i = 0; flags && i < ARRAY_SIZE(clk_flags); i++) {
+		if (flags & clk_flags[i].flag) {
+			seq_printf(s, "%s\n", clk_flags[i].name);
+			flags &= ~clk_flags[i].flag;
+		}
+	}
+	if (flags) {
+		/* Unknown flags */
+		seq_printf(s, "0x%lx\n", flags);
+	}
+
+	return 0;
+}
+
+static int clk_flags_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, clk_flags_dump, inode->i_private);
+}
+
+static const struct file_operations clk_flags_fops = {
+	.open		= clk_flags_open,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+
 static int possible_parents_dump(struct seq_file *s, void *data)
 {
 	struct clk_core *core = s->private;
@@ -2615,8 +2665,8 @@ static int clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
 	if (!d)
 		goto err_out;
 
-	d = debugfs_create_x32("clk_flags", 0444, core->dentry,
-			(u32 *)&core->flags);
+	d = debugfs_create_file("clk_flags", 0444, core->dentry, core,
+				&clk_flags_fops);
 	if (!d)
 		goto err_out;
 
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 411db2423bd45818..73add58e7d666083 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -20,6 +20,8 @@
  * flags used across common struct clk.  these flags should only affect the
  * top-level framework.  custom flags for dealing with hardware specifics
  * belong in struct clk_foo
+ *
+ * Please update clk_flags[] in drivers/clk/clk.c when making changes here!
  */
 #define CLK_SET_RATE_GATE	BIT(0) /* must be gated across rate change */
 #define CLK_SET_PARENT_GATE	BIT(1) /* must be gated across re-parent */
-- 
2.7.4
