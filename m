Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB68542E019
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 15:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784301922; cv=none; b=NFMWiO2lzCLSX9ZrP8juZFrODh311mrbVwpD6GIraPt/k08WHe8zntOKfINDj99Ji86QBGQNHGpfpLW4AbPRKUGBsFGsYR4ijNO3LT4JzM45tOpviBm4rb4I0py4pW/IYUGHmF4EFZVpL+SBslYFkZNZaA4fY9Gz9gyJd5lI+L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784301922; c=relaxed/simple;
	bh=6iIA0WTn0kaWrc1sr3Kek/HJCNSFbL8qhQ+00WGwRBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CmRge+/PykxAhFJVYfo8PJGLualzwL7sryfHL43atz4Xa0AIs9lkL0JUlqQmma6koELVtZjZjzrs4NpVz5ZtuyixHPpY0HPVH0iRPHFDOurtbRGGcBwLwO56PUUm3iMPAovOCObOfGSAUPpAklbudp1MHAWvZTZ1K6DgkEA9s0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=RvSHDH2b; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="RvSHDH2b"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso4389199f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 08:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784301913; x=1784906713; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3wgMh3yFxpSQUpY7Ql+FMu1f7EBXpSaKGdxPimN78QQ=;
        b=RvSHDH2byUamNAM18X5VAOPjKzpBKo/GEVf2bl1Xkna1njhFb6r/quhPdMCZJLXp6j
         5Z0t9irlPwJi8wdl36ZK35rvH9ar2339LQUcuU2/0aoMgduZOvSGzHGff8EKWTxhjmGI
         PAvvYbyiyOQd0XRUId/ZoF4kAVVYRNlxil5BRHVBiUkgfHiRo42DNjVZt4PYyzS7M72q
         kiwkuZozwismyIdQvjybdZEiRdcELuPq20j9qyqSRH5YoO2y6sbamG9YzKX1InjKFsa/
         A1+7+b0CkVI+hFwXD1sp6CBbOf2gQBv0LP1wQKkkOL8wXo3UT1Ykf59NUX3CB6D0jbl2
         AkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784301913; x=1784906713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3wgMh3yFxpSQUpY7Ql+FMu1f7EBXpSaKGdxPimN78QQ=;
        b=QcwVxMuuFBs2WRz3yBjxr97GOtfqflNchGx5pJg+4lSiyOpZBwG30t90xduH65kY0O
         ExuL8NbO212NmcOco2Xagq8sKYe704CN0+qAEH3P1Ezxds+8Vtme/YSFelnZKydJWPu9
         RCxmVOpmNArxM49l6H0Mg9bcVZ53novFfiDEEBr0W5D+XGQKvTmx5wE8+UYMAtUj8/74
         MjWCeblqQLpL17A7j71h0NLQUuinRqcQB2z1KIVx7MSVqz8YSKCFKm+/3OnMDI9Hsn4f
         CMVMgN3B+myZj/HG2C/Z5BApCbR2BfuFCqemKCecXsPD1Z7paq9ET6Dv5GVdGjPbUUa3
         WWGA==
X-Forwarded-Encrypted: i=1; AHgh+RoCIzJTLFFmOfb2+TJaMIbxEQ7hZDQX8gs7AOGwSYmmgScP+R+onvUFTdP//3MK00zWxHZ0aHY5op0=@vger.kernel.org
X-Gm-Message-State: AOJu0YytNQ0oOTLyOOneJ/3XuRUv80g143+vgZInoEyvEj3y1Um4UEje
	p1G1z1APP8t4rYL8B92HSmktqOngFJQBtEasGmmgPm8cn1Rc+tw+NFQ1tEKmZscygPWb12rjHHY
	C9/V0
