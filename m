Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F6814A4CD
	for <linux-clk@vger.kernel.org>; Fri, 16 Feb 2024 22:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708122778; cv=none; b=LBzfdJSvqTfa81w4Wcta+RRzAum/tdEwtJshyHYqrNSGAxjKrIZuDWo4Kov1/7YtwiNhurARfJya+dysDnLIrR9+3iLM/rUXsnRRGX4FcxK42QMkBVY8m6N46+oxhzq9jLuOcMgTzm7jpDPKYMOwWmEc5wmxHa7ko/CvWjkOrew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708122778; c=relaxed/simple;
	bh=eqZGJoOdifIJ/nx09+Uj4OtPl8hVswxwsmltU49Eusg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QJ76IAsq4GojilXqubMLf9u0OIiy7t2YAWjrXLTpSmEPSwRgPjxEeiv5gpYEllgLTA+bl1iESQtlrdY7XV9XA9NInEyqLAGR3CVIrJbDww6P8i7LeP2N2AwpuqfhbqV1J+n75PH8kcV7Lk+aOHOMevWTXGkmuIMwgMYrMf6CUgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vtWjq/nI; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vtWjq/nI"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6dc36e501e1so1649416a34.1
        for <linux-clk@vger.kernel.org>; Fri, 16 Feb 2024 14:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708122774; x=1708727574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BSXQtp/xYos/De5K15KnT8HtuCXV3FX1KoFk0gl8ZIY=;
        b=vtWjq/nIy+z7OvNKFwUITs5Vsx4DROu581jb8UvPcrZTQgRr7+L89yiOX98aBaCZwF
         Yx9KhuBZt8iK3UYF3LhoWxlDc3YnnlUBwnv/QdNoiYNl03KmtsvehQvZJ4Oaiup/Ujez
         JqCnt5RDPKOqBgUpVT5sOl0TIFnYZwxEp+Ir11aAXtHfL2V6Y5FDDr8fxcKDaFwcFvHu
         bRqidlYnTZ1EdqqXv27f8pk3nWPk1Ak+Tc1huMTKMioimzqSpSdgNVGreCz883AbHluq
         95MG0nNPc87YI6KNywevXhlJBqTp73GBIS5njaYGXHs+ooOvp1C/wOcHqAUeKApc6md4
         U/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708122774; x=1708727574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BSXQtp/xYos/De5K15KnT8HtuCXV3FX1KoFk0gl8ZIY=;
        b=EDhtTyrv8N5GWaIEHfS9ImEi4r6y7DVEwp0oKtXnL0jRyBwY169k6VGtmsAYKwucEB
         J5Io53uXxxQtEwwmzY34Yl/F8xRYa+LPuRGakewkUeC61JTaZzCTWMxz/3g59hEZ5rG2
         2eo2etwiO/aZYTzxbDbPk4mctsOEdTeHAk17R8hYk4dhhT6mPhgoeVS9UfRVBVGY3zsa
         0YEJzZxeZeZQMG0FAGRw2tcOF+a/8WRpP3oEoGwgXYfTRdBV3LKTGVfKAEGmHlkHvyJ4
         z51ODX/QLnTcQ/CYqiNwGpgOewFufcQ6sDNNrDHZRvK1V5Iaodqxg/+lnm6ZktexdXDD
         ibUw==
X-Forwarded-Encrypted: i=1; AJvYcCXGuZZdO2RrZiR25nUXxme2/vQhtYB1OzUV1/uWCLWgpw3bGD3srsOi96gen0Qku857/hY0igF1KsacgjW/A+8IGw+b2cjAXH3s
X-Gm-Message-State: AOJu0YzsLwoIFWJ0ibbk+SXd2opeGaEgLlJm1gD1Q6WIAFaiv8JRKHdP
	wBaVa2ZlvglKJEahXix0YiL5cb21cszSlchXozuh5kTDzBQCrY0pmskFhVuzXD8=
X-Google-Smtp-Source: AGHT+IF80c+KUyEOcpIptb5o8+krEJ6RGLdrgifsX5usLDGRORjlnGWJbpx/niTC9m5iauYccvVvKQ==
X-Received: by 2002:a9d:6b83:0:b0:6e2:f9fa:9e5c with SMTP id b3-20020a9d6b83000000b006e2f9fa9e5cmr6533177otq.3.1708122774331;
        Fri, 16 Feb 2024 14:32:54 -0800 (PST)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id j2-20020a9d7682000000b006e2ea96949csm141544otl.29.2024.02.16.14.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 14:32:53 -0800 (PST)
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
Subject: [PATCH 10/16] clk: samsung: Keep CPU clock chip specific data in a dedicated struct
Date: Fri, 16 Feb 2024 16:32:39 -0600
Message-Id: <20240216223245.12273-11-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240216223245.12273-1-semen.protsenko@linaro.org>
References: <20240216223245.12273-1-semen.protsenko@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Keep chip specific data in the data structure, don't mix it with code.
It makes it easier to add more chip specific data further.

No functional change.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/clk/samsung/clk-cpu.c | 40 +++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/samsung/clk-cpu.c b/drivers/clk/samsung/clk-cpu.c
index 21998c89b96d..04394d2166c9 100644
--- a/drivers/clk/samsung/clk-cpu.c
+++ b/drivers/clk/samsung/clk-cpu.c
@@ -42,6 +42,16 @@ struct exynos_cpuclk;
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
@@ -54,8 +64,7 @@ typedef int (*exynos_rate_change_fn_t)(struct clk_notifier_data *ndata,
  * @clk_nb:	clock notifier registered for changes in clock speed of the
  *		primary parent clock
  * @flags:	configuration flags for the CPU clock
- * @pre_rate_cb: callback to run before CPU clock rate change
- * @post_rate_cb: callback to run after CPU clock rate change
+ * @chip:	chip-specific data for the CPU clock
  *
  * This structure holds information required for programming the CPU clock for
  * various clock speeds.
@@ -69,9 +78,7 @@ struct exynos_cpuclk {
 	const unsigned long			num_cfgs;
 	struct notifier_block			clk_nb;
 	unsigned long				flags;
-
-	exynos_rate_change_fn_t			pre_rate_cb;
-	exynos_rate_change_fn_t			post_rate_cb;
+	const struct exynos_cpuclk_chip		*chip;
 };
 
 /* ---- Common code --------------------------------------------------------- */
@@ -419,13 +426,24 @@ static int exynos_cpuclk_notifier_cb(struct notifier_block *nb,
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
@@ -464,13 +482,7 @@ static int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
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

