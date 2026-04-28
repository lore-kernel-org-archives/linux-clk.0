Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3260D3AEF37
	for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 09:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368718; cv=none; b=HTUZbdttKc79YGrRqqfaCGFEoWs8yjWw9kkcEysZST+IT+/vsd6M+f7EXEiJRfaa5fNv3aTTT4OupuZpTqt2YaFTQ2RTQ5Zf8YRyRpHrynMlAc3sCqjkcogDJ9THnbWsrwaKUPsauqlMwOTL4MZ1jrm9WFi0ykajA4wH0mUiBwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368718; c=relaxed/simple;
	bh=h9eZACR4z7mpIooGhOiT419vQIKcgdMqK7cNEMEvsNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p3Sy5a8VFcyvkJuKiSQfo4/Gbx6sdz/a2fipmTiYMNOaRSlUQBkunDm82su3W1emjkh9vsQfrfFFLiPns8JkPBet/snCaQgX5wrlkLbC+WxpwIZt9KRjb3p1U6XTQrHH84/gvMLgqZyAXyK1ETODt2NBrJ1fP40cLiuwuqIAkz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=odkRg92L; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="odkRg92L"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43cf7683a28so7428955f8f.2
        for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 02:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777368714; x=1777973514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9Ztw6B5UPvw7YsngQxm7uiQb4ZGKmac/cw3zOwVaSc=;
        b=odkRg92LD+oLA1teH6fRXROiMULoO9nyPG/v69ZKuipeS0VPuSUuA9WWCBsk+oUrBB
         UetChHaTTOaGEbM0U21kO/AFEo5p2X51WtRyd7Moi2PpogRHDsE34Ft74Q9LRvWTj7tS
         24ByNVIidK5ihkD0mhhXwIRuVpZWgSiYd9sGP0+miofyYXcj0vG2qexCPzfZvHZ37Rbe
         QLHMrVc7XExspe804G5mPbrze5EAfxwzhJ43V3fDB0Wlqrz/kxfB5hjI5VDW+8q1nd5f
         PgRnH3vK5sOCCgqcOQtWC5B+p1f9I1xCmrswnN7oXBcrvwccCK7YAOObXjvZURZVckAz
         eibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777368714; x=1777973514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K9Ztw6B5UPvw7YsngQxm7uiQb4ZGKmac/cw3zOwVaSc=;
        b=k+LxFD3HUx4YDaN049xznN0tniKEJp/vqKc6Y2TJCiixbWftwCkLMF5m5vwUTuzxUh
         3OewyF8dRVGuNQa8Dj6nLJPaLbZxyiUUCOjeWawBmNl/HSV11TCGQ73ma9csHra97+jM
         GjFzkFT1zLw+iWPvbygJK8tWYmGzkMx9mGZsWIZiPvraeHyvmRVs6JDVrd3Z1yWTNMUY
         Z32lojw7gZfbJXMp4/kZjk4MfBPgHd9/07OczOWorp6uNl5FHDjsMwgnLwXnk60RJu4j
         yscdv4zG3+KIobOSBfUuu2sovrLct3iqqVYzPZ9GqOb4uV7auW7ZDCnAlBeocvnq3rmO
         gz1w==
X-Forwarded-Encrypted: i=1; AFNElJ8n/fUjJJuSpBOfT3YcnqHPKkQFLz4oApbrz/SFNY7POXRz0fsVd3NydJICLY5h8z37a6ExlmFwbec=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCD5iMuReHhRt4nB46PeaAqMEAvLKz2Wj64YYbTHVhR11vd6/k
	0eqMbar9y5ZqtJqh2pVXCX9xUsu1oHND8AQCyr8JhS1MeddyhVGTtEGi
X-Gm-Gg: AeBDievet1P5RcUsRLmOImkdlAgiZII5wdN67R3Czql5TaoafovzhqhU832rnzlQdjs
	D88b1cKAnUiPjlPgLLlgyPor7gxiI+8ykm0ECYGejffO+P7BGsYtJtTki2VuJkHydgscbzV4Nn8
	myVMQ29kwxRWZzlsIspPX01zVzDxRmkEx9Uifow8E96sQLxRLbi09tZ/PWCK6NSw7uvgJY+io42
	6d0iOvanP7T36fauujHbJh3gXr5UDHe5AkSGKyDxAFlNd7W7uFWxJDcuUpq2/+78R/N9gjGbZ62
	tT4YxdpIJX74Dzk+V2ZbdmtIXQFfseycrootBO9+27iX7h/w31AvYugC9Lt+ojTKxRwio9REK/7
	DDMAYaWWzPRE3/PVlo/qjbBAuVm0kBPQO71dbdg6baSJG9o0j2Ri71jMCXErluxV6Ci4BAN58xu
	S9FHMlyIPUJZBSzPyLozZHCIYb5D/fSB8ujtChKhgj3ZdXCoVVRF8LGnlTIxj+H2mkYx6fTdiBO
	RUjH1T+9yr2KcISYcc8c/4nB6OpjdYPKa3LqAL251OI3okC
X-Received: by 2002:a5d:5850:0:b0:43f:e43b:2d69 with SMTP id ffacd0b85a97d-446478087c4mr3955146f8f.1.1777368714174;
        Tue, 28 Apr 2026 02:31:54 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8851:8e5e:9c47:30d1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4464004ed80sm5389589f8f.34.2026.04.28.02.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 02:31:53 -0700 (PDT)
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
Subject: [PATCH v5 2/2] clk: divider: Fix clk_divider_bestdiv() returning min rate for large rate requests
Date: Tue, 28 Apr 2026 10:31:46 +0100
Message-ID: <20260428093146.3171672-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260428093146.3171672-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260428093146.3171672-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v4->v5:
- No change

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
index cb56931456b8..8ee1614128d0 100644
--- a/drivers/clk/clk-divider_test.c
+++ b/drivers/clk/clk-divider_test.c
@@ -61,7 +61,7 @@ static void clk_divider_bestdiv_ulong_max_returns_max_rate(struct kunit *test)
 	 * can produce.
 	 */
 	rate = clk_hw_round_rate(div_hw, ULONG_MAX);
-	KUNIT_EXPECT_EQ(test, rate, PARENT_RATE_1GHZ / 8);
+	KUNIT_EXPECT_EQ(test, rate, PARENT_RATE_1GHZ / 2);
 }
 
 /*
@@ -133,7 +133,7 @@ static void clk_divider_bestdiv_mux_ulong_max_returns_max_rate(struct kunit *tes
 						  div_hw));
 
 	rate = clk_hw_round_rate(div_hw, ULONG_MAX);
-	KUNIT_EXPECT_EQ(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, rate, PARENT_RATE_4GHZ / 2);
 }
 
 static struct kunit_case clk_divider_bestdiv_test_cases[] = {
-- 
2.54.0

