Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794605478;
	b=nSY3iwlKCl8r+4s/+ZXp+3PpdbaDefxahtzsjmRbxVpgSznrNVdnRfD+TeysQvcUpjo+
	 ZqPfd9Oxv2+lGn3i64uCH5yvqPmCCGuPay6sYUBSH5WGYDC5sgQtdsk4txA/bfozsJ9J5
	 YNNkeMfk1hLQpK3cBEBoefcacZ1Wco01wy/usbZBwM5EptJOzTYz63e10yI5b3DWMe/GP
	 5k5u22HwLINBjmx0xvI1N9nCto1zD+RvnkzsznLUq+qrsrz3j2IuNp3SW83udyFek/7es
	 H7iBCpnveIRSi6RstxLCQoh2f06skdlS2iPZg8NY0sn40y5Z5ds6BADrDqNXgiOEX0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794605478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=kMoMcD1Lt/e75Xj6NwZBeN1pbuvertD/cK+qW6+KjfM=;
	b=C73+PKEVLjt0r16X2TyLheV601T0Y8FwWBlofhUK3PuxFNQPheuBhRL80yNB/TZMTSCY
	 8O0RMgUScz0E79ezsOSCj8cfN9dUAB0Eq7P9hLRpRYnnx57cnpRxZyGdafkWKdygnzump
	 owkv9Dd2yTMG5UgpAkl39CrqkhpOFMBv2DBHj1KwuBn8wf60K2Gt4iDNV4obcOhOEM1V1
	 p18lcplo3uPplPuwMu4o/fseWGLhqe00uEo2sH9PcC63nipv0SECB1E8xg2aPIAAoryFV
	 PKGXbEpYI5HZiKU2+SzNpo1liaZfw0Mfcf0aPpVD7iKsnhY+ZL7UMfq8SDL0US+wG4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=W0icztte;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A55606A883
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 21:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1A55606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=W0icztte
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso23748615e9.1
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 13:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794605475; x=1795210275; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kMoMcD1Lt/e75Xj6NwZBeN1pbuvertD/cK+qW6+KjfM=;
        b=W0icztteFaa6NYbT/QAMgfvslUHIGvz9Q9hJaV5MZastAiI+FLdz/e3yH+fhEBn/pc
         xuiBT9kq3STl/OlC3L1g+Bt/1ph1fZrxBZT/9WQ9eLfovE7WrH9tgQu8/d2ix61SlKEx
         ANrZGg28xLox5Feob815ZcshJq6JM5aFXbW1wHezRmb5Os9ZkviBm1TvtgjJIzW1quHQ
         FY7ZPzOF3L7xDjVGcHXCZFMKaK/iKVssyVWFNX/S3ZT6uMO+mb7vsjMYj+DUgk9wmC7d
         xaSnf0QiPf6L5Las0YvQ1K2JQlD5TJOMJe/XcopA9sKocYMqns2USzVGZ1B5wTkKD2y5
         xJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794605475; x=1795210275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kMoMcD1Lt/e75Xj6NwZBeN1pbuvertD/cK+qW6+KjfM=;
        b=gIhcrAzhi6pMyvh3ZiHSSIMErc4G24icu/NGDGidqqBecD/x/oRytrLkF0ebq7vvUe
         icyMuf5S7ASBmC6J9cdIi+Ffnp92O9waCPbdDdLBceoOjc9IsjcxecPRdZr1QmzgWTyv
         0flV2RP+gkwZ9Tfkflr/SmphjZSP7Rog83ZVnO4WO+wUkc5WR09bx28niocAdukypwxI
         f+lWWpIAnv5fIhy5nfN+aPHN3XL/j+mSZdp5LdkcJCYe5Iqd6Oe79LMKJJGlCT7Bbkh5
         BDK46BstcQAVO8yo5aInczVh2/XgiIBbqxss5d4q6hk4BgLdCyfRRaPMIKFdY/so+kbF
         rEVA==
