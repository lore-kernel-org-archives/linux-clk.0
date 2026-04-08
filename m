Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB5F363C43
	for <linux-clk@vger.kernel.org>; Wed,  8 Apr 2026 09:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775641754; cv=none; b=essNMv7K7ZT2GyFh5oE65bh/stKAJ/d10ejF8t6oTuBCu4HQ9/gSXfc+oz+btIvS3M1FzFGGvwPtuKVcga66dLWxh/zxXC32QYFH8l+TVXvJsexPkrGAMpzFR5mRlDxfAgW7FOVJSyN+5kMCJO4T+8GXNzPEX5jwQZsjObd1Ytc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775641754; c=relaxed/simple;
	bh=mpR/q6X3i/M2BnduABDgEH02LEks6wSFU2eL75pnwGk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YxH80Zw+oFCYnabT8eXFt44G3uLI5hiy42vnURwpd/q8tLKp6qrLpRQI8pb+rRWc9RyiWakwN9XHotHQlIhH1Rr+8X3ya/86vLoUEMA0q/WTfCCKEANxYp4lAjn6cqIxChAgfqYTzpC6kpyqUt3NbosSge9Cue+SZMeTLIFc5oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HIfZCJ0D; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HIfZCJ0D"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so18822025e9.1
        for <linux-clk@vger.kernel.org>; Wed, 08 Apr 2026 02:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775641742; x=1776246542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pYoGMeCz6Y1Ts2t+vdMHS9mUEhRgNq0fMUR9Htuve1Y=;
        b=HIfZCJ0D/DvySHEPmNeKNho8Q1o0qqXhzL8g8LdFHOoUXXQqzXcHNfhbxemd5yfJ3a
         S4bIZ5KMv38nvrzvW+k2vf8a29hA7CYiwYjd9SN5cJcobfa9/Jf/Oc/U0ytmHq/ERB/g
         Gj3srS1WgCHjNwuUSP4hqkrmjPufq7lXhLEue0uoKyjyZqAaXVVNzlO0/ZUrVe1pkb9r
         9DwWo7nw8B0fNJ8AbLikKKildFqMbk+oo5levvcJEXWUmReLDaZJIG+wTZop3EViJxlK
         jogV+O7nrZPbKf2wjx6LkJkjHA0GwqkjMDsrXiWC3vQRjGYsCtOaEkrQHLI1atrKKj71
         Hd/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775641742; x=1776246542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pYoGMeCz6Y1Ts2t+vdMHS9mUEhRgNq0fMUR9Htuve1Y=;
        b=ZnNRclVwnnKTBcvMyJs2X0JrpsUSFb30ptiHM/D1GJw0I2fGh3d/fMQErw8WrF0Fn9
         bp0lePLsDik2+8+2Kkx3Jo4Gbh/BBK1LTfmq14GvWf4cMY3Tfg+D7qqyeWkxNLLMs8lW
         7D7o0Dt30VIK4GTuTq6ssezLmlnTK+VTIHmm8yFEGVl1W81msc/WZ2+lgnQDCfJwiGVz
         YcCBfKn/br/6+CZ27m1eSj9Q+/rQA08ljaZW0frQ5sfXOKWDzRq3YMPnO3ygcX0UtENg
         7Qx++ZNsWS3+Tp5JBH+0zAJr/0o42mlYzbbJQo+NLFAfff8xFMUFbaLjkHgbsB0gT9KT
         5qfw==
X-Gm-Message-State: AOJu0YwTbWfIceaCkZCWvaYH5kAJ+HxA+6GHmPbmU69cowJ5cdVo9xko
	JNULEvUCAPunqjsJQ42jmIDTVUZ9JmyY3Lza9/ks6Dewwj4J0LjlW/25
X-Gm-Gg: AeBDieuiJVEfSLn/jD/X9w/yiAULqzsWOWqymTX2TCYiFYC5uneIxJe7DuRLlJp3Se5
	wWy34+71urZp0QH6KUye1TDMSRwWDyJzcSFbx8/e5x8Du6Ge3CiHbNKlwDjzLCnkPHFsUyX3e6z
	jqhhm+YWYrA7ztgdraMREj9FA0N0HU6DUEsGIj02HLHimmuwkTf6hK4Y1lBlLJ9yqyi/5lPap1Z
	Oc9joynkjIjjw2ikGIp6BOIqBKAc2i1/NQAfz4jOJ3W9tHd5UW4kTFStjdANsBNB53kgvcgS0Xo
	1Kp1AFUgq+3R4BfYaLU1JrIflJTFIXJygPuY3/d10DyBWCzdRQ6dFoYgu1F25BnZ38MOR82SiWe
	J5WYp3LJ/INaZIT4g7GJjFpiAR+hq2KYJbBzo5gBlsirODMbVPRyZriVMA6u5KLUFU1Q+kBOUb3
	8Ezm9TTIeZKgXJoU3XvCXxMCKn5CQSaR20lvMPrQQCcSo7YmL/VkmczORKYgqXQNTOpuK8bWrb+
	c2wpBzuCpaLEJlZgvqmI5BLdc9npfodu6x7uw==
X-Received: by 2002:a05:600d:8449:b0:487:1fbf:e0a1 with SMTP id 5b1f17b1804b1-488996a1e01mr217238555e9.4.1775641741935;
        Wed, 08 Apr 2026 02:49:01 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:98bc:78d2:5881:a11f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d58e5sm57689153f8f.23.2026.04.08.02.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 02:49:01 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] clk: divider: Fix overflow in clk_divider_bestdiv() for large rate requests
Date: Wed,  8 Apr 2026 10:48:14 +0100
Message-ID: <20260408094814.321072-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
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

to avoid overflow in rate * i. However requests like
clk_round_rate(clk, ULONG_MAX), which are used to determine the maximum
supported rate of a clock, result in maxdiv being clamped to 1. If no
valid divider of 1 exists in the table the loop is never entered and
bestdiv falls back to the maximum divider with the minimum parent rate,
causing clk_round_rate(clk, ULONG_MAX) to incorrectly return the minimum
supported rate instead of the maximum.

Fix this by replacing the maxdiv clamping and the unprotected rate * i
multiplications with check_mul_overflow(), clamping target_parent_rate
to ULONG_MAX on overflow. This allows the loop to iterate all valid
dividers regardless of the requested rate, and clk_hw_round_rate() with
ULONG_MAX will correctly return the maximum supported parent rate.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/clk-divider.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index 45e7ebde4a8b..dc486c2aa946 100644
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
+		if (check_mul_overflow(rate, (unsigned long)i, &target_parent_rate))
+			target_parent_rate = ULONG_MAX;
+		if (target_parent_rate == parent_rate_saved) {
 			/*
 			 * It's the most ideal case if the requested rate can be
 			 * divided from parent clock without needing to change
@@ -332,7 +330,7 @@ static int clk_divider_bestdiv(struct clk_hw *hw, struct clk_hw *parent,
 			*best_parent_rate = parent_rate_saved;
 			return i;
 		}
-		parent_rate = clk_hw_round_rate(parent, rate * i);
+		parent_rate = clk_hw_round_rate(parent, target_parent_rate);
 		now = DIV_ROUND_UP_ULL((u64)parent_rate, i);
 		if (_is_best_div(rate, now, best, flags)) {
 			bestdiv = i;
-- 
2.53.0

