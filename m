Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1A64229C0
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 08:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782979862; cv=none; b=F6N07Zj+ZPiMDkIWQrxQpAsIhL6nilDKq9lrvkbCwp/FX17TfjdDkSEErYpSRdnGUw8QPnMGUu+ucYxyKgUOe343IKGkEiraSIWBgt0g2Cuxldnn9sziXHRnGgiqmsx4Lfnqn9ycvIHFuYIViZ3+jpPtyAfyx9SYWAPpTiLQxHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782979862; c=relaxed/simple;
	bh=mDE5aNV7J0YTDC++0PyqpQq+1LRXe/OEq5dNJJriQq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kpNxBPfhMnfNkaTVQcoW6UnsZgEAd4vSCBikiFqaSQLdJ0ZQLvu8QzVWmhfoXm3m8QMsTb/PRFuIb0Bvo3e/RU27mRkkL38M0knr/arrkVX+0FVgO8l7L4J2UJswKGYp9IXH/4AZDhDEic37ZzUR1CAvf97AJHk93hma7J1xGx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=JJwk3h/q; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="JJwk3h/q"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47863f723ccso51825f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 01:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782979859; x=1783584659; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rSh1ZBRvKf6dioysT8A/x6MNdQs15mKol/PsSCRG53E=;
        b=JJwk3h/qQtnc7NyJAUiOHc3LRNs9k1PaxZ8qWN3irb7xLTwnuXXooJKzOMUUzyOVEx
         ZyuU7XIivqJMadJlCRSU42SPDIyqXSmvYjTuFCSiHT5ZZtspozHwl0JQ6vwzImUKyYYw
         qK70D3c31njjV5ehBVV/CFdbEv3c5jfE3adeOUL8P3iPVW1XHwf6JYNLUifyLbb2AYjL
         lGSf2CbnsM8D5jMmzcS9B6NjKOGroQgblZjQh5KeXPlzp2bVIAPJGXAqie781sbovKNe
         a6pYUiRpCYXj+kb+88jePjRdzfa8bbdzn22NhEyD/kT2JDFUlh9bk7TK25OXdvGchKQB
         jziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782979859; x=1783584659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rSh1ZBRvKf6dioysT8A/x6MNdQs15mKol/PsSCRG53E=;
        b=VwFTE1CW+mYiFEeUv0oCTA1EVPi5x8TbuF5xnXFD85VgeGAWiHRYxtDpf2zhvkNXkY
         0fIOXd8p6zAUAnUeqgrTdaIXR6ifdBu5ooGypS25SVuOhRMKBU1g3U8QpO1cb08tLZa9
         Qs688QISNyckqJmS0lFZ9msXPoEA29w558sBJMEj0nIin8jmB0hIclS7T7ev1h9mPMiO
         dn+mVULMwddFEhh1asmxdxN3hk2i4D2I57gi3gmXWxP/EDUGTgXRoM61/J/kTujhSN29
         uz6NeB44O22JIXcPZzlAlSGscACAaqyIr5gN5Mka4ve6D0mtwcXMP31+I6meg3WQPnAZ
         sp0w==
X-Forwarded-Encrypted: i=1; AFNElJ+i63FgYiOct2ZL3mBflPFd8QUgHyqLJBfj4lllTL6+EWCSd9zg1o7JZMAlewVU58RvYkQlTPZ7Hhs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNlMAKVG9SRYM/vetdruK4DJZnVAG9KKi7MGQgqv+HlFY+MS5f
	gFUmek+YNWBfWZzc0Ek3funGaX7BekFD6T+Iw9pgKBaqpNVybDcsOutZBQDwklESPnQ=
X-Gm-Gg: AfdE7ckYfW45IQPmoKxOPfyAPxKOmLlsLBmUJlGJUU3+weMxuSBJmXlIe3AXSQyFpbW
	iBIEE7F5cmsOyZ9vasr3EvU1jLvC/w/8Bk1jrgoRtfvDJwLM4k8UHebqgQLGgGebIL4tNWJMw7O
	lXPjcSLQ4YOqr37YByLj6h2qaiYz6Pa/dWuTbCLU65SZRbRXxVDKoreSNFf2HCc+VO2Ei4WLoNE
	G6ZOFEWmbt9HB+ir+WBFDaGHfuBq0gAqk+6GRyJdnf6p6AD/jaDg7SQXsnmfZb8kB0xWrxPdlHi
	TczG/WyEP5wOik1r56oQQ2BJzVQysvcCeYLFe8mo1j7AaRd9MoXR110To+XGh78ooHCfDZ+Gf1S
	0SotCqY41Cu3oswaOLujRK6K8iEdQSzePBaZzbVHjGQSbIzpFAQCmqZyjC/U7ICkhuSkhL19FpJ
	eLfQ583dWHAVMDBJKLXSNfnw==
X-Received: by 2002:a05:600c:c046:b0:493:a8eb:5145 with SMTP id 5b1f17b1804b1-493c3cd4ac7mr42700915e9.4.1782979859299;
        Thu, 02 Jul 2026 01:10:59 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:2e3a:7dcd:d2a4:6556])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493c6372a31sm30759565e9.13.2026.07.02.01.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:10:58 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 02 Jul 2026 10:10:06 +0200
Subject: [PATCH v3 7/8] clk: sunxi-ng: sun6i-rtc: split main oscillator div
 and gate.
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-a733-rtc-v3-7-eb2580374de6@baylibre.com>
References: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
In-Reply-To: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqRhz84Va+eOo65gJ7r3N6Uf0cw5m///ZPyWWed
 jMOv7SogdyJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakYc/AAKCRDm/A8cN/La
 hX2JEAC0IHxsjEu2zR4yluC1t2Qb1R/L4bdk5ZB2cG6ZO54dIfcruEioVYrQy33K0Ed91Qx1xdE
 60I8i6/hGKoLimMfyWJbAVqKQ29WXMVpz3nY2R/Qnv46o03/dSHRoXFaA6/lWNtZohRlcktfxh8
 pz87aKnhsIc/yHVwoXXniWAT3FpyS4dWoG2odR05jydF7opAW1I76KngNaxEhoKAepZS1/2Pbd4
 L6GlU6TUuzQmxSpqK6hyV/ltMo7+8DnGIjjaH5/LDcBkvUXgf6jfqqYWtetU3AALKJYIsasG+Qn
 eC7Ypky8gYw/34RmJ4M/vKUPr582khMcs9Xi9eOFXS1Zk9YSLncqBCPFLxkvkbLfk+E7moeGo4g
 k/6ux28KThwQx49b/VFGIiAxQKJej3xUtaUY/22zhSM2QKrSAcnSTnBneywFJLzOraENmnJCz/e
 VU257QrLk36zzQqVJcg7MvDtSK2PFYQ6yloz+IGekf1LYV5pCGljTyXowMn0U+uOAnh06SZKyuO
 BkF/Flqz2jcmaHNMsOvAHn7hL7P8HrAIJx4Iw8v3a+/mhvHAoq6nCKnSZ1y2BDMJpxj4qyCVYKF
 2ZMJ0jLwbj6nrVsCADE2p0X9xadDN8s3baLJGDZCxm5FtiYxyB5kZCQXDcQ2LM7aR8Rh1+zAq8D
 6FeMPTX8vOFg/lg==
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

