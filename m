Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679B2408019
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 12:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782736961; cv=none; b=mgrxe8TvZ0wnvmWWQUovnaWdXgmI0lZDLRleVxoYCS+N5KuLOdLtTkDuV3RCblUQ++hzbQYiUyhKfW54YpZR7/fRlNAfkC8CbanT2BufsV0Lr5ZFTy+RwU8On/5KnkDvUPwLPExYfF4uEfjQqAVhRlcV4AUMZkqbASybgpa5glY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782736961; c=relaxed/simple;
	bh=mDE5aNV7J0YTDC++0PyqpQq+1LRXe/OEq5dNJJriQq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gm9oPhrQj5S0IFKuuCRNysFe/ApeUXuPPNCPkG8PXfn0BCtL2YU/2o/LlWUWN3fxh6BlSKj8yS0drqrRnH5e/gjoWmLanvbZYukNYAGDcr49B8E/X36FLhXJH83ec2PkxqP7fML9k6SOL9Heyek8A7VTUJDzWo9DHkngrDtNI68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=NGaRvJ3p; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="NGaRvJ3p"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493a7bd27c2so11814055e9.3
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 05:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782736959; x=1783341759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rSh1ZBRvKf6dioysT8A/x6MNdQs15mKol/PsSCRG53E=;
        b=NGaRvJ3pKdrzawa5CQoL2X0tGODbKMiNJ1m68rKTbe6BNTpBnrlynETqFz5kP3t882
         /lGSfikchUWVdfYyW+LTrz9ofqwhT5O/ntRiAhZw1ZLOG1YA+VVDym5rlMT77GwETCyj
         Ve8sQZoYrgnDpa+tJfKNVQ5qttmI5HT893lyieriAUtM9tPtHmhj7jM9CNezrI+sdrz9
         0u41IygVqV4eRZIUIfUnFr9cyC9B7/02kwiUhckiznXUlIjqsF5dB3z7NtK1/Sw0xrv4
         LsRZeqxQk60eIvA7kW0VJWi5j2UoCEH5sTe7oy405OeSwlzsiswNKw5UZ8luhnH3l2hv
         Hj2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736959; x=1783341759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rSh1ZBRvKf6dioysT8A/x6MNdQs15mKol/PsSCRG53E=;
        b=ZPjZ/s+gfj/YP/RpoFwpyIrHLkg9an2ZgfLoGtaoQ2+SYAVVmYa8t8CLGzPUj23/b8
         cUPQX/xWJ7NZx1PzXesP1vK07yWIcs1Y4Otovc6yytRNrCFMnXqWZHFh72x5Am2UGuJY
         JnbYJA3Rug9gUxIRpZI8GfhwchPkllV2zkXicJ8L0PqZqlJOHNlJpUkFaUFr1rhrtKgr
         jptoGYspzMXnSXyrL2pE4eOkMilfU2Omcnq5ZRgWZKQYVGZ/oR1KazJJAeBNWaov2TN8
         nCjqFDtsNSJebX5jtGT5LQyVS8rd7cF6JxWadT4XDrq71B12QMu8Debh3zamEeBHG790
         gX+g==
X-Forwarded-Encrypted: i=1; AFNElJ+yvUM6pvOX3f/ngd59PY58ytcMZ2BhGfAuvfiy1eZjMKdhjw0gjix9yTaGaEWaW5LIcZqKC2lox/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwA3uM3ahh6XAJTFEHceTGYZLEBLW0kUWCCsLw4aIICtOfbHib
	Dqt9CtF5bWGRXyKC/eTAo5DY6pxgg8n96ncN2D5d6himZd+7ZP+t4aFPGA1uQPXaj7wciZrFhx5
	x8luq
X-Gm-Gg: AfdE7cneFpjEX7R01ktzoR8HsXWWDQkQP7J0L+50sAkG+lA9Bl8usZxQGjFViz+ujXe
	Q+CxEe2Xyn6fprjKDQrCDEKmlPMj6VGg6IMz/TAEOIeP+xWJ0OCAoGDwZUxay4QQyaYK6vMXFVr
	DdxUwPBBu150HQqNJ4+1BmABHqyR6abBzcNHo3uJGcZR/2wTFq129mRi3tUZ9LRUB0msHye4gzm
	YixYCFUK0oIX+w9t4gvoX3BmcGlO9NNOy9SmDkJnAnFaZvWiQLrc7qx8AAEkz/EK4fnxxDGkknz
	hw2TC4/hfGH/keKbM1wOvURQsW8UWh7jO/zvgsG51Yd3kGkfTIrazKBigtlziery5EzIEX4s80b
	JMZYvFYYloSz7U90Lovu9mCtmGEriXQFRLaXx5hPoeVXeH1VUocjz55pk5NmJzG1gRYXh6npv69
	qKzWm/+pn7G9c=
X-Received: by 2002:a05:600c:8b30:b0:492:6eff:7d02 with SMTP id 5b1f17b1804b1-493b71dad66mr10202405e9.30.1782736958743;
        Mon, 29 Jun 2026 05:42:38 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d21:f5d5:2d3c:23a7])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4730937e18dsm14116290f8f.21.2026.06.29.05.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:42:38 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 29 Jun 2026 14:42:09 +0200
