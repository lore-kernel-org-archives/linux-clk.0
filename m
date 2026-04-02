Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6135A34C808
	for <linux-clk@vger.kernel.org>; Thu,  2 Apr 2026 03:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775099097; cv=none; b=hRUeXwg+EA1djkKPvRt8YEJ0zu22k5Wh1Wt+jBx0KB8A6uDA0RidTAT4L2aBDz2bO7hsmkeQZ9phiKmTS2k4t1sP0jnLbRlK9Zc3OctvFwt8ZwvBu4AkiUVdDaKIsKcIWxPCUbo8AMfGt3gvW9E4U0BjiekannAo6XckpY8pz3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775099097; c=relaxed/simple;
	bh=9IIzc+eywz6mbGH5F5bMbvFGszQOAFr0MEDFHAbMnUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ldM7+xydWOtYWxhNpWddZUd2tgH4lp0F/kkjLzXWK2gM467UW8ZV4tBIlW15TRwJVAdPtJaCfWJdVF555v0F9R1CvoG7RghNAeimvS7VaUJYrf082xdz6pnTBEmma38NbW8sH97pv4CFFfZagzAFDxfsT1nDJwQxyCfJSErs2EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UR0MBCwx; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UR0MBCwx"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35da2d35eccso214043a91.0
        for <linux-clk@vger.kernel.org>; Wed, 01 Apr 2026 20:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775099094; x=1775703894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nmCC7f15JgRcCuYZBiyTal7ZYGjILnrKEbih3hVx7XU=;
        b=UR0MBCwxlGWdKrWpaP4ODocLpxMeu9f3tBy4t/1Z0Zunuhg2AuTKPzo0GrvMSdHV4L
         i1au/VMByUZfZ+xiX8HTVB4gwj9l61Sd2Y1b4fQd+jKolSgI8yanZlCNLzIEF+fD2iCs
         sa/gkHeiEAbteAZMJ0SWDkyJKvgg0CWgBDN+1aDLjxsWUMK8Og5CljPc2ZCG9nSwYsvD
         fcf2dq2M5bA+VYlg23EyNpGq+wfzXNMLMUVdZGG2tn3YvbLFJGdIltC+oEGH+IoqaQj8
         oO1WxViJ6XQWSFJTGPbMWgB7RO0oYKOXuBjr+ralAAA8BWZi/ZZlMVku5L+XPP84YNLF
         ikvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775099094; x=1775703894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nmCC7f15JgRcCuYZBiyTal7ZYGjILnrKEbih3hVx7XU=;
        b=r/mnZWUtffjXjHMGMcXRjAHtly+vt1Oo8Pb5KLRcx+/fNXmS3EJj0gSOXG1sCIsPGK
         2UOrx8TKbQU6myg6MFMylEbH7vNrfbTHm0Ai1rHQBvYTWzZpkkSs/MnrjFOSfngFrvxl
         TDKMDnb+/PClcRt6hA55+j06r/yQhIOi8VWK8FbJXgEaxGH2AwWYq4SIVZzSHUtt+Fro
         ILReQrD8BjVdV174dXxkawITonAP/kwNcQ4uk+44ztTt0sAu+77O4BHtRonBUBPheXUU
         NAWZFOQYwq9+zIiNfiY7W89iwuYFNbQytQSPuRtcVTD17qSiJLN6nZF4NZDlgEcGwefh
         TdNQ==
X-Gm-Message-State: AOJu0YzDpCpycgsMfKIxdjrfEDXc68JunD9CssQr22hhYnW8DI0L/0re
	m2NBLz8mgJ/IgadXCd9LVKx2Efvi91z+bCDYCkkMP9eyw6AkJI17y2tq2fUzQBaC
