Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852743B8920
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 11:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777289326; cv=none; b=lyXee8GNrFQAS9lb75v89gSQVUMkOX0rtDv+WNZNuQgFyNY0UqwshTpfTVSUictWeiDVaXUeuPLQwnKJJbvnLGj91u2UoBHx2OYmSDFimqHAaaLFZ48vWzMFSzwRvKCfFtvEYtfeU/7wgu9h6hc7cjRjf6PIEfvOJx170UlvEcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777289326; c=relaxed/simple;
	bh=h7uIE0mqqq4mHL5t/tYzDztinxFslRwHMvJ3tdF+6q0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UZ94v8/JdUFedVX0yJlO+7aahJr2AVgdBK8a/9jFw8p354Zn1tgTFwD4qhlo/Py7IHnNBlFBVj6nfocqoTrwKkpGDFjHWXmUP1W7FPozzfhB6c7lpH4A0soM1cNoLJUix+52GSrixPvOjYRzhCrob8r2BDOVJIjWEVxkuB2dIO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NH6KkKX6; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NH6KkKX6"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43d77f60944so7449971f8f.3
        for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 04:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777289323; x=1777894123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCeqg+kQQc+bo4zJQuFR7vpp5utJVCWYM9xfYQe2WTM=;
        b=NH6KkKX6BTIxhRBg87mLl7vZkvyYVrP0ahuVj98Zu8/Q36G6sgjoBGVqA32qEskxdR
         x9e8MecXYft6GeGtWLMJikwkZSVC0zxO/pqKwu8AL+zeuInbRrnVDN/v0pLpF9AjfUC4
         w7kDHnxsVx7fQPG4z0o34R2eBSYaTgzqaAjOTPhU6JOXoMdkcVdCmpRs97iFlpjkfuc9
         3Hd+Y5P8JcKJ1J5XezUMmSdRbqIdaNQ74ZX+ZYWmh7G47iEK5yyHe/pkHv8sJHbZLP1k
         VspAS/1v7EOzVPrHDjjA99jbis9P616bp4Ue60VlFT9ezFYwyWOJ3gGgQpvnQpTbQBZn
         ga+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777289323; x=1777894123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wCeqg+kQQc+bo4zJQuFR7vpp5utJVCWYM9xfYQe2WTM=;
        b=lWx3KlL2fplAYSgMQZwNnwu37AogdCAXOe0Kyg+nF3eKbt16PtSoPzgzLNl/udlnN+
         PmFePvnl5XNa09yhz6KptqGFSGY4do9ve1AD33YpDL3fArAEAp5DeKUzi+1gVvzd8Six
         /2PpAw/t9PQEAP+cs59hlW+gPoWMGU2TDB6qxqAEKMj423hkE1xoPYNh84gH4gnaw/lS
         lyIh3hJliJrUsA9BwMShR/Yp05BufRyLgXdDyinoOsIpmt+5iYdNV++cw042WZI9nN+Z
         aI8mJaeTvjNIETQPesAuAGy6TQUqcnz6rgL5JQp//Ar6lIKOM1QO36Wc0JGAsqi9y39E
         Aimw==
X-Forwarded-Encrypted: i=1; AFNElJ8znZl+Z8laKV29JEhuHTIS3TPUiRWnCnpUdjOAg2B3SEOFn8HcPqwn837oI0Ha67ozkXwYl9P2zpE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7OFX5jgoChkADcjwWDwGPxPsd87iObw/q8tavO/UOelzSsOX3
	2NcvCqk9yWi9Ql5bnAmudI4GCJrxEQXK1TD4wQZGivrIKJGYx2fQLntH
X-Gm-Gg: AeBDieuxF5xw71pRk1DsFWp7N2pf7NVMo+/iZOKAWCjl2LXSx/MHaeDv9Vmd+uH44rQ
	A+Xf7bcPdsefj1QjguNfZQS5kT2doY9YSc45l/8M64GD5V0fc+5MlNR7O4fdz9aYq+HrfGEXA0b
	vFEswqwrEoHg0P2rcEEB0EvWvPVMZBvlW6jsBLopPLj+BIo8Z3MVOcLKfRTi6DLtYAcmXFnfrm4
	UX0iiUkUrOD+a2XO7WSr9fyyuefqW1Jny+Udd5Qb/xuqqA69tDLze7SrIf2x8eV9SSWF5vl2MS5
	eN4Rtl4tjYlsUKf2LBN/b3rMqzTwaD+LuQjs2NES+EDM7TaY03/JtAdDLp1LoWQ/pgUladhRkO/
	mUkYevsvpPDMcO7ozb9ThGB89023S9eb113Qv8rLHMoJwz7Y4DJa6XCHVCnOOwxKeVKU1jaI7sD
	vQjStTFtv/AdTRGrihynOXpwhHPjU8zrdpIHkTzrYEJGcebX8EoFYycbErirHEi1QDm3dfHhmw3
	dCm3+jaSzuQVjCL+PWqRZtMjOMH8t4UeD3m3gcBdi9AMgHG0KEo+amQc46cRE6ymSIa
X-Received: by 2002:a05:6000:2886:b0:43d:500a:1e5c with SMTP id ffacd0b85a97d-43fe3e0dc92mr65324143f8f.26.1777289322784;
        Mon, 27 Apr 2026 04:28:42 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3f97:a47d:8f30:c055])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb135asm85759519f8f.6.2026.04.27.04.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 04:28:42 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 2/2] clk: divider: Fix clk_divider_bestdiv() returning min rate for large rate requests
Date: Mon, 27 Apr 2026 12:28:24 +0100
Message-ID: <20260427112824.231150-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427112824.231150-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260427112824.231150-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

