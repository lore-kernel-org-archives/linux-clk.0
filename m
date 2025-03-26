Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C623A15199A
	for <linux-clk@vger.kernel.org>; Wed, 26 Mar 2025 12:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742990886; cv=none; b=oEYKpo2mto12Z3AujN/Lfm5G21Fl0/QAt0Bo3rv6x94Vh4W0yC06Utee2AjgCE4P+04LeyxzZluFXZtBn4WidcH0qtdgPNqGsM3azVCKo9FnrwHb4tSbG0u7UiKlANQm+Wk0NXAFxZayClI5TEOCmk3dURNAdCA1KFIPCgzviDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742990886; c=relaxed/simple;
	bh=jjnSTG3I90Mn5Ca9Xyv++q9P6Z4yvrzjERBIMNIYWYg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lNior5O/rQjmOhPI55zgJN1AQ7UErTiUTGv0FnHQqc6E+ysWVF7yDGIQ37/gyucmSO2vU9kDB8aiSiz44Si6QZBmhIXh8BqmWKB/JBUTkCC5VNZOJJkx3C6HX2aIQpjyZYt9RJ2U6qcgBPWCCVlvVHqnnxgjNsjsU+jm1X0Pk84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b7mlnSxa; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b7mlnSxa"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-abec8b750ebso1220657566b.0
        for <linux-clk@vger.kernel.org>; Wed, 26 Mar 2025 05:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742990882; x=1743595682; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6EOvw4ltGt39X6cSYI+P/xxRhDM+qmj120OFm+7gNRo=;
        b=b7mlnSxacG68Yn+Zs3UdGrkbG3EXspdbFsoFxpILRuE109HxFjaaUvjlDsZAPvZpxL
         9yPtCF7AITdD3DEwz/V08f+7QVex/xwXrbN7mf5yIQRz2ILabI+EFPJ7ZXw+++XQpzVw
         x0j4jVH4jxQQH0JwvRNf+NBEwvPd/hmGVNKs7NAjrgPNgjiGFOQf/FLpIb2GBl6wwbru
         e+yEzpPdjaprSk8pYbGFAv84sAPlO1w3zplKw9RKD/UGQFoN6TtNWlEevvFBobitftDU
         WcYW/O7/kmT9qr52UQvHyc2ELtssW7XNZCBSWTbFWkTm8K+Kc8i53BBZjyDsNBiEzlcp
         g1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742990882; x=1743595682;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6EOvw4ltGt39X6cSYI+P/xxRhDM+qmj120OFm+7gNRo=;
        b=pm2NHas6yNeOtEmDi+uCWbXzW4obgk6IB9nTKME6mdHixCpOlrHXji75oqXo/rLaiL
         QWRxiJwJeJtm7HdakWgwiJUaaHW3jbN7tmwZ4+YGFnWnGFVIRUj4NxtSHR8/P73gxlrA
         zClnoaGqzegGT2IB/aXIgJN08RLglQBY3krv4fby1ESFQhw5nlpwGb2V6UouBP1pd7W5
         tcARzhsMsU+HsgekIt6mGtvesPif3l59Yrdc0aRqF4n+5bKC2H8jQsXDrah4a0iv3/BW
         hqtNgUmshRJIlvsM37pAG9QFcgFgMCdE1wq+BwiujljSa2iNkttn4Gd6Jvg7o6h+piHD
         G23Q==
X-Forwarded-Encrypted: i=1; AJvYcCVmH+uYI7GjIeY3hmaNALWr56gHyx/FKwFK5baovT51tdcddx02Yi9Em4jvapg6x3rBO/c3CpZT2X0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9pK8A98z5nIgQtuK9DoHXnCBiXNFqhQUg7y2hhz6ZQ2uebfbl
	reXg/N9NGG9h3abc41ouClBKtwJa9UO4laWSJUZ87ZPrjg3RQ3AKagCmH7fCsNE=
