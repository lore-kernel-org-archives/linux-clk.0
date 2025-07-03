Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C302F2731
	for <linux-clk@vger.kernel.org>; Thu,  3 Jul 2025 23:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751585019; cv=none; b=mefwaQmWT/K4LuPgELEVWt0K7FOg/8EV9ASfvlp7+ADM7s0nsLMocGBDuaA7IUlAMZ+fy8R+zxiV4JUY3fOywMA8QfWqOAz4/q/uvfO9kvO22IgzG0kKo2lCB+QFHOxIpLIHF50Th1xPDuAae6WE34KNflR9dzk9V65c9+ta1nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751585019; c=relaxed/simple;
	bh=4fRm/4wvZQWe/TuI4l5eob8PB/NYw5v9nV4VOmFwTUI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z3Snrcz7T0r1EUXwnQckie/EUW4ACpRz4VFLd1Nfh5G+K30xR990JeweiZbko06UGuQNTrRcbqEaQZGhFvdiHPRiZFG61mwkkcNFq9NZmToowKsChgMaQiBHIuYQMu2UNw0+WqNA9vdykCFSw99ZhA06fuzvUscO+iVnAX8w7No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dDXwpA15; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dDXwpA15"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751585016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vIUTPB0Xa7IujQxGdU5BbuzZFcJXYmPAbUo0ojDRNf8=;
	b=dDXwpA15y2I93i0v8KfFVnloMDZg2k8t9As4vgZ44xQAIjcOYGhZvKnbf6m+1UokM+Y87y
	AJ9x6W19eea5+wQSZWSTK4gxrmma8OrBVasjJPKV5FhM12WFUKltKYtPxkewcwa2P/W1/h
	V7Ur1312mewcbNkx0/5A1IqPQiJQ6y4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-215-ahCA9tyRMjeSuyzb79Hd3w-1; Thu, 03 Jul 2025 19:23:33 -0400
X-MC-Unique: ahCA9tyRMjeSuyzb79Hd3w-1
X-Mimecast-MFC-AGG-ID: ahCA9tyRMjeSuyzb79Hd3w_1751585013
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fd3aeb2825so11884646d6.3
        for <linux-clk@vger.kernel.org>; Thu, 03 Jul 2025 16:23:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751585013; x=1752189813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vIUTPB0Xa7IujQxGdU5BbuzZFcJXYmPAbUo0ojDRNf8=;
        b=OD+RKCCtmTKgIi6VbnitAjZyW0dn5RGgCxkbNaZ/DfYPplp1bPi7rMHBSce8YCwPBo
         Tgu3lK5JHa00narQU8OgjyIRcYTwSlykH4azygKGF6yYWru0nHK+9y3b5L0C3KuXResI
         krIWg0LPsGQpotSJSCwl+3/yEh6pWZPnA0HnKNkacm2gq9ETGJWSYoUcweA5oSG0vUem
         r5wIL0WWmkCv+N3koNwLrSAE6bbci/0Qi0Aqw7M5snh+xCzDC5qOQ5npF0dN9sxzQJrb
         EIEKyD3/Z0+AlR+MPXWvIhMAQ3Hbys53/c/tqb0txhDDS0CHxWpQOvnATedpIu7Or7xU
         GBGw==
X-Gm-Message-State: AOJu0YzYbBlCJPFdKCWghkZRnUgZgwJaVz4K9KV1e5lp5cljQZV8vsCt
	tOLJWjpOahk9ZoXqu4NPpsla2T/nGnqB/icmwY3NctcC89EhgVBXKlIL2rhCrksImz/lKuxe8JS
	qX3W6SZvuQ2+bg3jOxl0pzCYUEyi6f43e60O+rXawHI8A/YHCCe/ofwN6ZKm45A==
X-Gm-Gg: ASbGncvh0S3GyiMCaD8s6iTd8O/ruM5nrs0J4iuOFPik1AasCUZg801g59+J8+75/TI
	3suzo1xNC7BqwrTuJn4oQ6fgARm6prs2MvR0H+yBXqZBeBuz4JT1y1GzrtlFyKscWndg65OVGvf
	XGRrZqTSNmC81zgQk83QwMy69yF6YpNCRCFsJqOjtd2yRgR0ZLYdNl0YjRKuyRKxy8ARR4mNSpo
	4+N54L18kIMr08LPv0Dcfb7aO7wabrZ6kJj8QGL7Abmstmy6xdMtLLFrmuQKqD3wuDIdLsX590W
	bddeijp6+CZOQAHtY07CJdlcj6E5IRrVxfN+GiVkl1UVpH2VmPh4pz6y4wuuyw==
X-Received: by 2002:a05:6214:400f:b0:701:945:68a0 with SMTP id 6a1803df08f44-702c6db6d72mr2550916d6.26.1751585012818;
        Thu, 03 Jul 2025 16:23:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsLP+EtTPJqTbUAM3azCv14keKHQHBVX2XiZhb2AArhva5ftrpXUEhswiQr1GgZeMTOKJdIA==
X-Received: by 2002:a05:6214:400f:b0:701:945:68a0 with SMTP id 6a1803df08f44-702c6db6d72mr2550676d6.26.1751585012507;
        Thu, 03 Jul 2025 16:23:32 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a958sm4469956d6.84.2025.07.03.16.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:23:29 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 03 Jul 2025 19:22:34 -0400
