Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CB64F208
	for <linux-clk@vger.kernel.org>; Sat, 24 Feb 2024 20:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708806065; cv=none; b=Pxl9RezCgbTD1/IdDTPt3/BmkVO0GGQ5LTyxuByGDmMu3MORBk39zg6mS5q8Cq+chn53Hkf+oqI1mshklA87Ibp631GAiGxnfUGTDD/K/xGg+UaJj574atVudue3VoIa71XLPMn5IAGzhnAJmpn5iSGaUvd1G5/PtHWbt4j6AkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708806065; c=relaxed/simple;
	bh=1ImW2IACKGUhYJ7/rOYdyKajWLj0N3ZFaS5Yy40Yw9Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SYA4acW/kHzkLW/aQvt+l1o/7D+7mQMQK0FGXH2HydI4wouNF1KHx2/X+xsC+PXhJqRLEhEN5DInV93zaNETdQ+p2pAxfg5hkY2yl8urkdwGHsCLhkbzrTGlN8lpse5rAPLV2KF3C/hZ1xdXiOYLuihqh7/Q/3VssADhEr6+/+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qk5FAEkj; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qk5FAEkj"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3bb9d54575cso1422842b6e.2
        for <linux-clk@vger.kernel.org>; Sat, 24 Feb 2024 12:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708806061; x=1709410861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7KoDUleWCo5UKlQBGeeXR+YMlhweLkGTgyZVq03PTg=;
        b=Qk5FAEkjrBHH8HlHdVAu9FwzTs1OZcvOlRjeq5hHbGEDMWbAVC0Rp+UsrP/uA1dkIO
         hNDPTPu3Nzi1ochSmYgkPuibYyOwknfrwgAWLo+GcMkIJ3ww52EaRN7zW10zBvJOXnLw
         6sn4JAKxYdgsYWqLbV66W8cAfNaxHcdHl9KhMK3UluqNeTAGSZjPQsy+u5WToBiCn1Kl
         A+4sAwb0uJeKLVQrpskgly/cLXxMFvASYGOc1UsownmtMX0iFQQ1CWyDwvN/Ih7psvJb
         Iab/NmG4IVxl/FYoOz4Jsc2xKwkSzGO+2VXMxnMb+6pyage8G8KKFKJG+s4RP9LcVEtr
         bZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708806061; x=1709410861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S7KoDUleWCo5UKlQBGeeXR+YMlhweLkGTgyZVq03PTg=;
        b=FPanYzdy3eNF1R7mtuPBcB42u0DZSgLom7rJ7RQf4oljjs50W+3wcQOkG/1bNKhVz/
         2FrKci43m3Yl8c3t5TUOZWmzbsbu66qjRKUKqVHjId2Q2DH3In8K6chSBqEEsoWJFsjr
         dgc6cED930NiVPf4b98Hux6EkOxRE2jnFoo/pycCaUPuw/kBZSihjHsT436xfaq/Mvuc
         Vmoqatr1VHH1dZVgqgPTrymeVq16gpP7fOh3RekGMXVjpp/zKW57n5Rq9EuX8Tb0fySH
         sz3fYfvZdJINpzDoI0tlbJJapXxjxeiabtRCFEpAbWcuMy1HzR9K2E27otX8+QGnANkf
         zrkg==
X-Forwarded-Encrypted: i=1; AJvYcCWCtd38xHkqfSDzichSPpRZxgOc1DRKAS0F1SRBaBG2Y3HHhiFcjy5gZ74rLEJc6tcRHldvx1hK4Qhrrxkq9QIfF/gATH8NA9jZ
X-Gm-Message-State: AOJu0YwWjRvgHa302QhW6ls+A4R86OmX+YTiXlomQQEqQOqBE3mQ0btv
	N+jK6YU3RIUe26VUFImyxprvIIPL0RS1QUou+joSgkYQZTMZxQb8Nl8wcZf2RUo=
X-Google-Smtp-Source: AGHT+IENaAaBEvjJseobNlvF+eiZDk+l+seaHD0oo3sk7o+f/hO5ZUaGaS5Q1MrGsUHlW0icJeudIw==
X-Received: by 2002:a05:6808:f88:b0:3c1:9c5b:74a7 with SMTP id o8-20020a0568080f8800b003c19c5b74a7mr119158oiw.17.1708806061101;
        Sat, 24 Feb 2024 12:21:01 -0800 (PST)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id 22-20020aca0916000000b003c150705429sm382420oij.12.2024.02.24.12.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Feb 2024 12:21:00 -0800 (PST)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 09/15] clk: samsung: Keep CPU clock chip specific data in a dedicated struct
