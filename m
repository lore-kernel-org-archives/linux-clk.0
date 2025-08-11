Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75CD134CB
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 12:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754916520; cv=none; b=QxFwtKVhaUqwbeXa4XIkxGPr9I9Qwfve6xHKcIp21jqgJE2E0PXa/vDQhepaTkoFD52lktS24gYDkzGIlz6fNswhqujk9Q5qcTAEEDUxznBEhs2Vnedkq+iPgsWNuPBS00abXK3WzSypIKXt67yC2v7J4sVuEQyJoR96QJdJnrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754916520; c=relaxed/simple;
	bh=DNZBuAZfcx9FexqFDGC7waIYnaLgayG+z6+X0rCNNVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OIDExC+wMH/TcDp14vacL1PRiP95i3Rs9c9TzQpTI9N2UciXTf5g+nHnc/lMLErrNR26WajweK1b/VGbaIZQN8gJvn411BDpmDhorNKLNfoXBY2dOr6NCFNHXkXxGV1cqtoQl8W1mJi+Zt5dSnWozDLyFaqPISQwgXVasehgD+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IzxZWjgW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IzxZWjgW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754916517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KHNqb91UWuBKwgKT54tuy98UAhSa9cfI1l7yUMC9Py0=;
	b=IzxZWjgWqzRLNwu9s4I+YiNihcS7k8CXtGxEJaPH4z742PTelnKD2eWiqEAIHAAE6HvUOU
	JpptCYaAVvevv8bIIy4RwnnAhwwOyi33gPKqdo7b0/XnqShbV759ZCxKlgvAOlpKCnF8QR
	/QHyu0AT11CLDsALs3CGfZZNdVjJELM=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-81-LT2InjxNPhS31fyhZgrN2g-1; Mon, 11 Aug 2025 08:48:36 -0400
X-MC-Unique: LT2InjxNPhS31fyhZgrN2g-1
X-Mimecast-MFC-AGG-ID: LT2InjxNPhS31fyhZgrN2g_1754916516
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e6a5428a76so1361227085a.1
        for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 05:48:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754916514; x=1755521314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHNqb91UWuBKwgKT54tuy98UAhSa9cfI1l7yUMC9Py0=;
        b=Bogs/yCeiXHbPXXiBG2nAFbv0L2V5DoYfFXTOD+3JxVnIm1VwSMLoO/ejO/ISu4aZo
         /d7xbDQCkQzK4WLlcQCwstNO1IN5t9FKp6mfCykUlN0nr+MxvzrcTH3OJUhxtwur+Qwa
         tn0+/rnSt4Q5c7vJZcQGkCDY03rEBgJuYwkR1yy48Q0w5I5vgtMpWW1eJR/Gb8+pPcDI
         9AVicpAaZGmnHTv9RyckYOJZ/tCgYHwUryOqwudspV/d9fQq3Fv4eONjhPPwo+Mk7sMv
         hsU9t5t1mFUFtTksSIAs82RBqjCTlDI4fMvWscOagSynWm8NABsD42SP+b2A6qLM5ti8
         3HGg==
X-Forwarded-Encrypted: i=1; AJvYcCXzrBM++Cj8OMmP9F/lGUKSsT8tB8vlVRIChV05Tr0GkrO4dOpkisWl07f5EIjcwAWSQUOh1jL6NXU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmYoJJCvOl1YJb0JsEy8yCiuMkTnhci24gnHoyijmAs2Aj6ME4
	VbD5hoQygQvjPYo86+XD78qO3ELtpIJbIg/1+5vecpxqoqA/aoXVfs+YwP/Ju2r9OgZBAZIwgPJ
	qYnsntj9cLLRjwKA0oQ3c0zCHCkaj3+B3wbt2OiQCoApsNNZP5WCcvDrzqHlro1kyfFS1epoT
X-Gm-Gg: ASbGncsgQxzUbhLP3F8X3ZLIYXPEyqBaKedgviF3SoJd3P2Xto+hP7+8RPiWA3dRO8e
	YWnDVxPwMBxkPBYliItVOqYNoLfh+PsUTXj3bsDT7mn8vcXLy7zJqdCN7igGnu9pK0Eno3YOCVG
	Mmay5cylBdSDCN9D5qKlSevPqKOkhxhGDy1AMls77M/yrS7jxhGu45rSBOwpeORSKqbScW3TP0v
	z5KeQ49M2Rn7dxSgeYrQM07asZZK0vpE1QyXjTcffkpIde5i5ey1mOvPFs5NmIt9Vg9ZAN7D5ao
	RBFpQaENmanDA45MDSNBu4l6fvkV0wQnhY2N2zVz+8dXR40ZooLi6o2zh+q90L+8CDk9RlunzEI
	+43Y=
