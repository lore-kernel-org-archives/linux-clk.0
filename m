Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AE017A309
	for <linux-clk@vger.kernel.org>; Wed,  6 May 2026 23:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778110734; cv=none; b=bmEKgzuq6stfnPDZ9wBCBLkntanSYETsWxyr72Lo8BpSTaY5GARwESpkHI70U9FSaJPRGSBHqmDnRHNbVSJkjAa7TsNQhfLPSr97qeRq9vo0jRu0sfMkQti6q0FEjzj2VDcB8KRoPFAPIK+19tem/6jYNpXmdDXEGFAZCAMJMTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778110734; c=relaxed/simple;
	bh=YY+R1qr5oJy3WtrJhQmeK5L9NeY3a4lm2XE9sFQEb6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i6Zu27H2L3pzkcEZcBI4G0NaGMfwUD1V5HUrfY/+59HePJiGxEZO8ILMdiR9YR1cdHkXzypnCiNmurs3ElHKyuHnZChELqPIDNWsqm6PaeN7E3plTcseDtGLUqQJLO39WcnUz0dBWpPrt3r8Izt5s+J7EgVCxswDLV8OZHUQ3B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qktz3qj4; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qktz3qj4"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-362e30526f8so80746a91.3
        for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 16:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778110732; x=1778715532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CyuSYjZx1jLqRtBEtVQBj/M4Q/f4SPIG8RJjNTkgcSM=;
        b=Qktz3qj4FJhhAqld0ILcU9KwStIZav2c18ycDcP5aUNNmxrNDvyCPaHi2iKnfdCg3D
         7Y3b0wzasLHCDcjUpBAb5bfsFnabSeXIyhJE0ptpVJeHU+1NzouPJoDOp4dEajUvh1AO
         yBj5iIsezgcur5JPxPkenMkdnTjJgujPfIz3YL/MYASePdiHwmXKRNVTRX6r/Gj4IO4I
         cn/VCrBsrFYxo0wAXfiv5ieaVAEGotzWjnZu2xdl0Z5LmRbcs9QZs6MYTe+nycNZ1fiA
         f+xZCkfX3d3sOywiI5G6GzxL+jkEAm9yZLw8udl5tkOuBeAZDEOKStpJp13Q9Lv6aQad
         L27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778110732; x=1778715532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CyuSYjZx1jLqRtBEtVQBj/M4Q/f4SPIG8RJjNTkgcSM=;
        b=LFYxog6gRTWvWn2F4uZCI5hcEOb9m3vCp1G+RxY4EpTs92QbqNe/rVvWgwh12emZnq
         wD3hijjU7iRg/1J5+7wabfvLC1TTHVQhFnvp95q3gz9VssmPMc0tHh9H5Z37+8+banZc
         J/Amx6pNtVKJ50Fi+FwuRbCUyrsLvzrTXQrTsBgLAlO31rkojSunNb4TUMXLyO+zdhX9
         iCcctOYjDq2qyTXJRY+u993EcS1iIWe0L9tbCvBbYp+fTsAnuoepDTS1Dx0zXJJLnYXB
         Y0SqRF70/o2bTCmckg2xGM2Ju8FT3YoNFG4tFU3K1UR+gf6s5RIQL64dEbSBw2CfRpY+
         vFpA==
X-Gm-Message-State: AOJu0YwptLeAxmSEAqOGQP7anXRZcVQJPvVkSCWObM8jPr21cMDepbE+
	6wAC/86/9AckijYF2J66xc281Hzpk07lADF5plPQdeJ0PeleHlnoNR5vEKb/nwQE
X-Gm-Gg: AeBDiet9mPJcpLrLDO7e9Np+uWc2ZqTUdnf73QIgsPejFLA2cWthBgobi8k3yelFyO5
	/Wj07hxL2a3CA/mI2I7PgQHjTBKrT6qTGWeIfaQpot5uIylcdOpPpW742kU0zDaY7CY2rx5asxN
	/TWaXX7EFqnbDJ0xkcGRfRyZux++YwPGddbK70wF4g/4T9JqgHfsHJIrEmHihPppETuziIGuJUp
	VK3Po4a85FhD0AV7GCMVkFwW9/vD7K9YQozyqnHrUE0CTCzJMixjf4Pe/01X2xfK5pKoKoTGwD9
	Akelwtro57UxfsKY9fC0d7gSw30xk4OQL6aXPxhXNfbQiM/6nv7eoQ3XvvuR0ViTXY0eqD5FCMv
	YOTTsH0R+zXTsRpEdwzPcHNlblsVJJYxsnW8BRvtXNvj/xZxlyA80/TdTRtmfsYvqSq0LwTdPxu
	lyM7td6NkxSpTtC1cqpReElpwRKJixbGsE0HevZFevm3SlENtlvZqifKy0I5wSCDy8dYHuCZ07l
	KmHlKeem/1C/T0cPO4zlk9P+E2WM+CqFPltZWepUn5Opg==
X-Received: by 2002:a17:903:2b04:b0:2b4:6080:d4d0 with SMTP id d9443c01a7336-2ba798c2f47mr60722265ad.22.1778110732541;
        Wed, 06 May 2026 16:38:52 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2babaaef08bsm3471805ad.28.2026.05.06.16.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 16:38:52 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG SOC CLOCK DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCHv2 1/3] clk: samsung: use kzalloc_flex
Date: Wed,  6 May 2026 16:38:31 -0700
Message-ID: <20260506233833.178357-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506233833.178357-1-rosenp@gmail.com>
References: <20260506233833.178357-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify allocation by using kzalloc_flex with a flexible array member
to combine allocations. samsung_clk_alloc_reg_dump is no longer needed
for this struct but is needed elsewhere.

Add __counted_by for extra runtime analysis. Move counting variable
assignment after kzalloc_flex which does the same with GCC 15 and above.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/samsung/clk.c | 11 ++++++-----
 drivers/clk/samsung/clk.h |  2 +-
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index 91e5cdbc79d7..2895c77534ae 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -430,21 +430,22 @@ void samsung_clk_extended_sleep_init(void __iomem *reg_base,
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
2.54.0

