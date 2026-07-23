Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1372E43B3E7
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 10:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784802143; cv=none; b=k40vUdzINIzBj3fVRpQfL33zLIneEtxxiCvG0dlZkCtfMRR1s4uGfnDOVGpXSR/Vbn3fHiUL7o+GcWrRJTVe905gq6Abvdukjt3tv8nIZiBZvrV5s/usyE0zeIqtBFPNanenrJY2V/Nq46amzg16Lkjun37Ykt+pIqmBHXyBVVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784802143; c=relaxed/simple;
	bh=SA2Nr/sgMInMeZ9zzbOPl13XCwabwddmdhZt2984r/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JOvjjbG2rEAc1nIY7Dgn/XhwydSHOlps8NUFT8jDFjH/IDEibabXdJrB3b/4dQO41OBon5yRK9tMK2rXSIDSKa9co+yWbyWjvoF4FCNrynHdKDytXNcgh4owAmwkqhFGwiQRB6kJkwNBG6CYBtmOX9eg9GYsdkBBPXNcjFosJJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=k0Tj41Nd; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="k0Tj41Nd"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-698aa7ba3e6so793958a12.1
        for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 03:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1784802140; x=1785406940; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pFqonK3BjYNpZGqcCAw+wY74K13WEhgmD2D1si4hUes=;
        b=k0Tj41NdolHdSXBm4UWUozEzDADoSl4UzDKUuqzJigiyQfs3FJa+/OHObBrRMf6ReX
         6KLtFX6HWsbOBC8S+6QP8FGva6T+fushaZVeh7Y1fauUOYJU1YEJnT+Df6fAqDPLZO7w
         08rtWq1r5w0Bpz+OAdtiLM1QqCuUHLPVW2OLS9bN+mmqoJTYii1rSOTl8kCWU2D+BfPY
         xDHjwOW2h/6No5bbTifH+Fk0YcQVz3mosxer6OC3K7kTmpLifWrYFLCEwxcAcGhOTA4/
         yn7QqL9Awa38zAHhr1MG1loRK2nQNYOGmp0JGMGNhFRFTCQLqTFXIWPQYWvs6efBU0IO
         9Ifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784802140; x=1785406940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pFqonK3BjYNpZGqcCAw+wY74K13WEhgmD2D1si4hUes=;
        b=SY+RVJ193MIbweHoBiUDnH+eV/L0fKdcvd9OzrxtQ8w2wuFRaKXgrAbdQNEtnjH6iu
         7R20n60Cdb6WEDO7jdgzF/wL+155hM6ie5xU7mKsMaC2k2Mer4wM+EkSXs0imTv/xZY9
         dR39Tvb9e5SffNu3IZ6LZOe2Aqcy1C/yO/Jz6tXfy9V3NlcFtXTKnYT4fXXPuSlmNL3k
         kj5in/vmgcFzGfR4eaxG//ZfYJDT7ZD/aXf9KjsLG6nfdX8xffCm5qKbfSuGDkdsvxW3
         N1lXxVt5ljY3s04H512B7zgR07Xhc85CuZuazZLczMToZ7WY1rUFo7w848Q/XiSNJj4C
         zaeg==
X-Forwarded-Encrypted: i=1; AHgh+RrIQPpBHgBXG7gCLRNhcbcB/8k4FmRB/7ij0jgVdVq3qidDKKK6MeFWyWPAc40/w6OUuQ+MuCnJ2g8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ+RYpkS97h5b9Mhfa3XU9sw+zemuLkTgVMu9JYc5DlpEgyB9V
	TS2erN+z1HEIIM0hawTtQhinikNSUjLPHkbYaZBDoG05HuWEnXRi0HjD7eSNZG+M9Pc=
X-Gm-Gg: AR+sD11h6ej3c5j7yjCzQWQVo8NCshHwy2YxRYZ5mYGatTGyepUNHrObP474ps8uie1
	43b/uXqXjQU3kfBuGEYCyXEsZ7HMTxjEkDaecHDgxU/IKtVCH2ThIfX6m089p8v2g2xr9XzBLgf
	EEnGfuChsygmNbiIJtL8O5EkK4SWB1kmn+r3A/sirW3nvcy/BM4TpdsZJobKUFZQBe4pTTgoET1
	tpQuM6Yrk47+Y1KBMrO3/A7EEKbbyWT+BwQWBWVzudMurbwGzZdlW4jdN7ypE2qY7KBGU5gz2DP
	5LKAnbHPqDeU+P44iDaY2p3iz0cJzXvdIg0dbiaFY0oXsYAyjo2LF44twJANRFWtBPpYNlBuYkp
	sOcdr9MID/kQC8CsdPh00qUpL8keAS8bogEsXiQa4H6aH9uppyaSk486nlOugyLmvHwO0AsC2bH
	5zo8qykLV2PQvGq3/zE1QXpw==