X-Gm-Gg: AfdE7cnt9LBgPBs5zOZ/e0TrsdcH4XLDZ5vDtTYBeNFXHCbdVWLnjqiv0tm/JHFyWIl
	hLdfC2KIEHtFZ9U+D37OUkzB/w43QM8t8oqe/15On6hOKNDy8eKGiQWGWaXakHyFDCbL9szZNjw
	7Vumq3e3+GZZASMo1uSl8ls1TevexLHgDDUMnj77i3F+6soX/3Pn0xAHKd9yVjEmSdDpPK6O4S0
	hRue8e7P8nc5qgsOikDuEb7NffDuiYV9KEMGxnmaVij6mWdM5JiyDdCt14DFApaF4y41iBEYt1b
	ajf7OGISHwWm0gmEPDGBc+qUpG4jZrj2Vi+gl4DiSn9QXH0S5KaOaFvUWlwRhRFoSMDhS9tiZz2
	YqMXGrkB83ygoQOXCUCw4kAejRssPjb8+vqyxdZqHJYrMOnmhKqkvC0LpS5g5cb8DGWL0X/WWBH
	Im
X-Received: by 2002:a05:6000:1882:b0:47f:5e89:aa2 with SMTP id ffacd0b85a97d-47f62338d7dmr3838108f8f.51.1784301912982;
        Fri, 17 Jul 2026 08:25:12 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8e22:8a15:f33f:dc60])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f63e496ffsm4808169f8f.3.2026.07.17.08.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:25:10 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 17 Jul 2026 17:24:52 +0200
Subject: [PATCH v5 2/4] clk: sunxi-ng: div: add read-only operation support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-a733-rtc-v5-2-3874cc26abf7@baylibre.com>
References: <20260717-a733-rtc-v5-0-3874cc26abf7@baylibre.com>
In-Reply-To: <20260717-a733-rtc-v5-0-3874cc26abf7@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3662; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=6iIA0WTn0kaWrc1sr3Kek/HJCNSFbL8qhQ+00WGwRBM=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqWklNbHRTWu+C+fdTSwA8INAva/DV0orsBtig+
 o8EwQ1NvI+JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCalpJTQAKCRDm/A8cN/La
 hW7YEACFQgs0gDea4IfvKYhJ1hf7FoiOwHPm4tFr2Kwikrbz/InoPDNLw3I8YPgnEXuT3MNUJkH
 GBywQ3xsx/f8qCtV+nYNELgy1zlm//70eoe8gk0W+O451Acv6ztXiiJBIiNtXC/ArXnUCDJgufo
 oTrn3eKvmlbAdSPUIEEFYPTZR3Q6n0pYAQckIZ13fZyNfW5OlC6D3CI+VSPXFzbTzSqtrwmblyT
 YgEY0TTGhgHKQ4na+E1rTJ5p+pkf56LIvv08Clf5/Bl4POHDz07KMmLbU3DVJ7yHf4vKwHceHjn
 leMhf6SJUEsENp3XIcvo/YDVtAKE8lR0rWfbFAXSI1MpAayGdzgUMKpVIltkpQj8tnznHShrt2J
 ptBOUAvE9+GtFSZW0MvpklDn/fOjMniZ7FadxnUqGJj++GbKm0tVAxCQOu1VmcIQmLl6wt1hamc
 aZz9AHLU2VzQUR9ckVe46iUIHMlkdi6SS0vGPVA5XxCmNO7R2+TWaiVgNygmw4+WkZMs6LUikCc
 0UeuiZIwItjIPQj7IUGtJIT2RPyBQN6ISzoFwf5GKUhOQxRC0FE5CLbXMxhnpPXU0NQbvVKOLoQ
 vK0biMw+yjrTxywcCSFehJLjFnr6n8+/pFldsgGJEpsDIJf2EtXoXHL0H3Z6pD/4b5WpNPDYCrs
 PPg2Ow8dyy3i3bQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add support for sunxi-ng read-only dividers. This will be
useful to the a733 oscillator detection logic.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu_div.c | 30 ++++++++++++++++++++++++++++--
 drivers/clk/sunxi-ng/ccu_div.h |  1 +
 drivers/clk/sunxi-ng/ccu_mux.c |  2 +-
 drivers/clk/sunxi-ng/ccu_mux.h |  4 ++++
 4 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_div.c
