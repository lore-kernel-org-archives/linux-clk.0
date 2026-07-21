Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB6F400DFF
	for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 02:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784600099; cv=none; b=CfOqnNv7Z0VYLW2x0DfJ/0Pl/2+0UX7ZoRlhCms1AuKij8tZ7Z8WzjsVDpsFHyPqsiflGKvUW747DVyWsvmfBfHcS6qO0Y1YMlrz1O2cGRQjIYiDZUyJ4/JyIZu19aeaFO562TjbNGHR3wq7TOqr4aW+xnUShVVIYzqYMUT5mGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784600099; c=relaxed/simple;
	bh=7iYJyleZBwgksxOOmPrkRVeVrn+YU5L3ImQL22TAFUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FOsXL1xymukoc8EDvODFaG9qB1BF1QyH/Z8qXKVNkBzxxB0I2sx5mfMbqwzPA4Qyg/+wvm+AOONPm/5PmBQeb1gU/NWUQf1Y/qP8m5+mlupPqgpDO0oC3fF2xm9F94HzM5vqtLXkwE8K63JzVB87tyu8UJ8SdivvNchcQv7kKHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQCQsRsi; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQCQsRsi"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3811f512167so10538324a91.3
        for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 19:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784600096; x=1785204896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fUEMfFXXEJWfpYYV6BprYH6yq5tTMFc+tIMi7bPpkS8=;
        b=LQCQsRsiiES1XpztBA5NE+Cw6bPHZ8kLpKVsWaiMV3iJpH2DB7A06hQx8SvNhtPE9l
         3UPwJsxsgfZ9veuLSGoqkiGLGRiwuHzT6ZmZcA66AuoVsuj6v7gKnEAmcFVkmji5hijj
         G5y8FPax4RPX+sBJEL/GgB43TvXy8ASSH8gvaa6fkctfSMEEO87dpplEsEmK2NGTHyg/
         CGkqXiT25hJAig9nT/U5CbWGHc8YBEVNjBaqGQD5MDsMBFEKpbA7t2ePR8QBDXCz2Il7
         bb39DRllLOXjbr5xirBWJAOvRoY3NriQu4JDD/cX46NH0TeSVqHiwsAVXZ302v389KiM
         59jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784600096; x=1785204896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fUEMfFXXEJWfpYYV6BprYH6yq5tTMFc+tIMi7bPpkS8=;
        b=X+RULwXoO956lJrwVRgGS6dfBR0Qz4oMGoKpRjiYKMYCknGBM5gv8tbpvmmFRVHkbs
         DmCJCPul7gGeTwTcUO/Ff+BccMYlKulOtXkJWs+4gPlcmuYJQlsDVwz3SbwrR1YmNyXm
         5OUVwW23dwa8a30R85fn6ocP6zvxd/ZSMrol5b5IJweeHOLBGPcJtfTMdvyvF2v+r1Sg
         fKE2Zqarmo+EwmC8A1jHrIEskE4HVby0F6pIhkXs0SUDCXgEmO5ZFmOTUpQ3PmyZmxty
         7fiyagHDyLMozMXVNIA4bKX0O8ownarCfM44uOqF2WUVqNQXSOKnp9xmeNQ5SLEUDCAS
         tpaw==
X-Forwarded-Encrypted: i=1; AHgh+Rqt1DAj6QWmU3Mgk8qKZ8Cgc8xMnwnLY4xG+SbihdcYCiDhdmbrfmxX72ZZ9ittScobLQEmxg1/Ll4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFZFRnWJ7PgV1O5qgDw0x7smhM7DZwK/PFDpiZ1JBGseKVG63V
	07oHB6rDEWEFTE+vSCCEN8IxhfwhoOvVYkHcAMK4LSJFZ1hizMI0pDIz+WqUWg==
X-Gm-Gg: AR+sD10eCQwVjNvXv9hG8GehTuQWBVg4Nune10lWMYa6h8wABK1VtJHxfoWvMBKJsZh
	jbl8jdKRzwguHZbwRjpfRCUERA00gHZRwlV2/X31Guy/A0r0he/R/RrV3K/DeSmiecIz3Mv9iqf
	bq+L57UdzC7tibR/9CtES0s+lJ1B3lJHLM2MAssPnHqon4NlUEKQEytRpQHaMXtbi4mFxvBf6zo
	4jDlIMK5y3i+6Kq07DVGodoz+zCp8yUjWYhMdnliDd1+CbeBteyCg94LKyxedTCja2/VGDaon5e
	TBR7S6Grn6Gkgens3mpLwUF7VO2FMfDiGD77nthUKUOrvGyvAyYdZbm2D9ElG/N2bqub2fCHi6u
	QIm/1vBCZvTbd0Bz5MscnpDHSp7y5uqQXGQldwslvMeL0s8i2wIo8n5AWCBnPBsd3QUsGrcU6JI
	70PReNGn9uCq4MWHyaUYToMakUHkPyC4TDFK+8rUdNsNixdFM9xaAcy38He4lN17I=
X-Received: by 2002:a17:90b:56d0:b0:38e:e0b:320d with SMTP id 98e67ed59e1d1-38e4b594707mr17316465a91.41.1784600095935;
        Mon, 20 Jul 2026 19:14:55 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e9235a4dcsm586241a91.12.2026.07.20.19.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 19:14:55 -0700 (PDT)
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
	Brian Masney <bmasney@redhat.com>
Subject: [PATCH v4 2/3] clk: nuvoton: ma35d1: fix PLL_CTL1_FRAC bit field width and fractional calc
Date: Tue, 21 Jul 2026 10:13:55 +0800
Message-ID: <20260721021356.288506-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721021356.288506-1-a0987203069@gmail.com>
References: <20260721021356.288506-1-a0987203069@gmail.com>
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