Date: Sat, 24 Feb 2024 14:20:47 -0600
Message-Id: <20240224202053.25313-10-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240224202053.25313-1-semen.protsenko@linaro.org>
References: <20240224202053.25313-1-semen.protsenko@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Keep chip specific data in the data structure, don't mix it with code.
It makes it easier to add more chip specific data further. Having all
chip specific data in the table eliminates possible code bloat when
adding more rate handlers for new chips, and also makes it possible to
keep some other chip related data in that array.

No functional change.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v3:
  - none

Changes in v2:
  - Improved the commit message: explained why it's beneficial for new
    chips to keep chip-specific data in one table

 drivers/clk/samsung/clk-cpu.c | 40 +++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/samsung/clk-cpu.c b/drivers/clk/samsung/clk-cpu.c
index 635ab8cc54a2..eb2b67d08f89 100644
--- a/drivers/clk/samsung/clk-cpu.c
+++ b/drivers/clk/samsung/clk-cpu.c
@@ -43,6 +43,16 @@ struct exynos_cpuclk;
 typedef int (*exynos_rate_change_fn_t)(struct clk_notifier_data *ndata,
 				       struct exynos_cpuclk *cpuclk);
 
+/**
+ * struct exynos_cpuclk_chip - Chip specific data for CPU clock
+ * @pre_rate_cb: callback to run before CPU clock rate change
+ * @post_rate_cb: callback to run after CPU clock rate change
+ */
+struct exynos_cpuclk_chip {
+	exynos_rate_change_fn_t	pre_rate_cb;
+	exynos_rate_change_fn_t	post_rate_cb;
+};
+
 /**
  * struct exynos_cpuclk - information about clock supplied to a CPU core
  * @hw:		handle between CCF and CPU clock
@@ -55,8 +65,7 @@ typedef int (*exynos_rate_change_fn_t)(struct clk_notifier_data *ndata,
  * @clk_nb:	clock notifier registered for changes in clock speed of the
  *		primary parent clock
  * @flags:	configuration flags for the CPU clock
- * @pre_rate_cb: callback to run before CPU clock rate change
- * @post_rate_cb: callback to run after CPU clock rate change
+ * @chip:	chip-specific data for the CPU clock
  *
  * This structure holds information required for programming the CPU clock for
  * various clock speeds.
@@ -70,9 +79,7 @@ struct exynos_cpuclk {
 	const unsigned long			num_cfgs;
 	struct notifier_block			clk_nb;
 	unsigned long				flags;
-
-	exynos_rate_change_fn_t			pre_rate_cb;
-	exynos_rate_change_fn_t			post_rate_cb;
+	const struct exynos_cpuclk_chip		*chip;
 };
 
 /* ---- Common code --------------------------------------------------------- */
@@ -420,13 +427,24 @@ static int exynos_cpuclk_notifier_cb(struct notifier_block *nb,
 	cpuclk = container_of(nb, struct exynos_cpuclk, clk_nb);
 
 	if (event == PRE_RATE_CHANGE)
-		err = cpuclk->pre_rate_cb(ndata, cpuclk);
+		err = cpuclk->chip->pre_rate_cb(ndata, cpuclk);
 	else if (event == POST_RATE_CHANGE)
-		err = cpuclk->post_rate_cb(ndata, cpuclk);
+		err = cpuclk->chip->post_rate_cb(ndata, cpuclk);
 
 	return notifier_from_errno(err);
 }
 
+static const struct exynos_cpuclk_chip exynos_clkcpu_chips[] = {
+	[CPUCLK_LAYOUT_E4210] = {
+		.pre_rate_cb	= exynos_cpuclk_pre_rate_change,
+		.post_rate_cb	= exynos_cpuclk_post_rate_change,
+	},
+	[CPUCLK_LAYOUT_E5433] = {
+		.pre_rate_cb	= exynos5433_cpuclk_pre_rate_change,
+		.post_rate_cb	= exynos5433_cpuclk_post_rate_change,
+	},
+};
+
 /* helper function to register a CPU clock */
 static int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
 				const struct samsung_cpu_clock *clk_data)
@@ -465,13 +483,7 @@ static int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
 	cpuclk->lock = &ctx->lock;
 	cpuclk->flags = clk_data->flags;
 	cpuclk->clk_nb.notifier_call = exynos_cpuclk_notifier_cb;
-	if (clk_data->reg_layout == CPUCLK_LAYOUT_E5433) {
-		cpuclk->pre_rate_cb = exynos5433_cpuclk_pre_rate_change;
-		cpuclk->post_rate_cb = exynos5433_cpuclk_post_rate_change;
-	} else {
-		cpuclk->pre_rate_cb = exynos_cpuclk_pre_rate_change;
-		cpuclk->post_rate_cb = exynos_cpuclk_post_rate_change;
-	}
+	cpuclk->chip = &exynos_clkcpu_chips[clk_data->reg_layout];
 
 	ret = clk_notifier_register(parent->clk, &cpuclk->clk_nb);
 	if (ret) {
-- 
2.39.2

