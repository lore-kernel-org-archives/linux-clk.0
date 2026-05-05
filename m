Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED9F4A2E14
	for <linux-clk@vger.kernel.org>; Tue,  5 May 2026 17:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778001313; cv=none; b=KWkX+jg/llUZl+Ax6KAZqGM9Z73ZF/pUr99g6IWRZ5W4Q50lKZoTGEHLjx/dfTz/wGoFWUepJt93NjoWzN/Lj8c3pos5hRX/ESjKhsqU0jD6yZHXyYqFEcilNXEOBVUslEdjMybN60j3SM438Prnq/wWrJH0C+Vq4N0gFvWBLVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778001313; c=relaxed/simple;
	bh=lfOOkuIV2FBobVlnnDylaAQ9MU8rXE54JgCvXidilto=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L7sjJaC++YT+h0F8/oNaWd1GfmLeSS5EoREM0NSN3vpEOD55vJTqFiVHOAAYIiP6+gNF5HSqrVZpW5YZ1C2QZRCmbSkliXdYo425mQtFr939V/ib3a7sdI/9W4SSdSuw3MxwzuuuHLu6HntcxcJSvST4BoSsp2bIQgT9y0FzcGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M89DZlva; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M89DZlva"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36528851d7dso1412699a91.1
        for <linux-clk@vger.kernel.org>; Tue, 05 May 2026 10:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778001311; x=1778606111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oU5jBJsvD6k1Jx6JWFG09TBpMXR8dm6+HY33LOBovk4=;
        b=M89DZlvatxaPVTeCDQZu8zgk3IQTfLk62Cje8BNqcKqfWvvtUab/Arqliz/ztILDuE
         AEqO4o7QYC3I0xyED17ZIYoXIQ4QEJSZRjwFuEOOpuJfekLR2Oez5pUUSvKGQMzqbNxu
         4KQI6jgcwbJgS29Rqkl+0ahQI0pLPQ7hnpp4/VEYcVqhn3AEUsQgeRGpcuDFuLZftOd5
         b01aVbvH968/dDRauVWBxdwlb3VXQtW2wPEylqsYLybw0Dmq8jIb1zeJAoWo0tyN8GrQ
         OjMckYdzvJmxpz7eBnnx21ReB4dTq35tpqdZBGi71H9cwLhvX020qWd30dFSHpmrnxGK
         dtzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778001311; x=1778606111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oU5jBJsvD6k1Jx6JWFG09TBpMXR8dm6+HY33LOBovk4=;
        b=o5lIjIBExnBbbbcI+64qF6P2gBGuyUFNTZD0q/MsGv9V/jlK9Fgzwc31O2qIiVEOXn
         JmbMsA0HMjx/iAMIc2ysledTQkOrCaxxbjarXqZE0barce35/ZnKAUwj/5u/aPSS0fQw
         +gxMd+p6VXrRXbT0STBo21aD4m7THVwsLrwew6B6MCGax4y0Rl79j9MQwBCf5nDXgi/Q
         hCx/e/b2BHnxmdeD/klSAMwx+JieX09Zt3n4GZrB7RWA/yS4Vl1QNihZNC10EHCdjlY8
         dzT5Zjx6PqnlAcI6BQ9zVehcToUlr1JjyWI9mWrOag1OOLiaS+Ivdzik541UMM+seLEl
         n+aQ==
X-Forwarded-Encrypted: i=1; AFNElJ/0xDYZ1bC17suitkQaOGIn/JvNPRpB/mjq5EQvdlUujyjRE1N06LcYoG6wwIknKF0OVAu1TY16Wqk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZLZS3sfa7zP0c4JshYSXPTSPhHQQjYKXVpstzNA1nZrVec9ih
	hpUTTcvtHugtN/jcVTFHyMVXMM76RPvNwR0vS+T1vx+XwO1YRdyg5NVr
