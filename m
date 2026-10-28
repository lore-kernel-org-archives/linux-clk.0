Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202853;
	b=2yTJki4UR7lyOhY/SmIbXA81XNsmw85fyMcnBr30ErQBhpRDceuPlc/iGKGtlSPeABab
	 near3C5HU2lu2XCUHg2e/oUCWoQsU4ogbRv2x7F5kpvNfd1TCU697jruPJozb2hKfOmg1
	 IaB/nmS9yLaiANTMzlGCrw3IRtRcIKWQ+hygfqnM4THvTqCdq5sd5C8onOmUIoZzEnFM1
	 rQDs8YraozCOEKN1A8M9GS2MeL59HFVi92jZytGqcYPOvf4+hZS49RBqK4CPxdt9Oomit
	 9SGeMRlqnsHMA0G+fw8zb6NiG/ZoZdj3oLNTdzikfglMpC2kdOnSkYH1KhJ8id+PgfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=qlUAqcZHRmthPrXpDWxzYDUWpDG4f7VCO48jJ9/tTSM=;
	b=z2ERyqbl5wEz0gsw7sMWeMQxVB7aENWY1RJu9YLTC3xlCzDTwJ6YbAigfTD9skn1Vfx+
	 or8MKu9rN/iaeuCP3rhl6MektxU1XlesJTsYpsnjZ/pDB2BdETpZIz2rpCHX6DyzaQn09
	 pD7e0KNZTf3WrFSwPCxfKicksfc7EOPQkeRnTLM9godOYCTgVeKbqkXtXM8NRlwNuGEMu
	 tQgjz7TiBb6C8km1Fe0Lr+8LJN93tOrZF/12UaaZmnJAoyQLErGgfBbHaimTQm8YGMbCH
	 aCiQ/OleNuEpOQ3YmJDbjBbAKhr4ch9d0+ZTsEMpQt3+F61bT2IfKZ/po8Dw83ZmyZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=A6MjP7n0;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC40B606A324
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 15:54:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC40B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=A6MjP7n0
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso10477765e9.1
        for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 08:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793202851; x=1793807651; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qlUAqcZHRmthPrXpDWxzYDUWpDG4f7VCO48jJ9/tTSM=;
        b=A6MjP7n0n8j8auUnILUjYtHRaznhskTP1CETZRjLb9bk+t32K09N3rjuj44Cel/RZ0
         D21SoR/yGZT7bVQRxn+qgfq/N2SvyMHNc60dNNq/NPP8fcLGbyjGP15l0CmfIvajcHUT
         aCQ5VIHHXwThZcwcRnBTAI33iqDLKb2GBDvu8Gv7U3OYV/OGhUQfTllpKDM7kJwoa7tG
         UYeCJDfs75pMnOMEJmf7l1gByWOALQZRR5a0FGE3Wghp3Z3CLqv0qgo362zY8Dps2urg
         4u/XHemPd5m7KyR6zaPYmwbAxYEOm2zJBwjT7h8DDbtTBd1c12uJlE3O7jtEkodErLof
         khFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202851; x=1793807651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qlUAqcZHRmthPrXpDWxzYDUWpDG4f7VCO48jJ9/tTSM=;
        b=UdHuqsjMuEPBWD5Qed7j+xFkLehj7otk4wrdZwcleb4JmTEB4x5DfNA7b8R6scVevv
         9+HI8IFjs0t/ePpdWs83PUkHlCzXS9/3zwTDWsyqUAkoXWuS6R94DvUIVh/K+FJyEY5T
         ZbiVbZBuTLPP0We4RTyYfYD6KDYMWAK3IRKFGNBTfJ5U32RMuBuu0K2DIWPmpQxROyYq
         rGHrDKY0lud8fWhLBAvPSPQb4KE9cPFpZdgta3tLEMpyYOhAuY5j+iPIqijTZxZsn/7v
         tuyw8sYL9WJZYeAxVOBYqfA+dvN/6PzKgmU6P0t62M/c3yKMqLlu7YY/SDJ+49QYhKMV
         fZcw==
X-Forwarded-Encrypted: i=1; AKwUvBxP7DURbG8/Y/FMSITGK/ENpFfGlDS2T9vrsRkNSSbE5qGZyk1/vFMp/xjl/+KU2+vfJw5yuV6zMaI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLz05R02s1d/Cve/xAT4BKNTKazHgvRCOnT7LwJqSTEKfG1lZcG
	AgSvvXI/KidWBUpM2AesBWaL8ZtDwG7+beEXx59hF5KtRzsOMvUpGH2Kx/+XUsSHezM0q6BKMbP
	hzbSb4iwHZQ==