Subject: [PATCH 10/10] clk: sunxi-ng: ccu_nm: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-clk-cocci-drop-round-rate-v1-10-3a8da898367e@redhat.com>
References: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751584976; l=3661;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=4fRm/4wvZQWe/TuI4l5eob8PB/NYw5v9nV4VOmFwTUI=;
 b=fvx7qhP1aLoIOPU3sjNvBCth81x2jcOY/I9wnn1tKMT2BbPA4cFWn1Ytapjub1E1HqAvCp+zr
 RDPpPrT6r0wCY9IQ3u30PGRfoAmv/kGQTGOqlafbNKX0lErw2qUupAD
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

I manually fixed up one minor formatting issue that occurred after
applying the semantic patch:

        req->rate = ccu_nm_find_best(&nm->common, req->best_parent_rate,
                                     req->rate,
                                     &_nm);

I manually changed it to:

        req->rate = ccu_nm_find_best(&nm->common, req->best_parent_rate,
                                     req->rate, &_nm);

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/sunxi-ng/ccu_nm.c | 43 ++++++++++++++++++++++---------------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_nm.c b/drivers/clk/sunxi-ng/ccu_nm.c
index a4e2243b8d6b4a8fdd9ea1ff2ca06e2f1a009632..df01ed3b37a6b56e93e18cc4c1ad5909e2ba0c5b 100644
--- a/drivers/clk/sunxi-ng/ccu_nm.c
+++ b/drivers/clk/sunxi-ng/ccu_nm.c
@@ -116,39 +116,39 @@ static unsigned long ccu_nm_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
-static long ccu_nm_round_rate(struct clk_hw *hw, unsigned long rate,
-			      unsigned long *parent_rate)
+static int ccu_nm_determine_rate(struct clk_hw *hw,
+				 struct clk_rate_request *req)
 {
 	struct ccu_nm *nm = hw_to_ccu_nm(hw);
 	struct _ccu_nm _nm;
 
 	if (nm->common.features & CCU_FEATURE_FIXED_POSTDIV)
-		rate *= nm->fixed_post_div;
+		req->rate *= nm->fixed_post_div;
 
-	if (rate < nm->min_rate) {
-		rate = nm->min_rate;
+	if (req->rate < nm->min_rate) {
+		req->rate = nm->min_rate;
 		if (nm->common.features & CCU_FEATURE_FIXED_POSTDIV)
-			rate /= nm->fixed_post_div;
-		return rate;
+			req->rate /= nm->fixed_post_div;
+		return 0;
 	}
 
-	if (nm->max_rate && rate > nm->max_rate) {
-		rate = nm->max_rate;
+	if (nm->max_rate && req->rate > nm->max_rate) {
+		req->rate = nm->max_rate;
 		if (nm->common.features & CCU_FEATURE_FIXED_POSTDIV)
-			rate /= nm->fixed_post_div;
-		return rate;
+			req->rate /= nm->fixed_post_div;
+		return 0;
 	}
 
-	if (ccu_frac_helper_has_rate(&nm->common, &nm->frac, rate)) {
+	if (ccu_frac_helper_has_rate(&nm->common, &nm->frac, req->rate)) {
 		if (nm->common.features & CCU_FEATURE_FIXED_POSTDIV)
-			rate /= nm->fixed_post_div;
-		return rate;
+			req->rate /= nm->fixed_post_div;
+		return 0;
 	}
 
-	if (ccu_sdm_helper_has_rate(&nm->common, &nm->sdm, rate)) {
+	if (ccu_sdm_helper_has_rate(&nm->common, &nm->sdm, req->rate)) {
 		if (nm->common.features & CCU_FEATURE_FIXED_POSTDIV)
-			rate /= nm->fixed_post_div;
-		return rate;
+			req->rate /= nm->fixed_post_div;
+		return 0;
 	}
 
 	_nm.min_n = nm->n.min ?: 1;
@@ -156,12 +156,13 @@ static long ccu_nm_round_rate(struct clk_hw *hw, unsigned long rate,
 	_nm.min_m = 1;
 	_nm.max_m = nm->m.max ?: 1 << nm->m.width;
 
-	rate = ccu_nm_find_best(&nm->common, *parent_rate, rate, &_nm);
+	req->rate = ccu_nm_find_best(&nm->common, req->best_parent_rate,
+				     req->rate, &_nm);
 
 	if (nm->common.features & CCU_FEATURE_FIXED_POSTDIV)
-		rate /= nm->fixed_post_div;
+		req->rate /= nm->fixed_post_div;
 
-	return rate;
+	return 0;
 }
 
 static int ccu_nm_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -233,7 +234,7 @@ const struct clk_ops ccu_nm_ops = {
 	.is_enabled	= ccu_nm_is_enabled,
 
 	.recalc_rate	= ccu_nm_recalc_rate,
-	.round_rate	= ccu_nm_round_rate,
+	.determine_rate = ccu_nm_determine_rate,
 	.set_rate	= ccu_nm_set_rate,
 };
 EXPORT_SYMBOL_NS_GPL(ccu_nm_ops, "SUNXI_CCU");

-- 
2.50.0

