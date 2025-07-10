Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC6C302064
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 21:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752181928; cv=none; b=Rl6e2hNIdfCwS8IoqDKt7X9uxGktFsIHVkze6n+Sri2aTsLw3kdUrs3JEbRfgTMB3rb29RdrkqtToxcam1vioJoMALeEcNTwXGjnzaXllLc/qxMxKvPUXEx7PQ0l5KnYQnca5qY/NDfVTf6X4FUpIsgomLS8jpbZnSfPFLLog+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752181928; c=relaxed/simple;
	bh=eYghFW8p4DYIUBCaUWp+/iE+HslCUlPDg0t9I+XyN/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Frta6IZBBd5x6sBn756OZcI+kXekQtfJZeyRfawfoPujFLRHpx1luPup3T71/dzWhzVC3wpEBJuDGokXdvWunA+9GcsVIypMoSJmF8mZuIkb7Lo5oisJgiQDBFQpATnIqXna8O7SAySfi0tmyPhyY4KrEMmaN+cNQehF9SOmB9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dRefkhYZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dRefkhYZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752181926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RMxn3qGVHET6C9gd+BL5oIIz2htkls+w6noefj8NRsw=;
	b=dRefkhYZeD9b8MQ6Wox6ZYPS9fLCUrkgVSVLq6QtbyuJzvCwBtQko7fikVC16iUowfV8HU
	e+b2oqmVqfq44nbA2EzSGtAQ88kwlapi+uIhlq8D7ZXuLBcgPJByOhLNm4BXOGMr/pqbtY
	QraLzEXmIj+MN+Rn2TQKpJzY2m0fZAY=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-ruQatDNBPXSUYu18MVaRAw-1; Thu, 10 Jul 2025 17:12:04 -0400
X-MC-Unique: ruQatDNBPXSUYu18MVaRAw-1
X-Mimecast-MFC-AGG-ID: ruQatDNBPXSUYu18MVaRAw_1752181924
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3132c1942a1so2189765a91.2
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 14:12:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752181924; x=1752786724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RMxn3qGVHET6C9gd+BL5oIIz2htkls+w6noefj8NRsw=;
        b=uogUEi2Ll8D2/3juKu6I9yBGpXUpLZVWq/tpMMAUK06VSw45TVLuCe1odfc8aCpR7r
         GVp4VvKzi98McFp4OdAmrde3+RYvpyYEEnZhp9ioE/iHk5x46LnHan/dUmnXHpVtY2+J
         wYqDmBslV0KSzEi5M7NHFx2ZLVs8zioxzbTKEeNu2/c3XILYmwrOjlDEGUsrNxj/UQvh
         wakC/tzCWD+DtzpA0EMFR4pbIs85xYLNiM2MJcWEwOpWyWWkSKsQuaftO4W7/D+PK8/d
         vygEs4mgdh+/HN8vRmMnqpnSzOdWN/S+ehQDopqjvBt2AbT3QKzqjOBn8l1HCUwndbNQ
         YSMg==
X-Gm-Message-State: AOJu0YzcQlDlTBj1AJnPT/ZO3EGYe/qnP5+JPMBMVVcvUGXRQJ7hXfHE
	+YqpbMWDUc9WXgWzUHUd3cgfBdfuD9Lvh3JrmWo0rAApttv2MkQPKjxHbhyqKEQpGShSjtJVi39
	ZgzuonnQvfHvllcuEHw5H8tVQVZwPrn0z0gxH2z09xsKUExH3ZLNH/ByNAR7hKA==
X-Gm-Gg: ASbGncu0Zfu1B7IOZjt8KtwyuVkbz765eXMnd0q3/4E0go2rZbJ/Q/NRt+ZLVXOXxT6
	0eJEDgS96LajsYbY8dfKs+r5rLVzfB/YtZDwdePK01Q2dmocJm/OEtcOhq8s1OE5dYRHMNWeKto
	WQ+fyfUwpxhA0nabFkZ1YG9Ft+Yx7XyOaQpfg31qXsjTM6L0S5TtrtwgbEKMYTRg+aGu+kiUn4f
	sea0sdM98HH1wQXS8cx4s3RQNWRdcclRmk7NgLq0b5ltZsQyAmFEs/fumY2TR6x9CYvEssEbcSR
	tL5+OKuFlqa8pwBGCtrUQ5Rjxr2O
X-Received: by 2002:a17:90b:4b83:b0:311:e8cc:4248 with SMTP id 98e67ed59e1d1-31c4f5d782fmr181003a91.33.1752181923699;
        Thu, 10 Jul 2025 14:12:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZJwG4kbKUPKJJw9NlPg14COmpPc23m7MFfrg7F5+Wtg/2WFXr5ADA1o8ZCRL9BuYnk5dhrA==
