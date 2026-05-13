Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD34B3B2FE9
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 05:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778651812; cv=none; b=ISaAa9cFcz+rIAYIKqrwHI3oySaR/yvWzBXKXs7taMvjHbIo5iwmgY/YB9lYmZZ5zQusFuFSm281W2OFMeLvDF4FPA6N7uu1LoTYJl4i5lJNzWrUqKEnWcAvFw5RAOYtHRf+fcvsZ4SH8o7osl3RN6ekWep7+W1J9iBvqu1i9wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778651812; c=relaxed/simple;
	bh=iwshQxBJRKng2AeZeJRg2jhjyadmBg+GsEws2R7KPQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=shLZCkpVxWce8WTEMLuwFJN23QiAJQvhMy4YnJeR63/U2jMD47y8evyD2gNoUttrS05zWeI+Kw/oqC8bVBstocwaDlbUjRq5I3JKLbI0FNSG2D8pYuhE9oqp1Z2y8SKo8oNIgI5aYA+z+X96FT1SBfZYg91LcL+l0Dk4dmeXgGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EV6Urh1A; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EV6Urh1A"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-367c2a39fcfso2295591a91.3
        for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 22:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778651808; x=1779256608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/LoS/AHTeCtpWKc6PkMtF6EkZQfXCl5pc+5m7F4o70U=;
        b=EV6Urh1Av4mx+pUBLNBkWjvqaY+1QN3SUzlODlGacThToGGsuyo8fFCWUL6TM3Z//Y
         iJTbq4Q2gApo2YLt91itnfy+2/kDwXed9WYG3LqIRBoo9XU1QgN3p2Bbz5OEfmo+Fk6A
         umc3Lh4mt7uQul4TfKmf4nJbgtM7wZcpsEk+G6+yCL6xfObWWxF/Jjey01B9zsenqSt4
         OZjoPGP8ZR8zYYlbYWL8BZrKiCbrtI1uWq9FNYhBzk4GEtj4BlrBXcPeue7xJ5FbiZx+
         ThVue8TlkRXDsLIUDJDBkgGBYVi6tjYOzV81oOlUbxiBL1S2GIIyYgiUgxOgfGiJSGxo
         y2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778651808; x=1779256608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/LoS/AHTeCtpWKc6PkMtF6EkZQfXCl5pc+5m7F4o70U=;
        b=cSMTEHfZBuASYcx3hVBopeXRyGLuGAil70KXIRCkyRGjumXdCU9P1Sdx3rx0Wb+Bqz
         0As8FLCIwFFRvl2/ghcBVyJckkLiKfFCDxOYCL+JNVz1MNXKWQLgl6Y6aHquDWxzORXB
         u0a8qEnBFW2fu0R6r/R6EQPtdkwId5ywDlzXceMAOpqqML+OweWrcdi7PjnKLK/CrrUv
         iThSZNiY4ufmjOH0JCWrloG687WfOtdBMLRd32DTxcwPLTlI9rlHpnRZ3XjfM8EGwA9x
         oqgqvFTjiLB4wHcaVqZtj+TF61Mx/GtuhtoHGJGjV1mprh16c7sHqOZX5p43ndVT5vmV
         rCOw==
X-Forwarded-Encrypted: i=1; AFNElJ93rNg0pudobbEa7X+ECIrWg8iqw7TrFJ9BhVW2qG1I0L1y034KNBDMDp6Im1y4N4Hq1ZYf3fTkK9I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUK1Gf5yTkDzuN0W5hDskBEsdIsA+85FDZ9abnWlIGMXLOaDMZ
	9l0gXDX6t6knBOVVnN0DM0LYFpm79Ya9+AhEsg+RV/tPG9du04RCo47T957fPA==
X-Gm-Gg: Acq92OFVp7YaTUAxmAY8l83y/nVVBbXn1kqdqw0KJK0LT5nKpSeqIj+JWlEpFJArIbw
	44ZXwS0hljqLBwF5HnY1JMsPafqyBoGA0MD+r5aVjzAaw1Ty5ezBOCZBfnQKHSD7+OJuZWlHhLe
	7jCztGMFktY5SrtJ8zYcfnUxxc+FRHmI4bmOELTD7aSLWECpz2zH2Di2zQetgcohmmj9BO/Gqmh
	03h80CXHUHtIB4pQKfFjqG4kuofq+/GNbn5iTpJmnInGAnLYPagmipmIYfiWVDeQUSaWt7P3wF+
	07kdyBi3oTpSNOPfRfXa7/u5k06DvMRKJDjUMOsDWbddYE6kMQdJB4WB+JsgKbQWN+o/dqJGVxF
	u5t37z9rW/+CHIIxwAcjDTWaAXgSgGN8MkH8U3aHWwbdjzJFAnaEAyPPeS3qCQ0mGwiT5M6NDgH
	UjZQBrw+3k6zGYTSjpEe7cSaiO9+Qd/3JqS4uFaqZyaIgISa/OJf/899C42hYP0AIvVO/Bt3inJ
	nEgpeLsR8vYMxqIaCjAcT4=
X-Received: by 2002:a17:90b:5688:b0:356:22ef:57ba with SMTP id 98e67ed59e1d1-368f781c7b9mr1480053a91.7.1778651808190;
        Tue, 12 May 2026 22:56:48 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368ee32822asm1785492a91.12.2026.05.12.22.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 22:56:47 -0700 (PDT)
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
Subject: [PATCH v2 2/3] clk: nuvoton: ma35d1: fix PLL_CTL1_FRAC bit field width and fractional calc
Date: Wed, 13 May 2026 13:56:25 +0800
Message-ID: <20260513055626.1070533-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513055626.1070533-1-a0987203069@gmail.com>
References: <20260513055626.1070533-1-a0987203069@gmail.com>
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
24-bit fixed-point rounding to 3 decimal places:

  n_frac = n * 1000 + (x * 1000 + 500) >> 24

The +500 term provides round-to-nearest before the right shift.

Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/clk/nuvoton/clk-ma35d1-pll.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1-pll.c b/drivers/clk/nuvoton/clk-ma35d1-pll.c
index bfedd45bd04b..7e6b30d20c01 100644
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
+		/* x is 24-bit fractional part, convert to 3 decimal digits */
+		n = n * 1000 + (u32)(((u64)x * 1000 + 500) >> 24);
+		pll_freq = div_u64((u64)parent_rate * n, 1000 * m * p);
 	}
 	return pll_freq;
 }
-- 
2.43.0

