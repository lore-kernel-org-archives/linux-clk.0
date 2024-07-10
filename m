Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C2C193467
	for <linux-clk@vger.kernel.org>; Wed, 10 Jul 2024 14:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720622117; cv=none; b=VmJ93I3rMfcUoUpdrpIvoqGWWtSXz2Bj6Hp907iGMxvYUQP3ccgSg2ISbAfKO6hrng1piBzhyc3ZJ8NiZ9acOyVJCfbhtLKW5Oz7cRFco6LAmfbMzcWiFvxIexaa07eKCrvH5cxsj6q+x3eqUuvyGpLCWsHCTVlYJVt+mxH/ce0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720622117; c=relaxed/simple;
	bh=9jooIyIr/HyUzJS6LzsDZvXen5wuwqO3O1aOewsFVTs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=naUgiczMCNEKhB0c7691yKE4xhMWKeMG+7lnMlgxCfrbf1qrqKaKcarAMw8r4S28vr5WgmnPsUDYHjm7qK3VyvCTeEwYJwUoXqKp0c3UTvO2DaBb4EOe03OY4t2pGV9pQYVS2vrL9dqXObZraE3eQpRYhmXGvjWS6ggUPy7oH30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=HHcjhS1b; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="HHcjhS1b"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4267300145eso16242045e9.3
        for <linux-clk@vger.kernel.org>; Wed, 10 Jul 2024 07:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1720622113; x=1721226913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y+0yIikCD08oMheZij8lHE8qY8gpPceCppKq1cqRcAo=;
        b=HHcjhS1bwMk35gRgCF4G1qD8VGQysTf469DwI/x32PEieXI4qWHD0bLUQ8ZKJht3vD
         6vbYikbf9kyxgyLG+hypL1sH69a2wtvcXVFBZo/V3x5G42HMvwDZLOZM1zAICAGjFxiu
         GDuKEkL5yDP+NEQYjnxD/J3oH8gaTmefp9GxfIUVerP00uUebddeWlyQ2pru7l01dlXa
         QZrc0b5Vd6IxAgVzl5ns8hy8IlHri9LWCCgCgo6d0RU9sHPAZC4liYZehGqKa/ZHI05A
         DQdduYgaaD/zKjoOc0t47zCImunFGzuUfmdOZ/AzO4X23/gxHDneuCB6jTbwO5tbQXqo
         pjdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720622113; x=1721226913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+0yIikCD08oMheZij8lHE8qY8gpPceCppKq1cqRcAo=;
        b=HwrNMy+6V6SlGyk6bsklVYuzarWAbUfPfBZR/h40GapaiGj/HckAC2n+2uzUYRpUsQ
         kjSU3suHH1y8fniIXEdwl7/5XaEkYIYwH3stMo2PZWaXt6ANElfAURoL02cZBgIdqMnV
         DrAbSQSZdkBQjIH2HgLWSfrlM3NvNkv6NnYkQI1/SIsFqBrFlNWhvQ2rgy3okJv5qWlY
         Nbwj7RYxUwu550Wrzmow66xeO2LrQYiYAtUCoiqEVCYZi9yNGvYIbqej2j3rEEGDoEbv
         dFoO9MYXXIIk8uYMhljjSQhHg2iJHR8wQicdqSCI3yj/0aENmK/aIEC3snNjs00MfJZ2
         AE4A==
X-Gm-Message-State: AOJu0YzVnpzUofJT1u4pCt5sURaoOzBk297UzC+zfO0GyBO/P7DwZXTo
	WLGBypf9MSweGRDwzD22I1gOqdf3lQjeNg36FEJnARo1+kGP0KfkDRGerLaUZwZ+MVog8PCuwQo
	XPJI=
X-Google-Smtp-Source: AGHT+IGGyG6eoSg+EDRDbPNkiAakf/Y71Bv3rcFVrUCzswdv8GYcPnvEmlqukEaNZ6hBPV6Mku68+A==
X-Received: by 2002:a05:600c:4312:b0:426:6857:3156 with SMTP id 5b1f17b1804b1-426707f8580mr44315485e9.27.1720622113357;
        Wed, 10 Jul 2024 07:35:13 -0700 (PDT)
Received: from fedora.fritz.box (aftr-82-135-80-26.dynamic.mnet-online.de. [82.135.80.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f6e097bsm85925025e9.6.2024.07.10.07.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 07:35:13 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <thorsten.blum@toblux.com>
Subject: [PATCH] clk: mxs: Use clamp() in clk_ref_round_rate() and clk_ref_set_rate()
Date: Wed, 10 Jul 2024 16:33:10 +0200
Message-ID: <20240710143309.706135-2-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use clamp() instead of duplicating its implementation.

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 drivers/clk/mxs/clk-ref.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/mxs/clk-ref.c b/drivers/clk/mxs/clk-ref.c
index 3161a0b021ee..2297259da89a 100644
--- a/drivers/clk/mxs/clk-ref.c
+++ b/drivers/clk/mxs/clk-ref.c
@@ -66,12 +66,7 @@ static long clk_ref_round_rate(struct clk_hw *hw, unsigned long rate,
 
 	tmp = tmp * 18 + rate / 2;
 	do_div(tmp, rate);
-	frac = tmp;
-
-	if (frac < 18)
-		frac = 18;
-	else if (frac > 35)
-		frac = 35;
+	frac = clamp(tmp, 18, 35);
 
 	tmp = parent_rate;
 	tmp *= 18;
@@ -91,12 +86,7 @@ static int clk_ref_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	tmp = tmp * 18 + rate / 2;
 	do_div(tmp, rate);
-	frac = tmp;
-
-	if (frac < 18)
-		frac = 18;
-	else if (frac > 35)
-		frac = 35;
+	frac = clamp(tmp, 18, 35);
 
 	spin_lock_irqsave(&mxs_lock, flags);
 
-- 
2.45.2

