Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B466439F77
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 10:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784802139; cv=none; b=dVUyIbWIV03PSe7asUaTBN/dIAyCGGvJQj7gWrjAy9Xdg44ETOsKdKgTmkWWc0W6GBwplchDmPIz+PJWKSdCFXhOgvsxKN8C8XiaUxSCFabMLUqSOb6hJAD02BirKWavtUUkMOasEZeHJSDvkDPF4TH+L+J3TiVV6odJBnlYZaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784802139; c=relaxed/simple;
	bh=jqtEtaQJKghCWQEk2fjI4x9WFEAteFPftL5uLjU7sBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pvWV1Hhfrim65khsmDT16FT0NOssMirdnayDFVIZRLPCItz9X9Dq5JhhVVh60siOakhCsblwWXjV4wwPARdajOQV30LSSxcz0KF2sMYwqxs6XiGCcgzNveeM1jNQqrGxDGmibeLM4hI2/KxEPYeyPX/eIjp80jXNXxmWhSDwnX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=rcp/zcg/; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="rcp/zcg/"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-69c5f6f7a40so944545a12.0
        for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 03:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1784802136; x=1785406936; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P5GvXCyDbMywePvpWfEAV2wGSAk98JtrF+QMdiv9nn4=;
        b=rcp/zcg/cFYOL7+R1p5O3p6UWhKHiSto5IS07CqlLMTkZmurw2HNSEERCIUDrewGeq
         cPZ9/Y8u1xUxfMKIO89JdcceHTnyDPzV2neMEXsP7acMymgcRb/hYBE50bLSf/ZKx1gx
         UbQCgCXhpIcoQyGaO4vD3ktsodmpUz3cCUKazOhkgWj23rTfvuNLu0S+lKJKj2vsx/fn
         nQC8EP/Te8nVvVuGm0rUzi8KSX9OtHsbhwfp0KpFdnoTr2mw0zGZ/opP/hFdtxu3yFVk
         y1qffLCHiYq6F/IYerlk95WUHzlUAm2nWWiAwA/aMS+yoBD7O3m+TqxyjdI56CO8/M1N
         KgPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784802136; x=1785406936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P5GvXCyDbMywePvpWfEAV2wGSAk98JtrF+QMdiv9nn4=;
        b=hTHj4Jfowkw8m7pVJDbZnA0cJqqf+/99zneWYNscC6qsE/C1XebERkcM7BaFAM1ASd
         1lt1zoWVJsxiRlFEPNRVXSydCPZkx3bfl5+OMuW+4beWgRQ2yJ9j7SUYJht3IJktKwwF
         iIE1DrciLJm739WASArm45P938yUNBliMPgX4QvHRs27bPZr9ZQLju0gAkMXPtC/gpvs
         c3ZprQ1G28qPLlLTZF1ej8dCrfBgKKoVzqMS0HH8K3QXiSCvj96E9TYUipdlDx7m4zZW
         MLFLT5y5SYfHF1J3sh6WVv4/UY8nle/6Dvvk2l+Xi/NvCmZyy9nwhJy1/4VG+mymVh8w
         ooBA==
X-Forwarded-Encrypted: i=1; AHgh+Rr/dE7qE8yHz1bunBq1seD6D8vW9ObZFPfWUPl/zRvlxPNC8oXEd8rw96wV28owq79QZMgTH3O37Qw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyllnzSlugEiasuTOUuqxarOxVyS5NXrDoZ7AAaqATVerVn36ZI
	LoCH9BJZ7fWo2Y8RPxLjIpgnpD1ujuKFXwz80FcEgVCgs/9/nZpAQM0mjny1jt/+uug=
X-Gm-Gg: AR+sD12DFPNFdC1WcIilmtOSOGXcJI/y9Fnpcvt9wUZ4WmkU0SAaRLylw+3SB8Nure8
	4PwhOtWq7uVAvLvE/a+/Mbaav8gKQXxG7MLtqSq/EO7nfyFUd0ACDu2S5KzqDXHESUm8u4CG1rQ
	NS94+S+6N4bAMS78OFkijeqUp0hgAXuD0h3AbgJrX5Uk67AnXPUh9N3h3iYDwyBZ2yCAqbEmyCL
	PxvCr6u0ZF6fYdLPdy3M3ruDVHJ4xxBJYSfpRXjrdklD0HJ4ut34uluABulVPKyQmXu49NnONfS
	4p1VPAUp8EqIZJqqOm05/8WlX3YHBRuvqjUpi5sUEnHS4maOfzCqIF0Dts0d6KfJP6D868+TRUm
	w8QoDCq1nqudkZca/6vU1B5d+80uBV8cQoPYjRVFjt8ueYTSYSB1d3GpLXA5uD1uNkcrNgsKJvW
	5V10rWk3wFujpKFCya1opXaA==
