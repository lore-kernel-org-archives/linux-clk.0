Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED922F0E22
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 16:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752164874; cv=none; b=PzpgQZDqwpBHcdo+XgqDWz8euCwpm7iG1fMJ+S1ivo3xbNOxIGZAQngaoJ7NcJOT187S8fvVvramnEgRg29zbKbHPlD+cE6Xh5c0kZCUDdydLepoZzBuUf5DeC9T1NoylrTXjN1zXaqzVOtQeFgO9rK0/oIpPWzbax08C2qv3nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752164874; c=relaxed/simple;
	bh=2tcX4i+WplqrfRmawSRGIQU9quR/NT2tlxOGP4FTR2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AM3S5OKHDDwHh0Qm/Lmm7XLMcNFDK5mNk/2QVPMDg0BpgRHjjUtbBb4QLTRpbMyDc60y461AK6fXDW+ciP6wxScuwkYhsOCDfKIJKIbv15yVOCCzVvIoEFHZE58/bi88hoXdwIMUP+s+vzPgsY8/ke04JPl5FUB9SQ4iEGfLh6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L98kfYr+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L98kfYr+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752164872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8lg6vSRQIoxZQq3J6kiqCP0RJ7z/x8IqpzwjD/7nChQ=;
	b=L98kfYr+6u9NVtE4T1HobAclVDxgOC4uo2FIJ6jZ5DjMwXJHIDhWsc08TR2mBS5S/pe3Tg
	y5axUx842qtp6qoz/wcnbBzxV7L0vWbifGqC0306fpz8lO7tAioVEZeEpUtmqB932ymJRZ
	fwyQ9jJmhyOpALqV8zOneW6LCYBllV8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-unsxs05rNDa9Wy9BOzh23g-1; Thu, 10 Jul 2025 12:27:51 -0400
X-MC-Unique: unsxs05rNDa9Wy9BOzh23g-1
X-Mimecast-MFC-AGG-ID: unsxs05rNDa9Wy9BOzh23g_1752164870
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7dabc82916cso218022285a.0
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 09:27:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752164870; x=1752769670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8lg6vSRQIoxZQq3J6kiqCP0RJ7z/x8IqpzwjD/7nChQ=;
        b=E7oVusLJsuvx/BL1wIU1d6V9R0jowZb2RkgqHS3cC0+fko/BynrYmmOQn7KQji62Se
         Jhu8749V2JIPXBnAGJ6dM/PUOwE8WxIGwPI0U7y5nDjWd2+H4DRx/HxPuDdkF7jbuV8o
         9S1xW/hvek0qHfmcynQAe6xWNsPkK+ri300NeT886Kv7IsZa+WZr4s21hY1Ia+w4+SZ9
         onLOmCN6ytendG0+KYpIFOEqkWIeKslFztjKeFGKCeXLQnXo+10n+DrAgu0Ja40pDejk
         DrqU6Dah32l6VwwBlKR8VLp5WYV+rgZNhaaLz4r08GhpXw9WfGbWLBTIUd7NO2BpElL7
         bsMw==
X-Gm-Message-State: AOJu0YyzsOgkqkRadyFAMNoqbZMm9nofMHXmdNBUaaKlQFXLt/Lv7M1D
	3Rp3J69RPvQIhfmk9+DaUcpwvTtj7FkHUmMI21KvgrSzmp595Wc9XDDhrAFmuEGT+gx7rgM2XTL
	LEISq1tXKeruNkN8gj018odcyld/7BN9OPrRw/TjpE8kwxUZ5+bgRVuPPaBCHSw==
