Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC9E344DA0
	for <linux-clk@vger.kernel.org>; Thu,  2 Apr 2026 03:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775099095; cv=none; b=hlPAkj2eSoUi9G3ytDk5qp0TVQJp0poPCzE82RO3gLXbDs/SEs4jt8+y9/hDv+Mh95NX6eVu7E/BZeEv7ZBJP/JgItE7QwDUAj3SVP190NKvM6GPMO0t+bXkKxFxFoWHWcyl6+wa03AtRDoFJwVHZGCkefg9I61QO5uel8wGlIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775099095; c=relaxed/simple;
	bh=uNa3V+l2+zMvQBRPMDJlv1PjVBSkIBsWCPDk3WYqUHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b6/Zj0A3LRhsKRimd4V1GAZNvRB6mXPzJqBqJLYiIgLSX0RqX4XNJmpyM9ImpHGNHU4ufHzT5ifYU97XMVzXYOTGmrQ+up3z2UHHDONreF7GQwYU7rxSKCimEkF9W5P7QyC7PHHmZ3LHQhEGEaPmcbht6jj12gKKWOFVmfHh/GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OYhBndW9; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OYhBndW9"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35d90833cacso184076a91.2
        for <linux-clk@vger.kernel.org>; Wed, 01 Apr 2026 20:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775099093; x=1775703893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u0ucHKBOty4mZVVfHvLn6hix9SbADzLEqJq1CauEJu4=;
        b=OYhBndW9zZGJBS2rebGgm5kyBN4rBegW/DNCCcbc4jDOK2sybbphlOY05o1fYyw1jI
         HVYdyX4tvuMgqMNFtWs/ZEX9hdH4rW5kVxaJQjQ1nDsZJ6I2qUKYF3RCxRwD29KNCcnM
         6HJWbmwZxG6wLpjzuP38mzBh8CS5ue5wT29jSXkR/7I0tRbuwL7lUmAQeCj4OeE5KeB2
         b97GuwYhGk7ctDmaRQFkSHSw0UI37zuk9VVTrouLZaYIXqKwcKlvcdXFCx7pdWZa5P7S
         7LAX022qqD9oecqSDREzy7tREFl1IC1RwsAFjHACxLsvURGSxOb7m409v+LBE+WYFKA2
         +L4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775099093; x=1775703893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u0ucHKBOty4mZVVfHvLn6hix9SbADzLEqJq1CauEJu4=;
        b=OmqCYxqeKeWNz6y/EHiSRTr21cLwvqXXHUbykyL9P5qq3FQjy/ZyFo7a4Z8LifSMoH
         pTLHiqUCfIG9vbJmgE+6JdDDRHB2QfuSq89eViyUPuaxkJgq2/pS+H5Z62BLWT4ZKw0n
         numXDG7bHYGC57bp2BuRCirIi/LG1mWsYV44v95dB1g6AgpmuLoCL70YZpVvoXvmZRwn
         U/OxuTdNt3Ym1Wvd5JhJoL8KGqaWvqC4YcWanwubWiKdzhmcE2y4GgYuA46blcGvnpFd
         FLksXjj1juSVrfjmXFtlGzERRsI5a60Eex8KY1UkX+GzWzip5iZ5UF50hx2TBlQHPk6N
         cdMg==
X-Gm-Message-State: AOJu0YwpoQKw2lHR+/ywtipuX2Cj72NQcJbUvB5m7bu2vLU6uiqEF6Lz
	D+YM69VS9e5w58nYs4QKfPJRUlMhm0LzbEvsVigpan2AHF5NAh0NwVEc3VPtDTEv
X-Gm-Gg: ATEYQzwD1WZGcPpDRX78y0KWq2aMyr1ocvYHyhlVjuwac5nLJ9I5B0/Aa+RW/LqNGOO
	aDW5MxOKtm8NdGjyyzEHx75IUHQ0C6OUJ6Hgl79V+quhsjB6kzVRrG4iJ9VI29lrXCwvffq8DJ8
	hNJ+yk4qivkziBWhpDGZOVbmznagy1WC/FqkkyELV6a/f7TlHsbgSNicGQE1PCHCDwjotcwL1+n
	gpDqpD57/GERhWgNBYnL+TI5fqqp9YMuscMId9tJTU7eEl8SQcqCPcm0bE70A7FmRsUoNQjgDTO
	J1wrjbHMzAxr1rdogtjQ5dkKZzY2VSEVnJzYlYScfJ9ZAYAaZ6YNGq9FUzNorAgjpRzwS+pZJgr
	0no/hl/NUmx8G9tCxM8V3RYXiK0ojXCjKGYFlFWTz4+M47bJrmu9wnJ9OF3IBQ/X5gGOZlEO+xc
	+oqqTus8+RyZfR+DJPm00KT/EzevSdkHPbz9f6711uGDUCUaJi47TdfuA=
