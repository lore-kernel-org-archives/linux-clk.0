Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386F0242D99
	for <linux-clk@vger.kernel.org>; Wed,  3 Sep 2025 15:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756912555; cv=none; b=Hi11PHN7g1UbFGvfFcL04jBtAHBS1cbimH+j4ocZXWqm3OfLRXfQruD81uPM7fARRVhqVS0ctQLsgE/qdWHsvYlgZlGf+b2IUp4cFe7JZBhr5aBvP1u1fSzhB/+OyI6cS8vgMPIf4Jgc6rJ0kqRg+Wbm4QJcG3gs/lqV64CsS2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756912555; c=relaxed/simple;
	bh=43sEbwhMVLXr4Ugy2k4lhtQIjlFVPQRMntWIuVLuAbk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NLFM5TH+z0mKMVcQC/whnWiSFF6YT9qmXCGObcIH7v1byGXomASdJiMsq6vR+I4aVxQbRpwPMkCEr5OLqprrFS6gLuxtRofHPxG92ZmsW0ojr4jXWU7CXUwErT7WQ1Z+9ehhtwR9RcaTGSp0YMNhje7mgDu+GqZZU5F02aHo4So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g+MSvpOF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g+MSvpOF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756912553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x9cuOYxu0U7DIdqQ6OT/K5slwo9p+cHFbhRnmBL6l1o=;
	b=g+MSvpOFt4d5nfdcosUhLVbGIqQ9Nfucpe9C3+d8k3eNSU8USK0Hdt8l5ScAa4mRYAjKEz
	r7QiBw0mUtWuU7NKk8HHLVI5ajtrVtK7MJgmQZhzPM2/2uR+UrEAEWRlCSznoUL+QhZrZO
	j4xzZ/JLwzBQ8YH/LR/Nge9TZXwbTio=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-568-noHXkakOPqCsBuyXYPVCiQ-1; Wed, 03 Sep 2025 11:15:51 -0400
X-MC-Unique: noHXkakOPqCsBuyXYPVCiQ-1
X-Mimecast-MFC-AGG-ID: noHXkakOPqCsBuyXYPVCiQ_1756912551
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-726aec6cf9fso10797846d6.1
        for <linux-clk@vger.kernel.org>; Wed, 03 Sep 2025 08:15:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756912551; x=1757517351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x9cuOYxu0U7DIdqQ6OT/K5slwo9p+cHFbhRnmBL6l1o=;
        b=wvWM1/wI3gT+d/se4aWRDq4VE6ntdBE9tNxVzj1qQPE96Yqv6VzWktbVOjkfk7KAPF
         j8z5E4xC6XUk6wYMNQrlFAhUx1SnilvtiKeozPBskfh7bLfuj7waZSEa5EdxmYJZK6re
         EZx8IC1RQvZLpgmL0Och0qVqRtC2rfJ8oCujMOfkKzEUh9swAdK7OlG4RpUHhW+gM6BS
         D4vYmLr74M+J840mk0+beS7xfq6Lto2hAMoj+p059Px1Biw7ahluXjJZ+aCpG8H2rJCv
         P8IakXGif2/ohPp7w02AtFyEsqGjXQu86/HqW3aMx60wEmKJ/oiLOY7ggNkDahZev6t1
         qisA==
X-Gm-Message-State: AOJu0YxWBuWS+qlUSvkUNyNxLmxJy7vmGkLf20lkAMzmlXJ7rKh8YEsJ
	BRhYhS/XVu/hcGOXiCLYCyuHm1HCRK0ERZr92tfiaXOoZ3zUUwZ1eVwiw6wRL0JIG1bCpeGEw/t
	B5eGtQsqkMx+l2F5pNtGNEXUJCk+3QfGGAjAsSocs6Pa7/xuDupCeqinypnV4sw==
