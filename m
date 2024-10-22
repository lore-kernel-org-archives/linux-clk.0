Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCC317C98
	for <linux-clk@vger.kernel.org>; Tue, 22 Oct 2024 19:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729626941; cv=none; b=ev3tqHUlHZXP6ItSiJYBatuVzZjJTXJSonPilRkUm7fqSDqxqUGZBeoNB0hoVrqD82dRdICJg/iV2UZsAWoDqpeqJzeTT4vGyDFJbjj22n3qZyKgNOek0Kp0Fveq+Y7nuY1M3szI8Y9auSw408uqe7p3wFCgw9oVPBkoqUQfVhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729626941; c=relaxed/simple;
	bh=l9bZXGbTHegEae8ffVc5KCqqZxXhifnaSdE4se/P+t8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YpU9Y3P841JupCliXAVmdvOUOdPecE0hSbz6JNiIhgenTDbkETaVnjiUuxsepzTr/9UFVOmFRlj6UicuX6zAoe3Z6x57keZ7k91BnhF7OBOkpBWwWBOIX3qXhY1/u+7Lcq3NpAyllWcnGSdHqDoBgex01TTrtvE/prHOr0m6Gm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=arysN4rG; arc=none smtp.client-ip=209.85.219.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="arysN4rG"
Received: by mail-qv1-f66.google.com with SMTP id 6a1803df08f44-6c5ab2de184so35551046d6.0
        for <linux-clk@vger.kernel.org>; Tue, 22 Oct 2024 12:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729626939; x=1730231739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dvr/3CqtHvirdVxQdvzdhKPnFGUJkTsYQ/fDj0c3Y44=;
        b=arysN4rGscJM6UZDwZqqH1NAr8w7BiLXKiJu1/nFNR58jZec32WK+NRMQ15qzWqQ2C
         asFR2oMmFbAJ4YQkIe0h9MP21pSZLnpdDUhe0xua3jYWBu+UdZy3VOIEAeUCJ8PmbIJ3
         izKOv3YOuF9YyDnTariZhWfOcSAZo+UrLaXhx+jBDLGeuAhnG38sGnlcRp/s+yYm3hhl
         ZtiMRnPYdjBobkiMLd+/ZqctVrYa/rCY2A+Uqd1rCuQqXVuy+ZgFGD0hcUJn3vpLnEZB
         JCHifFj6+KTn/cqPSmcNMU9RKKrsPddGUvWz/UKJWNFeFTdAUbybvxh0bddshejW/DVs
         LnJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729626939; x=1730231739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dvr/3CqtHvirdVxQdvzdhKPnFGUJkTsYQ/fDj0c3Y44=;
        b=lhl7N5YF0yP01/cXfrR6DC9o/pZgCCtSfmIv7XOXAAc6305x/6DYCVqJyEGkW91rZT
         F7xvOsIS8FdFRrOcAwcjbmInWHMwoZmBB46AEAFn3r6W4/Hu8YzbQ3jImV1WCzU8HSC8
         v8DSUKlRLBTNI4t7X0qyYpzMIf1al/bS/ftvdZaOW1gemhJLEHjHtnbGZ1Rujpw+qI65
         ZeA4mS2R6KbYc9+QU4hupa4XYZXUQPDceyo8nrpTcld+eBTPwXhS6ZkpX13J5eETq1Pm
         YPpspXIRpixXrfI3Z6StS4nZljUzNZeC5mU98QHvo4I5tRmAzbLhtiF2AZK38isQc3U7
         JzNg==
X-Gm-Message-State: AOJu0YzNH2ui2jIjBcG5kABYfYI90+rqOFeNm+VnstRbg9rFWZRkMSiX
	izYVDRfNd6jwcVvLCO37XrfMlTkbZtmTarSdYlozsO6twc+T2gXM
X-Google-Smtp-Source: AGHT+IFmJCDrBHCASpC0g13HRMVd1q80m2hwQ4vtCMbT2yuCMwPhwbYnZfJ2iTUJYLyhO6r+//zMug==
X-Received: by 2002:a05:6214:440b:b0:6cb:7e7a:ae87 with SMTP id 6a1803df08f44-6ce342d6fafmr3300016d6.33.1729626938619;
        Tue, 22 Oct 2024 12:55:38 -0700 (PDT)
Received: from localhost.localdomain (mobile-130-126-255-54.near.illinois.edu. [130.126.255.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ce008fb6b0sm32457156d6.48.2024.10.22.12.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 12:55:38 -0700 (PDT)
From: Gax-c <zichenxie0106@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@outlook.com,
	nathan@kernel.org,
	dan.carpenter@linaro.org
Cc: linux-clk@vger.kernel.org,
	zzjas98@gmail.com,
	chenyuan0y@gmail.com,
	Zichen Xie <zichenxie0106@gmail.com>
Subject: [PATCH v2] clk: sophgo: Cast an operand to u64 to prevent potential unsigned long overflow on 32-bit machine in sg2042_pll_recalc_rate()
Date: Tue, 22 Oct 2024 14:55:01 -0500
Message-Id: <20241022195500.8805-1-zichenxie0106@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zichen Xie <zichenxie0106@gmail.com>

This was found by a static analyzer.
There may be a potential integer overflow issue in
sg2042_pll_recalc_rate(). numerator is defined as u64 while
parent_rate is defined as unsigned long and ctrl_table.fbdiv
is defined as unsigned int. On 32-bit machine, the result of
the calculation will be limited to "u32" without correct casting.
Integer overflow may occur on high-performance systems.
For the same reason, adding a cast to denominator could be better.
So, we recommend adding an extra cast to prevent potential
integer overflow.

Fixes: 48cf7e01386e ("clk: sophgo: Add SG2042 clock driver")
Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
---
v2: modified patch to numerator casting only.
---
 drivers/clk/sophgo/clk-sg2042-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sophgo/clk-sg2042-pll.c b/drivers/clk/sophgo/clk-sg2042-pll.c
index ff9deeef509b..1537f4f05860 100644
--- a/drivers/clk/sophgo/clk-sg2042-pll.c
+++ b/drivers/clk/sophgo/clk-sg2042-pll.c
@@ -153,7 +153,7 @@ static unsigned long sg2042_pll_recalc_rate(unsigned int reg_value,
 
 	sg2042_pll_ctrl_decode(reg_value, &ctrl_table);
 
-	numerator = parent_rate * ctrl_table.fbdiv;
+	numerator = (u64)parent_rate * ctrl_table.fbdiv;
 	denominator = ctrl_table.refdiv * ctrl_table.postdiv1 * ctrl_table.postdiv2;
 	do_div(numerator, denominator);
 	return numerator;
-- 
2.34.1