X-Received: by 2002:ac8:7c4c:0:b0:4b0:769e:42e8 with SMTP id d75a77b69052e-4b0afeccd41mr193849281cf.29.1754916514231;
        Mon, 11 Aug 2025 05:48:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRYfhAfRgX/s4HpGLDWsaFoaW3m1/bn3Hye48GDtU8OhUDtEZEYMD9VR6dYRyB77KAAGjaOA==
X-Received: by 2002:ac8:7c4c:0:b0:4b0:769e:42e8 with SMTP id d75a77b69052e-4b0afeccd41mr193848841cf.29.1754916513646;
        Mon, 11 Aug 2025 05:48:33 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4aef746b6efsm138724001cf.15.2025.08.11.05.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 05:48:31 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 08:48:08 -0400
Subject: [PATCH 3/7] clk: ti: dpll: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-b4-clk-ti-round-rate-v1-3-cc0840594a49@redhat.com>
References: <20250811-b4-clk-ti-round-rate-v1-0-cc0840594a49@redhat.com>
In-Reply-To: <20250811-b4-clk-ti-round-rate-v1-0-cc0840594a49@redhat.com>
To: Tero Kristo <kristo@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754916502; l=12349;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=DNZBuAZfcx9FexqFDGC7waIYnaLgayG+z6+X0rCNNVg=;
 b=jxq1//VKLI2tsa207Bys+TKqhvSir68NtMzcMG/IbDYgfpdvtAKr65MGt26U4gjUylZOT8xdq
 YgftMLgHZAfBJXXHVWSAeGUxHmLb4bDbuuQ02HOnlTGlBfSZ4OVnkrB
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate(). Part of these changes were done
using the Coccinelle semantic patch on the cover letter of this
series, and the rest of the changes were manually done.

omap4_dpll_regm4xen_round_rate() is now only called by
omap4_dpll_regm4xen_determine_rate(), so let's merge that functionality
into one function. This is needed for another cleanup to completely
remove the round_rate() clk ops from the clk core.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/ti/clkt_dpll.c | 28 +++++++--------
 drivers/clk/ti/clock.h     |  6 +---
 drivers/clk/ti/dpll.c      |  4 +--
 drivers/clk/ti/dpll3xxx.c  |  7 ++--
 drivers/clk/ti/dpll44xx.c  | 89 ++++++++++++++++------------------------------
 include/linux/clk/ti.h     |  8 ++---
 6 files changed, 57 insertions(+), 85 deletions(-)

diff --git a/drivers/clk/ti/clkt_dpll.c b/drivers/clk/ti/clkt_dpll.c
index a8c0fc20f791689c74868b98810b1af2c78b18c8..2ecd66968af4dce4228cbb33e9b7d3378668545a 100644
--- a/drivers/clk/ti/clkt_dpll.c
+++ b/drivers/clk/ti/clkt_dpll.c
@@ -268,10 +268,9 @@ unsigned long omap2_get_dpll_rate(struct clk_hw_omap *clk)
 /* DPLL rate rounding code */
 
 /**
- * omap2_dpll_round_rate - round a target rate for an OMAP DPLL
+ * omap2_dpll_determine_rate - round a target rate for an OMAP DPLL
  * @hw: struct clk_hw containing the struct clk * for a DPLL
- * @target_rate: desired DPLL clock rate
- * @parent_rate: parent's DPLL clock rate
+ * @req: rate request
  *
  * Given a DPLL and a desired target rate, round the target rate to a
  * possible, programmable rate for this DPLL.  Attempts to select the
@@ -280,8 +279,7 @@ unsigned long omap2_get_dpll_rate(struct clk_hw_omap *clk)
  * (expensive) function again.  Returns -EINVAL if the target rate
  * cannot be rounded, or the rounded rate upon success.
  */