X-Received: by 2002:a17:90b:2ecb:b0:35d:9482:2233 with SMTP id 98e67ed59e1d1-35dc6fc83b5mr5204534a91.24.1775099092867;
        Wed, 01 Apr 2026 20:04:52 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe9379f3sm6395873a91.9.2026.04.01.20.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 20:04:52 -0700 (PDT)
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
Subject: [PATCH 2/3] clk: samsung: cpu: use kzalloc_flex
Date: Wed,  1 Apr 2026 20:04:31 -0700
Message-ID: <20260402030432.101066-3-rosenp@gmail.com>
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

Use a flexible array member to combine allocations.

As kmemdup_array is really kcalloc + memcpy and kzalloc_flex kzalloc +
kcalloc, kzalloc and kcalloc combine leaving the memcpy.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/samsung/clk-cpu.c | 30 +++++++++++-------------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/samsung/clk-cpu.c b/drivers/clk/samsung/clk-cpu.c
index ffc33e5decf5..ad08d6288baa 100644
--- a/drivers/clk/samsung/clk-cpu.c
+++ b/drivers/clk/samsung/clk-cpu.c
@@ -101,11 +101,11 @@ struct exynos_cpuclk {
 	const struct clk_hw			*alt_parent;
 	void __iomem				*base;
 	spinlock_t				*lock;
-	const struct exynos_cpuclk_cfg_data	*cfg;
 	const unsigned long			num_cfgs;
 	struct notifier_block			clk_nb;
 	unsigned long				flags;
 	const struct exynos_cpuclk_chip		*chip;
+	struct exynos_cpuclk_cfg_data		cfg[];
 };
 
 /* ---- Common code --------------------------------------------------------- */
@@ -660,10 +660,6 @@ static int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
 		return -EINVAL;
 	}
 
-	cpuclk = kzalloc_obj(*cpuclk);
-	if (!cpuclk)
-		return -ENOMEM;
-
 	parent_name = clk_hw_get_name(parent);
 
 	init.name = clk_data->name;
@@ -672,6 +668,15 @@ static int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
 	init.num_parents = 1;
 	init.ops = &exynos_cpuclk_clk_ops;
 
+	/* Find count of configuration rates in cfg */
+	for (num_cfgs = 0; clk_data->cfg[num_cfgs].prate != 0; )
+		num_cfgs++;
+
+	cpuclk = kzalloc_flex(*cpuclk, cfg, num_cfgs);
+	if (!cpuclk)
+		return -ENOMEM;
+
+	memcpy(cpuclk->cfg, clk_data->cfg, num_cfgs * sizeof(*cpuclk->cfg));
 	cpuclk->alt_parent = alt_parent;
 	cpuclk->hw.init = &init;
 	cpuclk->base = ctx->reg_base + clk_data->offset;
@@ -687,29 +692,16 @@ static int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
 		goto free_cpuclk;
 	}
 
-	/* Find count of configuration rates in cfg */
-	for (num_cfgs = 0; clk_data->cfg[num_cfgs].prate != 0; )
-		num_cfgs++;
-
-	cpuclk->cfg = kmemdup_array(clk_data->cfg, num_cfgs, sizeof(*cpuclk->cfg),
-				    GFP_KERNEL);
-	if (!cpuclk->cfg) {
-		ret = -ENOMEM;
-		goto unregister_clk_nb;
-	}
-
 	ret = clk_hw_register(NULL, &cpuclk->hw);
 	if (ret) {
 		pr_err("%s: could not register cpuclk %s\n", __func__,
 		       clk_data->name);
-		goto free_cpuclk_data;
+		goto unregister_clk_nb;
 	}
 
 	samsung_clk_add_lookup(ctx, &cpuclk->hw, clk_data->id);
 	return 0;
 
-free_cpuclk_data:
-	kfree(cpuclk->cfg);
 unregister_clk_nb:
 	clk_notifier_unregister(parent->clk, &cpuclk->clk_nb);
 free_cpuclk:
-- 
2.53.0