X-Gm-Gg: ATEYQzy2DztevlqOUlHQ0P0iNsq92L60a0eKzU0qXRz5Az5KGtWOEYlhYyv4xf6+H/9
	oGTMci5lNdglH2NneULKjQLcPegDbQksgZAtjiGJf3JkyMgL5/dJiyqTdqkwCotXfj/Wt74jZGV
	ufv8y+f2MwoD1Zpuj6pyrhHK69K3pMKFaqy/lTn28X7AwJg3w556sz0agh/KCE80W0NKpr8ODQb
	BwgL+ecL77OZHuJcM5wP/awozHVkOPqf5Dc2m1kvxcQyOVZ36WDAQUkTm/bGcTSR/j5DtOPItTX
	0SH8E+Osqarj1wTKuhOZpdztk2OKaNrDII9Ll/k2MApTXjw+KZrUFpbXPakP1c1zfmZLAQMBL4P
	qhHCGJd/7ZhaA3QljruZGOnTxazoV2pNy0M3UXx8pcjmS8l0471vgcWPo1wRFZWQD/i8t/uTg09
	dU7anG9bn1RKnAZ1gwIsn6+P3jhr54x6WrEu8wYtWHr/S1MO6qqusFvZA=
X-Received: by 2002:a17:90b:4b90:b0:359:f77f:8cff with SMTP id 98e67ed59e1d1-35dc6f4cd92mr5416790a91.19.1775099094428;
        Wed, 01 Apr 2026 20:04:54 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe9379f3sm6395873a91.9.2026.04.01.20.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 20:04:53 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG SOC CLOCK DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH 3/3] clk: samsung: pll: use kzalloc_flex
Date: Wed,  1 Apr 2026 20:04:32 -0700
Message-ID: <20260402030432.101066-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402030432.101066-1-rosenp@gmail.com>
References: <20260402030432.101066-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify allocation by using a flexible array member to combine
allocations and remove a kfree.

Use __counted_by for extra runtime analysis. Assign after allocation as
required by __counted_by.