X-Received: by 2002:a17:90b:4b83:b0:311:e8cc:4248 with SMTP id 98e67ed59e1d1-31c4f5d782fmr180978a91.33.1752181923366;
        Thu, 10 Jul 2025 14:12:03 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:7716:65ad:9491:c054:6f2d:80ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de433e51asm27790595ad.180.2025.07.10.14.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:12:02 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 17:10:44 -0400
Subject: [PATCH 12/13] clk: imx: pllv4: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-clk-imx-round-rate-v1-12-5726f98e6d8d@redhat.com>
References: <20250710-clk-imx-round-rate-v1-0-5726f98e6d8d@redhat.com>
In-Reply-To: <20250710-clk-imx-round-rate-v1-0-5726f98e6d8d@redhat.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752181866; l=3218;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=eYghFW8p4DYIUBCaUWp+/iE+HslCUlPDg0t9I+XyN/I=;
 b=GlygFKUJrkVpwE7GHwRPUG7uDzpRjwh+PDyr1kcDB3zP0XEHH7Gkt8tVur2GVkNuwZ24eg+r7
 k/5dyQToeGkBYWaTeEwsUjiUla04efU+hrImZBsDIo9uilD8+vVwD3U
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/imx/clk-pllv4.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/imx/clk-pllv4.c b/drivers/clk/imx/clk-pllv4.c
index 9b136c951762c23cb7424405e1a66ec70af57d5c..01d05b5d543852c9eb48d1ae2b63e8f32b4f4a89 100644
--- a/drivers/clk/imx/clk-pllv4.c
+++ b/drivers/clk/imx/clk-pllv4.c
@@ -95,11 +95,11 @@ static unsigned long clk_pllv4_recalc_rate(struct clk_hw *hw,
 	return (parent_rate * mult) + (u32)temp64;
 }
 
-static long clk_pllv4_round_rate(struct clk_hw *hw, unsigned long rate,
-				 unsigned long *prate)
+static int clk_pllv4_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
 {
 	struct clk_pllv4 *pll = to_clk_pllv4(hw);
-	unsigned long parent_rate = *prate;
+	unsigned long parent_rate = req->best_parent_rate;
 	unsigned long round_rate, i;
 	u32 mfn, mfd = DEFAULT_MFD;
 	bool found = false;
@@ -107,7 +107,7 @@ static long clk_pllv4_round_rate(struct clk_hw *hw, unsigned long rate,
 	u32 mult;
 
 	if (pll->use_mult_range) {
-		temp64 = (u64)rate;
+		temp64 = (u64) req->rate;
 		do_div(temp64, parent_rate);
 		mult = temp64;
 		if (mult >= pllv4_mult_range[1] &&
@@ -118,7 +118,7 @@ static long clk_pllv4_round_rate(struct clk_hw *hw, unsigned long rate,
 	} else {
 		for (i = 0; i < ARRAY_SIZE(pllv4_mult_table); i++) {
 			round_rate = parent_rate * pllv4_mult_table[i];
-			if (rate >= round_rate) {
+			if (req->rate >= round_rate) {
 				found = true;
 				break;
 			}
@@ -127,14 +127,16 @@ static long clk_pllv4_round_rate(struct clk_hw *hw, unsigned long rate,
 
 	if (!found) {
 		pr_warn("%s: unable to round rate %lu, parent rate %lu\n",
-			clk_hw_get_name(hw), rate, parent_rate);
+			clk_hw_get_name(hw), req->rate, parent_rate);
+		req->rate = 0;
+
 		return 0;
 	}
 
 	if (parent_rate <= MAX_MFD)
 		mfd = parent_rate;
 
-	temp64 = (u64)(rate - round_rate);
+	temp64 = (u64)(req->rate - round_rate);
 	temp64 *= mfd;
 	do_div(temp64, parent_rate);
 	mfn = temp64;
@@ -145,14 +147,19 @@ static long clk_pllv4_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * pair of mfn/mfd, we simply return the round_rate without using
 	 * the frac part.
 	 */
-	if (mfn >= mfd)
-		return round_rate;
+	if (mfn >= mfd) {
+		req->rate = round_rate;
+
+		return 0;
+	}
 
 	temp64 = (u64)parent_rate;
 	temp64 *= mfn;
 	do_div(temp64, mfd);
 
-	return round_rate + (u32)temp64;
+	req->rate = round_rate + (u32)temp64;
+
+	return 0;
 }
 
 static bool clk_pllv4_is_valid_mult(struct clk_pllv4 *pll, unsigned int mult)
@@ -229,7 +236,7 @@ static void clk_pllv4_unprepare(struct clk_hw *hw)
 
 static const struct clk_ops clk_pllv4_ops = {
 	.recalc_rate	= clk_pllv4_recalc_rate,
-	.round_rate	= clk_pllv4_round_rate,
+	.determine_rate = clk_pllv4_determine_rate,
 	.set_rate	= clk_pllv4_set_rate,
 	.prepare	= clk_pllv4_prepare,
 	.unprepare	= clk_pllv4_unprepare,

-- 
2.50.0