X-Gm-Gg: ASbGnctfSi9m/k+fSxqbYWG6b993Mg7xOlUVRZfZf+UeYAzaObEimnQqNul7O5gIs2e
	/iEEDmfFLDVaU8tClNr6E8z1eWRRtHVCVL9nAPSDevm+duUiJUDIg1x7asI/LCbxkKSVur89jqy
	uJvYh38C6mpaszuzfC4Z9U/AG0OWGBiLJtqBshy482cijZNDMDOBFL3sd52flt+0fC2xYg7hs7g
	fMDELzc5qwzHzFR8rSQXMHcxZ0nufOHQFC0CztN+G7RoBb3Fwj1QlhXMjB/+blj9drOJfdnrp9h
	be6QRoPoO7+aJ1qIotOSAi2brYi6o1C1Pgw6kfWjPuXHm+TOAgZuvhHLdROl
X-Received: by 2002:a05:620a:278b:b0:7d4:4b40:fcab with SMTP id af79cd13be357-7dde995087emr35200385a.6.1752164869858;
        Thu, 10 Jul 2025 09:27:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzID3fxPLzjceUNQ7ykn+etrxan44d1sFVAzLmbbmeJrEyagiiMxYKuKtBXqRalDrZs3g0iA==
X-Received: by 2002:a05:620a:278b:b0:7d4:4b40:fcab with SMTP id af79cd13be357-7dde995087emr35185885a.6.1752164868703;
        Thu, 10 Jul 2025 09:27:48 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcdc5df99asm113487685a.49.2025.07.10.09.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:27:47 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:27:27 -0400
Subject: [PATCH 1/7] drm/msm/dsi_phy_10nm: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-drm-msm-phy-clk-round-rate-v1-1-364b1d9ee3f8@redhat.com>
References: <20250710-drm-msm-phy-clk-round-rate-v1-0-364b1d9ee3f8@redhat.com>
In-Reply-To: <20250710-drm-msm-phy-clk-round-rate-v1-0-364b1d9ee3f8@redhat.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752164864; l=1824;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=2tcX4i+WplqrfRmawSRGIQU9quR/NT2tlxOGP4FTR2U=;
 b=qzj4XInGJ7/EHJVBNG2+t0ziIbNz896g6fTJEvecN0CZRiGCaopgTV+PetsARQ4sfl9hv4ynl
 EW7hPRPg9BxC9pUnEaWMMeMPqih8fcUG8Gm5AhUD6C5SJGf/nMExHjE
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index af2e30f3f842a0157f161172bfe42059cabe6a8a..d9848b5849836a75f8f6b983d96f8901d06a5dd3 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -444,21 +444,21 @@ static unsigned long dsi_pll_10nm_vco_recalc_rate(struct clk_hw *hw,
 	return (unsigned long)vco_rate;
 }
 
-static long dsi_pll_10nm_clk_round_rate(struct clk_hw *hw,
-		unsigned long rate, unsigned long *parent_rate)
+static int dsi_pll_10nm_clk_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
 	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(hw);
 
-	if      (rate < pll_10nm->phy->cfg->min_pll_rate)
-		return  pll_10nm->phy->cfg->min_pll_rate;
-	else if (rate > pll_10nm->phy->cfg->max_pll_rate)
-		return  pll_10nm->phy->cfg->max_pll_rate;
-	else
-		return rate;
+	if (req->rate < pll_10nm->phy->cfg->min_pll_rate)
+		req->rate = pll_10nm->phy->cfg->min_pll_rate;
+	else if (req->rate > pll_10nm->phy->cfg->max_pll_rate)
+		req->rate = pll_10nm->phy->cfg->max_pll_rate;
+
+	return 0;
 }
 
 static const struct clk_ops clk_ops_dsi_pll_10nm_vco = {
-	.round_rate = dsi_pll_10nm_clk_round_rate,
+	.determine_rate = dsi_pll_10nm_clk_determine_rate,
 	.set_rate = dsi_pll_10nm_vco_set_rate,
 	.recalc_rate = dsi_pll_10nm_vco_recalc_rate,
 	.prepare = dsi_pll_10nm_vco_prepare,

-- 
2.50.0

