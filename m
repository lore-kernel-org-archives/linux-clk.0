Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D0A3016E3;
	Mon,  1 Dec 2025 09:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764582164; cv=none; b=W4o6U6VeAZl9NAZELLClBi8cGasJQH8pZJF9WzzmtkWOxNkmGVIcoZWpONElQLrPshGyz0hAmi1BOp6ganjdRaFM+u5jCHzt1C71V9hdW0uFjm4ZqfoJJrWG9v2dDqSscqlhv8I60ZX45Y7zVb0ZyD10pI9bLiRpu73FCxPwFDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764582164; c=relaxed/simple;
	bh=Rop73a0pQUcijlSb51lsm9IBZ0VCRG+QQKZ7fB5bcYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UuZtLUkMMtOk7TMqjn6fsDAv8R3/ypZJ/hM18GiJiqNOHPfPSr/KXPRwPNGfBa1B96KHvvkup1SQuqfxr9/bRbt68QKVRiPICqYfNjzoLySStwvjVdLgaGwgmrxruO8AMzuBS23zuSFY1nAwd5VlkyPhfNt8j3E5G8aRfdJbNp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9427DC113D0;
	Mon,  1 Dec 2025 09:42:41 +0000 (UTC)
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
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 2/3] clk: Merge prepare and unprepare sections
Date: Mon,  1 Dec 2025 10:42:27 +0100
Message-ID: <c6bf644391dc28803a0ac1e331f196fc2c3c36de.1764582057.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <8066e45dbdd9acca29c0f9b578922a091a5c31fd.1764582057.git.geert@linux-m68k.org>
References: <8066e45dbdd9acca29c0f9b578922a091a5c31fd.1764582057.git.geert@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

<linux/clk.h> contains two consecutive #ifdef/#else/#endif sections
that check for CONFIG_HAVE_CLK_PREPARE: one for prepare-related
functionality, and a second for unprepare-related functionality.
Reduce #ifdef clutter by merging them.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 include/linux/clk.h | 46 ++++++++++++++++++++++-----------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/include/linux/clk.h b/include/linux/clk.h
index 64ff118ffb1a1d7d..9e5291f37c50c78a 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -329,8 +329,21 @@ static inline void clk_restore_context(void) {}
  * Must not be called from within atomic context.
  */
 int clk_prepare(struct clk *clk);
+
+/**
+ * clk_unprepare - undo preparation of a clock source
+ * @clk: clock source
+ *
+ * This undoes a previously prepared clock.  The caller must balance
+ * the number of prepare and unprepare calls.
+ *
+ * Must not be called from within atomic context.
+ */
+void clk_unprepare(struct clk *clk);
+
 int __must_check clk_bulk_prepare(int num_clks,
 				  const struct clk_bulk_data *clks);
+void clk_bulk_unprepare(int num_clks, const struct clk_bulk_data *clks);
 
 /**
  * clk_is_enabled_when_prepared - indicate if preparing a clock also enables it.
@@ -355,41 +368,28 @@ static inline int clk_prepare(struct clk *clk)
 	return 0;
 }
 
-static inline int __must_check
-clk_bulk_prepare(int num_clks, const struct clk_bulk_data *clks)
+static inline void clk_unprepare(struct clk *clk)
 {
 	might_sleep();
-	return 0;
 }
 
-static inline bool clk_is_enabled_when_prepared(struct clk *clk)
-{
-	return false;
-}
-#endif
-
-/**
- * clk_unprepare - undo preparation of a clock source
- * @clk: clock source
- *
- * This undoes a previously prepared clock.  The caller must balance
- * the number of prepare and unprepare calls.
- *
- * Must not be called from within atomic context.
- */
-#ifdef CONFIG_HAVE_CLK_PREPARE
-void clk_unprepare(struct clk *clk);
-void clk_bulk_unprepare(int num_clks, const struct clk_bulk_data *clks);
-#else
-static inline void clk_unprepare(struct clk *clk)
+static inline int __must_check
+clk_bulk_prepare(int num_clks, const struct clk_bulk_data *clks)
 {
 	might_sleep();
+	return 0;
 }
+
 static inline void clk_bulk_unprepare(int num_clks,
 				      const struct clk_bulk_data *clks)
 {
 	might_sleep();
 }
+
+static inline bool clk_is_enabled_when_prepared(struct clk *clk)
+{
+	return false;
+}
 #endif
 
 #ifdef CONFIG_HAVE_CLK
-- 
2.43.0

