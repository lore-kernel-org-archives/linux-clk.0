Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAF638C2B7
	for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 11:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774523215; cv=none; b=Zi3pxcqVFMFZeJOPHKPbwRC8Tp9xaXQBFRPdk45HMS6OkoEKA6O4Q5AgIUhtiYiKLi/Tm8XTWVAUfmlSL34pS6OyZ4UXxnuu50CWlHNjlJWvxJE+eJq2re0rc+FegUx4l1o7iWD6sq4UvD1nNBY5GLSGQXAaTsiVLLtCjuA8It0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774523215; c=relaxed/simple;
	bh=+ZAyTQp65EIwuXSHSXormBFcrCjnoX+hpRnpUkHYdWA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=meAMQhcTO+DVwtpx3mB81W388fVhQpqnU7o93Ld0/cZ9lFlww907byhwWVWXuNyGnmVc8GnB++DRsv/z9z0sr2qAz9hdJDuvvN2koalLEUTpZU66trwcXKidXgzjZ7GIeN9jZ/BmCO8ufgSu+Ky5PjVkhyp9n5BCwJGCaa+aOyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HlmSrXmG; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HlmSrXmG"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43b9144790dso446532f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 04:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774523212; x=1775128012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q/sFHOET0k+buUlTybSm02sxCJWIJTnlItgG+5spzcs=;
        b=HlmSrXmG9ksNfrc3X9ZUZZSj3MySUKI4Q6RLIgx0uzqIy8IfhJEK1O4KNA59QQkTAC
         f9eCE2uOVgzgPVh6a4MU+eE7BE9Kxw03ixc4+ejpGH8jvfSleq4+hDXtgTwbMG8ihTZi
         h8A2bvoB7BpFBLmJ0zC0fxvbMrxI6hcC9yEI1aTCwiZUVBRfl4shCJ7zJKfhrXc2NPV/
         BC/giADRyqiLQmfIBYA1cP+eEZyfbWlLwUzIT8st3wxNHm+Eml9Q1o8JOGpn6PuqMZsE
         M08DFOXhibrObRGNh1jdlm0dgbAPB1CMM343p5y5ZMKIo8k2nKTNpl0oTtwnKw35GjgP
         xXKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774523212; x=1775128012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q/sFHOET0k+buUlTybSm02sxCJWIJTnlItgG+5spzcs=;
        b=qUKCoCAf+M0fIWaKbAvQtesSMEaxoXJYVEoRSqgJu1s15EF77BG1kJBY98Z1YqgU9z
         A6z5YBKiHKeGC7THXbpVEBTnGY3GULtPPPgd4u57k5Jt5Q8A0EXiyDwsA1v2Z2oTbimO
         YEvHR9mikAQxTF5W/mwTqE6OfrN8hZb26kVprCtjsIcw3z3uPuz8yreSkFi/Q6GBWGvb
         XM1nm98hYw4gTjZvISbbLipaVCMFZcXVh1maUcWkW1UdWG3rS6nPS8M7+W/s9e/zTBWo
         uq8IeAuN+yA13eBpLCWqkx37DOUQMj2UopYO82jqG8FlApWSI+Ry12zKcHe21wWbYawj
         a0pg==
X-Forwarded-Encrypted: i=1; AJvYcCVho45r8v6cmWp57Qb4aQYx7AbQw7GPpaTDGj5TTK0W+jI/J4xnkNDtfHK89L6O5DLllMu6EVNDQ7E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPOoFi8Kr2ZhUPBvcMPHjtPIiooSZVd9YBDkFa7lW7nVDVc2VV
	zibvZLIEwjbO2XkxPdyVhd3PnmWY4G+P21PX3iV30t8AO+fP5ZhV7kfk
X-Gm-Gg: ATEYQzxPRxUNLQFGlsBbVGOS+8fNY8ck1/85ukk+zH/ahxxrGnS/PHFmYpBrMzVUGrl
	2SsdUu2uDxu8VObr0aGB9Y82y/GUNE6EVNrcw5Nl8drdhyARRVQQgdBe5YBeGxrb++v3kvefq36
	zXtuXJtlYwoaowk8bg79ARtbghDQX2qdBrHzWb1b2bc/epzK5fGVF11X5dK8XS8+ga78cwSgXHz
	4FPRB/Ma2vqh4P5J9hYppx6SKhu+irQ7lBkpJVfdMMcZK2kptL7CM4pueIlvAv9lm15yNZGwr5h
	lECB1rWXyoZYqJKMYpmXLgX3tRTdn3XZkL4oyEAxds7Yz7OrAvbt2tUZHebMV2aFL5n7Bs0ygIr
	luepp4VIVcxaH0wUt19m71zhAX+KcaJLCJ/PI66Q1BtC6SkwmAjP0GDkyopxA6vJt5JScJYnvQ3
	3//nZd5LCOUTlHR4at2VFCGI+hxJ8BX6lJKUNVFGLgZH+vScXs
X-Received: by 2002:a05:6000:18a8:b0:439:b522:37f6 with SMTP id ffacd0b85a97d-43b88a0feedmr10937192f8f.35.1774523212434;
        Thu, 26 Mar 2026 04:06:52 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:377f:9a3e:6c94:560d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9194311asm8626084f8f.10.2026.03.26.04.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 04:06:51 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 1/4] clk: renesas: rzg2l: Drop a check in rzg3s_cpg_pll_clk_recalc_rate()
Date: Thu, 26 Mar 2026 11:06:35 +0000
Message-ID: <20260326110648.29389-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326110648.29389-1-biju.das.jz@bp.renesas.com>
References: <20260326110648.29389-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Drop the unwanted check in rzg3s_cpg_pll_clk_recalc_rate() as the function
is SoC specific.

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * Rebased to initial boot series.
v3->v4:
 * No change
v2->v3:
 * Collected tag
v1->v2:
 * No change
---
 drivers/clk/renesas/rzg2l-cpg.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index abfd8634d2be..910c16a369a5 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1107,9 +1107,6 @@ static unsigned long rzg3s_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
 	u32 nir, nfr, mr, pr, val, setting;
 	u64 rate;
 
-	if (pll_clk->type != CLK_TYPE_G3S_PLL)
-		return parent_rate;
-
 	setting = GET_REG_SAMPLL_SETTING(pll_clk->conf);
 	if (setting) {
 		val = readl(priv->base + setting);
-- 
2.43.0

