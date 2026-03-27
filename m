Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4FA3016E0
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 02:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774579251; cv=none; b=N2TYAbsI4aEQcJPeCpg1k2D1pOerfLIHKQi3t4W1BeT6YIyuKQh+p7NxEybprGr7cmkQfZs/XUfESZIN+FRX8B+gIDIEW65WMO9YeuS8PjKZclhBSJup2sAdXYbh0s0Iv6adFFr4A4iwkrozG5JWYkc6u5F6VXvECdzOiQBRx4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774579251; c=relaxed/simple;
	bh=bJmhah8BO4GXX1etyw5zjhRvVTRdllFSbR0mFV7t+OY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r5Wzju9uPSbREIRD70bzxCsSXmebfbx6aUNv5Ju9YrqwZ2KSa+en/b/nVORy++O3WWKhPGhFmKMeCaCOQYgYBezN2xp3E9lCawq3nPIBwgHE4NG3mhQshLc61JnOnGAlntkkP9g/tZJStAZBDMV6Y0enL+NEDTOBIuW4XN1MFWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rjh20Zpi; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rjh20Zpi"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35a02f3b8feso796670a91.3
        for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 19:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774579249; x=1775184049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lBc2P507k1klvWCoFiMHYRRdEnQHdpFoSfRfVYfjrcg=;
        b=Rjh20ZpibS8bmuLqwyugerIhxXC9K/UVoH7D0DhGdGD4SL0C7zhRzhxwIj7a7QSX7k
         xGMoZIXBxPT4wVqmUeaAWt+TH4Uf4yOg+POWHWN6P2pHcFUTClaRs//+vmNmIIlCuiBc
         3YMOV7TNL/alDsoN0tx/fbRR9d/zLvRhY6OhGHr5EE4ic1JwTnIm83f0qrZhALSIf7qo
         tS6ePzslgn4woZsw0nnHnaqVYnyuDlfzgC9ur8Y8OOWL52nLXe4Jr1cEBjWmSXXsddad
         /T7PBVduWFO8PIE62MMLWqS3uwqIsrKGbolLdAokS+QDT4t8u3rBXTtACASg6K698Sw/
         ntbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774579249; x=1775184049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lBc2P507k1klvWCoFiMHYRRdEnQHdpFoSfRfVYfjrcg=;
        b=HGWDfITXp0R6ld+YwGJyt7WYrnmJpFRqALzztSJ6kADrcN4qHMOl4X3+ai04jqSQUh
         CLAZARZ4jgV2qc2BXO0w4nvb18Ys3YOeq+kFdlTLqXWTSNN+X57bX5fEC45/ix1U5uaV
         0auOiLulWTK8H7F7vZWH7sRQO86IfCQBfZFyro3qRXA2cEMKx7rT3rXm0LJJURP8CwLQ
         uhD1XPJprG3IUpBE+0Ac493RGzTq4kTmQn8GyJqxLn7NkvpDo1hKepU9eYpkh0Yz6C+/
         2Qeal8SfWEasfXxYXkU6UEPiaVA1YVDt2fM2CQbA20nLOR+w0hs1RNTz9uD6Jfbb6D7R
         GSgQ==
X-Gm-Message-State: AOJu0Yw/sW7LZfmHIo+sqoxamu1IxA+V/1Xa4fuD5eRNp2KMfCnMEUMQ
	DqGXJQAVM3+83GnnyIH/k49wi1G58OCczgddrKKQUeoVrMTmmW/C+TyIb4lX/q+0
X-Gm-Gg: ATEYQzyzwZvHhGMPcUrrzGbvXYnXPK8C4rMFvpdcr2EYqKdH0zmSZz4gGz5MsosZQuH
	914K05W2N62xFna4XDXixQnutxqLNCMcSXCj4SuOPejqe/GigQ7plTpl4yCn/RN2N47EbGfDnwC
	1tHDHaPlFXmW+jQvz83M07PwFLIswzZC8otD18j3uV77DxW+h5Rm5detgNxnRdsIrcGSqT6wA4O
	R0a5lGuJPyfx3swk91P3yJ5vPDBqzVhYNdpoHddDjVrmz/NU7wc5IRvFdayX258QKcvSpykVHT7
	gtiEO+UHvNWIeS3hJwv3FMs1OWUQO4f5hjP/s3s1PypllDn65T3/obOVf7VzuTBmLQWQhJbPPW3
	hXbm6rLENDhHQ4p9/gw1OdhWU55rWosQ3hz+QALrgTbUiM2fvyaCnJ/aorD97UJI4uasEYP0G7D
	yiy5LUkf8MeS7k9/fvcFFEOGsWIZ4azDRG/kCeFhTqWtT8AC2EfPRo61k=
X-Received: by 2002:a17:90b:3d06:b0:35a:189b:43db with SMTP id 98e67ed59e1d1-35c2ffa80ccmr841360a91.4.1774579249319;
        Thu, 26 Mar 2026 19:40:49 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22cba9f7sm3196073a91.11.2026.03.26.19.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 19:40:48 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] clk: hisilicon: clkdivider-hi6220: use kzalloc_flex
Date: Thu, 26 Mar 2026 19:40:32 -0700
Message-ID: <20260327024032.6537-1-rosenp@gmail.com>
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
 drivers/clk/hisilicon/clkdivider-hi6220.c | 24 ++++++++---------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/hisilicon/clkdivider-hi6220.c b/drivers/clk/hisilicon/clkdivider-hi6220.c
index 1787ecefe601..14d72fd716c2 100644
--- a/drivers/clk/hisilicon/clkdivider-hi6220.c
+++ b/drivers/clk/hisilicon/clkdivider-hi6220.c
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
+		table->val = table[i].div - 1;
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

