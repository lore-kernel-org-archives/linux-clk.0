Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41212F199C
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 16:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752164881; cv=none; b=NBY5tXSBIiNgX6ty3ciyYNKF+IiRWQcZRjaOIPrOqlPKd11Z1690SZfipXq/vKlX9SenQISP2KuPuYQdcXXzIYQNxc4we5IFwxHwr4Q+KW0kferxgTJvphPWPfnjTNIUoe/avw3scWSWb1QxHl+ocWt/+n+5CCsjWPjEZ2zzYMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752164881; c=relaxed/simple;
	bh=3ODFGmq25OpFxWiAcH0OIyfIX2aQaxGLNyYzCPsECGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wo+SJGU44bwMiyFrRQRjSP6yPuzBl72hXYPBe0UgsE0b2+0ngiWKA2Yt3EZ0naf1pqE2CNJ3L36BJhblP5OsTB5FLfB7fsJeriZryt9fWWOKlSeV+FxVbGW5y2SLBu6t5ke2D+K0gQsSuDP1HBFslppajo2LKpKNDkIO2EAid/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BYLHDbm8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BYLHDbm8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752164878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p9mwZB2plhUHbudI2oPn9i55OvcjPNJuoUdisMW4qVI=;
	b=BYLHDbm86AiDVF5dnsfYuBREEDugJ08l/K3qLLV2y+X3tjpTwts7utdn9ZHfxxhbV5Y3oe
	9LX0VMddQcsRD632Y0GOJU23WqoErCvHxohBftSLg16fdh2BP3Do+Kdu4t43RetE9YG7jN
	HCfhHkcOqgBc4uMKVukMcJlPVJCkXXs=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-fq0SBAmeN-iWppEmWP4RYw-1; Thu, 10 Jul 2025 12:27:57 -0400
X-MC-Unique: fq0SBAmeN-iWppEmWP4RYw-1
X-Mimecast-MFC-AGG-ID: fq0SBAmeN-iWppEmWP4RYw_1752164877
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c7c30d8986so306511285a.2
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 09:27:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752164877; x=1752769677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p9mwZB2plhUHbudI2oPn9i55OvcjPNJuoUdisMW4qVI=;
        b=PN8Fc9uVhkWYrMz12QtJe/GtFeiS+tpwustulRufkRfBX8Q+Rhg7a6i8+Fy9zBTIkO
         olbVLM7ZNM2O4H/aBw9iAFKjFksVz3keo54hpoIpvxP0SM7b8IV31OQKzjbuwRtIp8cx
         Si439Shbk9YTAytV8KRcg1ZsqY8AY2y6IaB8N7tKgbNrRF9Cj925pLJczr56B8tRdSo6
         dgzBxkrDW/nmD2yaQtdlJ06kRZUiDFVVVW7bgrvKVE4a5TCgbONluYcu5y0BmDdJIE7W
         TPBV3es3NwbO0ZvoUB6DiOe0lbGYzfBecFfYSwa+jO2EBExVD49kgPSqzeEQwT1zp+VI
         Y68A==
X-Gm-Message-State: AOJu0YxM1L1SyrFSd8ikmDaD88Jnr1VTPj8beV3Trq7XU+IVoqS2usDh
	YkxtF9tEUP5L+aMYFVl6BFXfjFQY4f6an7gkEL6Me/nmQOht1R/JD/WYlyNl53D5hKWKp9rtFIv
	50RVbIvFQPuvXoQbGW6CRpGfr/EJl6SpSdzMBXVW4KxsIzlytZT2UknUsAs7pFA==
X-Gm-Gg: ASbGnct89aheWLLH+5a4AU9rO6HDZryx0z7IzSXzO8mE8sgwskz2TYQsVfz3msy3T6O
	F5rMAQ2HLKw/4OFeusP3rEDFdN9ezmKbe09wZQ2I2aESf4vZ13fStPkijAFYw2e32vQ+iN2Ie98
	yBjhFbv1TnVvFjFFli0onp7rNOI/YhacuypbVRnHnDmbJBPpn7UIFxgoiVqiGWvFYD4Ym7vpDuN
	oZQyz58Qa6C6zR17f3cqxWAcJKBoOc5cUW88T53Asv65Y5U0BTpLJBsg/ATGPhtGeRr52bahGYw
	gB/7NXc+onhQHePGigmq0NGipJhqMVuzHIKIieGo69EX0/Y2Iz8DwYZ7OBFL
