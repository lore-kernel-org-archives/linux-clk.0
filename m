Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CFD35DA5B
	for <linux-clk@vger.kernel.org>; Tue, 21 Apr 2026 18:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776795949; cv=none; b=Gn9Usd3nSuPljGt+mw3BptaJwWTaAaFji/WkPlVO7liTLYyRpVWU1KzNLdBKLczN5yGxObpT7dv8sMlocd792L+o7s408fAP88AHtxk0/3Lg40AdC/dO63qLfasA6I1NQGzH01kue1OjlWcf+XU5oCtN4ZwUVVVnXSGGDhT8gyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776795949; c=relaxed/simple;
	bh=PSar3N9Z2BHMP8vv/EuV+UcLe488tH3TScHmwENCS9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A3qUDFsRorFezo+npoksU1ADXCLC0kEt7pLcQrom9sZtUUIiNJUJ89w7ZC6Wh+6J6pAy1eJqtqHl8xqAEs6SjmTDKXBSkrbCqCPzzK856XkMykerL38q5qfVZ4FGhDiBNDOThF6AQmoaPk8/MfiucrB+osuzUd5A+hzkOpMO948=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DYTdS9K0; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DYTdS9K0"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso61614795e9.3
        for <linux-clk@vger.kernel.org>; Tue, 21 Apr 2026 11:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776795935; x=1777400735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M1R6milmB9n/Q/nqo4lAWxKj72sYlq6LR8BMjq2RJUI=;
        b=DYTdS9K0X4qqwAz15Uh5roAkXlBV33kjVH66rS/pGSMzf8rBRZL5mefOhLiso8DRfY
         utBaNRNGaVYpSmyAJs8Up+a3hgsiSMt8GSzkyMJNIsgpj2dfljwijlnsfHt+rF64HDNP
         YmF1ffrAed3tFf+yJVAxb0Xjatp+95gvWgUeeRiAHx1xPICmgCNHNJBuLLrFXY8Ru6Dq
         YBrwtMaL8iaftEskbKQwmWGAtbtsEEqNzzuZBVMilTWa2G6ellXCZ1tEZi6uS+gbyns4
         gc6ME9bG2/ua+TnDLtoz3gy2MqzDVZogVU6tBj85TmJ3sPkqRXXZi75y50xORv3pSCku
         luFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776795935; x=1777400735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M1R6milmB9n/Q/nqo4lAWxKj72sYlq6LR8BMjq2RJUI=;
        b=EWDYU8Qv6xiWE07Q5ltGjDl/5piAQ3eJRpoBiPHZSmiMPB+AXTE562+hHMZy0zW2jJ
         8rTGklfkl1mfE7txHXVOnvurEYuVMCs+Fl4QoWIgUmZ21tBANFRKCrb56tCsyDN7CJ82
         CxunOn/XgPwGMpDaOtL+NA4AxuhXeMjqND737V4R3wCn8efzoBUrGraLnLvLFFkBwe80
         lshGMLF+fyZI55w5dw7P4QKyZdExXKQw6VAX2rCdK3e6cyt91HF1rx0QG94OW0zvxC6b
         lISLW+nagpL1jXBGr/umh17KzMzIEk2mnIWJlqOadChFijedHCMd6jYAODMyxWyFjtDx
         uBLA==
X-Forwarded-Encrypted: i=1; AFNElJ/jwNRQrgn9cNqqCE+Bs67tQ5InyDDmvx4vtYMDfTepm2ITzwbuoDQ5iyOxBoev67zuSDbJeT8bKFw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyA+J0uK+11mrzpIQ/Cx31Mmby599q6YhzhRGz8ow/Z4BhyTL38
	fvcx12KEGllboej2eGo1lr4jX4vXCQ8kOsqlNIrOj1cwI1DJ/Tx3o3cI
X-Gm-Gg: AeBDiev9C8wqVB+tnUryph/9qyI8afmQbxikeVivrfMhEfMKrePfvxXlHsQYBCrxRTP
	HOWJoxPBzQqB0+YLlyaUEvAjQJLYYNhw47bOCTsoBk5BMkClg3dVdgcAscda758t7L0Ujix8aoh
	JdDKyJ7cQB9il9ST1njldLj1K8dUIxTZxMnAHVc9fN4gJC43tpS7QgxnMFKTIa/yYEDKiogGCn8
	UGNuXp851toppfgkThc9De4SvF19ZI5t7Z/bO39oCi6A4Ia+HSBnlY9FM8TfSsXhz+NbezFdCnG
	MIdbXRqmEOBtVKu1lD8HypVSfgfErXz28SNtOIEjGUnsjyISgp0CGdJNGnDhGd9/flRdpM7/D3m
	kkNq59qej1CnZCwF5Yng1C2opjyLOdBPPaB66FRn/uUS9V4xXP4OrE4//yAlEp/lvJJnGb4wVzR
	vw6mi+vrT5ObCbvnj0qRTEgFxGgHhsQeGtHsoNVNO7mH0nGlX30PcBJu/OuQdVNqqzkjMWifCI+
	Gqs4rfqE4QDrqDUXCm++GTmgfvjiPfXKodcd8YeQ6ZstUHK
X-Received: by 2002:a05:600c:4fd1:b0:488:78f2:6b0 with SMTP id 5b1f17b1804b1-488fb78ede0mr278306405e9.29.1776795934482;
        Tue, 21 Apr 2026 11:25:34 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:d3da:32d9:3f08:c6f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891941e05bsm66621565e9.36.2026.04.21.11.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 11:25:34 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 2/2] clk: divider: Fix clk_divider_bestdiv() returning min rate for large rate requests
Date: Tue, 21 Apr 2026 19:25:26 +0100
Message-ID: <20260421182529.3055114-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260421182529.3055114-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260421182529.3055114-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
index 3087c77fb157..300b8ba04279 100644
--- a/drivers/clk/clk-divider_test.c
+++ b/drivers/clk/clk-divider_test.c
@@ -68,7 +68,7 @@ static void clk_divider_bestdiv_ulong_max_returns_max_rate(struct kunit *test)
 	 * can produce.
 	 */
 	rate = clk_hw_round_rate(div_hw, ULONG_MAX);
-	KUNIT_EXPECT_EQ(test, rate, PARENT_RATE_1GHZ / 8);
+	KUNIT_EXPECT_EQ(test, rate, PARENT_RATE_1GHZ / 2);
 }
 
 /*
@@ -138,7 +138,7 @@ static void clk_divider_bestdiv_mux_ulong_max_returns_max_rate(struct kunit *tes
 			kunit_add_action_or_reset(test, unregister_divider, div_hw));
 
 	rate = clk_hw_round_rate(div_hw, ULONG_MAX);
-	KUNIT_EXPECT_EQ(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, rate, PARENT_RATE_4GHZ / 2);
 }
 
 static struct kunit_case clk_divider_bestdiv_test_cases[] = {
-- 
2.53.0

