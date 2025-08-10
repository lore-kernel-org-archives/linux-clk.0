Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BD32D8381
	for <linux-clk@vger.kernel.org>; Sun, 10 Aug 2025 22:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754866666; cv=none; b=HTW0ZXXEmbPtP0uUCdG3VzCw9skEG0rhm3hgej/u3i7QeNBOUVyfxCEAnoG/cq727dPO9vl5KrKoQ25j+7ZSNJuneP2y7V6kS5/OTDglMpJQyX3wxM3E16OoODJfhY/0CleTxCCQS/qAbI2JHNoCqCGLy0RMgbk+VORMEb4uLFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754866666; c=relaxed/simple;
	bh=mlZH8VUTbF6GjSuW92dEJqa/xMC0PXyQyKOZ+vDaxME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pvIO+sZKReYSUCY3FWPsgrwg9G7Yp0d/l2nNBWS16XoEyGo0ILU/0Amxtyz4UOPlcmN4hEcZ1ePV8dCetF3lWFizwCSqBBIMCe3FlUpR/M2mCvwzvnete84QusRuRZeTbd7/FWXxiVTdx/39Dp1Z4bNUSV1rtbRkVu4QSDJvY9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UvucMBJN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UvucMBJN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754866664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bVC0fsmzSbmTSL6eyVRHt/hFHyj+fClbPc4jjMQBQNc=;
	b=UvucMBJNkkznm4M7nwGZX/p6h8Weq+K2EPxtcd8QsuFvBIK5NVN5qZeavgdnV3d9QoR4hL
	8axkZahunuip+2WP05oaUK4tgeyCzveUITZjY5Sd3XTzwcTj+ZrzmJfvUBrTakAP/Ee5cZ
	JV4Pid4zgOJ6aR/B5z9uHgbXizGC0SI=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-212-XyC04wxlNki25Bkz1pVZsw-1; Sun, 10 Aug 2025 18:57:43 -0400
X-MC-Unique: XyC04wxlNki25Bkz1pVZsw-1
X-Mimecast-MFC-AGG-ID: XyC04wxlNki25Bkz1pVZsw_1754866662
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70707168c59so40446216d6.2
        for <linux-clk@vger.kernel.org>; Sun, 10 Aug 2025 15:57:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754866662; x=1755471462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bVC0fsmzSbmTSL6eyVRHt/hFHyj+fClbPc4jjMQBQNc=;
        b=Mub4oEezdPIoV9IFIsv61pa4HiuWVv/gd5bAMuYvX9aPRMocafnJpFc2pbFSs5FOp8
         S3jD90Q9qeDSB666LD1nxEUF7C9f7FYkY1o6jTI/u3K5aWc7jQQxY4n6kb1DntPLLpC+
         FyGl9tCY5yDFWU5VaZLjOO0eFR/opjE1nQTTaeFIeqgYfTo+tImepOL/epjOWiRzN3PP
         Ox1NFPvVRvoGELGKVJ0TRhnx4LD3raFrc19ZF/uATBMCS532jQj4D9AgmCpOFw5Je3uk
         4DuBTEK7BadvT1012p9BcO4VhhAaqgB3FHXpayrghWYSdCgN/vM4LD2z/IMhXO8kUxOH
         1hRA==
X-Gm-Message-State: AOJu0YwOhZn9ktFnRIuvju1xYprxS6d10aJOsafkrjwz/I1TPigDHo5H
	1ENIZPHcVI4k3JPThgos+DEkY1dpZtv+4QWMF6qhDpd0MZ0fmjSHhQHnXq3ygG6yNBiCZvoCBFH
	rUBLSVy2HUR8/zrnpWpyQWY5HOGHJb3qJEQ0j4+noKaVcoZnqODKzVuIBjTtceA==
X-Gm-Gg: ASbGnctofTSYYLikAacsPbU6X921d+ymO2ygeNgTyjRXe8p3dxmkBSBN7Vb3I4pw/ZQ
	DbJtOmcHCnCmVNLKYfkE5LjRFE97N4GkJroTQoR6/K8LK71nAkdKGmTfwwoJVAqXpEwtSLwpXRj
	0e4zXMnoLGtpy/bWAuqUgrqu+AaoV9Ef5mW36Q1LIn+evk87pmN0Lo0uwjEZ2JHGMyrPqqrQHAj
	yiUNtse8Wm8htDikJ3jt0a3UfUG2jFyqHPWIYEOGzWhwRDg5/Ir6Faw5lsWo6SLdXbQ74wt6aFN
	ld5Q8yQb6SxcXAv1yyFUzl9jTxcNTh4zT+j+0Op3b3JqAoEBS7u2oeFPsqPSTpateiFfxbmUXaX
	f1uwrRg==
X-Received: by 2002:a05:6214:2a45:b0:704:e0ab:a9bd with SMTP id 6a1803df08f44-7099a3e56f8mr122299136d6.24.1754866662368;
        Sun, 10 Aug 2025 15:57:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcMnOEXwtR8lN8UlPgOjL9+Zy3/GaRT4D7BPMh+oeXRYAdB1ptGpb4wo7alWACslPJfTQXCQ==
X-Received: by 2002:a05:6214:2a45:b0:704:e0ab:a9bd with SMTP id 6a1803df08f44-7099a3e56f8mr122298976d6.24.1754866661965;
        Sun, 10 Aug 2025 15:57:41 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077cdd9916sm144266336d6.61.2025.08.10.15.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:57:40 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:57:25 -0400
Subject: [PATCH v2 1/7] drm/msm/dsi_phy_10nm: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250810-drm-msm-phy-clk-round-rate-v2-1-0fd1f7979c83@redhat.com>
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754866653; l=1786;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=mlZH8VUTbF6GjSuW92dEJqa/xMC0PXyQyKOZ+vDaxME=;
 b=x0tYnThWbgPO4mmw+Gsp2C+ceOXEYoVMWAX/rkUBoIKXhbcdtiiiH5Qx0bZYWg7rb85fOnwgn
 te+Em4v6YAqCUom67xxN5Ay9xj6+tIi+ghcjTR1lViL5pmDtQqvYeDu
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series. The change to use clamp_t() was
done manually.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
index af2e30f3f842a0157f161172bfe42059cabe6a8a..ec486ff02c9b5156cdf0902d05464cf57dc9605b 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
@@ -444,21 +444,19 @@ static unsigned long dsi_pll_10nm_vco_recalc_rate(struct clk_hw *hw,
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
+	req->rate = clamp_t(unsigned long, req->rate,
+			    pll_10nm->phy->cfg->min_pll_rate, pll_10nm->phy->cfg->max_pll_rate);
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
2.50.1