-long omap2_dpll_round_rate(struct clk_hw *hw, unsigned long target_rate,
-			   unsigned long *parent_rate)
+int omap2_dpll_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
 {
 	struct clk_hw_omap *clk = to_clk_hw_omap(hw);
 	int m, n, r, scaled_max_m;
@@ -299,15 +297,15 @@ long omap2_dpll_round_rate(struct clk_hw *hw, unsigned long target_rate,
 
 	dd = clk->dpll_data;
 
-	if (dd->max_rate && target_rate > dd->max_rate)
-		target_rate = dd->max_rate;
+	if (dd->max_rate && req->rate > dd->max_rate)
+		req->rate = dd->max_rate;
 
 	ref_rate = clk_hw_get_rate(dd->clk_ref);
 	clk_name = clk_hw_get_name(hw);
 	pr_debug("clock: %s: starting DPLL round_rate, target rate %lu\n",
-		 clk_name, target_rate);
+		 clk_name, req->rate);
 
-	scaled_rt_rp = target_rate / (ref_rate / DPLL_SCALE_FACTOR);
+	scaled_rt_rp = req->rate / (ref_rate / DPLL_SCALE_FACTOR);
 	scaled_max_m = dd->max_multiplier * DPLL_SCALE_FACTOR;
 
 	dd->last_rounded_rate = 0;
@@ -332,7 +330,7 @@ long omap2_dpll_round_rate(struct clk_hw *hw, unsigned long target_rate,
 		if (m > scaled_max_m)
 			break;
 
-		r = _dpll_test_mult(&m, n, &new_rate, target_rate,
+		r = _dpll_test_mult(&m, n, &new_rate, req->rate,
 				    ref_rate);
 
 		/* m can't be set low enough for this n - try with a larger n */
@@ -340,7 +338,7 @@ long omap2_dpll_round_rate(struct clk_hw *hw, unsigned long target_rate,
 			continue;
 
 		/* skip rates above our target rate */
-		delta = target_rate - new_rate;
+		delta = req->rate - new_rate;
 		if (delta < 0)
 			continue;
 
@@ -359,13 +357,15 @@ long omap2_dpll_round_rate(struct clk_hw *hw, unsigned long target_rate,
 
 	if (prev_min_delta == LONG_MAX) {
 		pr_debug("clock: %s: cannot round to rate %lu\n",
-			 clk_name, target_rate);
+			 clk_name, req->rate);
 		return -EINVAL;
 	}
 
 	dd->last_rounded_m = min_delta_m;
 	dd->last_rounded_n = min_delta_n;
-	dd->last_rounded_rate = target_rate - prev_min_delta;
+	dd->last_rounded_rate = req->rate - prev_min_delta;
 
-	return dd->last_rounded_rate;
+	req->rate = dd->last_rounded_rate;
+
+	return 0;
 }
diff --git a/drivers/clk/ti/clock.h b/drivers/clk/ti/clock.h
index 2de7acea1ea0503790754a5d4b9bcfe42da701d3..d5e24fe4ae3af67907e01055fcdcaa266459eb08 100644
--- a/drivers/clk/ti/clock.h
+++ b/drivers/clk/ti/clock.h
@@ -273,8 +273,7 @@ int omap3_noncore_dpll_set_rate_and_parent(struct clk_hw *hw,
 					   u8 index);
 int omap3_noncore_dpll_determine_rate(struct clk_hw *hw,
 				      struct clk_rate_request *req);
-long omap2_dpll_round_rate(struct clk_hw *hw, unsigned long target_rate,
-			   unsigned long *parent_rate);
+int omap2_dpll_determine_rate(struct clk_hw *hw, struct clk_rate_request *req);
 unsigned long omap3_clkoutx2_recalc(struct clk_hw *hw,
 				    unsigned long parent_rate);
 
@@ -296,9 +295,6 @@ void omap3_clk_lock_dpll5(void);
 
 unsigned long omap4_dpll_regm4xen_recalc(struct clk_hw *hw,
 					 unsigned long parent_rate);
-long omap4_dpll_regm4xen_round_rate(struct clk_hw *hw,
-				    unsigned long target_rate,
-				    unsigned long *parent_rate);
 int omap4_dpll_regm4xen_determine_rate(struct clk_hw *hw,
 				       struct clk_rate_request *req);
 int omap2_clk_for_each(int (*fn)(struct clk_hw_omap *hw));
diff --git a/drivers/clk/ti/dpll.c b/drivers/clk/ti/dpll.c
index 1f55554e0d73ca0323459e8823125b22623ae4a9..971adafd9a8bbb17a801260f0e1bf27fed5e51c0 100644
--- a/drivers/clk/ti/dpll.c
+++ b/drivers/clk/ti/dpll.c
@@ -77,7 +77,7 @@ const struct clk_hw_omap_ops clkhwops_omap3_dpll = {};
 static const struct clk_ops omap2_dpll_core_ck_ops = {
 	.get_parent	= &omap2_init_dpll_parent,
 	.recalc_rate	= &omap2_dpllcore_recalc,
-	.round_rate	= &omap2_dpll_round_rate,
+	.determine_rate	= &omap2_dpll_determine_rate,
 	.set_rate	= &omap2_reprogram_dpllcore,
 };
 #else
@@ -88,7 +88,7 @@ static const struct clk_ops omap2_dpll_core_ck_ops = {};
 static const struct clk_ops omap3_dpll_core_ck_ops = {
 	.get_parent	= &omap2_init_dpll_parent,
 	.recalc_rate	= &omap3_dpll_recalc,
-	.round_rate	= &omap2_dpll_round_rate,
+	.determine_rate	= &omap2_dpll_determine_rate,
 };
 
 static const struct clk_ops omap3_dpll_ck_ops = {
diff --git a/drivers/clk/ti/dpll3xxx.c b/drivers/clk/ti/dpll3xxx.c
index 00680486b1bd06ac653dda0cce186acf68736755..8c51b988a04ff0bfe79f39a7eb7727ac2edce149 100644
--- a/drivers/clk/ti/dpll3xxx.c
+++ b/drivers/clk/ti/dpll3xxx.c
@@ -587,6 +587,7 @@ int omap3_noncore_dpll_determine_rate(struct clk_hw *hw,
 {
 	struct clk_hw_omap *clk = to_clk_hw_omap(hw);
 	struct dpll_data *dd;
+	int ret;
 
 	if (!req->rate)
 		return -EINVAL;
@@ -599,8 +600,10 @@ int omap3_noncore_dpll_determine_rate(struct clk_hw *hw,
 	    (dd->modes & (1 << DPLL_LOW_POWER_BYPASS))) {
 		req->best_parent_hw = dd->clk_bypass;
 	} else {
-		req->rate = omap2_dpll_round_rate(hw, req->rate,
-					  &req->best_parent_rate);
+		ret = omap2_dpll_determine_rate(hw, req);
+		if (ret != 0)
+			return ret;
+
 		req->best_parent_hw = dd->clk_ref;
 	}
 
diff --git a/drivers/clk/ti/dpll44xx.c b/drivers/clk/ti/dpll44xx.c
index 3fc2cab69a3fe6cfadb3d6bbb3ff87d434c32e6a..08ed57f181b49d00aa4efd2f18f3df000ae3c9d3 100644
--- a/drivers/clk/ti/dpll44xx.c
+++ b/drivers/clk/ti/dpll44xx.c
@@ -133,61 +133,6 @@ unsigned long omap4_dpll_regm4xen_recalc(struct clk_hw *hw,
 	return rate;
 }
 
-/**
- * omap4_dpll_regm4xen_round_rate - round DPLL rate, considering REGM4XEN bit
- * @hw: struct hw_clk containing the struct clk * of the DPLL to round a rate for
- * @target_rate: the desired rate of the DPLL
- * @parent_rate: clock rate of the DPLL parent
- *
- * Compute the rate that would be programmed into the DPLL hardware
- * for @clk if set_rate() were to be provided with the rate
- * @target_rate.  Takes the REGM4XEN bit into consideration, which is
- * needed for the OMAP4 ABE DPLL.  Returns the rounded rate (before
- * M-dividers) upon success, -EINVAL if @clk is null or not a DPLL, or
- * ~0 if an error occurred in omap2_dpll_round_rate().
- */
-long omap4_dpll_regm4xen_round_rate(struct clk_hw *hw,
-				    unsigned long target_rate,
-				    unsigned long *parent_rate)
-{
-	struct clk_hw_omap *clk = to_clk_hw_omap(hw);
-	struct dpll_data *dd;
-	long r;
-
-	if (!clk || !clk->dpll_data)
-		return -EINVAL;
-
-	dd = clk->dpll_data;
-
-	dd->last_rounded_m4xen = 0;
-
-	/*
-	 * First try to compute the DPLL configuration for
-	 * target rate without using the 4X multiplier.
-	 */
-	r = omap2_dpll_round_rate(hw, target_rate, NULL);
-	if (r != ~0)
-		goto out;
-
-	/*
-	 * If we did not find a valid DPLL configuration, try again, but
-	 * this time see if using the 4X multiplier can help. Enabling the
-	 * 4X multiplier is equivalent to dividing the target rate by 4.
-	 */
-	r = omap2_dpll_round_rate(hw, target_rate / OMAP4430_REGM4XEN_MULT,
-				  NULL);
-	if (r == ~0)
-		return r;
-
-	dd->last_rounded_rate *= OMAP4430_REGM4XEN_MULT;
-	dd->last_rounded_m4xen = 1;
-
-out:
-	omap4_dpll_lpmode_recalc(dd);
-
-	return dd->last_rounded_rate;
-}
-
 /**
  * omap4_dpll_regm4xen_determine_rate - determine rate for a DPLL
  * @hw: pointer to the clock to determine rate for
@@ -195,7 +140,7 @@ long omap4_dpll_regm4xen_round_rate(struct clk_hw *hw,
  *
  * Determines which DPLL mode to use for reaching a desired rate.
  * Checks whether the DPLL shall be in bypass or locked mode, and if
- * locked, calculates the M,N values for the DPLL via round-rate.
+ * locked, calculates the M,N values for the DPLL.
  * Returns 0 on success and a negative error value otherwise.
  */
 int omap4_dpll_regm4xen_determine_rate(struct clk_hw *hw,
@@ -215,8 +160,36 @@ int omap4_dpll_regm4xen_determine_rate(struct clk_hw *hw,
 	    (dd->modes & (1 << DPLL_LOW_POWER_BYPASS))) {
 		req->best_parent_hw = dd->clk_bypass;
 	} else {
-		req->rate = omap4_dpll_regm4xen_round_rate(hw, req->rate,
-						&req->best_parent_rate);
+		struct clk_rate_request tmp_req;
+		long r;
+
+		clk_hw_init_rate_request(hw, &tmp_req, req->rate);
+		dd->last_rounded_m4xen = 0;
+
+		/*
+		 * First try to compute the DPLL configuration for
+		 * target rate without using the 4X multiplier.
+		 */
+
+		r = omap2_dpll_determine_rate(hw, &tmp_req);
+		if (r < 0) {
+			/*
+			 * If we did not find a valid DPLL configuration, try again, but
+			 * this time see if using the 4X multiplier can help. Enabling the
+			 * 4X multiplier is equivalent to dividing the target rate by 4.
+			 */
+			tmp_req.rate /= OMAP4430_REGM4XEN_MULT;
+			r = omap2_dpll_determine_rate(hw, &tmp_req);
+			if (r < 0)
+				return r;
+
+			dd->last_rounded_rate *= OMAP4430_REGM4XEN_MULT;
+			dd->last_rounded_m4xen = 1;
+		}
+
+		omap4_dpll_lpmode_recalc(dd);
+
+		req->rate = dd->last_rounded_rate;
 		req->best_parent_hw = dd->clk_ref;
 	}
 
diff --git a/include/linux/clk/ti.h b/include/linux/clk/ti.h
index e656f63efdcee77ee3e8bc55e763423686cee06f..54a3fa37000477c0150fe73e01064cdbe666e393 100644
--- a/include/linux/clk/ti.h
+++ b/include/linux/clk/ti.h
@@ -34,14 +34,14 @@ struct clk_omap_reg {
  * @clk_ref: struct clk_hw pointer to the clock's reference clock input
  * @control_reg: register containing the DPLL mode bitfield
  * @enable_mask: mask of the DPLL mode bitfield in @control_reg
- * @last_rounded_rate: cache of the last rate result of omap2_dpll_round_rate()
- * @last_rounded_m: cache of the last M result of omap2_dpll_round_rate()
+ * @last_rounded_rate: cache of the last rate result of omap2_dpll_determine_rate()
+ * @last_rounded_m: cache of the last M result of omap2_dpll_determine_rate()
  * @last_rounded_m4xen: cache of the last M4X result of
- *			omap4_dpll_regm4xen_round_rate()
+ *			omap4_dpll_regm4xen_determine_rate()
  * @last_rounded_lpmode: cache of the last lpmode result of
  *			 omap4_dpll_lpmode_recalc()
  * @max_multiplier: maximum valid non-bypass multiplier value (actual)
- * @last_rounded_n: cache of the last N result of omap2_dpll_round_rate()
+ * @last_rounded_n: cache of the last N result of omap2_dpll_determine_rate()
  * @min_divider: minimum valid non-bypass divider value (actual)
  * @max_divider: maximum valid non-bypass divider value (actual)
  * @max_rate: maximum clock rate for the DPLL

-- 
2.50.1

