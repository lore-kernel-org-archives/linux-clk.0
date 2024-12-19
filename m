Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8D12248AB;
	Thu, 19 Dec 2024 12:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734610773; cv=none; b=bXf42jabZ549mrhhn0VzAuZzgxUZ/NTIuGT6CTj/ONramJPpOq7vWuxVhMRv8/8qshj3Yg/PdFag58R/PYyds9qXqiA3hXLMM4ZnYqGBR2zXkVxEqhep0c+4pBUGcgLmZH4zWL3wU7+Mst0/jYh0OAphMS0u5hSPRQ8tkKWw5dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734610773; c=relaxed/simple;
	bh=cugUH0d+SlgkRyuP28N0msPKI703sIZVVOLV5vnDtT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rj/eJK3rlTA5///Lcu3nxrZOCrZSMBhbmMhSl1Se5KSrJiZ1GQFZRMLlr/YOo1xHqrijEYAVFzA18NNdnCVmxHVOEWbkpVhLekJZbHDRc3AUTngB1J/SPCrJk3AkLH8//82h3ggaLGunFRmxETIFlz/r4LLWxBq5UNn8y2vLHF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RuXNMMJi; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RuXNMMJi"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436637e8c8dso2647595e9.1;
        Thu, 19 Dec 2024 04:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734610770; x=1735215570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59Aoy43dWzBwCaG2A8ucKh0QGC/BCGRrGg0QGt/ktA0=;
        b=RuXNMMJi4XYbZ+lQ/qS2X0JKIeuGm32ezg4Ja0tTd6AjnRbyErqZTai3SIaE3NRTq2
         T3TUq0aVV3Utcq9LBNegIEd7tvhbw2mxrBIotQFCFNsWzb3lH0/WY/GX4NmgyyfNsBYN
         teai81pYnZpK8WLacOBUJgdBIaEeJVbMXIGPBNEdoWwtpTjOZwo4JyMc/9EgUsRbqI0z
         n1TSw7KH0DHLR1Hl6F4KFbuA0D0o1hxT9vq6TUh8poGaGv048yXWyTLEGTT1uzLh/qoP
         Kry26+1Ya6LGfQe13wxvCHnbcXpwzEZdoaSoLFpvQF/mx3HFg/z7+n+73RY4ucOdt3xs
         s+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734610770; x=1735215570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=59Aoy43dWzBwCaG2A8ucKh0QGC/BCGRrGg0QGt/ktA0=;
        b=FCCbm64VjvUQke7oexw1fPTeNuIvsv1Nek7xYriPA3ssU5NVDBZSf627Pq2t1LmG5y
         Z/ZOzXM+SJHqfKnapS5cpCLmXx82FdLA9nDRTfYVCuuCw93cQXkorujQ33rTd+a7aYUO
         XItT37/kmsK8iByCSlPf5t6g8Z9y3bgINXODepkWTtTH9x2HlOICzRVkhfKz5PqhUt94
         XwRvrP7Ng6Lvv/75wfO61C0qlDYT/0vBPWZL/37l80Sa/cshvN49wD1NDPnN3H7bm5p0
         /CU1SazFdYpWsZmLpT6xPYdJZByszInAzubNt1mRSyvP8zi2iHMZDl4Xu6P8lMsq30dh
         n/mw==
X-Forwarded-Encrypted: i=1; AJvYcCU1Wm1ptDLdJQFEReyU0fWugKWlZ+I5vxA+yERwEBV/mvvUhTVHTUs+cBU+OLuDDFLiZTcdM18Epqhc@vger.kernel.org, AJvYcCX4sERrXMAVpTqjjEkKFoz6BuMEcI3gpqnWTnQTiPrsZDGgthN1B+O2/VueDWT/Kn2WJlkS4UpPBQRy@vger.kernel.org, AJvYcCXTy3iKMDDO50zcrzYk8T3kzPOUx0lutfpJAPKwxwh3xNLsJ2WEPgZ87osQnh9R9VwxTkSItMb0C9q6o/+A@vger.kernel.org
X-Gm-Message-State: AOJu0YxwhHR5X+48dA+c+8K963mxSUHKi3Yi7xM46vgxlGXEQlnKyFuE
	a3iZuTljDr4OZTrSrfz+lqcAieJ9xkvWgVEgZ9YB7/GaTU24yqVIBc56YQ==
X-Gm-Gg: ASbGnctNL3ojZdcvdoBWljJwOmVQ4UGvGoacjV2lzn0nTiqcpXgwux/wZt1+vqkmeDC
	V4npGaK2fCkasK4/McVIG2/HJBOxdUGAv1g2R7uUnhMB74n/RCMSUS/Rtqg+nfVtbsMwKRE0df7
	fpvQ49X/dpwU/Jf4GTu4bX+yG8JGiqFAWhFSKkwTmAZOsRN6z/F5DPumql0osZdQ1a6ALaujVcD
	Blngpn6GA8eDkacu4tIIz/OZCewOsP3UQ8lyURSZ0ZvVQabNuZzfsZqRhhlyCrhYweXKoJ0+Dm9
	fRSAfg405CtG4BxvyyOd0KOp3sJdvQyXZxEG4ouBjiI=
X-Google-Smtp-Source: AGHT+IGlnD59bx6wdPWBteUTx3SXxB0HfDoL9TeSvQiDMj9nT1n7cW8ovuxdXdFbCCZQWxvBR5t9/w==
X-Received: by 2002:a05:600c:450a:b0:434:f4f9:8104 with SMTP id 5b1f17b1804b1-43655428a0bmr53822195e9.33.1734610769724;
        Thu, 19 Dec 2024 04:19:29 -0800 (PST)
Received: from localhost.localdomain (host-80-181-61-65.pool80181.interbusiness.it. [80.181.61.65])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436611fc762sm16679975e9.11.2024.12.19.04.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 04:19:29 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	upstream@airoha.com
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v3 4/4] clk: en7523: Add clock for eMMC for EN7581
Date: Thu, 19 Dec 2024 13:18:53 +0100
Message-ID: <20241219121902.16339-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241219121902.16339-1-ansuelsmth@gmail.com>
References: <20241219121902.16339-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add clock for eMMC for EN7581. This is used to give info of the current
eMMC source clock and to switch it from 200MHz or 150MHz.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v2:
- Rename emmc_base to emmc7581_base to make it more clear

 drivers/clk/clk-en7523.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 596847446b14..b36445359b5a 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -91,6 +91,7 @@ static const u32 emi7581_base[] = { 540000000, 480000000, 400000000, 300000000 }
 static const u32 bus7581_base[] = { 600000000, 540000000 };
 static const u32 npu7581_base[] = { 800000000, 750000000, 720000000, 600000000 };
 static const u32 crypto_base[] = { 540000000, 480000000 };
+static const u32 emmc7581_base[] = { 200000000, 150000000 };
 
 static const struct en_clk_desc en7523_base_clks[] = {
 	{
@@ -281,6 +282,15 @@ static const struct en_clk_desc en7581_base_clks[] = {
 		.base_shift = 0,
 		.base_values = crypto_base,
 		.n_base_values = ARRAY_SIZE(crypto_base),
+	}, {
+		.id = EN7581_CLK_EMMC,
+		.name = "emmc",
+
+		.base_reg = REG_CRYPTO_CLKSRC2,
+		.base_bits = 1,
+		.base_shift = 12,
+		.base_values = emmc7581_base,
+		.n_base_values = ARRAY_SIZE(emmc7581_base),
 	}
 };
 
-- 
2.45.2