X-Gm-Gg: ASbGncsXz7UGEZJuzG3V4LIQwH1WdhTtzg3xwTQp1EynjqzhAXeZbMWzdXxobXXIDRf
	pJBxyG5QhX1ngWajLCo3HBlBYSLBGneacZWe2r15V91DjuC5seOG/de5c7/ZellJeipVdSEsj6F
	s2Jcf3tC6hQXUOKSyYsLopf0O6u8WlKqLymtAaOeLcJH8s0X0NOIvNjxf6EtT4DgmLgVuYGzsvU
	YiBmkJH6TedAI6jddwC33ymIMniie631KRjqbgCV08NZa8dnrXUv/P6Qmjj8sYzNS37ZGRh+JlY
	vj+JrdaLV8P3D98I0pwtKIjs84NZTIcCmiMUbVHC4izji5aXsr4UTmSAzg1cb5S6jt+FIQXVyBA
	=
X-Received: by 2002:ad4:4eeb:0:b0:70d:961c:bb0e with SMTP id 6a1803df08f44-70fac9202d8mr197031736d6.58.1756912550886;
        Wed, 03 Sep 2025 08:15:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnqDjIqsiZca+ggH4RMjYaXqAO0ErU7lwak2EX2JoTANTpehd9a2V8hc1liqn8FqdeAjJJmQ==
X-Received: by 2002:ad4:4eeb:0:b0:70d:961c:bb0e with SMTP id 6a1803df08f44-70fac9202d8mr197013286d6.58.1756912536653;
        Wed, 03 Sep 2025 08:15:36 -0700 (PDT)
Received: from [10.12.114.224] ([2600:382:850c:786a:ff8e:13a:e47c:3472])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720ac16de16sm30827706d6.3.2025.09.03.08.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 08:15:34 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 03 Sep 2025 11:15:05 -0400
Subject: [PATCH v2 4/6] clk: tegra: pll: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-clk-tegra-round-rate-v2-v2-4-3126d321d4e4@redhat.com>
References: <20250903-clk-tegra-round-rate-v2-v2-0-3126d321d4e4@redhat.com>
In-Reply-To: <20250903-clk-tegra-round-rate-v2-v2-0-3126d321d4e4@redhat.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756912523; l=5433;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=43sEbwhMVLXr4Ugy2k4lhtQIjlFVPQRMntWIuVLuAbk=;
 b=rpRJizWaPvqeE8fyxaXKWGMOtJvlvuOaw1CCwjSgxH0jKIiYpjpuikcEEp7O69HVv0KF16BxN
 TXt73fGvnjOAYUe30HyZWWwnRS3516J0fBBdhdXNA86DnGkXxGPj02D
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Link: https://lore.kernel.org/r/20250710-clk-tegra-round-rate-v1-4-e48ac3df4279@redhat.com
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/tegra/clk-pll.c | 52 +++++++++++++++++++++++++++------------------
 1 file changed, 31 insertions(+), 21 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 100b5d9b7e26e906f71963152ad50bd0a89d14d6..591b9f0c155a033ab46fbb0a1de742efed560b5c 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -840,8 +840,8 @@ static int clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	return ret;
 }
 
-static long clk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-			unsigned long *prate)
+static int clk_pll_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
 	struct tegra_clk_pll *pll = to_clk_pll(hw);
 	struct tegra_clk_pll_freq_table cfg;
@@ -849,15 +849,20 @@ static long clk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 	if (pll->params->flags & TEGRA_PLL_FIXED) {
 		/* PLLM/MB are used for memory; we do not change rate */
 		if (pll->params->flags & (TEGRA_PLLM | TEGRA_PLLMB))
-			return clk_hw_get_rate(hw);
-		return pll->params->fixed_rate;
+			req->rate = clk_hw_get_rate(hw);
+		else
+			req->rate = pll->params->fixed_rate;
+
+		return 0;
 	}
 
-	if (_get_table_rate(hw, &cfg, rate, *prate) &&
-	    pll->params->calc_rate(hw, &cfg, rate, *prate))
+	if (_get_table_rate(hw, &cfg, req->rate, req->best_parent_rate) &&
+	    pll->params->calc_rate(hw, &cfg, req->rate, req->best_parent_rate))
 		return -EINVAL;
 