clk_divider_bestdiv() clamps maxdiv using:

    maxdiv = min(ULONG_MAX / rate, maxdiv);

to avoid overflow in rate * i. However, requests like
clk_round_rate(clk, ULONG_MAX), which are used to determine the maximum
supported rate of a clock, result in maxdiv being clamped to 1. If no
valid divider of 1 exists in the table the loop is never entered and
bestdiv falls back to the maximum divider with the minimum parent rate,
causing clk_round_rate(clk, ULONG_MAX) to incorrectly return the minimum
supported rate instead of the maximum.

Fix this by removing the pre-loop maxdiv clamping and replacing the
unprotected rate * i multiplication with check_mul_overflow(). Guard
the exact-match short-circuit with !overflow to prevent a clamped
target_parent_rate of ULONG_MAX from falsely matching parent_rate_saved
and causing premature loop exit. Break out of the loop after evaluating
the first overflowing divider since clk_hw_round_rate(parent, ULONG_MAX)
returns a constant for all subsequent iterations, meaning no better
candidate can be found, and continuing would cause exponential recursive
calls in chained divider clocks.

Update the KUnit test expected values to reflect the corrected behaviour:
  - clk_divider_bestdiv_ulong_max_returns_max_rate: PARENT_RATE_1GHZ / 8
    (minimum rate, pre-fix) -> PARENT_RATE_1GHZ / 2 (maximum rate)
  - clk_divider_bestdiv_mux_ulong_max_returns_max_rate: 0 (invalid,
    pre-fix) -> PARENT_RATE_4GHZ / 2 (maximum rate with mux selecting
    the 4 GHz parent and applying the smallest table divider of 2)

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
---
v3->v4:
- No change

v2->v3:
- Added Rb tag
- Added the expected value for the tests
- updated the commit message
---
 drivers/clk/clk-divider.c      | 25 +++++++++++++++++--------
 drivers/clk/clk-divider_test.c |  4 ++--
 2 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index c3804bbc06f9..36bfaf7200e2 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -15,6 +15,7 @@
 #include <linux/err.h>
 #include <linux/string.h>
 #include <linux/log2.h>
+#include <linux/overflow.h>
 
 /*
  * DOC: basic adjustable divider clock that cannot gate
@@ -301,6 +302,7 @@ static int clk_divider_bestdiv(struct clk_hw *hw, struct clk_hw *parent,
 	int i, bestdiv = 0;
 	unsigned long parent_rate, best = 0, now, maxdiv;
 	unsigned long parent_rate_saved = *best_parent_rate;
+	unsigned long target_parent_rate;
 
 	if (!rate)
 		rate = 1;
@@ -315,15 +317,11 @@ static int clk_divider_bestdiv(struct clk_hw *hw, struct clk_hw *parent,
 		return bestdiv;
 	}
 
-	/*
-	 * The maximum divider we can use without overflowing
-	 * unsigned long in rate * i below
-	 */
-	maxdiv = min(ULONG_MAX / rate, maxdiv);
-
 	for (i = _next_div(table, 0, flags); i <= maxdiv;
 					     i = _next_div(table, i, flags)) {
-		if (rate * i == parent_rate_saved) {
+		bool overflow = check_mul_overflow(rate, (unsigned long)i, &target_parent_rate);
+
+		if (!overflow && target_parent_rate == parent_rate_saved) {
 			/*
 			 * It's the most ideal case if the requested rate can be
 			 * divided from parent clock without needing to change
@@ -332,13 +330,24 @@ static int clk_divider_bestdiv(struct clk_hw *hw, struct clk_hw *parent,
 			*best_parent_rate = parent_rate_saved;
 			return i;
 		}
-		parent_rate = clk_hw_round_rate(parent, rate * i);
+		/*
+		 * Clamp target_parent_rate to ULONG_MAX on overflow. The true
+		 * required parent rate exceeds what can be represented, so ask
+		 * the parent for the highest rate it can produce. There is no
+		 * point continuing the loop past this since larger dividers
+		 * only move further from the requested rate.
+		 */
+		if (overflow)
+			target_parent_rate = ULONG_MAX;
+		parent_rate = clk_hw_round_rate(parent, target_parent_rate);
 		now = DIV_ROUND_UP_ULL((u64)parent_rate, i);
 		if (_is_best_div(rate, now, best, flags)) {
 			bestdiv = i;
 			best = now;
 			*best_parent_rate = parent_rate;
 		}
+		if (overflow)
+			break;
 	}
 
 	if (!bestdiv) {
diff --git a/drivers/clk/clk-divider_test.c b/drivers/clk/clk-divider_test.c
index b1bc802f38e4..093399c06467 100644
--- a/drivers/clk/clk-divider_test.c
+++ b/drivers/clk/clk-divider_test.c
@@ -56,7 +56,7 @@ static void clk_divider_bestdiv_ulong_max_returns_max_rate(struct kunit *test)
 	 * can produce.
 	 */
 	rate = clk_hw_round_rate(div_hw, ULONG_MAX);
-	KUNIT_EXPECT_EQ(test, rate, PARENT_RATE_1GHZ / 8);
+	KUNIT_EXPECT_EQ(test, rate, PARENT_RATE_1GHZ / 2);
 }
 
 /*
@@ -132,7 +132,7 @@ static void clk_divider_bestdiv_mux_ulong_max_returns_max_rate(struct kunit *tes
 						  div_hw));
 
 	rate = clk_hw_round_rate(div_hw, ULONG_MAX);
-	KUNIT_EXPECT_EQ(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, rate, PARENT_RATE_4GHZ / 2);
 }
 
 static struct kunit_case clk_divider_bestdiv_test_cases[] = {
-- 
2.54.0

