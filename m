Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83194327204
	for <linux-clk@vger.kernel.org>; Thu,  2 Apr 2026 03:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775099094; cv=none; b=ISjZkNAzxbNa/8rx2Fummq1DRskcVC7m7pWt/kkgq330I7++rfbpeu34qSblILZ2jJLLsSVYywMl/XXIWV1PnMMJ8ZRpW6G0SAnmMSysxUz4wCmtXGqlXwEM+4gWSERyhNGhuwXblNzeD6SgsATHbUnGiZYwVsaS4EAUeEjp20A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775099094; c=relaxed/simple;
	bh=VQV+QM3Ctswdo3o0HH0281fe1YsqIhLjc2B6oZPbNQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q4pdocPoT+JKNzezeFOqkZQmYx5cTWduU86lt79ojqGtUygev74+y/r2jmOGmcJy0wCJceGnJsJL3XgpbQbD/0C4ctaaX1DpM+EmamuscmQob0dONqCQBrveDGziYD2f5xzcQJnlcnux9YbWkaHM+lRex+Yzx819oDSUIlku65w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QFX22hAr; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QFX22hAr"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-35da9692ec3so324154a91.1
        for <linux-clk@vger.kernel.org>; Wed, 01 Apr 2026 20:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775099091; x=1775703891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EyR0efC7OyNfusuoJO8aWY+L0AWdVHjCgZDwzGoX9xc=;
        b=QFX22hArmIhwgcTsb0lM6iFVaEZe/hWSfRygtHqgwzsUp1JfZ1LkOaB+zUSLWVzcjQ
         sYjYh39SgldFoHbCFUk3TJht7SXaB0WS/w/iiik1qHUw/Dk9tMF+efqCv1hAb9JYDrw7
         LIRjNbtsSA2y5zEbnUv7xG6DBgV2bf8mWO+v8TLno81TxVXHBW/m3NdorL7IxbLGkkxX
         E2I7UN/Nh3iwjauhNcAbZ3riD4kRGvZ7XBa9T/vbiLYiHA79nUuVvaftZ7QSJlAqE2qy
         3i6Zddjtq36OI4KSGPkztW8kCcbqzR4VdfAU7g378rIU4x91E0pFRGwFDBmVNVAx0oeY
         ejNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775099091; x=1775703891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EyR0efC7OyNfusuoJO8aWY+L0AWdVHjCgZDwzGoX9xc=;
        b=BRXYJNR09iUo7kxzTw81SqZXk4rR2cOOVi3LJKPKJtB3imqxAw0Ud9EPGavNqQpnY5
         zRGnIImv5o173tMlHTZ1h1CxyFXCQ0oZ2T+9VRkQP3iSRTL995ICeCLQdeqCmi2QTPXW
         +mxPOJYM+OCMYiTz23kvkDUsdF3rnZrvkdjCGHG2Cllcp67M2OgMTbB6ku0MayB2/Dxj
         bEqH/mtR21klKxSLTcCqXYwOgniDaMQawnMr4Q5xzOWfT7726rKMWsgZN2+2j6k2rbsf
         VES87cq3x1/k61/JYbQB1A7gQoN7H10YnLjeEIzeo0aZyGZIJOK+RHaEMcnY+XshBuqX
         11/A==
X-Gm-Message-State: AOJu0YymUUsHmap8IBoOvHv1bJFB6X8NVS5NqMqEMf19ZAoj/Ym83pAf
	CMpNAQ72HVZJf1Cq4r8GJSEJnt9dVwF4UJcjeRARHggcd2vKfKY/ZxCB51MN301o
X-Gm-Gg: ATEYQzxjMXhqmULjwMYJ/84/YbwfZ6z0SAsnOiaHvAXkSfGpcLwxtANkbETm5uHAVeA
	YAgkHlw/rU6AsWFfAZrFarXHgjtAvYNY9kEUvOAZHNOo5MEAeuQBpaMwPsiDgrxnZpqJ+H9nHGz
	nOh87yGNQd4y1ynOI7gVA0YD6CJ92rnVJC46q6K5y4nTu5kYXH6nOxwvbRRoRZyY+iWJ5/LyjrR
	5c6ydowwKNxpgrJMUFuJ1GI89IkKUeSUrWyLaXImZZkAn0/GzGDQgFdCNJIDBJuPqFsX+Gvdrxi
	MHN/XlysEB+hWi4DNpjnbvECRhI1TIocXdiZG6QS2FCPcIUxy6T7KXLry/gxWwjiiMGUbhyJVrq
	ttvFv0FAiF6koXXsB0tgrsrSPi1n+lOCSnjzzbetHukjBOrRC1ILbyv5UXcd3Eyhpjm/Vuutedx
	csftcGHX1jMCg6+5C8/6edKyrlpWQxw6/rov0YpD9LSIghms1J1O5s2EY1Mf7jPkY3xQ==