X-Gm-Gg: ASbGncsDe0nKmt1h/VVyxtdLEjZkf0mNXpB6PE/zH4/3DGLQbcZMxV4uKRRs5ZUwnC6
	aAyPU2rwZbIPyW3Sw3hKO2L6LyEV0n5vxs6aXh0M4gXeDUKfQIfxy27bGTB1xYzpwo69Z+31pOW
	UG6t6cVluhXcDZ03aNa+28qHwCMlfAPsVVcOWeGxRWh9mtGWz8ijtH6j70P6cQr+UiPDya15rvY
	5BWaIgDji9q47sTF7iqteC89kMzPHrYq4yFG/udf4rXqkiY7fp+9wdpl5hf1AHO1aKkPDQ95mL5
	zxi4570gIHuj5YE7zeq/vsFhzDICVKWA2t5we/yGgLJ/dYRm6JRoza82GJnyRpDneSI//PwgbwX
	uZbc0VZDW6EDfsTA9CpxByvuP5gkRadb5mK1dYqI=
X-Google-Smtp-Source: AGHT+IFpDQ47OkR0lnhRuhDWvB2zczsji7a4MYoKTE4Oj7Ls7vmFXhE9PL8k1vAEh0QTa7oPWlII7w==
X-Received: by 2002:a17:907:9694:b0:ac4:5ff:cef6 with SMTP id a640c23a62f3a-ac405ffd0f5mr1438770566b.31.1742990881985;
        Wed, 26 Mar 2025 05:08:01 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac6ef561e4csm59334466b.119.2025.03.26.05.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 05:08:01 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 26 Mar 2025 12:08:00 +0000
Subject: [PATCH] clk: s2mps11: initialise clk_hw_onecell_data::num before
 accessing ::hws[] in probe()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250326-s2mps11-ubsan-v1-1-fcc6fce5c8a9@linaro.org>
X-B4-Tracking: v=1; b=H4sIACDu42cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYyMz3WKj3IJiQ0Pd0qTixDzdZEsDS3OLVPOkZAMTJaCegqLUtMwKsHn
 RsbW1AHqshmBfAAAA
X-Change-ID: 20250326-s2mps11-ubsan-c90978e7bc04
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-hardening@vger.kernel.org, 
 stable@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

With UBSAN enabled, we're getting the following trace:

    UBSAN: array-index-out-of-bounds in .../drivers/clk/clk-s2mps11.c:186:3
    index 0 is out of range for type 'struct clk_hw *[] __counted_by(num)' (aka 'struct clk_hw *[]')

This is because commit f316cdff8d67 ("clk: Annotate struct
clk_hw_onecell_data with __counted_by") annotated the hws member of
that struct with __counted_by, which informs the bounds sanitizer about
the number of elements in hws, so that it can warn when hws is accessed
out of bounds.

As noted in that change, the __counted_by member must be initialised
with the number of elements before the first array access happens,
otherwise there will be a warning from each access prior to the
initialisation because the number of elements is zero. This occurs in
s2mps11_clk_probe() due to ::num being assigned after ::hws access.

Move the assignment to satisfy the requirement of assign-before-access.

Cc: stable@vger.kernel.org
Fixes: f316cdff8d67 ("clk: Annotate struct clk_hw_onecell_data with __counted_by")
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/clk-s2mps11.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
index 014db6386624071e173b5b940466301d2596400a..8ddf3a9a53dfd5bb52a05a3e02788a357ea77ad3 100644
--- a/drivers/clk/clk-s2mps11.c
+++ b/drivers/clk/clk-s2mps11.c
@@ -137,6 +137,8 @@ static int s2mps11_clk_probe(struct platform_device *pdev)
 	if (!clk_data)
 		return -ENOMEM;
 
+	clk_data->num = S2MPS11_CLKS_NUM;
+
 	switch (hwid) {
 	case S2MPS11X:
 		s2mps11_reg = S2MPS11_REG_RTC_CTRL;
@@ -186,7 +188,6 @@ static int s2mps11_clk_probe(struct platform_device *pdev)
 		clk_data->hws[i] = &s2mps11_clks[i].hw;
 	}
 
-	clk_data->num = S2MPS11_CLKS_NUM;
 	of_clk_add_hw_provider(s2mps11_clks->clk_np, of_clk_hw_onecell_get,
 			       clk_data);
 

---
base-commit: 9388ec571cb1adba59d1cded2300eeb11827679c
change-id: 20250326-s2mps11-ubsan-c90978e7bc04

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