X-Gm-Gg: AYBFou2+epjkpir/ysY4lbP3NSlXTF6hglXUiGl26MKSJzU4mry90PtcnhpV57P9N0P
	Yh9NQNhBbaZVXqqwmPMdofz0CSFP7qlkcaKNZPCPqBXkcBFRIx50alN64HN1QyFFhb6QEPemFgg
	NYSgT13nBSGGgV9MmC5wwJmf8Z0wFSS4SPasFw/M7RVY8mFSE9LUEDEGlSuV1fDB+oVnTyROqtp
	UpUTa+iH+O7n72jrL1OqTXCXpRH8Cjfsjd94TUYCc6N1JIAu7SWU1KWjoO+SGuKOpvVZqiYW4BM
	uFCTeVsBdFd4Py+4n/JfdnNXFICzDKSNPyho7F4ogEiya3NdtRzxuPkVcnm/jMMnfCB+eiDudTY
	1FeukfK4XfKqanWLBf/ozBj58jwA26uAE1BLqQcPuosesXGt2XuglN8PA5P6ZKFx4tsj0j86Ji8
	7eXfKPQfRnWgP5pyyZeu/Dh+Plvkhx9bNfj4leOOXYwRRUdsymlI0kAHP/UZLtPBNpzNWQld8bB
	0WOVk/7Vdbz2LbvCqFNpyX//RnjqTrURQmtcQsbxhk10XOGGVClIUkSloccz2MPPw1Lyokygrrk
	O+mrR0C7vrPC9W1b/yW+A4nP1DfkBz/zfzZ4Ned1rWi1mjxJ2FCmbZKRsRrzmPdOfmUC+ri5QMU
	O0EnS3N6x0YGWL29fcDiqTWvFAQ==
X-Received: by 2002:a05:600c:e547:20b0:4a7:9006:b176 with SMTP id 5b1f17b1804b1-4a96667c854mr38601675e9.7.1793202851019;
        Wed, 28 Oct 2026 08:54:11 -0700 (PDT)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f3229dbsm1468515e9.1.2026.10.28.08.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:54:10 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Wed, 28 Oct 2026 16:53:49 +0100
Subject: [PATCH v2 1/4] clk: ti: fapll: remove ti_dt_clk_name helper
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-patch-ektor5-dm8168-clk-v2-1-dc6bf0fabae4@linaro.org>
References: <20261028-patch-ektor5-dm8168-clk-v2-0-dc6bf0fabae4@linaro.org>
In-Reply-To: <20261028-patch-ektor5-dm8168-clk-v2-0-dc6bf0fabae4@linaro.org>
To: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Tony Lindgren <tony@atomide.com>, 
 Michael Turquette <mturquette@linaro.org>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793202849; l=2114;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=ABvwyWZf34jMuxGuFGtYQbL5MA+37XtO7nEVwJg9AX8=;
 b=YsbRHc+3mjXFpWBUFToT1ViSmvk62je91w4y33JIgYo1glSMvV8Hyut13+0E3nQR0ot6/Vib8
 hHFXYIkubaHCA35/qWKSTze2o9bnX1QffpmMcOVQPy7jTUM02LM6v8U
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Rouven Czerwinski <rouven.czerwinski@linaro.org>

The fapll driver uses multiple `clock-output-names`, so we cannot use the
DT helper in this driver because that would assign the first clock
output name as the parent name. This change do not affect other SoCs as
the only consumer is DM816x.

Fixes: 9e56a7d4263c ("clk: ti: Update pll and clockdomain clocks to use ti_dt_clk_name()")
Signed-off-by: Rouven Czerwinski <rouven.czerwinski@linaro.org>
Tested-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 drivers/clk/ti/fapll.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/ti/fapll.c b/drivers/clk/ti/fapll.c
index e54b1df3436e..ae2f6fed10f6 100644
--- a/drivers/clk/ti/fapll.c
+++ b/drivers/clk/ti/fapll.c
@@ -10,8 +10,6 @@
 #include <linux/of_address.h>
 #include <linux/clk/ti.h>
 
-#include "clock.h"
-
 /* FAPLL Control Register PLL_CTRL */
 #define FAPLL_MAIN_MULT_N_SHIFT	16
 #define FAPLL_MAIN_DIV_P_SHIFT	8
@@ -541,7 +539,6 @@ static void __init ti_fapll_setup(struct device_node *node)
 	struct clk_init_data *init = NULL;
 	const char *parent_name[2];
 	struct clk *pll_clk;
-	const char *name;
 	int i;
 
 	fd = kzalloc_obj(*fd);
@@ -559,8 +556,7 @@ static void __init ti_fapll_setup(struct device_node *node)
 		goto free;
 
 	init->ops = &ti_fapll_ops;
-	name = ti_dt_clk_name(node);
-	init->name = name;
+	init->name = node->name;
 
 	init->num_parents = of_clk_get_parent_count(node);
 	if (init->num_parents != 2) {
@@ -592,7 +588,7 @@ static void __init ti_fapll_setup(struct device_node *node)
 	if (fapll_is_ddr_pll(fd->base))
 		fd->bypass_bit_inverted = true;
 
-	fd->name = name;
+	fd->name = node->name;
 	fd->hw.init = init;
 
 	/* Register the parent PLL */
@@ -639,7 +635,7 @@ static void __init ti_fapll_setup(struct device_node *node)
 				freq = NULL;
 		}
 		synth_clk = ti_fapll_synth_setup(fd, freq, div, output_instance,
-						 output_name, name, pll_clk);
+						 output_name, node->name, pll_clk);
 		if (IS_ERR(synth_clk))
 			continue;
 

-- 
2.56.0

