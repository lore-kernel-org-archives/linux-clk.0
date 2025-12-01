Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA838301485;
	Mon,  1 Dec 2025 09:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764582161; cv=none; b=DqAQqYgwWm6oIqWcAMAyetqm/4qgBNbPEMap4QYYQxoR++y0CuQXwjiY0HFs7GHEJUzUMJ0nFoCGSRg5DhXI51YXOw58sHak6zaDC6QXaM5x/M2adY2O5Udps3BMYI9/f7h+sOw87goGtoKuEkcl8WmVyEWzVrUX6r8t+fvOinQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764582161; c=relaxed/simple;
	bh=d1Owh/nhAJbky/+UEp3AAscgvEUBX35bI0tYlPAxnx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uUkPUHX4lypO+SmAMxD9BEEvTtV8TQCT1cpkmLAtcpII7QuUHc4oWsBzbH8cePlkbzcTmG6Wyg4/mF0bf+fb9ooOtz3QwqybW8Vh9zuwccHUKfO+Ycf6gWp7N/RiFUHHOcvuMJ9DvY7VWPtmvDIkCaR8B8Da5Kyn0Q7eWAaoS3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09E59C116D0;
	Mon,  1 Dec 2025 09:42:38 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Tero Kristo <t-kristo@ti.com>,
	Tony Lindgren <tony@atomide.com>,
	Keerthy <j-keerthy@ti.com>,
	Russ Dill <Russ.Dill@ti.com>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 1/3] clk: Move clk_{save,restore}_context() to COMMON_CLK section
Date: Mon,  1 Dec 2025 10:42:26 +0100
Message-ID: <8066e45dbdd9acca29c0f9b578922a091a5c31fd.1764582057.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764581744.git.geert@linux-m68k.org>
References: <cover.1764581744.git.geert@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clk_save_context() and clk_restore_context() helpers are only
implemented by the Common Clock Framework.  They are not available when
using legacy clock frameworks.  Dummy implementations are provided, but
only if no clock support is available at all.

Hence when CONFIG_HAVE_CLK=y, but CONFIG_COMMON_CLK is not enabled:

    m68k-linux-gnu-ld: drivers/net/phy/air_en8811h.o: in function `en8811h_resume':
    air_en8811h.c:(.text+0x83e): undefined reference to `clk_restore_context'
    m68k-linux-gnu-ld: drivers/net/phy/air_en8811h.o: in function `en8811h_suspend':
    air_en8811h.c:(.text+0x856): undefined reference to `clk_save_context'

Fix this by moving forward declarations and dummy implementions from the
HAVE_CLK to the COMMON_CLK section.

Fixes: 8b95d1ce3300c411 ("clk: Add functions to save/restore clock context en-masse")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202511301553.eaEz1nEW-lkp@intel.com/
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 include/linux/clk.h | 48 ++++++++++++++++++++++-----------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/include/linux/clk.h b/include/linux/clk.h
index b607482ca77e987b..64ff118ffb1a1d7d 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -228,6 +228,23 @@ int devm_clk_rate_exclusive_get(struct device *dev, struct clk *clk);
  */
 void clk_rate_exclusive_put(struct clk *clk);
 
+/**
+ * clk_save_context - save clock context for poweroff
+ *
+ * Saves the context of the clock register for powerstates in which the
+ * contents of the registers will be lost. Occurs deep within the suspend
+ * code so locking is not necessary.
+ */
+int clk_save_context(void);
+
+/**
+ * clk_restore_context - restore clock context after poweroff
+ *
+ * This occurs with all clocks enabled. Occurs deep within the resume code
+ * so locking is not necessary.
+ */
+void clk_restore_context(void);
+
 #else
 
 static inline int clk_notifier_register(struct clk *clk,
@@ -293,6 +310,13 @@ static inline int devm_clk_rate_exclusive_get(struct device *dev, struct clk *cl
 
 static inline void clk_rate_exclusive_put(struct clk *clk) {}
 
+static inline int clk_save_context(void)
+{
+	return 0;
+}
+
+static inline void clk_restore_context(void) {}
+
 #endif
 
 #ifdef CONFIG_HAVE_CLK_PREPARE
@@ -933,23 +957,6 @@ struct clk *clk_get_parent(struct clk *clk);
  */
 struct clk *clk_get_sys(const char *dev_id, const char *con_id);
 
-/**
- * clk_save_context - save clock context for poweroff
- *
- * Saves the context of the clock register for powerstates in which the
- * contents of the registers will be lost. Occurs deep within the suspend
- * code so locking is not necessary.
- */
-int clk_save_context(void);
-
-/**
- * clk_restore_context - restore clock context after poweroff
- *
- * This occurs with all clocks enabled. Occurs deep within the resume code
- * so locking is not necessary.
- */
-void clk_restore_context(void);
-
 #else /* !CONFIG_HAVE_CLK */
 
 static inline struct clk *clk_get(struct device *dev, const char *id)
@@ -1129,13 +1136,6 @@ static inline struct clk *clk_get_sys(const char *dev_id, const char *con_id)
 	return NULL;
 }
 
-static inline int clk_save_context(void)
-{
-	return 0;
-}
-
-static inline void clk_restore_context(void) {}
-
 #endif
 
 /* clk_prepare_enable helps cases using clk_enable in non-atomic context. */
-- 
2.43.0

