Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D853423E85
	for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 19:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784661464; cv=none; b=H5QKr++jnaBlUZWKncSm0L9p+5OyYlBHOH0c+A9/szqc/7J/rtjs47pRrb6vt4gnkiGcAgW4linP6z5g43I3wM1xjT2W+gD2nXi5abKZEckL8fiBtaNOzqu4E0POK4WGRoJ7itEMykK4Cf4p6mCV6c5NCbYC1REMnZcWZug5wkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784661464; c=relaxed/simple;
	bh=4IQcuuUttHjx+yzAyu5y+EXz1z1kR8v1d4gWKmLHTsI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pHb0b2yKMDoTjn6aLhf23J2+xKjbXtD+9tHuzXhenlR16I8m/WTHZ5WGiUPPUkwAUExO5XsuFiDU0So/G00jVJO6ft1FmcMD+JS9pD4oPq65X5ZhbVl9Qx7+FnBtwBeUqRB75t3fvGFjkTMRvG9ENiWuDMTwzdmfd17PXuMnSQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=yfGaS2y6; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="yfGaS2y6"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49558ce01afso24789875e9.1
        for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 12:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1784661460; x=1785266260; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=waJgXQXTGwqxVCoKMxFRK8UAG7XXejyC9jdURlCNsnM=;
        b=yfGaS2y6hzAknOUH2rkQQk3NS6xaSs7zZNtFl5ZrGA/2p3nZOsl33xXnveoWkxk+bG
         yFg7rwaRLbs+0eoQPnMSPXT1X3+1bBR3CTy8vzQz089zJQdspAW1XhSCDkA8tJ1TREjz
         leTBEYbcMsawHfCF4yiAR4dqV6xvSamWz/C97oNGexOnUGdnmJPy5kyHO3QGQxokbnCv
         hflWTBDi2wvG8lVj7Q9Ovr0svioLiOJ4Lyd2Jse5lr5sQFYqFWXxXOqZ+4tWXkG0DMdV
         jaFnpkq7aUmqcDda6es6eONU1BVsMo5+Jc9b4hAdYD9lYQefznkAsxNtCuV7rIyoCdZ0
         QZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784661460; x=1785266260;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=waJgXQXTGwqxVCoKMxFRK8UAG7XXejyC9jdURlCNsnM=;
        b=oQKyoqR3V3jSlAV3/gar4l0nIszBIwJsmAJs/xYQFhTkNq8uQTG/d9rYdZFXggrcyr
         r4nznqLFqTj9ukc53nGP9rcWLMMX6znI8CNwGgulAntXOh0hqrZMyIAlyrFVOCDFsnPv
         UR9A/4z+WOTiwW2dfGnR5CyPAB+2wAq92LrS52zdTMM2I/vjRrpaIcHGbTTm2TrAcVDD
         CqxTtdfG849uUq31g8hUpRZSrEoZcHxEuOqniJsfDX9PUHiSSqoHSxb4Voyl0GoYCf3w
         XYHYqW27hIFshN8270nHsIqatbGh3jnnOTor1f+bjvMgdmXymTYASnuabj9nUJR+pNtv
         stZw==
X-Forwarded-Encrypted: i=1; AHgh+RpZBERxovInt5yfT9yi2Xo6ZRJxDpS5+tKg2dGAO3KXtHelYU8JHUhfLkMl58ItxzPL5qakNa6ZV/4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq31SyXxMskCCxdqIFY1xjWCmytXQEIjZjwjdBMU9lqHwYmF48
	WHsNOxM0IgUUgGbzwa+HdvT3mPG2EhrcLCLAnMxlYjHVddcJ+KD32+7aG1pN80wk1V4=
X-Gm-Gg: AfdE7ckJpGaDPi8ltg/VODjBKth03f6/WBLYdDJSc4lCB2b21kQ4vJGTyNyf2vuEw3p
	tD/v2O95ncZ9f7k0PajEzWnfHJdQSDw3ZNc5JyISVqApDNLwamA+sz/IskpuMbmpt94PhguLUgG
	B7C7O7o8cSC/6bank+Am/PKeq1aB6ctmkbkNABZBiZgtoaVMp9/KLT8ogSNXaOOk4Y0RIyyTP9k
	MrRkkfYWEGdbkKSoUuNleVeGAPatC5a3NuY3T5Tc177o4GSJdJIiqPY9LuY1wspRgy7vOHp9kCr
	wL1nfCeiORoxhVtvUb21N76XNV1QwZL19utf1+hoFxJd+X0hoSpObQyA32LVXTHZBuRERPTUrMo
	CpyZHOShn3dlR6PlXCLFI5J5wWXTVeUVciHhB/dLUCyFpsDQFVA1amSG+oHsIk4wmTONPNShSZy
	S1RVeK9QUUrKJf+XQ47IXWz+4cIaCIy/uKzSDJLh129+LPsj+hSNyIfg==
