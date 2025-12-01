Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262903016EE;
	Mon,  1 Dec 2025 09:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764582166; cv=none; b=Tw2nqf6eP3LJp3BRYFeT7V4fobAFtVnDLtnef4hZCoIoD6AZx2RDx1ew06IzK7nNmplAybV/ZI1aM+CG0JN/zHLd6CiIGvDYViII9DOo9ptZare3k0Wn+ycdkKIIxeeX1S0S/Ot6f91A6LzxolLmUEWA0tDrnwzoAVQJIEBDgdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764582166; c=relaxed/simple;
	bh=UhWBOJ9KPeX8sO3fbaymzO3NlceLeGf9gFWjSQPe5NY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jwWhY1De8hswKTnsfA196MpZJdkI++k5YqQEIT5m1VIVe+wSBxYKuyKv9qU8Z3u264cP/vozt94mJHR3obsnFjrkq+Ps6TdidfP4gnE9krIfSh8IrSN27yPptcl8uSLAFRoLH60r5lnD2rRlor2Ulg6WiMjycrxTpwemsQGwt2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00DDFC116D0;
	Mon,  1 Dec 2025 09:42:43 +0000 (UTC)
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
Subject: [PATCH 3/3] clk: Annotate #else and #endif
Date: Mon,  1 Dec 2025 10:42:28 +0100
Message-ID: <6ddf998b90ec9f4ac1f2467f6053f1464d8c0e79.1764582057.git.geert@linux-m68k.org>
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

Annotate the #else and #endif keywords in large #ifdef/#else/#endif
sections, to improve readability.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 include/linux/clk.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/clk.h b/include/linux/clk.h
index 9e5291f37c50c78a..efb91604d3f667e2 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -245,7 +245,7 @@ int clk_save_context(void);
  */
 void clk_restore_context(void);
 
-#else
+#else /* !CONFIG_COMMON_CLK */
 
 static inline int clk_notifier_register(struct clk *clk,
 					struct notifier_block *nb)
@@ -317,7 +317,7 @@ static inline int clk_save_context(void)
 
 static inline void clk_restore_context(void) {}
 
-#endif
+#endif /* !CONFIG_COMMON_CLK */
 
 #ifdef CONFIG_HAVE_CLK_PREPARE
 /**
@@ -361,7 +361,7 @@ void clk_bulk_unprepare(int num_clks, const struct clk_bulk_data *clks);
  * to be right.
  */
 bool clk_is_enabled_when_prepared(struct clk *clk);
-#else
+#else /* !CONFIG_HAVE_CLK_PREPARE */
 static inline int clk_prepare(struct clk *clk)
 {
 	might_sleep();
@@ -390,7 +390,7 @@ static inline bool clk_is_enabled_when_prepared(struct clk *clk)
 {
 	return false;
 }
-#endif
+#endif /* !CONFIG_HAVE_CLK_PREPARE */
 
 #ifdef CONFIG_HAVE_CLK
 /**
@@ -1136,7 +1136,7 @@ static inline struct clk *clk_get_sys(const char *dev_id, const char *con_id)
 	return NULL;
 }
 
-#endif
+#endif /* !CONFIG_HAVE_CLK */
 
 /* clk_prepare_enable helps cases using clk_enable in non-atomic context. */
 static inline int clk_prepare_enable(struct clk *clk)
-- 
2.43.0

