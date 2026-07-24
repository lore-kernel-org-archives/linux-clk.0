Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27372931FE
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 01:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784857306; cv=none; b=Iu7dJK+DLHS3RB28Ca2kuni26mRiSk0X92AtmsV9vL5Bl1kcJQwZ8MezmU3vgOveX1N2Yt4nK/91NvwFaoBdxfwZte1W/2YefyItYITlXNPQpCtc4YjijFs5IZhYRNuUwDYHYnKWsnZ5wFJdn8czx5eSvC+dXa+K8IqgDHFqCtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784857306; c=relaxed/simple;
	bh=8VGV5J35M3tEQUvGItdWTIvWf/PwbtRYeVaQ5Dk3FCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gPpToTlQtHIf693M7OGPG5HoYkRAtGW/FxntaC4/lmrH+8tiTOB6LJ1HPtS6cg0KPss8jQC7tMIzWr9FVRZOD342Qb1Lcm3eiftq3JmdZZiA4dh7Gh77aWilwZTp+QM4VtU6P3O346xlm01DJQQAGnPv8O0ECi9B4GbkMjgHZV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fX8AhajK; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fX8AhajK"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38e347638adso1431228a91.0
        for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 18:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784857304; x=1785462104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DLZq0Oq4iriy5IZuUphLNLAdeQc/1NhQeDrqKXhuu30=;
        b=fX8AhajKAVePuvTM+Mqsp0keqyVBy5IjLvu8l+T5D8R1uQAW/8NZFg7Lcx/S1qOOci
         dk3aHPopT2ueMy31xYLRbAWJdJdOGKPdPaeKvqiDLmBsQuL0FP000kTgY6QYvCGm1Fju
         d/e2IJdrc/BG0G4x8E1rfu7F0MLFBcCROjHZFr0QFU89/+4khffOeHWlSfV+Tfzt9VGY
         stKHX2WJTaaajAG+yZz53KMbPruagVLeMOy3HfHAagKwQx9gXb1r5+vVuGMlWKhVqols
         dUfkyFraKnTnZDeJUWTaDObB+Va3EGxkm3RIqKtKhJcZOCT/kXSIv67lc75NYiFDgoQz
         r0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784857304; x=1785462104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DLZq0Oq4iriy5IZuUphLNLAdeQc/1NhQeDrqKXhuu30=;
        b=e9ociQYC0MhAmprAMmoXQe95JLiLBk0KEW55V3JYl34+Y5M7Xbol+fAaJhXxkk39I/
         B8cpo9AE1RCTjLVvi/r+xf9mtLDhNZnPHERP26A/Cb94LowJ/pI2cJ8/3gmF+XwDH6b0
         s39qdlngXysGAmnityF5Buzpmp4GED0ZG7W/DObQkfxXeUNsv9C0wOTajdVtdv6ni+j1
         vi0WfpdCiKr+4ML+i4tmMP6x2Snrab3BLQ07QW6SqogF2uaWtLuCu5PApQxiM7Y6nIWU
         p/2krp4FnGstGTWnLMJ2hJZyjUTtjaUEvG0rbQqJI4slGMAvtfoq8rwM9J4AbVgF/0wE
         l0fg==
X-Forwarded-Encrypted: i=1; AHgh+RoBz+XxxEt1VfhGatTtGJn5URv0xjtdYgeLuoCf2HlWIudHHsr/TH5sr7f6C+w/HMkBB7apk93zH6c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd+AbxzKY36SvaNaVoVDsPtXdIwFzXUuBKrtM0aDclr7XVHgmw
	KRM39OD4DSGO1khYj0gvhxfwJ4zsDYHO5nkXDf3f1pktY89DsJqxltss