X-Received: by 2002:a05:620a:720d:b0:7ca:efed:8644 with SMTP id af79cd13be357-7dde9d4b40emr22153585a.5.1752164877027;
        Thu, 10 Jul 2025 09:27:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5Dc+meUY3eLJ1nyNqdTNqbIqZwCg2pxyiI+KO5nsXIe7JUd0ZvtudqCR2DM307gX30VZuYQ==
X-Received: by 2002:a05:620a:720d:b0:7ca:efed:8644 with SMTP id af79cd13be357-7dde9d4b40emr22149985a.5.1752164876637;
        Thu, 10 Jul 2025 09:27:56 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcdc5df99asm113487685a.49.2025.07.10.09.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:27:55 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:27:30 -0400
Subject: [PATCH 4/7] drm/msm/dsi_phy_28nm: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-drm-msm-phy-clk-round-rate-v1-4-364b1d9ee3f8@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752164864; l=2599;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=3ODFGmq25OpFxWiAcH0OIyfIX2aQaxGLNyYzCPsECGw=;
 b=6/oStFWVrSUL8wUy/Yr+UeM9R3GqucZAe/BmJ+rdDWThekiBeQJQsTbUFCiwYDPvTUlOQurv+
 kZVgof83EB5BMQUlmdA4vkC4n6yoCb7TJpusAuMVQfBfOhbDoFBQBI1
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index 90348a2af3e9dac72924561b23b169a268abc3b0..6f500f6ac72813b542775e392680499f2eea6df5 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -533,21 +533,21 @@ static void dsi_pll_28nm_vco_unprepare(struct clk_hw *hw)
 	pll_28nm->phy->pll_on = false;
 }
 
-static long dsi_pll_28nm_clk_round_rate(struct clk_hw *hw,
-		unsigned long rate, unsigned long *parent_rate)
+static int dsi_pll_28nm_clk_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
 	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
 
-	if      (rate < pll_28nm->phy->cfg->min_pll_rate)
-		return  pll_28nm->phy->cfg->min_pll_rate;
-	else if (rate > pll_28nm->phy->cfg->max_pll_rate)
-		return  pll_28nm->phy->cfg->max_pll_rate;
-	else
-		return rate;
+	if (req->rate < pll_28nm->phy->cfg->min_pll_rate)
+		req->rate = pll_28nm->phy->cfg->min_pll_rate;
+	else if (req->rate > pll_28nm->phy->cfg->max_pll_rate)
+		req->rate = pll_28nm->phy->cfg->max_pll_rate;
+
+	return 0;
 }
 
 static const struct clk_ops clk_ops_dsi_pll_28nm_vco_hpm = {
-	.round_rate = dsi_pll_28nm_clk_round_rate,
+	.determine_rate = dsi_pll_28nm_clk_determine_rate,
 	.set_rate = dsi_pll_28nm_clk_set_rate,
 	.recalc_rate = dsi_pll_28nm_clk_recalc_rate,
 	.prepare = dsi_pll_28nm_vco_prepare_hpm,
@@ -556,7 +556,7 @@ static const struct clk_ops clk_ops_dsi_pll_28nm_vco_hpm = {
 };
 
 static const struct clk_ops clk_ops_dsi_pll_28nm_vco_lp = {
-	.round_rate = dsi_pll_28nm_clk_round_rate,
+	.determine_rate = dsi_pll_28nm_clk_determine_rate,
 	.set_rate = dsi_pll_28nm_clk_set_rate,
 	.recalc_rate = dsi_pll_28nm_clk_recalc_rate,
 	.prepare = dsi_pll_28nm_vco_prepare_lp,
@@ -565,7 +565,7 @@ static const struct clk_ops clk_ops_dsi_pll_28nm_vco_lp = {
 };
 
 static const struct clk_ops clk_ops_dsi_pll_28nm_vco_8226 = {
-	.round_rate = dsi_pll_28nm_clk_round_rate,
+	.determine_rate = dsi_pll_28nm_clk_determine_rate,
 	.set_rate = dsi_pll_28nm_clk_set_rate,
 	.recalc_rate = dsi_pll_28nm_clk_recalc_rate,
 	.prepare = dsi_pll_28nm_vco_prepare_8226,

-- 
2.50.0

