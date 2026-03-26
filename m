Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F77334B40F
	for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 04:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774499017; cv=none; b=ghyfatlFowgvFS9iUTJDZcgei3foOt7t/+Slm9FvzYVmdiY3eVmyxrywnu8XG3Jf9h7TZv6STQefTTG3U5k/K96HUlBboBpHlFt5/V/e2oncsnncpQophUQvX1Vf7idKeEFgV2rllAWf4nqSFaG6CQwTaR6Vcwzis1Fv15F2Y4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774499017; c=relaxed/simple;
	bh=9aXpIYHxEZve/zODLL3ErK9l7SJiyftQgW265r3QNo0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O0ogiiUhQzcdNOwK3lpF46rT31VkMrg2G7GjSPMkhcOmf/s3e3hy7ApQwoVEvpJxucMB6PN2ARxl73yAzQ30zMF6RjAH+g8s8eeTz4MOv5nSxGeLPhkSUz19OkZMV6ieEs4oasrKlxVcrlItodbeaSu6WdcCtKUSh0dIQgdwwdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UK4jyelZ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UK4jyelZ"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2b04e6a989eso3055585ad.3
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 21:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774499015; x=1775103815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uePC4t9zYdAqfWmLVP6FLg/cJ2NqG/wiW8h1ArBlvSo=;
        b=UK4jyelZdP0Eb6vUdPuGFatpW/rxaJ8Ao76PGrQE8yY7h2qxQJriM3JZ02O7CemOCl
         5QF5pCCy9jPUaM0JNt4Vj1+F74SSu/vYJDmFUXaIszEbmdlWQgWm6A/mJexUqXtBwbGA
         kHZPTgsp+8jqnLQ+sqJDU3L3lsnqsgbgN24SHzRnl+5ySGbO789qdSZyYKM9e0Z9LJqn
         QhNyu90hsKcTjzeqxmPnZUNq2gI4I9TIuqqPHQjiIrky7LWPH5912B9WhOeUrxA6S9Dd
         2BeT5ehUICDfpbTLqpB0R9oKvWfafJ6O2QzOQ6zGUycAi+52AyGmrEndG+N6Ys3ls0bc
         ZvVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774499015; x=1775103815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uePC4t9zYdAqfWmLVP6FLg/cJ2NqG/wiW8h1ArBlvSo=;
        b=p9Ev+wtUVTj3Q/Gt0tE1hv2fENJxnSKzJdJtoAOn0+vB9cMNGOD14yfYgxK8uYdM54
         ejXebxjDm4I4KDANwIZBjljULaGs7vcGbjNFlqL45axVgubvpZkkkzmYppDvFJJ57zxp
         N8reOisWXWCJJHb1kN9YWhYvrXZH+3LShC0ir6tj50eBijTHwlSjCxbo4k+cli1BU6Q7
         yOZgRjktkxMfCetXW180+1RZAlZE3G5fbu5jHKjtbxUy9Kskl7dgEoj/Z6MleojjByUO
         pMZ9fefO6ERZkdKubt0VdZ6vOwLdADQzxCNnLv1IGo+P5CyCSMIk9F/bTAWVl3pFf85q
         N+ow==
X-Gm-Message-State: AOJu0Yzf4Eu6WGZYp1jVFAm6uzLJ3Ev4sj4D1jR8oGd4ee9BeQI1dqId
	88tCBgAs922+oKI2tMBY6GDVZD1d8DlJUF2q6KWD193OAHU82K0N9n8W1dwcMuQC