X-Received: by 2002:a05:600c:3512:b0:493:cfe8:5b36 with SMTP id 5b1f17b1804b1-4954a3eec4bmr228858235e9.8.1784661459576;
        Tue, 21 Jul 2026 12:17:39 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-92-99-174-41.alshamil.net.ae. [92.99.174.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f7feea1cdsm9351011f8f.32.2026.07.21.12.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 12:17:39 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 21 Jul 2026 23:17:26 +0400
Subject: [PATCH] clk: rockchip: Fractional PLL coefficient on RK3588/RK3576
 is two's complement
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-rk3588-fracpll-v1-1-b289bf17cf17@flipper.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyND3aJsY1MLC920osTkgpwc3TQTY3Pz5BQLA0sLYyWgpoKi1LTMCrC
 B0bEQfnFpUlZqcgnIFKXaWgCE6LCrcgAAAA==
X-Change-ID: 20260721-rk3588-fracpll-f4377cd80983
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Wyon Bi <bivvy.bi@rock-chips.com>, Finley Xiao <finley.xiao@rock-chips.com>, 
 Elaine Zhang <zhangqing@rock-chips.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>, YouMin Chen <cym@rock-chips.com>
Cc: Dragan Simic <dsimic@manjaro.org>, Liang Chen <cl@rock-chips.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5756; i=alchark@flipper.net;
 h=from:subject:message-id; bh=4IQcuuUttHjx+yzAyu5y+EXz1z1kR8v1d4gWKmLHTsI=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTFH72wem3K6Tc2PHar3FZM/Blg9foU59ulu4X/Gf56e
 TT/wW1Tro6JLAxiXAyWYoosc78tsZ1qxDdrl4fHV5g5rEwgQ6RFGhiAgIWBLzcxr9RIx0jPVNtQ
 z9BIx1jHiIGLUwCmetIaht+sbmaXQ5WWLuXfdnDXaqGQKT2u5/UF+E4Y+pp2HDmpyPCUkeGe6Jv
 PoT5V8RHvnsQp1YUUrIlu5ZqzY1lKYr64k4pQNjcA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

When the PLL rates table was first committed for RK3588 (and later reused
for RK3576), the fractional PLL coefficient was defined as an unsigned
value, while the TRM clearly states that it is a two's complement 16-bit
value.

Rockchip's downstream kernel later revised the fractional PLL code [1] to
account for the two's complement nature of the coefficient, but that
change wasn't upstreamed.

Change the PLL table definition to use two's complement for the
fractional coefficient and update its users accordingly.

Note that a negative fractional coefficient is meant to be subtracted from
the next larger integer multiplier, so the _m values in the table are
also adjusted accordingly for the two negative-k entries.

While at it, fix the denominator of the fractional PLL calculation to use
65536 instead of 65535, as per the TRM (RK3576 TRM Part 1 V1.2, Section
2.13.1.4 Setting Guide on P, M, S, and K):

Fout = ((m + k/65536) * Fin) / (p * 2^s)

Link: https://github.com/flipperdevices/rockchip-linux/commit/7a72bc05dcc3a51e85ae531749e6270bf9b9212d [1]
Fixes: f1c506d152ff ("clk: rockchip: add clock controller for the RK3588")
Fixes: cc40f5baa91b ("clk: rockchip: Add clock controller for the RK3576")
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Not adding Cc stable, because while this fixes a real bug it's not a
regression, as the issue was introduced in the same commit that added the
RK3576/RK3588 support.

Note that there is a separate unrelated issue with the rate table, namely
the 2256000000 Hz entry currently leads to a VCO frequency of 4512 MHz,
which is just above the TRM-stated maximum of 4500 MHz. Also multiple
entries in the table end up with Fvco < 3 GHz, which according to the
TRM leads to a PLL period jitter of +-2% vs. the +-1% for Fvco > 3 GHz.
To be revisited separately.
---
 drivers/clk/rockchip/clk-pll.c    | 8 ++++----
 drivers/clk/rockchip/clk-rk3576.c | 4 ++--
 drivers/clk/rockchip/clk-rk3588.c | 4 ++--
 drivers/clk/rockchip/clk.h        | 8 ++++----
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pll.c
index 6b853800cb6b..f445b01aabd0 100644
--- a/drivers/clk/rockchip/clk-pll.c
+++ b/drivers/clk/rockchip/clk-pll.c
@@ -13,6 +13,7 @@
 #include <linux/delay.h>
 #include <linux/clk-provider.h>
 #include <linux/iopoll.h>
+#include <linux/math64.h>
 #include <linux/regmap.h>
 #include <linux/clk.h>
 #include "clk.h"
@@ -913,11 +914,10 @@ static unsigned long rockchip_rk3588_pll_recalc_rate(struct clk_hw *hw, unsigned
 
 	if (cur.k) {
 		/* fractional mode */
-		u64 frac_rate64 = prate * cur.k;
+		s64 frac_rate64 = (s64)prate * cur.k;
 
-		postdiv = cur.p * 65535;
-		do_div(frac_rate64, postdiv);
-		rate64 += frac_rate64;
+		postdiv = cur.p * 65536;
+		rate64 += div_s64(frac_rate64, postdiv);
 	}
 	rate64 = rate64 >> cur.s;
 
diff --git a/drivers/clk/rockchip/clk-rk3576.c b/drivers/clk/rockchip/clk-rk3576.c
index 2557358e0b9d..63f229e73a45 100644
--- a/drivers/clk/rockchip/clk-rk3576.c
+++ b/drivers/clk/rockchip/clk-rk3576.c
@@ -79,13 +79,13 @@ static struct rockchip_pll_rate_table rk3576_pll_rates[] = {
 	RK3588_PLL_RATE(1008000000, 2, 336, 2, 0),
 	RK3588_PLL_RATE(1000000000, 3, 500, 2, 0),
 	RK3588_PLL_RATE(983040000, 4, 655, 2, 23592),
-	RK3588_PLL_RATE(955520000, 3, 477, 2, 49806),
+	RK3588_PLL_RATE(955520000, 3, 478, 2, -15730),
 	RK3588_PLL_RATE(903168000, 6, 903, 2, 11009),
 	RK3588_PLL_RATE(900000000, 2, 300, 2, 0),
 	RK3588_PLL_RATE(816000000, 2, 272, 2, 0),
 	RK3588_PLL_RATE(786432000, 2, 262, 2, 9437),
 	RK3588_PLL_RATE(786000000, 1, 131, 2, 0),
-	RK3588_PLL_RATE(785560000, 3, 392, 2, 51117),
+	RK3588_PLL_RATE(785560000, 3, 393, 2, -14419),
 	RK3588_PLL_RATE(722534400, 8, 963, 2, 24850),
 	RK3588_PLL_RATE(600000000, 2, 200, 2, 0),
 	RK3588_PLL_RATE(594000000, 2, 198, 2, 0),
diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-rk3588.c
index 75d42fea2a11..24baa0ef9bf3 100644
--- a/drivers/clk/rockchip/clk-rk3588.c
+++ b/drivers/clk/rockchip/clk-rk3588.c
@@ -79,14 +79,14 @@ static struct rockchip_pll_rate_table rk3588_pll_rates[] = {
 	RK3588_PLL_RATE(1008000000, 2, 336, 2, 0),
 	RK3588_PLL_RATE(1000000000, 3, 500, 2, 0),
 	RK3588_PLL_RATE(983040000, 4, 655, 2, 23592),
-	RK3588_PLL_RATE(955520000, 3, 477, 2, 49806),
+	RK3588_PLL_RATE(955520000, 3, 478, 2, -15730),
 	RK3588_PLL_RATE(903168000, 6, 903, 2, 11009),
 	RK3588_PLL_RATE(900000000, 2, 300, 2, 0),
 	RK3588_PLL_RATE(850000000, 3, 425, 2, 0),
 	RK3588_PLL_RATE(816000000, 2, 272, 2, 0),
 	RK3588_PLL_RATE(786432000, 2, 262, 2, 9437),
 	RK3588_PLL_RATE(786000000, 1, 131, 2, 0),
-	RK3588_PLL_RATE(785560000, 3, 392, 2, 51117),
+	RK3588_PLL_RATE(785560000, 3, 393, 2, -14419),
 	RK3588_PLL_RATE(722534400, 8, 963, 2, 24850),
 	RK3588_PLL_RATE(600000000, 2, 200, 2, 0),
 	RK3588_PLL_RATE(594000000, 2, 198, 2, 0),
diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
index 9e3503e2ffc2..72b36bba3152 100644
--- a/drivers/clk/rockchip/clk.h
+++ b/drivers/clk/rockchip/clk.h
@@ -635,10 +635,10 @@ struct rockchip_pll_rate_table {
 		};
 		struct {
 			/* for RK3588 */
-			unsigned int m;
-			unsigned int p;
-			unsigned int s;
-			unsigned int k;
+			unsigned int m;	/* main divider, 10 bit unsigned */
+			unsigned int p;	/* pre-divider, 6 bit unsigned */
+			unsigned int s;	/* scaler, 3 bit unsigned */
+			s16 k;		/* fractional part, 16 bit two's complement */
 		};
 	};
 };

---
base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
change-id: 20260721-rk3588-fracpll-f4377cd80983

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

