Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94392382379;
	Fri, 20 Mar 2026 15:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774019939; cv=none; b=MBLY9ugAN5mYfCEnx0nbWYpoxi9zSjRGXHGCN7QtASB+27QQYoXwPnrLivAhpjxf43e7vNegQKXubs6cfheqEr0hxACnHFLxzFDK/RanCU3FUY7Yy2eytOpxMfNJbT1z/vjJoDzgQ/H08Wbt/k/PHRcqACmv5VBjwB9/l0bAIiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774019939; c=relaxed/simple;
	bh=xHmhQ8dRD2dEcRUqB7fOfr+94wpA4YRxC+E13Alo6RI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Pg5xp7iLsW4cXn3MDFaMR9TkUsXZ5gWZ8C2/cGDV2jpq6SsCHb9oXrPLtWQ6tIa9ut5kT3PEOLDaXuv3DFgvXTJQOq+blm1BWQ0ZyqV5FUamYB0Aqwot2HyKMLxzwxd4YqhcblbmkMiicj2gETYGPNWZyk/8IQrgPCD91IaWhlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L4pdjy7k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L4pdjy7k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9A0FC4CEF7;
	Fri, 20 Mar 2026 15:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774019939;
	bh=xHmhQ8dRD2dEcRUqB7fOfr+94wpA4YRxC+E13Alo6RI=;
	h=From:To:Cc:Subject:Date:From;
	b=L4pdjy7kU+nEWfitkhWYS7mfJNZRQICELhUgT91XlRwOw7Hr07wXxx3m/Jw+Ij0Uu
	 UxSRTn1c5RysVZm9wELETz+hiJQmM2DPs9ZQDqhgsCjBtFCU3Z+5XVZWeHmDtrvub1
	 qpR9YMrFxakuyH2F+d+CQrGmxuCvFeTM+c5/F5YW5ZLzvKmO3bsIItwlV7075l6P44
	 2HOf2ngJMGx3xlkBhBOxJqrSGQsCi2gz1KqWemcvWBqCs9FAqfLlyH5nefnL+dTFEq
	 s+/GLzdtIHGkgCKApyWjIerH5Fu3iRI4+d/WCG3Ut9NCf/aw6qPQt7js5msnDHb8t5
	 DMc1TJPLDEGxw==
From: Arnd Bergmann <arnd@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Scott Wood <scottwood@freescale.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Kees Cook <kees@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] clk: qoriq: avoid formwat string warning
Date: Fri, 20 Mar 2026 16:18:49 +0100
Message-Id: <20260320151854.3465248-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

clang-22 warns about the use of non-variadic format arguments passed into
snprintf():

drivers/clk/clk-qoriq.c:925:39: error: diagnostic behavior may be improved by adding the
      'format(printf, 7, 8)' attribute to the declaration of 'create_mux_common' [-Werror,-Wmissing-format-attribute]
  910 | static struct clk * __init create_mux_common(struct clockgen *cg,
      | __attribute__((format(printf, 7, 8)))
  911 |                                              struct mux_hwclock *hwc,
  912 |                                              const struct clk_ops *ops,
  913 |                                              unsigned long min_rate,
  914 |                                              unsigned long max_rate,
  915 |                                              unsigned long pct80_rate,
  916 |                                              const char *fmt, int idx)
  917 | {
  918 |         struct clk_init_data init = {};
  919 |         struct clk *clk;
  920 |         const struct clockgen_pll_div *div;
  921 |         const char *parent_names[NUM_MUX_PARENTS];
  922 |         char name[32];
  923 |         int i, j;
  924 |
  925 |         snprintf(name, sizeof(name), fmt, idx);
      |                                              ^
drivers/clk/clk-qoriq.c:910:28: note: 'create_mux_common' declared here
  910 | static struct clk * __init create_mux_common(struct clockgen *cg,

Rework this to pass the 'int idx' as a varargs argument, allowing the
format string to be verified at the caller location.

Fixes: 0dfc86b3173f ("clk: qoriq: Move chip-specific knowledge into driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/clk/clk-qoriq.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk-qoriq.c b/drivers/clk/clk-qoriq.c
index f05631e55310..2524c5c0eb46 100644
--- a/drivers/clk/clk-qoriq.c
+++ b/drivers/clk/clk-qoriq.c
@@ -907,13 +907,11 @@ static const struct clockgen_pll_div *get_pll_div(struct clockgen *cg,
 	return &cg->pll[pll].div[div];
 }
 
-static struct clk * __init create_mux_common(struct clockgen *cg,
-					     struct mux_hwclock *hwc,
-					     const struct clk_ops *ops,
-					     unsigned long min_rate,
-					     unsigned long max_rate,
-					     unsigned long pct80_rate,
-					     const char *fmt, int idx)
+static struct clk * __init __printf(7, 8)
+create_mux_common(struct clockgen *cg, struct mux_hwclock *hwc,
+		  const struct clk_ops *ops, unsigned long min_rate,
+		  unsigned long max_rate, unsigned long pct80_rate,
+		  const char *fmt, ...)
 {
 	struct clk_init_data init = {};
 	struct clk *clk;
@@ -921,8 +919,11 @@ static struct clk * __init create_mux_common(struct clockgen *cg,
 	const char *parent_names[NUM_MUX_PARENTS];
 	char name[32];
 	int i, j;
+	va_list args;
 
-	snprintf(name, sizeof(name), fmt, idx);
+	va_start(args, fmt);
+	vsnprintf(name, sizeof(name), fmt, args);
+	va_end(args);
 
 	for (i = 0, j = 0; i < NUM_MUX_PARENTS; i++) {
 		unsigned long rate;
-- 
2.39.5

