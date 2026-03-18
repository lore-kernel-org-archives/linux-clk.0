Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA7635E94A
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 11:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773832056; cv=none; b=H3/UQwZmN8lcW8840WR42uA2ocYdTI29+Dgq7jpk2GRuOiMM9jB+T0/mSgho+phns1UwK+NuHt36MvGjuUDR9QA0mZP7NTZB+LKDAB5zdtspF3t1ehrAXStvtZka9rJThfsFFwUzCsMiVxGeQIHiSCPbRKxzXKUo7vSqQAhC338=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773832056; c=relaxed/simple;
	bh=eJBoZ48Ez5RrV80Z31ro3hsF6HK8BJFcFtu9cv4YWH4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bN8K9W0hSgjC7QZBuAX9JHHpHwMcVLY9ZhnPGxfMzL3EnLPnbMNoKqZUAkQU7Vf56UzZdNZTC/RpWCw4bsXIJXPmY6m1vkMHdO4r1nd8DF0hT2sFcsAulh4TDxbqiHpcAZrocRxCfcS5R1isQhWn6fXcOHuowtbDXBhVNZaiS10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TmYFPKBw; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TmYFPKBw"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c74244dc0b3so278291a12.2
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 04:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773832054; x=1774436854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3bIIa3h2z/cZqqIYFuGVpDrxnGGpkmrifYRg8XYq0Sw=;
        b=TmYFPKBwsFgT9a+NBot2MXvfeUJf86Gt4GbHNVL9YbFQFl3v0mOf4pv9QcGRisA9It
         V3XF2W7VocEL2GLCFKl1xAsrybINjKQvbkDspe6Aix5x3Ar8DPDKkKldBOSzken8TKRh
         +2bxN+2PWukBA4ze+quXJZCB1NFiR98fMnSFMcEfNG21S+Z11MBL12J6hvYCWmY3Jv4/
         w0CuyCkIa2mviVXDdrH/j52L4rMlQ6xPp9ONjd30r5dRmFVBbY+Gk+tMr6/+1pwYlosB
         5M60quWz3SaQKNgy7+SmID2lek6/4MDn5IhF6LbN4JPaCmIzjjw9R22B7aTCjxD+NUMz
         pK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773832054; x=1774436854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3bIIa3h2z/cZqqIYFuGVpDrxnGGpkmrifYRg8XYq0Sw=;
        b=ME7L5l726ukSKA7gwb4e46C8Fo3v3/aTv7Zt9DWekUSdnJyF0p8PU+16hMIC2LXlRh
         HPH+aw4GrMkzVZnDga5F1Dj2s6OCEhr4PRGcE7pfUMTlLBcI+TmHqO46766JFpLlQs/7
         5r84KAfPu5rm7ADitdAnktttWyfekxD2c6k+cGGOh1lysZ3YiO4HpoUAculzsi3tS2s/
         eNBy48WfeC5H04dZQ2KG2SrUdLM/Dds6bZ1E3yZtF3CeshIeiA1nYIG56TaEehm1yaKU
         UrxauJv16LsfOSVkRtUiwcGJqAdx+d8NTyPt5VI6ihkBJV9Ij8HFFT/hisQ7bqCiDnOZ
         VCFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUU6GR4xkff8p6BkYEypCNrJZ2RzfbSVteHUconMnzGWXlZQ0HX5wTKXu8WAs6LlZp9OK+Z5YVv6Ag=@vger.kernel.org
X-Gm-Message-State: AOJu0YwY8FZ6We8qXx5KTuQJfJAZUa/oKLvnMePAzMJtN0oWAB5n04j1
	4UWOYrsVocM3iE/DVhiDTeKufvFDL2HQdokSS8svlaqeJwsz28EAkwnK
X-Gm-Gg: ATEYQzzEm7eE2KAWFaTaoy07Z1oaPH3J6iK1X4kfr9XC15DvjzJqnyqAeBE6zEvKC8b
	FwiWmWKOhbDNMOQ1371OyA6rx9vA3Mo4GT9Vao141ylAMt31YJTRxMZFYdRVbolFDnd/2bW7D8n
	Z+dRiuV2uCmF1PQUfhJauBNyq6I/amV3a9N3C0qnc//3w0OLO6VXAXIOqB9294MF+CsdeZ69+7w
	EGsNc2OWAJlNXORHc7MkN4fzonrUhpTz5WWAdJE7jflLq8MCIHxGAxNwwqsEE/KkWtewm+I/HRI
	jcbFuGWDQQGvwJCfBOPdwr5DcUGAPommsbG95n4q3l4o09TXDBB2O2dP57f4WUptfwE7rd3ngtx
	bzZgyDrJkkab/VVed5XTB2mDeVG8DFaMVve3y0eScfKcYlQUQp4k4ijbkn/dJj2mTzOQFgBWJYy
	42B7R98FRtewA/vak5PC/ZKM+O
X-Received: by 2002:a05:6a21:4603:b0:398:8f2a:5dd4 with SMTP id adf61e73a8af0-39b99d01abemr2840291637.8.1773832054324;
        Wed, 18 Mar 2026 04:07:34 -0700 (PDT)
Received: from ubuntu.. ([152.58.155.3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c741e0b2015sm2355531a12.6.2026.03.18.04.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 04:07:33 -0700 (PDT)
From: Anas Iqbal <mohd.abd.6602@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-clk@vger.kernel.org
Cc: hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	yamada.masahiro@socionext.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anas Iqbal <mohd.abd.6602@gmail.com>
Subject: [PATCH] clk: uniphier: mux: fix signedness bug in get_parent
Date: Wed, 18 Mar 2026 11:02:51 +0000
Message-ID: <20260318110251.2412-1-mohd.abd.6602@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The uniphier_clk_mux_get_parent() function returns a u8, but
propagates negative error codes such as -EINVAL and regmap_read()
failures. These values are implicitly converted to large unsigned
integers, resulting in invalid parent indices.

The clk_ops.get_parent() callback is expected to return a valid
parent index and does not support error codes. Fix this by returning
0 as a safe fallback in error cases.

Fixes: 734d82f4a678 ("clk: uniphier: add core support code for UniPhier clock driver")
Signed-off-by: Anas Iqbal <mohd.abd.6602@gmail.com>
---
 drivers/clk/uniphier/clk-uniphier-mux.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/uniphier/clk-uniphier-mux.c b/drivers/clk/uniphier/clk-uniphier-mux.c
index 1998e9d4cfc0..f3b21ea96649 100644
--- a/drivers/clk/uniphier/clk-uniphier-mux.c
+++ b/drivers/clk/uniphier/clk-uniphier-mux.c
@@ -38,13 +38,13 @@ static u8 uniphier_clk_mux_get_parent(struct clk_hw *hw)
 
 	ret = regmap_read(mux->regmap, mux->reg, &val);
 	if (ret)
-		return ret;
+		return 0; /* fallback to parent 0 on error */
 
 	for (i = 0; i < num_parents; i++)
 		if ((mux->masks[i] & val) == mux->vals[i])
 			return i;
 
-	return -EINVAL;
+	return 0; /* default fallback */
 }
 
 static const struct clk_ops uniphier_clk_mux_ops = {
-- 
2.43.0