X-Received: by 2002:a17:90b:2b4e:b0:35d:aeb2:25b2 with SMTP id 98e67ed59e1d1-35dc6fdd655mr5707508a91.27.1775099091470;
        Wed, 01 Apr 2026 20:04:51 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe9379f3sm6395873a91.9.2026.04.01.20.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 20:04:50 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG SOC CLOCK DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH 1/3] clk: samsung: use kzalloc_flex
Date: Wed,  1 Apr 2026 20:04:30 -0700
Message-ID: <20260402030432.101066-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402030432.101066-1-rosenp@gmail.com>
References: <20260402030432.101066-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify allocation by using kzalloc_flex with a flexible array member
to combine allocations.

Add __counted_by for extra runtime analysis. Move the counting variable
assignment right after allocation as required ny __counted_by.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/samsung/clk.c | 28 ++++++----------------------
 drivers/clk/samsung/clk.h |  2 +-
 2 files changed, 7 insertions(+), 23 deletions(-)

diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index 91e5cdbc79d7..12028f13e8e8 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -48,23 +48,6 @@ void samsung_clk_restore(void __iomem *base,
 	}
 }
 
-struct samsung_clk_reg_dump *samsung_clk_alloc_reg_dump(
-						const unsigned long *rdump,
-						unsigned long nr_rdump)
-{
-	struct samsung_clk_reg_dump *rd;
-	unsigned int i;
-
-	rd = kzalloc_objs(*rd, nr_rdump);
-	if (!rd)
-		return NULL;
-
-	for (i = 0; i < nr_rdump; ++i)
-		rd[i].offset = rdump[i];
-
-	return rd;
-}
-
 /**
  * samsung_clk_init() - Create and initialize a clock provider object
  * @dev:	CMU device to enable runtime PM, or NULL if RPM is not needed
@@ -430,21 +413,22 @@ void samsung_clk_extended_sleep_init(void __iomem *reg_base,
 			unsigned long nr_rsuspend)
 {
 	struct samsung_clock_reg_cache *reg_cache;
+	int i;
 
-	reg_cache = kzalloc_obj(struct samsung_clock_reg_cache);
+	reg_cache = kzalloc_flex(*reg_cache, rdump, nr_rdump);
 	if (!reg_cache)
 		panic("could not allocate register reg_cache.\n");
-	reg_cache->rdump = samsung_clk_alloc_reg_dump(rdump, nr_rdump);
 
-	if (!reg_cache->rdump)
-		panic("could not allocate register dump storage.\n");
+	reg_cache->rd_num = nr_rdump;
+
+	for (i = 0; i < nr_rdump; ++i)
+		reg_cache->rdump[i].offset = rdump[i];
 
 	if (list_empty(&clock_reg_cache_list))
 		register_syscore(&samsung_clk_syscore);
 
 	reg_cache->reg_base = reg_base;
 	reg_cache->sysreg = sysreg;
-	reg_cache->rd_num = nr_rdump;
 	reg_cache->rsuspend = rsuspend;
 	reg_cache->rsuspend_num = nr_rsuspend;
 	list_add_tail(&reg_cache->node, &clock_reg_cache_list);
diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index b1192ca03db5..098f27a6290d 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -324,10 +324,10 @@ struct samsung_clock_reg_cache {
 	struct list_head node;
 	void __iomem *reg_base;
 	struct regmap *sysreg;
-	struct samsung_clk_reg_dump *rdump;
 	unsigned int rd_num;
 	const struct samsung_clk_reg_dump *rsuspend;
 	unsigned int rsuspend_num;
+	struct samsung_clk_reg_dump rdump[] __counted_by(rd_num);
 };
 
 /**
-- 
2.53.0

