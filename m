Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415E539B964
	for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 21:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774904557; cv=none; b=AYl9EAB8qTvbyNCcU4bYMO+fXEhVWr8AEmupt1wUtQULqLBYokPHS8V07qMFtp3hiGRaWON8YYl3S1x0AhwvBee1SGz3wP3Slo6xKrgwhmwO0RQ06ArskP3pCiiFo9D7Nq8B1HFG60htal8sWitc6mMaHbI7KAlRCE768ymuskQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774904557; c=relaxed/simple;
	bh=Th5VfauObM0xZXA9Q4H7HxD+v5yhbtYTdvWw1qXLLWI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hXelqLAqKFr6PV7r8a7zhXMAL1JrcSSh+mHWPY85wuCL0aIHVhNOCIaUhjOiv9ezyYU4ErRUESKbb7zAqPlz0uQ3dNky9iKm6XyRD4sxgZoLP2zSimSxbvSm5kzed2+Btu1hvVp5K9cYjmxv7FQw9T2mPcSH6iWGg18gL9Vv5yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=byVaC5B/; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="byVaC5B/"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a871daa98fso37949295ad.1
        for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 14:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774904555; x=1775509355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HGPMU6au8tsARPVg+vn4AUp4UmNLZFS5AfaheKEgVpU=;
        b=byVaC5B/7DtYUJz+cSsZfvm9EakVBSkUL1OS3jBiwu3zCPutPM2rr1EDCT5wGQavK6
         Rjhwt/AqF1u3Fn/6w/sOw9shLn4Fas8vjlRbFYDgwTLV60yt7f7wni8tUDe6YFLgUKcW
         6mAllKvauf14xDHXcdwSVnxBYTOZOFBi5x55F7ItsWd2kVpa1PNaNG8Nbk4f4pWWp29M
         Csk4DkLI4FSAjfv0Oz41okAMtSk9LfZhXdWS1qG+f+SypQtjj1TS1AfqgZ2t1x2XSmx2
         vOheuXglERv44V90Fw460vKwEFo/n419ULd8q8pVBDb4U8VbbIg9tk/GYDIbvzpgFZyz
         fxiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774904555; x=1775509355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGPMU6au8tsARPVg+vn4AUp4UmNLZFS5AfaheKEgVpU=;
        b=q6cjw3757Z2TAKTymDdMCgrjolUY7JW4XKo/C9CpjcDrlfGCsPY+UOKQY6lX0Fu4Da
         gSqBbKQ+Q81ukPAvTqJhnQLjdlsL4GRiiAtgLh9CabxIlDzQTfwSGzMHQ10xFB8UzeT9
         iKdEc3qILMJQFN0HFUrUcMbMCnH7B0LLKEI+Aoe3tI62xSSIRhoEsviT8oKAfa9Vo1WP
         sLmjktXINCFMT4740VbAiijHoLpmSokU0WLCQztNJRD9/QdSQN/kYfp5sdUAz+tnkv1d
         zok5JW4CotLglc6KgUC9OFEnWfiB2msmzrHX1fFT9qZoVByJGRak5tgtqOpuJyAQP3Kz
         L6/w==
X-Gm-Message-State: AOJu0YxFYrS+ozhs7jCCaDrtTEmbqzWAWe017IhpB+acu5pL/WoEQORw
	i1uESSfBXrtk2l99lBYjnUn/cE0qeikovgAgbHYGmqkOQZ/FsIZOjFkMGPJb+Q==