X-Received: by 2002:a05:6402:551b:b0:69c:7985:5aa0 with SMTP id 4fb4d7f45d1cf-69f6bf195b5mr892015a12.16.1784802136598;
        Thu, 23 Jul 2026 03:22:16 -0700 (PDT)
Received: from alchark-surface.localdomain ([193.32.126.214])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f35020dcfsm1944928a12.20.2026.07.23.03.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:22:16 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 23 Jul 2026 14:21:58 +0400
Subject: [PATCH v2 1/2] clk: rockchip: pll: Fix the fractional part
 denominator on RK3588/RK3576
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-rk3588-fracpll-v2-1-3adfb9dda235@flipper.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2122; i=alchark@flipper.net;
 h=from:subject:message-id; bh=jqtEtaQJKghCWQEk2fjI4x9WFEAteFPftL5uLjU7sBI=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQlvvZq/Tax+UyJXQSjSdG9r+cSuRpOND07vMZbwq3TZ
 fnb033tHRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEz1jAmMDGf1FxS+Z5m+PGMVe/ec0MPTnzm/ePReOV9O+I7ehRMB3VkMfwXOq3/
 ZrqSrL30u0pVX6OyUn9yODO1avPmq7VMncge+YwEA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

According to the TRM, the fractional PLL coefficient should be divided by
65536 rather than 65535 to obtain the output rate.

Fix the denominator and add a comment with the TRM provided clock formulae
for future reference.

See RK3576 TRM Part 1 V1.2 section 2.13.1.4 Setting Guide on P, M, S and K
or equivalently RK3588 TRM part 1 V1.0 section 2.17.1.4 Setting Guide on P,
M, S and K.

Fractional PLL rates don't seem to be used by any current mainline
consumers, so this is purely a correctness fix. It will also be important
to properly support DisplayPort output going forward, as the video output
controller derives its pixel clock from system PLLs with no dedicated PHY
PLL option for DP unlike HDMI, and some display modes are only achievable
with fractional PLL rates.

Fixes: 8f6594494b1c ("clk: rockchip: add pll type for RK3588")
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/clk/rockchip/clk-pll.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pll.c
index 6b853800cb6b..bf8acf7cee0d 100644
--- a/drivers/clk/rockchip/clk-pll.c
+++ b/drivers/clk/rockchip/clk-pll.c
@@ -900,6 +900,13 @@ static void rockchip_rk3588_pll_get_params(struct rockchip_clk_pll *pll,
 	rate->k = ((pllcon >> RK3588_PLLCON2_K_SHIFT) & RK3588_PLLCON2_K_MASK);
 }
 
+/*
+ * 2250 MHz <= Fvco <= 4500 MHz
+ * For Fvco > 3 GHz: period jitter +-1% frac PLL, +-0.75% int PLL
+ * For Fvco < 3 GHz: period jitter +-2% frac PLL, +-1.50% int PLL
+ * Fvco = ((m + k / 65536) * Fin) / p
+ * Fout = ((m + k / 65536) * Fin) / (p * 2^s)
+ */
 static unsigned long rockchip_rk3588_pll_recalc_rate(struct clk_hw *hw, unsigned long prate)
 {
 	struct rockchip_clk_pll *pll = to_rockchip_clk_pll(hw);
@@ -915,7 +922,7 @@ static unsigned long rockchip_rk3588_pll_recalc_rate(struct clk_hw *hw, unsigned
 		/* fractional mode */
 		u64 frac_rate64 = prate * cur.k;
 
-		postdiv = cur.p * 65535;
+		postdiv = cur.p * 65536;
 		do_div(frac_rate64, postdiv);
 		rate64 += frac_rate64;
 	}

-- 
2.54.0

