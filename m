Return-Path: <SRS0=7qdu=IQ=linuxfoundation.org=gregkh@kernel.org>
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 5/5] clk: remove clk_debugfs_add_file()
Date: Tue, 29 May 2018 18:08:04 +0200
Message-Id: <20180529160804.1982-5-gregkh@linuxfoundation.org>
In-Reply-To: <20180529160804.1982-1-gregkh@linuxfoundation.org>
References: <20180529160804.1982-1-gregkh@linuxfoundation.org>
List-ID: <linux-clk.vger.kernel.org>

No one was using this api call, so remove it.  If it is ever needed in
the future, a "raw" debugfs call can be used.

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/clk/clk.c            | 13 -------------
 include/linux/clk-provider.h |  5 -----
 2 files changed, 18 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index ef701ce44439..59207cd6138a 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2669,19 +2669,6 @@ static void clk_debug_unregister(struct clk_core *core)
 	mutex_unlock(&clk_debug_lock);
 }
 
-struct dentry *clk_debugfs_add_file(struct clk_hw *hw, char *name, umode_t mode,
-				void *data, const struct file_operations *fops)
-{
-	struct dentry *d = NULL;
-
-	if (hw->core->dentry)
-		d = debugfs_create_file(name, mode, hw->core->dentry, data,
-					fops);
-
-	return d;
-}
-EXPORT_SYMBOL_GPL(clk_debugfs_add_file);
-
 /**
  * clk_debug_init - lazily populate the debugfs clk directory
  *
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 210a890008f9..00e55d4d07f1 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -996,10 +996,5 @@ static inline void clk_writel(u32 val, u32 __iomem *reg)
 
 #endif	/* platform dependent I/O accessors */
 
-#ifdef CONFIG_DEBUG_FS
-struct dentry *clk_debugfs_add_file(struct clk_hw *hw, char *name, umode_t mode,
-				void *data, const struct file_operations *fops);
-#endif
-
 #endif /* CONFIG_COMMON_CLK */
 #endif /* CLK_PROVIDER_H */
-- 
2.17.0
