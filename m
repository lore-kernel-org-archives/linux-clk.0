Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767D6190685
	for <linux-clk@vger.kernel.org>; Sun, 10 Aug 2025 22:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754866671; cv=none; b=e/t7SyqSfe7jViLbb8OvdZjl3Yg5Addn2DKQo9XcNTQHFZgnC2dVFI/5aiCCoLypOWmD8V2RS+KWKjZNPQxBTzVONu6T5cY3hNJ8u0+3l7AUuAj+HprvveqcGjkmvrSynrAuIgECwICeQtlMpGBza0XwN/JmvnUuq2HQKGYZdts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754866671; c=relaxed/simple;
	bh=zgC0RAqMfe4QHFoCK3ImKc6JYhHbtGs2pWeVB9da7xM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UqNFTXuR7VC4fgEfxTCsBeN5i/M/P9yFmPSk3JUM33PKYPlCZx4h5E6l4TSSneuezbUU4Z7R2G1g8vAd3e9CoekUYzCpX+t6yOxepE+BdEnsYy3gvEqSd217646nUcgxK+nTprkVJf78QM2Qza3MKfW7/5t7bVf3NeWFWAZYeKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Yyg3oG7l; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Yyg3oG7l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754866669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8SfCqXrLXFpaQOsEIXkeTXLB3lBS80oYBheI2i61aRI=;
	b=Yyg3oG7l7MzvjXkc3d7bloPpfb3/bpQtJN7kTPrqzfDGZ2EPz1d+mruWtv4sDH9gjtCs0R
	nhWDsW6SytAn5zkJRl8/D1jhYkQxO69JHv6X3fVXl2KbEMpKhRPDhZ+fPpfhrew4CkK4rs
	sRcyJS4+kOQZpEDbOOgNeOAjKHvkKZA=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-5K12ArmSOnGHOmDujIVwvw-1; Sun, 10 Aug 2025 18:57:48 -0400
X-MC-Unique: 5K12ArmSOnGHOmDujIVwvw-1
X-Mimecast-MFC-AGG-ID: 5K12ArmSOnGHOmDujIVwvw_1754866668
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-7073a52a800so79688126d6.0
        for <linux-clk@vger.kernel.org>; Sun, 10 Aug 2025 15:57:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754866668; x=1755471468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8SfCqXrLXFpaQOsEIXkeTXLB3lBS80oYBheI2i61aRI=;
        b=us1/t7PBeNJHzEVV5ZQ3RctJ2TMcbiVsWYPN+BQ+ZqUgXdwSz25ChcxLIyZZacZeW5
         dBmx/7CPxqzoRx365dotl2cL2QG7esQwUwdYLlwXWu98MIBgT283cU+LqsyDQRErIBbA
         yFs8YdUtf35E01rQ265ji8E4azGWVVTczilAyJs18RkMcUmYezWMH5Vh9nS10ymCDi20
         rfA6u1Cys1xre9rGCHfP6TSbJKLeZi9fA24+fwwDzvau7YDaJu48htK+9UuPeE5hEp2Y
         qdZEhbMpOB6k4sXnKCFC574DEE2iVsJi2dMEcNS0RX14kQ2j8PavpTi43H2tV3vhSdE5
         WbBA==
X-Gm-Message-State: AOJu0Yz9sX3ePi1h7eU1P+yRv8/oy8vLi1kGx3F9yJwIJQgKcfBQTXmu
	xiqIE6U3D5L74oVzb4citM8X4bbR3D9ucugK1CdTgnS5J5ICTfja8s05eHJqeLvNUDjLcm2Nt74
	v9D93PTnU3Ag+1fnI42dxDHQUdctD57BKtPLEdZcs9uVXjmog0IdLgzseb6XIPg==
X-Gm-Gg: ASbGncssdop6syG1k/ZTdPKrO12CD9slMg2IRBTTDOVp8JzHW5EBNYKSwC6DpH/bwma
	/+P5hwFz/d/twaKGNZ9E5e0USNyBroMexFEAESLqqxQoBvmKPy7ybR4iCQkiiH5FSIn9Q5FKjqp
	xv9taFufbH+1ycbOjqt27TK74glNbHAoyhrBQ49cAn52Zyd9biYAkCaQboEPcwUh+PHBxyXI9N8
	XZyV8aW6BcnFQSrI2NF3rjCh9lct7cJdcgvXQHBkKuU3RlK4F35PVNVfBoRSO95C56F6ghgdqV0
	lvav3nDEcDO0V6ZHAQIgO3Xf6aLjQGr+NCULUaUQHvJF2Ns5r0t/5Lc+GXha/83kNJcP2huRykJ
	kUOVuHg==