-	return cfg.output_rate;
+	req->rate = cfg.output_rate;
+
+	return 0;
 }
 
 static unsigned long clk_pll_recalc_rate(struct clk_hw *hw,
@@ -1057,7 +1062,7 @@ const struct clk_ops tegra_clk_pll_ops = {
 	.enable = clk_pll_enable,
 	.disable = clk_pll_disable,
 	.recalc_rate = clk_pll_recalc_rate,
-	.round_rate = clk_pll_round_rate,
+	.determine_rate = clk_pll_determine_rate,
 	.set_rate = clk_pll_set_rate,
 	.restore_context = tegra_clk_pll_restore_context,
 };
@@ -1195,7 +1200,7 @@ static const struct clk_ops tegra_clk_pllu_ops = {
 	.enable = clk_pllu_enable,
 	.disable = clk_pll_disable,
 	.recalc_rate = clk_pll_recalc_rate,
-	.round_rate = clk_pll_round_rate,
+	.determine_rate = clk_pll_determine_rate,
 	.set_rate = clk_pll_set_rate,
 };
 
@@ -1353,15 +1358,15 @@ static int clk_pllxc_set_rate(struct clk_hw *hw, unsigned long rate,
 	return ret;
 }
 
-static long clk_pll_ramp_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *prate)
+static int clk_pll_ramp_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct tegra_clk_pll *pll = to_clk_pll(hw);
 	struct tegra_clk_pll_freq_table cfg;
 	int ret, p_div;
-	u64 output_rate = *prate;
+	u64 output_rate = req->best_parent_rate;
 
-	ret = _pll_ramp_calc_pll(hw, &cfg, rate, *prate);
+	ret = _pll_ramp_calc_pll(hw, &cfg, req->rate, req->best_parent_rate);
 	if (ret < 0)
 		return ret;
 
@@ -1375,7 +1380,9 @@ static long clk_pll_ramp_round_rate(struct clk_hw *hw, unsigned long rate,
 	output_rate *= cfg.n;
 	do_div(output_rate, cfg.m * p_div);
 
-	return output_rate;
+	req->rate = output_rate;
+
+	return 0;
 }
 
 static void _pllcx_strobe(struct tegra_clk_pll *pll)
@@ -1598,12 +1605,15 @@ static unsigned long clk_pllre_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
-static long clk_pllre_round_rate(struct clk_hw *hw, unsigned long rate,
-				 unsigned long *prate)
+static int clk_pllre_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
 {
 	struct tegra_clk_pll *pll = to_clk_pll(hw);
 
-	return _pllre_calc_rate(pll, NULL, rate, *prate);
+	req->rate = _pllre_calc_rate(pll, NULL, req->rate,
+				     req->best_parent_rate);
+
+	return 0;
 }
 
 static int clk_plle_tegra114_enable(struct clk_hw *hw)
@@ -2003,7 +2013,7 @@ static const struct clk_ops tegra_clk_pllxc_ops = {
 	.enable = clk_pll_enable,
 	.disable = clk_pll_disable,
 	.recalc_rate = clk_pll_recalc_rate,
-	.round_rate = clk_pll_ramp_round_rate,
+	.determine_rate = clk_pll_ramp_determine_rate,
 	.set_rate = clk_pllxc_set_rate,
 };
 
@@ -2012,7 +2022,7 @@ static const struct clk_ops tegra_clk_pllc_ops = {
 	.enable = clk_pllc_enable,
 	.disable = clk_pllc_disable,
 	.recalc_rate = clk_pll_recalc_rate,
-	.round_rate = clk_pll_ramp_round_rate,
+	.determine_rate = clk_pll_ramp_determine_rate,
 	.set_rate = clk_pllc_set_rate,
 };
 
@@ -2021,7 +2031,7 @@ static const struct clk_ops tegra_clk_pllre_ops = {
 	.enable = clk_pll_enable,
 	.disable = clk_pll_disable,
 	.recalc_rate = clk_pllre_recalc_rate,
-	.round_rate = clk_pllre_round_rate,
+	.determine_rate = clk_pllre_determine_rate,
 	.set_rate = clk_pllre_set_rate,
 };
 
@@ -2321,7 +2331,7 @@ static const struct clk_ops tegra_clk_pllss_ops = {
 	.enable = clk_pll_enable,
 	.disable = clk_pll_disable,
 	.recalc_rate = clk_pll_recalc_rate,
-	.round_rate = clk_pll_ramp_round_rate,
+	.determine_rate = clk_pll_ramp_determine_rate,
 	.set_rate = clk_pllxc_set_rate,
 	.restore_context = tegra_clk_pll_restore_context,
 };

-- 
2.50.1