index 62d680ccb524..93cb4cb93abe 100644
--- a/drivers/clk/sunxi-ng/ccu_div.c
+++ b/drivers/clk/sunxi-ng/ccu_div.c
@@ -20,8 +20,22 @@ static int ccu_div_determine_rate_helper(struct ccu_mux_internal *mux,
 	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
 		req->rate *= cd->fixed_post_div;
 
-	ret = divider_determine_rate(&cd->common.hw, req, cd->div.table,
-				     cd->div.width, cd->div.flags);
+	if (cd->div.flags & CLK_DIVIDER_READ_ONLY) {
+		unsigned long val;
+		u32 reg;
+
+		reg = readl(cd->common.base + cd->common.reg);
+		val = reg >> cd->div.shift;
+		val &= (1 << cd->div.width) - 1;
+
+		ret = divider_ro_determine_rate(&cd->common.hw, req, cd->div.table,
+						cd->div.width, cd->div.flags, val);
+
+	} else {
+		ret = divider_determine_rate(&cd->common.hw, req, cd->div.table,
+					     cd->div.width, cd->div.flags);
+	}
+
 	if (ret)
 		return ret;
 
@@ -143,3 +157,15 @@ const struct clk_ops ccu_div_ops = {
 	.set_rate	= ccu_div_set_rate,
 };
 EXPORT_SYMBOL_NS_GPL(ccu_div_ops, "SUNXI_CCU");
+
+const struct clk_ops ccu_rodiv_ops = {
+	.disable	= ccu_div_disable,
+	.enable		= ccu_div_enable,
+	.is_enabled	= ccu_div_is_enabled,
+
+	.get_parent	= ccu_div_get_parent,
+
+	.determine_rate	= ccu_div_determine_rate,
+	.recalc_rate	= ccu_div_recalc_rate,
+};
+EXPORT_SYMBOL_NS_GPL(ccu_rodiv_ops, "SUNXI_CCU");
diff --git a/drivers/clk/sunxi-ng/ccu_div.h b/drivers/clk/sunxi-ng/ccu_div.h
index be00b3277e97..a30a92780a05 100644
--- a/drivers/clk/sunxi-ng/ccu_div.h
+++ b/drivers/clk/sunxi-ng/ccu_div.h
@@ -300,5 +300,6 @@ static inline struct ccu_div *hw_to_ccu_div(struct clk_hw *hw)
 }
 
 extern const struct clk_ops ccu_div_ops;
+extern const struct clk_ops ccu_rodiv_ops;
 
 #endif /* _CCU_DIV_H_ */
diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
index 75ec3457324c..905570375711 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.c
+++ b/drivers/clk/sunxi-ng/ccu_mux.c
@@ -67,7 +67,7 @@ unsigned long ccu_mux_helper_apply_prediv(struct ccu_common *common,
 	return parent_rate / ccu_mux_get_prediv(common, cm, parent_index);
 }
 
-static unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
+unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
 					    struct ccu_mux_internal *cm,
 					    int parent_index,
 					    unsigned long parent_rate)
diff --git a/drivers/clk/sunxi-ng/ccu_mux.h b/drivers/clk/sunxi-ng/ccu_mux.h
index c94a4bde5d01..272a2c36a8f2 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.h
+++ b/drivers/clk/sunxi-ng/ccu_mux.h
@@ -134,6 +134,10 @@ unsigned long ccu_mux_helper_apply_prediv(struct ccu_common *common,
 					  struct ccu_mux_internal *cm,
 					  int parent_index,
 					  unsigned long parent_rate);
+unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
+					    struct ccu_mux_internal *cm,
+					    int parent_index,
+					    unsigned long parent_rate);
 int ccu_mux_helper_determine_rate(struct ccu_common *common,
 				  struct ccu_mux_internal *cm,
 				  struct clk_rate_request *req,

-- 
2.47.3