X-Gm-Gg: ATEYQzytns+HL5Rk1Wmnwp5gLg18tJr7R9Kjy1dQbYm4h7NHRIulZHHqGuttmCfk+/q
	0Pmi1Xd/B2mdxXSlPQXvVHdUCaMKkN7OfMoVpOs41jenA5xXZ85FBCI9RXsaUp5x7GVwq+NNK4/
	em2iaKihpxZRJs3OnWxAH9eAkRQ/Zn9z/JoB+9ogkvY1n0acMiiPGyDJMtWR5gcKcfSThbhUeUP
	/JX03wBLRjMAt6COtrm9GJondSjoA4fh86z0zvjirk3V93Jajbd7Pv5rL7XQOw//w0tUfFDNxPo
	fmQkh83/pT/WUkZZBx/AqXmOAU4qII90VqT/uhni7+hzKVpOctOBbqLfTlXakk1/5toQ3A63+e5
	ZKgIWY+2x5jxbVmrW5u7kvSWD7HTqoBFVYxxN3Cy5q6E6VNDDCJdH/4SwT6WEglfm3HtfiGtRlK
	/whiuJksJv/pPvF9UaIgUqHpe8ZInOpmltljG9aJMpHHUR1RhAXz6OvHo=
X-Received: by 2002:a17:903:3b84:b0:2ad:da28:98d with SMTP id d9443c01a7336-2b0b0aa685fmr63377505ad.37.1774499015189;
        Wed, 25 Mar 2026 21:23:35 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc883c0asm15566685ad.45.2026.03.25.21.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 21:23:34 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/TOSHIBA VISCONTI ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] clk: visconti: pll: use kzalloc_flex
Date: Wed, 25 Mar 2026 21:23:17 -0700
Message-ID: <20260326042317.122536-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify allocation by using a flexible array member and kzalloc_flex.

Add __counted_by for extra runtime analysis. Assign after allocation as
required by __counted_by.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/visconti/pll.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/visconti/pll.c b/drivers/clk/visconti/pll.c
index 6fd02c4b641e..ca29d12f9316 100644
--- a/drivers/clk/visconti/pll.c
+++ b/drivers/clk/visconti/pll.c
@@ -21,9 +21,9 @@ struct visconti_pll {
 	void __iomem	*pll_base;
 	spinlock_t	*lock;
 	unsigned long flags;
-	const struct visconti_pll_rate_table *rate_table;
 	size_t rate_count;
 	struct visconti_pll_provider *ctx;
+	struct visconti_pll_rate_table rate_table[] __counted_by(rate_count);
 };

 #define PLL_CONF_REG		0x0000
@@ -255,10 +255,6 @@ static struct clk_hw *visconti_register_pll(struct visconti_pll_provider *ctx,
 	size_t len;
 	int ret;

-	pll = kzalloc_obj(*pll);
-	if (!pll)
-		return ERR_PTR(-ENOMEM);
-
 	init.name = name;
 	init.flags = CLK_IGNORE_UNUSED;
 	init.parent_names = &parent_name;
@@ -266,11 +262,13 @@ static struct clk_hw *visconti_register_pll(struct visconti_pll_provider *ctx,

 	for (len = 0; rate_table[len].rate != 0; )
 		len++;
+
+	pll = kzalloc_flex(*pll, rate_table, len);
+	if (!pll)
+		return ERR_PTR(-ENOMEM);
+
 	pll->rate_count = len;
-	pll->rate_table = kmemdup_array(rate_table,
-					pll->rate_count, sizeof(*pll->rate_table),
-					GFP_KERNEL);
-	WARN(!pll->rate_table, "%s: could not allocate rate table for %s\n", __func__, name);
+	memcpy(pll->rate_table, rate_table, len * sizeof(*pll->rate_table));

 	init.ops = &visconti_pll_ops;
 	pll->hw.init = &init;
@@ -282,7 +280,6 @@ static struct clk_hw *visconti_register_pll(struct visconti_pll_provider *ctx,
 	ret = clk_hw_register(NULL, &pll->hw);
 	if (ret) {
 		pr_err("failed to register pll clock %s : %d\n", name, ret);
-		kfree(pll->rate_table);
 		kfree(pll);
 		pll_hw_clk = ERR_PTR(ret);
 	}
--
2.53.0

