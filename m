Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAD03C8703
	for <linux-clk@vger.kernel.org>; Mon, 13 Apr 2026 12:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776084562; cv=none; b=JedneslPuMFh5yGsYxj+ksQBizwNKt7op5hS2IwD1ntE5yf2VFN4TVgjMwbXZ7kqVfZ2OKAtasW5htx9JbzFmTnH00jKxNEXaquxdSuMORpj3O49LTEXZ8Gv8jatbKd9iCD7eCntyvc7mc1JN8lJin8IF5fx7sPrBPpRDTa4vz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776084562; c=relaxed/simple;
	bh=kBqnvQDwdiPZ+uQ0CawA0daWE+Ez/OQGt5TdVXg//xk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k7PClpLuoJIfmwpQAwXNWB3cbcf+f494h6wTx7h8GIVCcP7yxbEbw4b2LszsH/5xHTc/tHWWZAwEqk9jnomGG0lYx7vEuvEfd45oyIW53CkjJSFjFEWMKf97TH9yBFBH5Tr1hsKsFopUxb3lclDKJ1UXIU2NKJriFj9+eRYxSxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JcvT/ODw; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JcvT/ODw"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43cfd1f9fd1so2816606f8f.3
        for <linux-clk@vger.kernel.org>; Mon, 13 Apr 2026 05:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776084559; x=1776689359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/iZLzX9bqF3lkIILNvVjrN7/XoHKLWrdf/ip5ggw2bg=;
        b=JcvT/ODwioXnS7kcUN4oOz85buJqkdCMr6iwXK9kFiRh8s6fbWsGCkOUG6m9KV9mp3
         lRNijl4zU6ozn3Rvu6HlY6XfIT80mqdZX0NNj2VPHgCVMRy93W/AR5SBdts8I8EFJw0L
         xRolZnEsJbk/AfK+wyv8jr2LfXjIVJdBMTFH1xdv7zb6O0i97V5yRTgezlW/Qc6UPhcU
         Lic8YKBn+vxJF12FmBJ1Aipr8QgQYOngI+Orn9wCiyrmmCijlMgzHUlt7P/pttWqAzcS
         pjPAaW/qM1ONrLt7BvnJhRhn2e6X/8deKoat7VPHdlyU3vOtIq0G/25BCQox2UArKfXn
         SdZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776084559; x=1776689359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/iZLzX9bqF3lkIILNvVjrN7/XoHKLWrdf/ip5ggw2bg=;
        b=m86L731i/ZSXM5SYJHprVieLxXugAWT9yz6oEUpgFkYnU4txdtM4st5i03jrqcHcl2
         W31XCHBZ6J5HZ3W5ayvGCxIrWoZrcQB5iHR26TfKSXp2KGu8L1AhZBksTOnuVuMfOtzo
         bAgCT+OeC4dNkBpqg/Hf0uoz+5JAiW5z/DNYjkuyWbPLOTq8Aj48AVNyX9jIp+ogoqK2
         m9vG8fVcnEJR6kAqTWcxOZddR/910IoWY8x0u2UjJ+NOBM8akA6SopJZU4xUhqelvn1z
         Fhem6heAXLFEaTTqscAF3CTYbwRD/f2aR20l4x+vPv8lmdj06Ba/smundfUbmhwTaknc
         kWPA==
X-Forwarded-Encrypted: i=1; AFNElJ9LpER5Wm13ngqBsR97AxvhLkVL8PRrvW4otQ0QZdkecsWUNqjfRoHBXqG5a3Fabu7swbeWNq+8Zss=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLBHC5cny2NYB8nckpniU/tzBPiMzHMMipsaRXXRhb+41Ykk4q
	O14mduZcc5JavFBtE0gbHetOzCz0AXhhttIkuW4hAKuxMrojqS5XNas9
X-Gm-Gg: AeBDiesAUUFFXmH7mEfvnAkY4n/m3B0Dl7QgiH2+YQck+xYIGdr1yn/FhRxQr3rjy0x
	6E/b6ZZwW1TGyHP0b0s5tQ+jcJEmnd9r/i+mRcFXOjhlNF1uI0YlnKJNOoIImiaN/qqAthjcAq5
	ZHG0gSjHHj4dh7ig9s6r3Xqs9QXr0QqY16LyrnyCbb/7c/N7UAtPYjmsvOVBS2YY3AAQpQCFKxu
	uR1CcmtHVYa9cZPWggSR+CaynRVYGMXcbSX3zcKtA15cauZLllUti5M3je0f0LuvkLGKYzw7s56
	fz9P0T7vcImWYC2kX3FJWxFWYk6xMCIybNrIsQYf+SD8F61Euelum65UNlQ9x6kawLw6PKIx0Yw
	Tna/l1JUurLZ9KiWi+AeT941sRhZOLJYcrMKVSvdY/BOXFHHDLrQ/Id6hW1ChQ0xy6RNkzasSaa
	kOcHxJMIX0LHK3wGlLdcbmcvbU5qah3kQBBAvB63+/E8H4LlXLXHKzEWSPILgswhBIwl58jfk++
	KTs3a9Rrp303e9045VuKR46tJr8jC4Sekpvu6YrsWuPFKV5eBQoxITQhQ==
X-Received: by 2002:a05:6000:400e:b0:43d:1c39:26fd with SMTP id ffacd0b85a97d-43d642dc79bmr19277103f8f.43.1776084559020;
        Mon, 13 Apr 2026 05:49:19 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:8060:3087:2ea2:f494])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e50015sm34634318f8f.27.2026.04.13.05.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 05:49:18 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/2] clk: divider: Fix clk_divider_bestdiv() returning min rate for large rate requests
Date: Mon, 13 Apr 2026 13:49:11 +0100
Message-ID: <20260413124912.3260571-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413124912.3260571-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260413124912.3260571-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/clk-divider.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index 45e7ebde4a8b..9a6a2ad6f397 100644
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
-- 
2.53.0