X-Received: by 2002:a05:6214:21e3:b0:707:616f:fff4 with SMTP id 6a1803df08f44-7099a199543mr177311426d6.10.1754866667580;
        Sun, 10 Aug 2025 15:57:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmz3g1MbcKxpKoE+L/OvCm0G94lPBEhAXAtzenne1OaexYFo15GBJiT3E87eJ0e4mZmWm1MQ==
X-Received: by 2002:a05:6214:21e3:b0:707:616f:fff4 with SMTP id 6a1803df08f44-7099a199543mr177311176d6.10.1754866667214;
        Sun, 10 Aug 2025 15:57:47 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077cdd9916sm144266336d6.61.2025.08.10.15.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:57:46 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:57:26 -0400
Subject: [PATCH v2 2/7] drm/msm/dsi_phy_14nm: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250810-drm-msm-phy-clk-round-rate-v2-2-0fd1f7979c83@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754866653; l=3160;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=zgC0RAqMfe4QHFoCK3ImKc6JYhHbtGs2pWeVB9da7xM=;
 b=g/OyIxfyVmL0j+PhW5RWDXbEs2uOlzP1vLM9nzajU+5emPdyje17xtKS5Qd4HfejxqWdsQWeZ
 8ROBSPZGhvzDt9b3VBZA5OUUGLIt5EVJPoH+qM81ctxrdXWei/umj9J
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series. The change to use clamp_t() was
done manually.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 34 +++++++++++++++---------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 3a1c8ece6657c988cfb0c26af39b5d145bc576f8..fdefcbd9c2848a1c76414a41b811b29e5fed9ddc 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -578,21 +578,19 @@ static void dsi_pll_14nm_vco_unprepare(struct clk_hw *hw)
 	pll_14nm->phy->pll_on = false;
 }
 
-static long dsi_pll_14nm_clk_round_rate(struct clk_hw *hw,
-		unsigned long rate, unsigned long *parent_rate)
+static int dsi_pll_14nm_clk_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
 	struct dsi_pll_14nm *pll_14nm = to_pll_14nm(hw);
 
-	if      (rate < pll_14nm->phy->cfg->min_pll_rate)
-		return  pll_14nm->phy->cfg->min_pll_rate;
-	else if (rate > pll_14nm->phy->cfg->max_pll_rate)
-		return  pll_14nm->phy->cfg->max_pll_rate;
-	else
-		return rate;
+	req->rate = clamp_t(unsigned long, req->rate,
+			    pll_14nm->phy->cfg->min_pll_rate, pll_14nm->phy->cfg->max_pll_rate);
+
+	return 0;
 }
 
 static const struct clk_ops clk_ops_dsi_pll_14nm_vco = {
-	.round_rate = dsi_pll_14nm_clk_round_rate,
+	.determine_rate = dsi_pll_14nm_clk_determine_rate,
 	.set_rate = dsi_pll_14nm_vco_set_rate,
 	.recalc_rate = dsi_pll_14nm_vco_recalc_rate,
 	.prepare = dsi_pll_14nm_vco_prepare,
@@ -622,18 +620,20 @@ static unsigned long dsi_pll_14nm_postdiv_recalc_rate(struct clk_hw *hw,
 				   postdiv->flags, width);
 }
 
-static long dsi_pll_14nm_postdiv_round_rate(struct clk_hw *hw,
-					    unsigned long rate,
-					    unsigned long *prate)
+static int dsi_pll_14nm_postdiv_determine_rate(struct clk_hw *hw,
+					       struct clk_rate_request *req)
 {
 	struct dsi_pll_14nm_postdiv *postdiv = to_pll_14nm_postdiv(hw);
 	struct dsi_pll_14nm *pll_14nm = postdiv->pll;
 
-	DBG("DSI%d PLL parent rate=%lu", pll_14nm->phy->id, rate);
+	DBG("DSI%d PLL parent rate=%lu", pll_14nm->phy->id, req->rate);
 
-	return divider_round_rate(hw, rate, prate, NULL,
-				  postdiv->width,
-				  postdiv->flags);
+	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
+				       NULL,
+				       postdiv->width,
+				       postdiv->flags);
+
+	return 0;
 }
 
 static int dsi_pll_14nm_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -680,7 +680,7 @@ static int dsi_pll_14nm_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops clk_ops_dsi_pll_14nm_postdiv = {
 	.recalc_rate = dsi_pll_14nm_postdiv_recalc_rate,
-	.round_rate = dsi_pll_14nm_postdiv_round_rate,
+	.determine_rate = dsi_pll_14nm_postdiv_determine_rate,
 	.set_rate = dsi_pll_14nm_postdiv_set_rate,
 };
 

-- 
2.50.1