Since rate_table is now a flexible array member, NULL checks don't work.
So use the counting variable to check allocation.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/samsung/clk-pll.c | 56 ++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 30 deletions(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index fdb84bcec912..e74552846ba3 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -28,7 +28,7 @@ struct samsung_clk_pll {
 	unsigned short		lock_offs;
 	enum samsung_pll_type	type;
 	unsigned int		rate_count;
-	const struct samsung_pll_rate_table *rate_table;
+	struct samsung_pll_rate_table rate_table[] __counted_by(rate_count);
 };
 
 #define to_clk_pll(_hw) container_of(_hw, struct samsung_clk_pll, hw)
@@ -1593,35 +1593,32 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 {
 	struct samsung_clk_pll *pll;
 	struct clk_init_data init;
-	int ret, len;
+	unsigned int len = 0;
+	int ret;
 
-	pll = kzalloc_obj(*pll);
+	if (pll_clk->rate_table) {
+		/* find count of rates in rate_table */
+		while (pll_clk->rate_table[len].rate != 0)
+			len++;
+	}
+
+	pll = kzalloc_flex(*pll, rate_table, len);
 	if (!pll) {
 		pr_err("%s: could not allocate pll clk %s\n",
 			__func__, pll_clk->name);
 		return;
 	}
 
+	pll->rate_count = len;
+	if (len)
+		memcpy(pll->rate_table, pll_clk->rate_table,
+		       len * sizeof(*pll->rate_table));
+
 	init.name = pll_clk->name;
 	init.flags = pll_clk->flags;
 	init.parent_names = &pll_clk->parent_name;
 	init.num_parents = 1;
 
-	if (pll_clk->rate_table) {
-		/* find count of rates in rate_table */
-		for (len = 0; pll_clk->rate_table[len].rate != 0; )
-			len++;
-
-		pll->rate_count = len;
-		pll->rate_table = kmemdup_array(pll_clk->rate_table,
-						pll->rate_count,
-						sizeof(*pll->rate_table),
-						GFP_KERNEL);
-		WARN(!pll->rate_table,
-			"%s: could not allocate rate table for %s\n",
-			__func__, pll_clk->name);
-	}
-
 	switch (pll_clk->type) {
 	case pll_2126:
 		init.ops = &samsung_pll2126_clk_ops;
@@ -1640,7 +1637,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	case pll_a9fracm:
 		pll->enable_offs = PLL35XX_ENABLE_SHIFT;
 		pll->lock_offs = PLL35XX_LOCK_STAT_SHIFT;
-		if (!pll->rate_table)
+		if (!pll->rate_count)
 			init.ops = &samsung_pll35xx_clk_min_ops;
 		else
 			init.ops = &samsung_pll35xx_clk_ops;
@@ -1659,7 +1656,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	case pll_0732x:
 		pll->enable_offs = PLL0822X_ENABLE_SHIFT;
 		pll->lock_offs = PLL0822X_LOCK_STAT_SHIFT;
-		if (!pll->rate_table)
+		if (!pll->rate_count)
 			init.ops = &samsung_pll0822x_clk_min_ops;
 		else
 			init.ops = &samsung_pll0822x_clk_ops;
@@ -1669,7 +1666,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 		break;
 	case pll_4502:
 	case pll_4508:
-		if (!pll->rate_table)
+		if (!pll->rate_count)
 			init.ops = &samsung_pll45xx_clk_min_ops;
 		else
 			init.ops = &samsung_pll45xx_clk_ops;
@@ -1679,7 +1676,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	case pll_2650:
 		pll->enable_offs = PLL36XX_ENABLE_SHIFT;
 		pll->lock_offs = PLL36XX_LOCK_STAT_SHIFT;
-		if (!pll->rate_table)
+		if (!pll->rate_count)
 			init.ops = &samsung_pll36xx_clk_min_ops;
 		else
 			init.ops = &samsung_pll36xx_clk_ops;
@@ -1687,7 +1684,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	case pll_0831x:
 		pll->enable_offs = PLL0831X_ENABLE_SHIFT;
 		pll->lock_offs = PLL0831X_LOCK_STAT_SHIFT;
-		if (!pll->rate_table)
+		if (!pll->rate_count)
 			init.ops = &samsung_pll0831x_clk_min_ops;
 		else
 			init.ops = &samsung_pll0831x_clk_ops;
@@ -1703,7 +1700,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	case pll_4650:
 	case pll_4650c:
 	case pll_1460x:
-		if (!pll->rate_table)
+		if (!pll->rate_count)
 			init.ops = &samsung_pll46xx_clk_min_ops;
 		else
 			init.ops = &samsung_pll46xx_clk_ops;
@@ -1712,19 +1709,19 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 		init.ops = &samsung_pll2550x_clk_ops;
 		break;
 	case pll_2550xx:
-		if (!pll->rate_table)
+		if (!pll->rate_count)
 			init.ops = &samsung_pll2550xx_clk_min_ops;
 		else
 			init.ops = &samsung_pll2550xx_clk_ops;
 		break;
 	case pll_2650x:
-		if (!pll->rate_table)
+		if (!pll->rate_count)
 			init.ops = &samsung_pll2650x_clk_min_ops;
 		else
 			init.ops = &samsung_pll2650x_clk_ops;
 		break;
 	case pll_2650xx:
-		if (!pll->rate_table)
+		if (!pll->rate_count)
 			init.ops = &samsung_pll2650xx_clk_min_ops;
 		else
 			init.ops = &samsung_pll2650xx_clk_ops;
@@ -1734,7 +1731,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 		init.ops = &samsung_pll531x_clk_ops;
 		break;
 	case pll_1031x:
-		if (!pll->rate_table)
+		if (!pll->rate_count)
 			init.ops = &samsung_pll1031x_clk_min_ops;
 		else
 			init.ops = &samsung_pll1031x_clk_ops;
@@ -1742,7 +1739,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	case pll_a9fraco:
 		pll->enable_offs = PLLA9FRACO_ENABLE_SHIFT;
 		pll->lock_offs = PLLA9FRACO_LOCK_STAT_SHIFT;
-		if (!pll->rate_table)
+		if (!pll->rate_count)
 			init.ops = &samsung_a9fraco_clk_min_ops;
 		else
 			init.ops = &samsung_a9fraco_clk_ops;
@@ -1761,7 +1758,6 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	if (ret) {
 		pr_err("%s: failed to register pll clock %s : %d\n",
 			__func__, pll_clk->name, ret);
-		kfree(pll->rate_table);
 		kfree(pll);
 		return;
 	}
-- 
2.53.0

