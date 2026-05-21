Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2005630C366
	for <linux-clk@vger.kernel.org>; Thu, 21 May 2026 01:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779327757; cv=none; b=FfUDFD1y3QxIbl30f7FwW2papE+4AVFi3NhPfA/kYww1Tz0+NNvMS2jK6mtRETjdyEAE04XN5g42CC0bYqG9RWwrFADiCqvWlrlWZuLk8a8g0URP+z45vA4yH1dsscOg6ZzkAoSJycpPK/oNiAOJSh5vgzLtwto5j9KepAQUDUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779327757; c=relaxed/simple;
	bh=y0eLfdlKOsnXKLcqHgoMoE6tZoZpJ5wRnAmYHP8/7DA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R9tFrY3zAoiIrBpmO4MXTJpo+3EZgdjVk3aOirQf97M0C22hGUHgnsclJzQe5g8K7Oz4H4qggZ+VAEtJVL6WqGPEKAW3TfPweTB5aOsRFlaykl4W6RaLpvj79s0TggIjLVdCqGAaBmhXxs5vshOy1t4OXcxw4bf8xN31eTnmsVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L1BK6VZx; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1BK6VZx"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8354461da74so2489933b3a.1
        for <linux-clk@vger.kernel.org>; Wed, 20 May 2026 18:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779327751; x=1779932551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQHAOKYoNq3MrKqMcGhimP9jof0s1tqXQowtY/BWP0g=;
        b=L1BK6VZx19VgAMtp65r9FWnqF7rP1jOl0JYYjN+Tt4HRrum/ClJ3HCvDrXduYkNlnJ
         Dq0SPZazzpE4I33zmPGut+mglgPsfw0OfZkGADudCLd99wQPSOIQorITloL5L/tJkpkA
         m95kUIL8NhDdnuqjBg03MIQFdyC9W0osynyAI27cqYPr/Jajn0Mj2UB1vozz3GeDVC9e
         ULHpN/V48l4EIvXztKWeMOZx93edWx7kmqi9v4lr9CcIte/thtPK0fG5OgEMzo2kx+cL
         P7yph36LPIXwh8YibohcjJSe1dKzzj/K4oDW6ij+GJwKQ6KqMofry5fKyV2dWKALpag7
         mRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779327751; x=1779932551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XQHAOKYoNq3MrKqMcGhimP9jof0s1tqXQowtY/BWP0g=;
        b=HzGIW0mSgRHzZdpx70CQUi3djpMPBVsZX9QHKwDeI2pgdYmlWN6GRJ6qDz+DJX8hK8
         3rT5XbbqVoxPo011LoP7qZ4YAFqkwUw/wVubwDV2Ix1S5feXPMprKJ7+ByJWLEctBut0
         qKZusjvmFGCvk3lrdWtVD0m7MFw4gKSjg3BS/gtlWlAhmXgyqQTxWTAphpnHM1Z7hYJo
         3f3+GCEjQRRO6YHVRge+c+8nzcoxYt4fCdGxODVcm54lMkIe9GYN/5i+o5+tUr0zqKN3
         X3s8Pa7DSgEqsb0h0vd/BBbRUBjRzlsagp4YrVC22fusmPL2ZAd7fwOOmAmclN+5Nh+M
         o1NA==
X-Forwarded-Encrypted: i=1; AFNElJ+R0JK0cu3MD793XAVtHJz7LuGHDvuSLnAze51ZjHNYnPSdQ+H4mypQRfZmihm8FqdPUV+MqFBvqHM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrk7RNnxmrlKcAQd2IC32wYhq4aIIcMlaF5BJ/lFFG/lleaQLf
	ClCi8J5mah9ZUkeLFl1Rs7zQmUS7j4IHL+PHCss/3WDEFT1NCaUMBOCx
X-Gm-Gg: Acq92OGxkdv2/TjAbPqjQ+2pbsTAJXn7AsCTlNgBNcn59R6z3T9nHVSYtEhQkHUlM3O
	QBJVcIsK41ErLd3EZe7mbwSzprvdCM/hlPTJUq+JkoKnP1wgH1C4nKoPlk6htiG2aIwV0C/YCjT
	rnlIpXrCFKETgFwzTN2cgKTn0rC0kk7ixqK0cF0DuAnaOH0JVHom2YNr0VwH5DCfJm7zz7jcgCW
	WSdnouXOhjdIV/k+0cvftvOULTbD6A8lBlXcv5uLC5r07N3pj6yal18JbCURrRRmUHLFfod3iI/
	jsfH7BSIs+sS2xuW5V9mGvWbsSWwD7VEo0PsQL39Eij0cg36fmn0TeJbleOnCiXtOLTsJH7Bfqa
	id53HPK7vzMzKXxnuz2xCQtRHd04dgZZK6RTIeaU08n9gkmLiDhc3rVYsWSX9M2QTvJhk+sDUWg
	00I3Bgxm08kGqbFfBUkQ9lX+qCnkEAB+lWFhPB7HmgQhRhsA3eqXPYJPhg8/znBwBinDaWfNJ/n
	zw4eTnb5o4y
X-Received: by 2002:a05:6a00:2e9e:b0:82f:61f5:1d7 with SMTP id d2e1a72fcca58-8414ade9c4dmr784283b3a.25.1779327750726;
        Wed, 20 May 2026 18:42:30 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19fa869esm26411475b3a.61.2026.05.20.18.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 18:42:30 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v3 2/3] clk: nuvoton: ma35d1: fix PLL_CTL1_FRAC bit field width and fractional calc
Date: Thu, 21 May 2026 09:42:19 +0800
Message-ID: <20260521014220.77955-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521014220.77955-1-a0987203069@gmail.com>
References: <20260521014220.77955-1-a0987203069@gmail.com>
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

