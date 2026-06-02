Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2AA31DDBF
	for <linux-clk@vger.kernel.org>; Tue,  2 Jun 2026 20:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780430577; cv=none; b=XNMQ023eSxyHYaJ2CIMrHkOpdwnHChc4UTa3zElIfz3g/GZYtlecogZykF+o8TOyAzZbK/WdKq9OKoR3HSBomC6fftZ+Qf/t7tJN/YlKSsdvNF++bHB5Bgw9/h2wGcJwZQLZ6EfzeBpRZORu/L5xwfbvjH54cEKwVraEOIm4n2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780430577; c=relaxed/simple;
	bh=Jfa5R8Hcp8fV8pBHclVi+5b8yBOKxWDa2CZqqB9gSbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q7la8WcFkmh9NDWNaogVNSl/paKoA/cyS3x6Jt9534+hmlnOH7CCkr2FF8llH+UbMiR+apgWCg+ks6m2Kz6WHBtlLCSDJrFsGJG/epB9LP5S0+Vq13OfY2QxWnMGtJ9EhEj3jaFIVhidawgt1Cnb9L7nK4kBAO0GCiCJpSmUyBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dNJdMGhZ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dNJdMGhZ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4904fd4f6aeso100047505e9.2
        for <linux-clk@vger.kernel.org>; Tue, 02 Jun 2026 13:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780430574; x=1781035374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VlPgG6RjNCKxvEpnrQ9KQhAPgcHAQDrzTyIKfeGNbKM=;
        b=dNJdMGhZRE6KpZlfNHwne8yFGnKbG2URukkI5ztwPyeEE9hDkqSkLJW55DY5CseP65
         BaNCliD27bQkspCTd+mpKZ+aiCLX6RiEosFJBx3ZXPIh6qbgHzeALPhPdDP7tr726GOs
         zzLJmERVSZroh1hVKfW0r3/HlNUXKcfplQGNB4G5K7l+8YCuON+m7UaPR02QmeIFG3xT
         +Vrkcz9JoFDDhR8qmOk223/diDca15AXCKf83XYwBNS4Sqrj9zvjVNP2K/5LdiMAFYj0
         Z+k9F+AuBxAJZfM7C1KZqhtYNz/HERSckuEa7oFxms8/3KRvvIdkZZfMJ+/FhDlOGaq+
         y18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780430574; x=1781035374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VlPgG6RjNCKxvEpnrQ9KQhAPgcHAQDrzTyIKfeGNbKM=;
        b=O1aNf3GMWPl1ls48x7pz0XRvBd/x2KaJ9rif5L9QKvDbupqXfq7Yz6RZvuzpaaQB/T
         0MW4Xy5jz62uR0nAjRNMizY/FZoDHGlmu6KiHuTbNFk6W1S8GcbVSMw5O/CXzJieOE7B
         Tp0pCTyPZylWYgfoXRvsQp5kCNmNLpVCrRY+nESHZAn1fmBhNpIFbwZdGSXobrV9nM3h
         nGSpoz6NsHJRBdw8PqEG7b+KHMsi4RlGaVOgvhw/P/DOny+B3Nq/iTYtgQkq2aw1boS6
         T4XdeCrZYIpC6a/Qe/s2qUq6E7nyiHa72lZjloRZ+0EyLCu/CPS6OL2cKp3+YP/3Jq33
         Cgag==
X-Forwarded-Encrypted: i=1; AFNElJ/I9zC/552vEzZR147fY/rTGwbAswznu2PoCf4Jf89KsOKrWkurTa6J4F1fgTAQKD8hdXHctC5ejiI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXNVE+OpyqK9JgXWVhSadI7WFak1EHRMV/zqmZ+W6RA/6L7qsU
	64Nih4lud2t2oKW3XzlZv7B/e4bENqGCaIQgz5zrq7QFeeNL2gUa1gEd
X-Gm-Gg: Acq92OFiE9lkxuwqnpu3TCPK65Xu0ZTj0PK6BcYxkpErqgDb3eCA6yUI3Xl49IAxUkf
	dwkOGgrKJ3e+aHcR6MtaKTgt5u0GHwMeubaw5YPoJYIEmzbutGF60hID6PLfky6zob866NB1S1f
	c3AhDBGpBkY+sbr9pQxD4x9jZdiOFBGZqqeakB7vZI0ciQCaJQMT/lJ1tm1qSgGHl6Mcel6+NFT
	Vdem8/4v8fiQ78Neggmr2NZ/Wp71MrlLUz8pWnoW6dWLYReE785OG1fsgj4MgJ9zjaVkxE/zve8
	uc/tHofeXWDDsL/y06YQzPiGceSAAvWw6G/na8vLm+7Mh3Bb0GrgRox6EAzGCMC9rDb12xoP6Hg
	JKVR0nW8U9oIRPk9TL7USRtnn1RGxUuXgG8HPJMBW9W477nTWn2/GqflX75Pf/oVaoVWG/AcB/O
	hfBsOr3lwX6t+It3dvQWbasZAW6kH3Ge+lDeXbsg1KVSGXBqr5MxwIV/j2EvaPrDkDy/y7o+QhY
	zFbe7b9iIOKKRu6FGmL23je8YYiqkYNttd8jkCfGhIa0EStlMVuPljt
X-Received: by 2002:a05:600c:4e87:b0:490:7dfd:f7c2 with SMTP id 5b1f17b1804b1-490b5ecfe9amr4818515e9.11.1780430573733;
        Tue, 02 Jun 2026 13:02:53 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:5ef:9913:4a77:3bcf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e823f7sm97978255e9.13.2026.06.02.13.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 13:02:53 -0700 (PDT)
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
Subject: [PATCH RESEND v5 2/2] clk: divider: Fix clk_divider_bestdiv() returning min rate for large rate requests
Date: Tue,  2 Jun 2026 21:02:43 +0100
Message-ID: <20260602200243.1806087-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602200243.1806087-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260602200243.1806087-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
index b3b485d23ea8..f68216c65d3d 100644
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