X-Forwarded-Encrypted: i=1; AL+hErFOHsu+JFgn77m/RTWAdb6ZJ4j+z+rRZMp9jmqyjImzr7LiZSfhaHPxhOQNnnlTf88tvU3HFkReUNs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wsA0WjI6Q7S79LhD1/eLlj6WMHqCXf6tGyPrgAKLeKi598SOu
	ovV/Sd14CDhziHvlKrwaoazw3OiydsaX8sjbnwJh+ysFFeGtwC7PeIA6lrXIfHTOnZQ=
X-Gm-Gg: AYBFou2ZqFYXxf6nRZqY0ojlYS5mckOHWtI+SkA6Uuev4LQDPvwGFwg0mHawG/GUOjr
	ks/vEjXK4vARsO2wZHzoZLT6NCq3xO2qrBhMsH4XYhVmt7jYne5tcgUJoVskocbPqo8o9DqitL2
	VnyIhYVDKAiBSvS1+xRNLrIZjjJZCmSlwd/tnanbCD/WdvRmHJ39oSn6fwRzFlNjiEnvU5rQsTx
	MGGcFFhjhgN0qmD1AUYaDrs+o2gXYpbtfS8lwL2JsEijYYdWQD7HrFHCK/4038xT20lHI+pa9c9
	7hIC7JHyQpgYEqiSRV8MsSiPy692Q6Iz39NifuVUCJ8JqERabOrz+mw0R6cKX2MUlVDBBr4q4I6
	3OgkmT4FR2Ya4hzCfV9GxyvOiG9UPZEckwcnZ0RyEWR6eDydHaeKW2Py7mMPASv3I8F2rKbXwgb
	k/hvve58lZgFQ5TEcFs9V5Ut5YgKfrAq4pvveMH6wDPdWkzVMHaXYEk10pGHz4J+i29q70HKzZx
	cKHEkSEpXWdDoN9TO7DPAESZZ12krF25eOb3OIxyu43XL9YY6CX3AxkKVvtNZLVwKUviGi2hH6q
	q5N3CjuSArxqgmmwfuUwKHRafG9iWtFOdezYbhW22oeJg5SsvU/XgjycqEZA8zusLsOv0Ctk6JI
	o04rasEC7pBtbZUwzXrYDKncNdQ==
X-Received: by 2002:a05:600c:46c9:b0:4a3:d327:6ed with SMTP id 5b1f17b1804b1-4bb55a5fdf6mr84563715e9.17.1794605475200;
        Fri, 13 Nov 2026 13:31:15 -0800 (PST)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c8a77sm7447727f8f.49.2026.11.13.13.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:31:14 -0800 (PST)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Fri, 13 Nov 2026 22:30:47 +0100
Subject: [PATCH v3 1/4] clk: ti: fapll: remove ti_dt_clk_name helper
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
Message-Id: <20261113-patch-ektor5-dm8168-clk-v3-1-a42cd1edc5f3@linaro.org>
References: <20261113-patch-ektor5-dm8168-clk-v3-0-a42cd1edc5f3@linaro.org>
In-Reply-To: <20261113-patch-ektor5-dm8168-clk-v3-0-a42cd1edc5f3@linaro.org>
To: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Tony Lindgren <tony@atomide.com>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794605472; l=2570;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=FcaXkSbmbLoEIeujNjI02i1V62uXoYWuhvh7robgIBw=;
 b=yLzZpIemdaez6TzWeagpbhxQd2QIPUczwuLxkq3FTp3SnHfFkFs2ln3YalKRTVg4zPqtLR4Zq
 gaAXhu0n3+tB3801Yk1hXh8pMvLRuRWqQDG22Hw4QL2NW+kQgCF34IM
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Rouven Czerwinski <rouven.czerwinski@linaro.org>

The fapll driver uses multiple `clock-output-names`, so we cannot use the
DT helper in this driver because that would assign the first clock
output name as the parent name. Otherwise, the clock hierarchy would
look like this:

        main_pll_clk1       <--- main PLL should be parent of other PLLs.
           sysclk1_ck
           main_pll_clk7
                    ...
           main_pll_clk6
                    ...
           main_pll_clk5
                    ...
           main_pll_clk4
                    ...

Reverting to not using `ti_dt_clk_name()` solves this problem, assigning
the correct parent.  This change do not affect other SoCs as the only
consumer is DM816x.

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
2.56.1