Subject: [PATCH v2 5/6] clk: sunxi-ng: sun6i-rtc: split main oscillator div
 and gate.
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-a733-rtc-v2-5-7b72112784f8@baylibre.com>
References: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
In-Reply-To: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2479; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=mDE5aNV7J0YTDC++0PyqpQq+1LRXe/OEq5dNJJriQq0=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqQmgwCcpAim4iGNmxcdYBHSDfCGlZjMmgEkjlG
 pEgFgGXBn+JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakJoMAAKCRDm/A8cN/La
 haOZEACnFfbvW3FhdzHAFggeUxMCHosJfDMAsVLsgX8coJCaSYo7KTr+uvuDH5zi96kgfbQFk82
 JX8sRKJemEUWdYZWWiBiqVSWYlk0LGOqL1aeqZjNYRpcHDuo+bEZSUute478X/gtGo+xF+Euqyx
 qc7ecT16wVXAGk6Ti6B14ixs+kgmoai6oyYcW7u8hhVpyfsC8+RaawD/4ng0FE5W0U5mhkAtrZU
 quu/IsG8QrFmvHaRy2b+clEQdK9t885FlCriHWlqqv6L0Sq1OLS2oyFpXmtwNpcdx3yrzPr2IIl
 +3EU7yJCxknNQh42OtSEBB+KwnCUUY/mWyQnOPihDWtxWT3Uoc3OVdJsaZdYkOL5zBrttkVmMKr
 d5E5ddcl3ChK4VuC8rjgjMhs19xua46P9haUS4YSlaXtUn3xftoXpfNwtcERxLlxVjAD37M0ti9
 ioQJ093gTZFRC7JPe6LETF2qSlneea758Jm26jQy72/2XhemfiIZUdQ1Vg9iD5zVlFvRDZ4Xv2F
 +WVGtuV6ayT1kuc/vV+VwQ8umGEzGBF5JsTxHTUjPvOxQIy5AncPF9bkWrxrG0Cilc4JNgYNZ6/
 k4f5yOMZyIOlo+C1LPERCOt0MZICSk9UBeQeyrAEqHGaL52hNAQtcQ3b2W1yVzdcy6S0YkN4Wjv
 2JBzJngCguw2AUQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On the a733 the "osc24M-32k" clock has the same gate bits as the previously
supported SoC but a different divider implementation.

Instead of a fixed 750 divider, the divider is selected based on the
rate of the oscillator. It can be seen as a simple read-only divider.

To easily replace the divider part depending the SoC, split the divider
and gate into two separate clock entities.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 20 +++++++++++---------
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.h |  3 ++-
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
index b24c8b196e66..25dd87e78eb7 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
@@ -218,17 +218,18 @@ static const struct clk_parent_data osc24M[] = {
 	{ .fw_name = "hosc", .name = "osc24M" }
 };
 
-static struct ccu_gate osc24M_32k_clk = {
-	.enable	= BIT(16),
-	.common	= {
-		.reg		= LOSC_OUT_GATING_REG,
-		.prediv		= 750,
-		.features	= CCU_FEATURE_ALL_PREDIV,
-		.hw.init	= CLK_HW_INIT_PARENTS_DATA("osc24M-32k", osc24M,
-							   &ccu_gate_ops, 0),
-	},
+static struct clk_fixed_factor osc24M_32k_div_clk = {
+	.mult = 1,
+	.div = 750,
+	.hw.init = CLK_HW_INIT_PARENTS_DATA("osc24M-32k-div",
+					    osc24M,
+					    &clk_fixed_factor_ops,
+					    0),
 };
 
+static SUNXI_CCU_GATE_HW(osc24M_32k_clk, "osc24M-32k", &osc24M_32k_div_clk.hw,
+			 LOSC_OUT_GATING_REG, BIT(16), 0);
+
 static const struct clk_hw *rtc_32k_parents[] = {
 	&osc32k_clk.common.hw,
 	&osc24M_32k_clk.common.hw
@@ -286,6 +287,7 @@ static struct clk_hw_onecell_data sun6i_rtc_ccu_hw_clks = {
 		[CLK_EXT_OSC32K_GATE]	= &ext_osc32k_gate_clk.common.hw,
 		[CLK_OSC24M_32K]	= &osc24M_32k_clk.common.hw,
 		[CLK_RTC_32K]		= &rtc_32k_clk.common.hw,
+		[CLK_OSC24M_32K_DIV]	= &osc24M_32k_div_clk.hw,
 	},
 };
 
diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h
index 9ae821fc2599..ab7b92b47f59 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.h
@@ -9,7 +9,8 @@
 #define CLK_EXT_OSC32K_GATE	4
 #define CLK_OSC24M_32K		5
 #define CLK_RTC_32K		6
+#define CLK_OSC24M_32K_DIV	7
 
-#define CLK_NUMBER		(CLK_RTC_32K + 1)
+#define CLK_NUMBER		(CLK_OSC24M_32K_DIV + 1)
 
 #endif /* _CCU_SUN6I_RTC_H */

-- 
2.47.3