X-Gm-Gg: ATEYQzw9b/CV1F12A41cQzJxfaJqUS2Dipl8KQnXxeZlkneZM69X7gu8BpTROTtsiTz
	qbA4//4MKJF59+N5iTN1gEa16daDgKMLARU6vcEv/RPP58AXI0ydsTAp111gjnGvWGy9yRveIAF
	V6WNmdLb1xYxom/cnKN5EKFl/yy6IUckSRHzm2AihHc5l2XdetpDFIiRIJDikd7iMTQTh1TbwG3
	51WpCbjFtrAyTiRlrpI2uB6Y8bxSQUJpXY4lq1IUXfDRH1sGsQrktT1vjquJ90vHrUuPxUjpSFF
	KEq7v6vqjunzx+hY36pYqhFPGeQYwuiwrvaLu6qlesRMyudnsUJWE+2iHjJOSkkaogX2XGR+F0K
	5hN15oHdJqG1ukM9AE/ZvyHTtGdWFaS7b/VWzE2NoRsDKG02ytVdhgvWz6ct+Khk0BU35oVy3st
	DVErBQfa0m/O3miQBJHdzNvtznXVP+z/PfEWI3vwvyoNvSkYl3n3+h/AQ=
X-Received: by 2002:a17:902:ef44:b0:2b2:50e1:f104 with SMTP id d9443c01a7336-2b250e1f694mr60243525ad.3.1774904554928;
        Mon, 30 Mar 2026 14:02:34 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242683064sm90152015ad.33.2026.03.30.14.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 14:02:34 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] clk: hisilicon: clkdivider-hi6220: use kzalloc_flex
Date: Mon, 30 Mar 2026 14:02:17 -0700
Message-ID: <20260330210217.11168-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Combine allocations using kzalloc_flex and a flexible array member.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: add missing transformation.
 drivers/clk/hisilicon/clkdivider-hi6220.c | 26 ++++++++---------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/hisilicon/clkdivider-hi6220.c b/drivers/clk/hisilicon/clkdivider-hi6220.c
index 1787ecefe601..b35c02d3bc05 100644
--- a/drivers/clk/hisilicon/clkdivider-hi6220.c
+++ b/drivers/clk/hisilicon/clkdivider-hi6220.c
@@ -26,8 +26,8 @@
  * @shift:	shift to the divider bit field
  * @width:	width of the divider bit field
  * @mask:	mask for setting divider rate
- * @table:	the div table that the divider supports
  * @lock:	register lock
+ * @->table:	the div table that the divider supports
  */
 struct hi6220_clk_divider {
 	struct clk_hw	hw;
@@ -35,8 +35,8 @@ struct hi6220_clk_divider {
 	u8		shift;
 	u8		width;
 	u32		mask;
-	const struct clk_div_table *table;
 	spinlock_t	*lock;
+	struct clk_div_table table[];
 };

 #define to_hi6220_clk_divider(_hw)	\
@@ -108,24 +108,19 @@ struct clk *hi6220_register_clkdiv(struct device *dev, const char *name,
 	u32 max_div, min_div;
 	int i;

-	/* allocate the divider */
-	div = kzalloc_obj(*div);
-	if (!div)
-		return ERR_PTR(-ENOMEM);
-
 	/* Init the divider table */
 	max_div = div_mask(width) + 1;
 	min_div = 1;

-	table = kzalloc_objs(*table, max_div + 1);
-	if (!table) {
-		kfree(div);
+	/* allocate the divider */
+	div = kzalloc_flex(*div, table, max_div + 1);
+	if (!div)
 		return ERR_PTR(-ENOMEM);
-	}

 	for (i = 0; i < max_div; i++) {
-		table[i].div = min_div + i;
-		table[i].val = table[i].div - 1;
+		table = &div->table[i];
+		table->div = min_div + i;
+		table->val = table->div - 1;
 	}

 	init.name = name;
@@ -141,14 +136,11 @@ struct clk *hi6220_register_clkdiv(struct device *dev, const char *name,
 	div->mask = mask_bit ? BIT(mask_bit) : 0;
 	div->lock = lock;
 	div->hw.init = &init;
-	div->table = table;

 	/* register the clock */
 	clk = clk_register(dev, &div->hw);
-	if (IS_ERR(clk)) {
-		kfree(table);
+	if (IS_ERR(clk))
 		kfree(div);
-	}

 	return clk;
 }
--
2.53.0

