Return-Path: <SRS0=7qdu=IQ=linuxfoundation.org=gregkh@kernel.org>
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH 4/5] clk: tegra: no need to check return value of debugfs_create functions
Date: Tue, 29 May 2018 18:08:03 +0200
Message-Id: <20180529160804.1982-4-gregkh@linuxfoundation.org>
In-Reply-To: <20180529160804.1982-1-gregkh@linuxfoundation.org>
References: <20180529160804.1982-1-gregkh@linuxfoundation.org>
List-ID: <linux-clk.vger.kernel.org>

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

The return value of these functions were never checked in the end
anyway, so it is obvious this does not change any functionality :)

Cc: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/clk/tegra/clk-dfll.c | 42 ++++++++++--------------------------
 1 file changed, 11 insertions(+), 31 deletions(-)

diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
index 0a7deee74eea..48ee43734e05 100644
--- a/drivers/clk/tegra/clk-dfll.c
+++ b/drivers/clk/tegra/clk-dfll.c
@@ -1196,42 +1196,24 @@ static const struct file_operations attr_registers_fops = {
 	.release	= single_release,
 };
 
-static int dfll_debug_init(struct tegra_dfll *td)
+static void dfll_debug_init(struct tegra_dfll *td)
 {
-	int ret;
+	struct dentry *root;
 
 	if (!td || (td->mode == DFLL_UNINITIALIZED))
-		return 0;
-
-	td->debugfs_dir = debugfs_create_dir("tegra_dfll_fcpu", NULL);
-	if (!td->debugfs_dir)
-		return -ENOMEM;
-
-	ret = -ENOMEM;
-
-	if (!debugfs_create_file("enable", S_IRUGO | S_IWUSR,
-				 td->debugfs_dir, td, &enable_fops))
-		goto err_out;
-
-	if (!debugfs_create_file("lock", S_IRUGO,
-				 td->debugfs_dir, td, &lock_fops))
-		goto err_out;
+		return;
 
-	if (!debugfs_create_file("rate", S_IRUGO,
-				 td->debugfs_dir, td, &rate_fops))
-		goto err_out;
+	root = debugfs_create_dir("tegra_dfll_fcpu", NULL);
+	td->debugfs_dir = root;
 
-	if (!debugfs_create_file("registers", S_IRUGO,
-				 td->debugfs_dir, td, &attr_registers_fops))
-		goto err_out;
-
-	return 0;
-
-err_out:
-	debugfs_remove_recursive(td->debugfs_dir);
-	return ret;
+	debugfs_create_file("enable", S_IRUGO | S_IWUSR, root, td, &enable_fops);
+	debugfs_create_file("lock", S_IRUGO, root, td, &lock_fops);
+	debugfs_create_file("rate", S_IRUGO, root, td, &rate_fops);
+	debugfs_create_file("registers", S_IRUGO, root, td, &attr_registers_fops);
 }
 
+#else
+static void inline dfll_debug_init(struct tegra_dfll *td) { }
 #endif /* CONFIG_DEBUG_FS */
 
 /*
@@ -1715,9 +1697,7 @@ int tegra_dfll_register(struct platform_device *pdev,
 		return ret;
 	}
 
-#ifdef CONFIG_DEBUG_FS
 	dfll_debug_init(td);
-#endif
 
 	return 0;
 }
-- 
2.17.0