X-Gm-Gg: AR+sD12susO1RDgdpc/8kZ5wTirBB/Ai+Vu4nqA4utJ+Es6J6LkJceaHPnYDjiIi9nv
	ZODkMsOCcm3Xrtf99EUxnPCBNOUivT9hiM1cEbxMEmH1xyikaSxtblmzkq9hx14UtEpH5V1il5p
	CzuTjgUmCs0FNBbJ3BF6HskryYaKi7x5llL8SOyqILh6U5dTdZKXCSC5ngqVznurlC1YJuAOWZz
	XfTcCv8SzrS+36MXiGgM6KY0Z5AHoE0KJFZjy+OtLsnkqgTnzvPhtV9/PGcyyJxrMrbFkdXA/SU
	QUG2BlYmHubR6KgoO3yNBhizDRApJ57OpHmfDL0eHxskRx17dlE3SWJQ2eqvWDDRDocCedhZhPm
	u8SbLP6So8sn5kqS8NATPoU7zLK6f329QCjYmX/fsSqvlJFUSQfqf4YkoCsHkGRv70mae7gFdUE
	TGHAspicGYBbJg1l8gcHki7vAIXyffVyFgufXb5BxHiLZfOuq9u0BsmS2zL3pQSljQ3Z3NDUOiK
	w==
X-Received: by 2002:a17:90b:57e4:b0:38e:79f:76ad with SMTP id 98e67ed59e1d1-38ec6566203mr5592434a91.23.1784857304339;
        Thu, 23 Jul 2026 18:41:44 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03b0e976sm647015a91.5.2026.07.23.18.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 18:41:43 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>,
	Brian Masney <bmasney@redhat.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v5 2/3] clk: nuvoton: ma35d1: fix PLL_CTL1_FRAC bit field width and fractional calc
Date: Fri, 24 Jul 2026 09:40:38 +0800
Message-ID: <20260724014039.1239552-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724014039.1239552-1-a0987203069@gmail.com>
References: <20260724014039.1239552-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PLL_CTL1_FRAC was defined as GENMASK(31, 24), covering only 8 bits.
The hardware fractional field occupies bits [31:8] (24 bits), so the
mask must be GENMASK(31, 8).

The previous fractional-mode calculation used FIELD_MAX(PLL_CTL1_FRAC)
as the denominator to obtain 2 decimal places.  With the corrected 24-bit
mask the old divisor is wrong; replace the arithmetic with a proper
24-bit fixed-point rounding to 3 decimal places using the kernel's
DIV_ROUND_CLOSEST_ULL helper:

  n_frac = n * 1000 + DIV_ROUND_CLOSEST_ULL(x * 1000, 1 << 24)

Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
Signed-off-by: Joey Lu <a0987203069@gmail.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/clk/nuvoton/clk-ma35d1-pll.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1-pll.c b/drivers/clk/nuvoton/clk-ma35d1-pll.c
index bfedd45bd04b..eb9d69d2077b 100644
--- a/drivers/clk/nuvoton/clk-ma35d1-pll.c
+++ b/drivers/clk/nuvoton/clk-ma35d1-pll.c
@@ -48,7 +48,7 @@
 #define PLL_CTL1_PD		BIT(0)
 #define PLL_CTL1_BP		BIT(1)
 #define PLL_CTL1_OUTDIV		GENMASK(6, 4)
-#define PLL_CTL1_FRAC		GENMASK(31, 24)
+#define PLL_CTL1_FRAC		GENMASK(31, 8)
 #define PLL_CTL2_SLOPE		GENMASK(23, 0)
 
 #define INDIV_MIN		1
@@ -113,9 +113,9 @@ static unsigned long ma35d1_calc_pll_freq(u8 mode, u32 *reg_ctl, unsigned long p
 		pll_freq = div_u64(pll_freq, m * p);
 	} else {
 		x = FIELD_GET(PLL_CTL1_FRAC, reg_ctl[1]);
-		/* 2 decimal places floating to integer (ex. 1.23 to 123) */
-		n = n * 100 + ((x * 100) / FIELD_MAX(PLL_CTL1_FRAC));
-		pll_freq = div_u64(parent_rate * n, 100 * m * p);
+		/* convert 24-bit fraction to 3 decimal digits, rounding to closest */
+		n = n * 1000 + DIV_ROUND_CLOSEST_ULL((u64)x * 1000, 1ULL << 24);
+		pll_freq = div_u64((u64)parent_rate * n, 1000 * m * p);
 	}
 	return pll_freq;
 }
-- 
2.43.0

