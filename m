Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EE7296BD1
	for <linux-clk@vger.kernel.org>; Fri, 13 Mar 2026 00:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773361303; cv=none; b=vFYBlh2gVBprbdQpAE/EQgTP+H8XcnATnTgEJvcXyGuYSpgeJNDpAGwVFcMgCetchxv4EhToIR4vo2XZBU+rmHrAtDekZ34NylfrXoH8nGr4YkKOURBlTAMABT/kZrimSkLYmWgFr8JAtdIfHJKRN1khbtnKO7nI8YvGP0Y4/Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773361303; c=relaxed/simple;
	bh=1YMiY7/Zot15ra9DuC1CUpjFsA44TAxwB5BjF3e8+FE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h7lpR3lejAeygScS+WUd980ECMTfAfTYWgjdKZFvwlyxU2WXTZsL2NTetih5ABvuMHWMFoUXColbjGYctXKcSAxY3h0VVepfSXD6aw+Whs7X9GmHdhpJgywJ8rzbyQ3xLqpOG8lgOCFGSLBQT3RDc8JT0z3RXM5LYSSoYcNwfEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JpDjyiOs; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JpDjyiOs"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7991db3dc98so16626937b3.0
        for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 17:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773361299; x=1773966099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PeETB9eQltddP5mF2mJA8o9tnQJB7YnT8JvFDCE8DGE=;
        b=JpDjyiOsfK/apRe83gzVuB21pDPIfiTt/JP41PuJV1odsJv0jQuPsjZUr7PQa7hdCU
         qJJ1JK+Hsjjt6R54V9zmcb08moedlPSk/8Hbtm58+iGPg8WVxe9IF15b6sowI23hm/Fo
         xx5dbv4vbWP2va5ZTil1s1Jh7bXmgNlmoEn7Qm2QrI6bjHX1rE2c9twg4fDBFLJVGb1R
         WTDphYV8ja1+7M4G+5iv5Ofsb0Q08dRDUepVqT2d5VN6UGHnDpiCVjtdliumfhf48h0z
         aGzwObnN/+jWf6UEbyD8+dFvlqmjax+YK5Tp7P9zG4w1coNt1RcqWhCjUsabLQZgNXIN
         OGEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773361299; x=1773966099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PeETB9eQltddP5mF2mJA8o9tnQJB7YnT8JvFDCE8DGE=;
        b=IhUvOGFgmjxQN8iAc5jUq9X7haZdtd1Byr/RaqrFFLz7VSjwn8GaJ1uAHBjV0icetK
         p5Y5IFYW0Sp6w+q/PrqjeHtpwMtNh1B6SdQqvszlzs7K1M0xbW52s6BX9Wsae58AFYVs
         ea61eYzu1apEqZkBrjSvfgc/FUuC35zAjfazItPCRUwS9pVnHW1t+HDbklRlMolLm/vb
         BEwmp+lOmHO5CU2tfWSXEhqDDKXFjvw7DOrY2HxeoSbtYMN3Ohw3Pz9eED3jBLIrfxUC
         zvEGpocG2c5EBe2n4iruwZBSJXZxp/H0BpWa/GMzR7y5Iaay7s18k54+mJgwaYSk7D2q
         noXw==
X-Gm-Message-State: AOJu0YwXiel9rRL1hD0gep+qYB9IyKUci4POK2Elvf9d0Xfrgat2ZP4P
	t+PTBS+clTUhWR5HjA0FUkjxy93cWxPaKWpc5is6oMdO5/Gg0OUPLu5c684cqDRp
X-Gm-Gg: ATEYQzxNCdrZWpfpsXXY9PHUjfwq+rdubwUXgrAmdtenIfC5FQPSMdrHPoaTtqMzgHc
	asNmc/wqVPgdOszZ0CIEtRdaqcewx+LuWak9osDlQ6Rk24sWTVmMRJRA8UOEE1n5Uwr3C68dLE8
	yHrvixhki8MsTvAKqCyQxf4NNk298+SANeWyZzsRFkPcDq4f/4dT9M6CXCymYPH1ihY1dMb9WwX
	sbeuz13nq2O0yPXImppqqSZWhLKHgWZX9QFhvWPnRS4tQfv2p/5+XjC8tXUseo9PmSrF4JvDahg
	KEbq2Qz5WX7wUofIu+YTW4BVb6kpDjOqn/vcJUyQt4ZPmTi4+cm/1nwZpOkXAAaUSzPNf3INfuI
	iRVfUNXMsj1dXg1/WlB91i+/MORO7TuuBMcT4c9OjgxMEdruZ/3vbSS+UhE9fcQEZnxOrQvEpr0
	bpaKwVacQl8qegzH4PZypV/CGjdsSlDoG0/nTWQrbnhmUxY55a3xme4AjQzvqPPAtL
