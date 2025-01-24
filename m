Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0AE4C91
	for <linux-clk@vger.kernel.org>; Fri, 24 Jan 2025 11:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737717438; cv=none; b=r2kO4K3lrAGIdx9Kl+PvZCINB/9cqsGTqjrjIBFxnHauGyI4bYLr0pfE/CN100adtc6+63AEUgkkfVbB3GSGu7pK6GAs08suGkOGIJ+FXHwGfgHlGzzMvftBrALMKNKC5MAKFVyGsSDJ9fXpJvMY/6rS6nnWyKFHXXSt/jFVKdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737717438; c=relaxed/simple;
	bh=9zptOK9BGQ3fQ4IWt6tQmxVxGeYtZVHhKTOywc7Kx3w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D5LPzzQmLrVdEnhxq3322HMqVH5BuqOWsHG1wr7DDqDWbMZSkdDhr8Oen26IzOR3jJWLthpTk/wpbafEOibKJ4LBPh10rcdw/GNPvmXn5WuIQwtPJpnkiPmFUI+UoofVfvXZYph78pakswDM36sTsyoKGTF7y5r9lfYfEi1gSM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=khgu4iRC; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="khgu4iRC"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43621d27adeso13031555e9.2
        for <linux-clk@vger.kernel.org>; Fri, 24 Jan 2025 03:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737717435; x=1738322235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cVXKrB+O1fh/6+48GtXPh7iohUuDCptQ4J19ggAdm2o=;
        b=khgu4iRC6CzJix4AQQDixAj6KirH+KEF0uBml61hq5gNwq93tCRyB3vbxGhuhwu3mW
         XiGoksaXzZac37UD8q71YRRdRWCAhxn6/yeHCTsxRJm/q3cZ80acg0x56o2tR7RIQvXc
         CvHwqokbX9VOaV9m+I9pDYGuxuSdvdrlefPWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737717435; x=1738322235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cVXKrB+O1fh/6+48GtXPh7iohUuDCptQ4J19ggAdm2o=;
        b=QHbY0rPtAgGja4MeSBa2DPvX0n2+Kh8M0uhPha3W7Psf9mMpcZMYGVKEItSaGNCRw3
         tlhtCFsCokWq+dUl2zQU7pkEEOO2dSpZoxO8QIbwWJxHVruBlWaSnJSIYaXAO0hTtG+o
         3ZVNtg1bD9jwJQCMkowZ4UlMt+o16KpfpXnqEIWAdwQ+P4CRDamxpuppd9T7YEUz2MnN
         g3Cjwkpc+WK8sTf/Bg0rVnjsecRbv+9dS7TWrvIV8lpXVYvyZixVeeJH2H/uyjua2m+4
         64ffP0B2zYORxRoLBkKVSMBrQSE4hE2X3ML0BeHliDsj5N5meggVhUe8RTC24iIFTQ7E
         SQOg==
X-Forwarded-Encrypted: i=1; AJvYcCUjIpI0JIUyqwIYFXeChyqdT2kv48ZTh61JkBGDbhyo4qgJJqWKQ2JifzNqnT13KmT9CfRjeL3Wqgc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5/UC0BQKornLuczaG1gILBokgJnfqKtLXY/cYLl7xNOlZQEJW
	MDC5XhF14WVcR58UhbMPzVfkCA8lHiUuIqVsi164M71yZ7owPlkr60PTyzaAXyE=
X-Gm-Gg: ASbGncu5/uMyFOzw9YEMjYJ4WHbEbCI3WpsHTPNkHW7CDy/5mvRF8pHtggCL/8rhF17
	ELfu3tITUrzMrMLkCorzzFhQk3UuXtZ+7o97mpDLU59GthZFDQSX7j1ROujIIw91ofW7M5z8/7F
	uCOzFcnm+mDRmzVKEAmoKmUERpq5wZHfofRHLC9+GASOYUVT729EAQ8aFTxw5rrRSLjtW4SsPXT
	tTVur84Rl/QXdeVso1vgvf+Ns8mxxL5OV4htVLj9LsRPyWkpIg6oNppzDqaVy94svjg54Sysmj8
	FwtmKLGfDZMx4j0KzJ4cXYfcQzGXcZrMSjfAKOHffQ==
X-Google-Smtp-Source: AGHT+IF7P9coZufZpIyRLi78wcbOmVrALszhypBmaNuECTkf3A9PTixnF+7VqbmWI7lij1JXG+mT6Q==
X-Received: by 2002:a05:6000:1a8c:b0:38a:888c:6786 with SMTP id ffacd0b85a97d-38bf57c063fmr27161921f8f.52.1737717435139;
        Fri, 24 Jan 2025 03:17:15 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:a445:7786:b555:5259])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a188bf5sm2431547f8f.50.2025.01.24.03.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 03:17:14 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] clk: stm32f4: fix an uninitialized variable
Date: Fri, 24 Jan 2025 12:16:54 +0100
Message-ID: <20250124111711.1051436-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable s, used by pr_debug() to print the mnemonic of the modulation
depth in use, was not initialized. Fix the output by addressing the correct
mnemonic.

Fixes: 65b3516dbe50 ("clk: stm32f4: support spread spectrum clock generation")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 drivers/clk/clk-stm32f4.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
index f476883bc93b..85e23961ec34 100644
--- a/drivers/clk/clk-stm32f4.c
+++ b/drivers/clk/clk-stm32f4.c
@@ -888,7 +888,6 @@ static int __init stm32f4_pll_ssc_parse_dt(struct device_node *np,
 					   struct stm32f4_pll_ssc *conf)
 {
 	int ret;
-	const char *s;
 
 	if (!conf)
 		return -EINVAL;
@@ -916,7 +915,8 @@ static int __init stm32f4_pll_ssc_parse_dt(struct device_node *np,
 	conf->mod_type = ret;
 
 	pr_debug("%pOF: SSCG settings: mod_freq: %d, mod_depth: %d mod_method: %s [%d]\n",
-		 np, conf->mod_freq, conf->mod_depth, s, conf->mod_type);
+		 np, conf->mod_freq, conf->mod_depth,
+		 stm32f4_ssc_mod_methods[ret], conf->mod_type);
 
 	return 0;
 }
-- 
2.43.0

