Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F401C363098
	for <linux-clk@vger.kernel.org>; Wed,  1 Apr 2026 02:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775010983; cv=none; b=QZHOlzBzoSSdWsCefQQPbwtztye7SpjNAakcQ0NBKYwqq5WxeqlGDJIcSs3ooMxKnRGmoSz4gz/T+MwFq72Mbi0eso2fP18SjZQn2kVHr9YsALqVDbRF9UymBJmfRMQgXX4loLdc3IlicXL+WLk1dwAqEaNlFJf8UlhnSL28Bvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775010983; c=relaxed/simple;
	bh=8Fh+swXdgNwto24U4ynkYJm3tITn/I2du8tk6ICetRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XLsGq/cwjyaw7HYB+PvQwpWTtqI4l+YiR/VrPJq24/UDFDW4ElBp78Xzu123H4al0muM8nt7ImJz+pXT4xTP9nB1I8Bf8O/EoC9r5pmoDcCWxnxcCOP/v3xXvN8oANZI0IbmihRkBPWwOok7jnq4IjQnVJNiFDMuM/HfznycUgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ktEACD0t; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ktEACD0t"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-823c56765fdso3066750b3a.1
        for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 19:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775010970; x=1775615770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/u3bAkQFELGFd8riivJpGH4laGns+1/mgHgCySVCkuc=;
        b=ktEACD0tE6GaAz/XGaySkpIRKVu97AhXJdD0f8+EPScWX0auFxQbQF7HPLM8OQBWin
         Dm4BuG9LFWgjb1r3Nql5N2/gitAp/B/fnW/CDq9RqmXfq7I7zIp8LpeyhHPw1msI+bfd
         78rngWocSPr54sQ85QA12VpElIkCAuLBZhH3IW5+gn4b6LJTbpxPTeyYkvuo/r4mFGUL
         TJ4FrcyDrKzR0g0n2YO9ggBLZXVDDurr/YZRiul4npe7ikvFlREmaLlQ/9bF2BBYX1ZM
         Qi2Rcqcx8G9uYimdgNSoYLDEa84u5gKsJtAmCc7GQ8hKTbyYpEIZK39386R8Y3rlgalf
         KxHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775010970; x=1775615770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/u3bAkQFELGFd8riivJpGH4laGns+1/mgHgCySVCkuc=;
        b=XDpDRu1JP9cjMJhQn0jEmbpukbYQaHG5HCxRfkyf9n/gfPstLlbULvy7ez75Iru+H0
         PCGKGuYJplAgyvYgZncoBA5mC0YgZwlA5zxIbDUXwv8gKId2mSqyxir6crNHXiC9EkI0
         hBP8EjUQhHHgjYBqsyF7RFmEnFqSyzhFRGVywVgZ0llFbaR7oH3VW56eKEC5XIGdWU4L
         AI3SF6dN54MJR4jPHuxin+/lIg8oiw9Nhs3LPY4G6Gfl/HUKBqBlAiwHRWRlir+AnBJj
         p/mXYGheKK78oqnJAuNCP2i5T0JmFSPMtuItXYkX4OaoxvqcH6/iAXCrKA+/wSI8Suo9
         mO8g==
X-Gm-Message-State: AOJu0YyQg5+vOFwPXk9MmJsLMHss4lqqzWdpApLp2UV6VFa4Kwb7tnsz
	H7u7m+U3SN/rBqH+8B7GD9wSLTXcuFiASb8U9DMjbNix1dg6bTlemFId75+0o7Mb
X-Gm-Gg: ATEYQzyQBcDArEPDHAXYQYfslkUuQ3WTg/lgiJ+B7xqBp0zI1ONE65wgy6Tt4/0gz5G
	rFJtqoIVKyO9dZvC2m+td07bU5el1l1QqSVQo9R/9LHDSBgBaIqjIKv+TpFGMhkTZdO3OmQdRvK
	LKs6WZBoAuT5qRHS10iz4W4g5qZTBmVs55NcJQclm7mg8fDKIjrX/tvcQi7ezHqLh9qkOWM8/Xi
	C3Mxs5OUypxxVuSazPeV4BtwB2FeXYOWLAbntRdp6qnm81wr89E84HeXzS1eXWWryfR+43QEQXR
	HUmwzln+dDqEgEWQYtBr3Ixi+lPjU94byXwW+jZ0zkMIACS9A3rvXLssusBtQttKdEb168BNyQE
	Vm/JnFfar7yYyVS9VGcUIVMCzkuoWtHS7ZtRpqSsj5uRmCtXFW9J2z1BTxXHZ0JhC6Te/UCBRag
	qdYdw047ktSVXnZtWV1EunlVlFri2j3ENSknG6DbDVlA7utewH6ZaCe3RJetmKTDKxyQ==
X-Received: by 2002:a05:6a00:600d:b0:827:2c79:fa84 with SMTP id d2e1a72fcca58-82ce88c2bb7mr2026767b3a.12.1775010969552;
        Tue, 31 Mar 2026 19:36:09 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca863063bsm11169941b3a.59.2026.03.31.19.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 19:36:08 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv3] clk: hisilicon: clkdivider-hi6220: use kzalloc_flex
Date: Tue, 31 Mar 2026 19:35:51 -0700
Message-ID: <20260401023551.27978-1-rosenp@gmail.com>
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
 v3: fix wrongly added -> in table comment.
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
+ * @table:	the div table that the divider supports
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