X-Received: by 2002:a05:690c:c155:b0:799:182:17bd with SMTP id 00721157ae682-79a1c0e1676mr14239947b3.24.1773361298678;
        Thu, 12 Mar 2026 17:21:38 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79917f1ecd9sm39089407b3.45.2026.03.12.17.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 17:21:38 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Microchip (AT91) SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] clk: at91: use kzalloc_flex
Date: Thu, 12 Mar 2026 17:21:19 -0700
Message-ID: <20260313002119.118962-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert kzalloc_obj + kcalloc to kzalloc_flex to save an allocation.

Add __counted_by to get extra runtime analysis. Move counting variable
assignment immediately after allocation as required by __counted_by.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/at91/dt-compat.c | 15 ++++-----------
 drivers/clk/at91/pmc.h       |  2 +-
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/at91/dt-compat.c b/drivers/clk/at91/dt-compat.c
index 5d543e807843..5c88cfafa31f 100644
--- a/drivers/clk/at91/dt-compat.c
+++ b/drivers/clk/at91/dt-compat.c
@@ -548,7 +548,6 @@ of_at91_clk_pll_get_characteristics(struct device_node *np)
 	int num_output;
 	u32 num_cells;
 	struct clk_range input;
-	struct clk_range *output;
 	u8 *out = NULL;
 	u16 *icpll = NULL;
 	struct clk_pll_characteristics *characteristics;
@@ -568,13 +567,11 @@ of_at91_clk_pll_get_characteristics(struct device_node *np)
 		return NULL;
 	num_output /= num_cells;
 
-	characteristics = kzalloc_obj(*characteristics);
+	characteristics = kzalloc_flex(*characteristics, output, num_output);
 	if (!characteristics)
 		return NULL;
 
-	output = kzalloc_objs(*output, num_output);
-	if (!output)
-		goto out_free_characteristics;
+	characteristics->num_output = num_output;
 
 	if (num_cells > 2) {
 		out = kcalloc(num_output, sizeof(*out), GFP_KERNEL);
@@ -594,12 +591,12 @@ of_at91_clk_pll_get_characteristics(struct device_node *np)
 					       "atmel,pll-clk-output-ranges",
 					       offset, &tmp))
 			goto out_free_output;
-		output[i].min = tmp;
+		charecteristics->output[i].min = tmp;
 		if (of_property_read_u32_index(np,
 					       "atmel,pll-clk-output-ranges",
 					       offset + 1, &tmp))
 			goto out_free_output;
-		output[i].max = tmp;
+		charecteristics->output[i].max = tmp;
 
 		if (num_cells == 2)
 			continue;
@@ -621,8 +618,6 @@ of_at91_clk_pll_get_characteristics(struct device_node *np)
 	}
 
 	characteristics->input = input;
-	characteristics->num_output = num_output;
-	characteristics->output = output;
 	characteristics->out = out;
 	characteristics->icpll = icpll;
 	return characteristics;
@@ -630,8 +625,6 @@ of_at91_clk_pll_get_characteristics(struct device_node *np)
 out_free_output:
 	kfree(icpll);
 	kfree(out);
-	kfree(output);
-out_free_characteristics:
 	kfree(characteristics);
 	return NULL;
 }
diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 543d7aee8d24..123050b4356d 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -75,12 +75,12 @@ extern const struct clk_pll_layout sama5d3_pll_layout;
 struct clk_pll_characteristics {
 	struct clk_range input;
 	int num_output;
-	const struct clk_range *output;
 	const struct clk_range *core_output;
 	u16 *icpll;
 	u8 *out;
 	u8 upll : 1;
 	u32 acr;
+	struct clk_range output[] __counted_by(num_output);
 };
 
 struct clk_programmable_layout {
-- 
2.53.0