X-Received: by 2002:a05:6402:a51b:10b0:698:b6c8:70db with SMTP id 4fb4d7f45d1cf-69f6bc1afafmr613329a12.8.1784802140246;
        Thu, 23 Jul 2026 03:22:20 -0700 (PDT)
Received: from alchark-surface.localdomain ([193.32.126.214])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f35020dcfsm1944928a12.20.2026.07.23.03.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:22:19 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 23 Jul 2026 14:21:59 +0400
Subject: [PATCH v2 2/2] clk: rockchip: Fractional PLL coefficient on
 RK3588/RK3576 is two's complement
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-rk3588-fracpll-v2-2-3adfb9dda235@flipper.net>
References: <20260723-rk3588-fracpll-v2-0-3adfb9dda235@flipper.net>
In-Reply-To: <20260723-rk3588-fracpll-v2-0-3adfb9dda235@flipper.net>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Elaine Zhang <zhangqing@rock-chips.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>, YouMin Chen <cym@rock-chips.com>, 
 Wyon Bi <bivvy.bi@rock-chips.com>
Cc: Dragan Simic <dsimic@manjaro.org>, Liang Chen <cl@rock-chips.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6189; i=alchark@flipper.net;
 h=from:subject:message-id; bh=SA2Nr/sgMInMeZ9zzbOPl13XCwabwddmdhZt2984r/4=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQlvvaS+rNBss8nqypqdZf5nzcZrzfM2Df9earNnaVOb
 y0upN3W7pjIwiDGxWAppsgy99sS26lGfLN2eXh8hZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10jHWMGLg4BWCq5fYwMnyttxAWdlv1xaR/y6qj7dkdXkcnT/IR4Wd57O4rdPd17EJGhodW739
 OU3prdSAv+qfIs1CmXTLSIeHHM1xKHpsHluWrsgMA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

When the PLL rates table was first committed for RK3588 (and later reused
for RK3576), the fractional PLL coefficient was defined as an unsigned
value, while the TRM clearly states that it is a two's complement 16-bit
value.

Treating the fractional PLL coefficient as unsigned in rate recalculation
results in a kernel-visible rate which deviates from what the hardware
actually generates by Fin / (p * 2^s), or 2 MHz for the two affected table
entries.

Rockchip's downstream kernel later revised the fractional PLL code [1] to
account for the two's complement nature of the coefficient, but that
change wasn't upstreamed.

Change the PLL table definition to use two's complement for the
fractional coefficient and update its users accordingly.

Note that a negative fractional coefficient is meant to be subtracted from
the next larger integer multiplier, so the m values in the table are
also adjusted accordingly for the two negative-k entries.

Rockchip's downstream commit introducing the two's complement logic for k
also does unrelated tweaks to the PLL parameters which are not explained
by the switch to the two's complement, so they are not replicated here.
If any of the parameters prove to need further tweaks (e.g. for precision
or jitter) that would better be done in targeted follow-up commits.

Fractional PLL rates don't seem to be used by any current mainline
consumers, so this is purely a correctness fix. It will also be important
to properly support DisplayPort output going forward, as the video output
controller derives its pixel clock from system PLLs with no dedicated PHY
PLL option for DP unlike HDMI, and some display modes are only achievable
using fractional PLL rates.

Link: https://github.com/flipperdevices/rockchip-linux/commit/7a72bc05dcc3a51e85ae531749e6270bf9b9212d [1]
Fixes: f1c506d152ff ("clk: rockchip: add clock controller for the RK3588")
Fixes: cc40f5baa91b ("clk: rockchip: Add clock controller for the RK3576")
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/clk/rockchip/clk-pll.c    | 7 ++++---
 drivers/clk/rockchip/clk-rk3576.c | 4 ++--
 drivers/clk/rockchip/clk-rk3588.c | 4 ++--
 drivers/clk/rockchip/clk.h        | 8 ++++----
 4 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pll.c
index bf8acf7cee0d..706ca4b344d3 100644
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
@@ -906,6 +907,7 @@ static void rockchip_rk3588_pll_get_params(struct rockchip_clk_pll *pll,
  * For Fvco < 3 GHz: period jitter +-2% frac PLL, +-1.50% int PLL
  * Fvco = ((m + k / 65536) * Fin) / p
  * Fout = ((m + k / 65536) * Fin) / (p * 2^s)
+ * -32768 <= k <= 32767 (only available in frac PLLs, not int PLLs)
  */
 static unsigned long rockchip_rk3588_pll_recalc_rate(struct clk_hw *hw, unsigned long prate)
 {
@@ -920,11 +922,10 @@ static unsigned long rockchip_rk3588_pll_recalc_rate(struct clk_hw *hw, unsigned
 
 	if (cur.k) {
 		/* fractional mode */
-		u64 frac_rate64 = prate * cur.k;
+		s64 frac_rate64 = (s64)prate * cur.k;
 
 		postdiv = cur.p * 65536;
-		do_div(frac_rate64, postdiv);
-		rate64 += frac_rate64;
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

-- 
2.54.0