X-Gm-Gg: AeBDieuh0STJh3lLi8wPa9bNZjKnTYPrtVA9F75qCSZe2ta94FHg5OPHrLz8gu/DL92
	PBwzjDwFl4+/tLgGjbIj0QaKYq0qMQikBpeB+hSgDyS4SbrVTWtHuSioFWM5VkwH6PM0bR8A1nn
	DS9BEMh2ShIVq+gLajp4qQUuTVaYpn2ZRKpIRo5A6Rr0tOn+0M/bcQlTtkhMT/pxUetTbmVKu2z
	G4WlWasEjbb76qNvR06QVwmtccftwL1ZhnR3k5q1Qn4vbCCf+4YZZO99DKs+HuspdmuaVu95x2X
	WlAGEeMYW/zmq52Wmqmg4/Gtw+/QIKmk0xnAQi6wZt7GxqzpVCsa0AobcC2jueIlGPvLajP8WyF
	GjU0nTqgnCX+lA2mNImz5xT5MMJvUCm72rKZTAbRgXgSRLTCcti9Yt097XG81HrALeeiVKZe5xB
	tVJsyLr79/OhizeJNYYTHgiOv5G+ePF33qMuoFsgvADjgkdc0qEcJkUKYDHsPd6dCBmhTkSU1Yy
	esfShOMWxCE63B+rOs8uMF/aMoQ7MW3nLs0EG17mJbi
X-Received: by 2002:a05:6a20:6a0a:b0:39c:643e:f062 with SMTP id adf61e73a8af0-3a7f1a1c8a6mr16302989637.7.1778001310824;
        Tue, 05 May 2026 10:15:10 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (32.237.80.34.bc.googleusercontent.com. [34.80.237.32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbbbf298sm13414509a12.13.2026.05.05.10.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 10:15:10 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: peter.griffin@linaro.org,
	krzk@kernel.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: andre.draszik@linaro.org,
	tudor.ambarus@linaro.org,
	alim.akhtar@samsung.com,
	semen.protsenko@linaro.org,
	wllee@google.com,
	hsuanting@google.com,
	marscheng@google.com,
	jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	visitorckw@google.com,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH] clk: samsung: gs101: Fix missing USI7_USI DIV clock in peric0_clk_regs
Date: Tue,  5 May 2026 17:14:57 +0000
Message-ID: <20260505171457.1960837-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the peric0_clk_regs array, the divider register offset for USI6 was
accidentally listed twice, while the divider for USI7 was omitted.

Missing this DIV register causes the USI7 clock divider setting to be
lost and reset to its hardware default value during a suspend/resume
cycle.

Replace the duplicated USI6 DIV entry with the correct USI7 DIV
register.

Fixes: 893f133a040b ("clk: samsung: gs101: add support for cmu_peric0")
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Build test only. Found via manual review.
Setting up an upstream kernel on hardware would probably take
considerable effort right now. Since this is an obvious typo, I'm
submitting it compile tested only.

 drivers/clk/samsung/clk-gs101.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index d2bcd3a9daf8..b44bb31f38b3 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -3921,7 +3921,7 @@ static const unsigned long peric0_clk_regs[] __initconst = {
 	CLK_CON_DIV_DIV_CLK_PERIC0_USI4_USI,
 	CLK_CON_DIV_DIV_CLK_PERIC0_USI5_USI,
 	CLK_CON_DIV_DIV_CLK_PERIC0_USI6_USI,
-	CLK_CON_DIV_DIV_CLK_PERIC0_USI6_USI,
+	CLK_CON_DIV_DIV_CLK_PERIC0_USI7_USI,
 	CLK_CON_DIV_DIV_CLK_PERIC0_USI8_USI,
 	CLK_CON_BUF_CLKBUF_PERIC0_IP,
 	CLK_CON_GAT_CLK_BLK_PERIC0_UID_PERIC0_CMU_PERIC0_IPCLKPORT_PCLK,
-- 
2.54.0.545.g6539524ca2-goog

