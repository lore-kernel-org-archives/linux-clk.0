Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F852D877F
	for <linux-clk@vger.kernel.org>; Sun, 10 Aug 2025 22:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754866676; cv=none; b=Q/xzuJKLchoIHm8LHaxMVkpbac8OxFcZMo2nRmgExobWF30RiP/L9KyCXmpyLFDdvFW1sz373TCu2FVUM18kJ94172UHZMEBXCMQmkYqOFj1SFiDBXVbseWqvIMyVPhoi2Z5D8XNdqTNWMcuyVz5V0esZsZ0MtEouXLudvYIXNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754866676; c=relaxed/simple;
	bh=S1ThvUuOJst13Y/YlkE34LQrjuUVO54/oWHL+6E9CBo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zs9ILaPs1DAnPH2d0TvpPU+61IhMwyWiJdAB6jdMaabn9N/ygC7L69rJ/YV4YrWKeWGUWl/3BTGJzGSalgScA8piYE3Xj0m3dPRW+OsFqd0NTRnIRnYdaIE1Q/8TXDgLvhDpWHouOCFTd8CqYLybRUGTPnZp3qwZ4PEDoY2dxf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SZPgOZhM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SZPgOZhM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754866674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UO4UTVA/mzla0cfFiIXtkcaKSPEU88yVqzjz85er5YU=;
	b=SZPgOZhMppyDM9EVKv+4vimMZWLfxLssxnVSfa32lKgKjWoCZpmBK/TYXLhznvfi2oGzx9
	FyXaUoE18lHlC2Li53UDx9mgyP6fordkm0Qh2uOqhS9ti+HoDvFGMFqvtdEkcwXxhF4ZnQ
	NRSP/2+qo77GgIBtxDobIyIvY3o0kOQ=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-1VEB-_N0PcuZQa-sQDk4Qw-1; Sun, 10 Aug 2025 18:57:52 -0400
X-MC-Unique: 1VEB-_N0PcuZQa-sQDk4Qw-1
X-Mimecast-MFC-AGG-ID: 1VEB-_N0PcuZQa-sQDk4Qw_1754866672
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-707453b0307so88526326d6.3
        for <linux-clk@vger.kernel.org>; Sun, 10 Aug 2025 15:57:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754866672; x=1755471472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UO4UTVA/mzla0cfFiIXtkcaKSPEU88yVqzjz85er5YU=;
        b=hTMnK51VOp2z3rymoAxmInFdXnL85SL9bS9CZ1m8NSbwBsFyQfPdc95f/mo+fTd6ao
         wqmnqgIecuX1Wx4weoYoD0osa+kRuC75vpRtlhZYmzBqYE1u7i76IrhsAbHx7UcehIeg
         HFWN3XEnTrxRWBjt0gDIHX/tf444G+7rKmpRkty/7A2wdSxJsYl6da6O2aziCrSUwv9F
         4XAQrHnBrfNPD1BG5qQlNg7jvhlCJT2ddsqLmSRtGbg9wIw12bPDTAx7kQLBFejBjLq9
         3jW/EdALLdUnHUC6LyoFHykN1Z5Q/FJuw73/0IyPQIxTwZSAy0CTkJISA2oxfdmJvcx0
         34kg==
X-Gm-Message-State: AOJu0Yxpr9g4c5VvwmejSSGEQtzW5Ty78TXm/irnVUZZvzBbOC8vQlPn
	sw896pbi3YPWB6TtmAgUohv2CUSM/P7dpTXDsVl2cTLih1N+wfyzDJcjjIkiI1j7BXJ50hi/UFY
	7QHJS8dWCs/sR8rLXpFMgM1jBz/Qk9wcB7ZxCYh5bcqAYhvVUPyg99RjLTOW37g==
X-Gm-Gg: ASbGncsL2rShXMpvXNw9C1ICOve5iii4u0RN7LI2nUa28WNNBcESX/r2r3NU7ePkn7x
	wm54Y8POFHR18QkrVWYWMt5Se88jZOJbwV3H2sCliOd2zavPs9dSKDO6SOpxi68hSOMVq/rSyd4
	HXwac1q070dv2VCOrm8cQ+ci5/heHcikSG92PsV21VdyICZR8qFw9GMprc43PTCjokzTpFFHBK4
	BBLJ2cgbcRe230NbBbT4k2Em/kwBeaxKiE2fWuV6dHrFcq5AqDE6XNaNSU1rPepgS+7y8PIHIS9
	4JaoNNHjYUyoKAzsFeECFfXe0XBGLFPWWYMzjhtHQmLEuKs5nxSgFYKa0ZPCQ/XNBUDvf6yd2k5
	VeeGm+Q==
X-Received: by 2002:a05:6214:d02:b0:707:4b51:a490 with SMTP id 6a1803df08f44-7099a19aad2mr137562946d6.5.1754866671695;
        Sun, 10 Aug 2025 15:57:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8jqqdlU+xWojFno54cfUqsUBZEN8YO23eSx1vJ00mPnhAbDT9uCqATLlZeCwNyroK4P6n/g==
X-Received: by 2002:a05:6214:d02:b0:707:4b51:a490 with SMTP id 6a1803df08f44-7099a19aad2mr137562776d6.5.1754866671327;
        Sun, 10 Aug 2025 15:57:51 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077cdd9916sm144266336d6.61.2025.08.10.15.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:57:50 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:57:27 -0400
Subject: [PATCH v2 3/7] drm/msm/dsi_phy_28nm_8960: convert from
 round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250810-drm-msm-phy-clk-round-rate-v2-3-0fd1f7979c83@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754866653; l=3029;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=S1ThvUuOJst13Y/YlkE34LQrjuUVO54/oWHL+6E9CBo=;
 b=4rVxfvm9gI5nV5UAVPsesymzsnSyxITGfXVS5e8nQ7ETrG0DkGZDJjcM2GeRttJ1xTdECTbGI
 s8fyPCx6Vs0B/8HLHCZbs2HwuxniL7G5vx63VQcoWh5nqmwlomL+2OO
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series. The change to use clamp_t() was
done manually.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 32 ++++++++++++-------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index f3643320ff2f2bae5301bb94f1fe19fa03db584c..8dcce9581dc38730ab725e0e435ab93a04c527ed 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -231,21 +231,19 @@ static void dsi_pll_28nm_vco_unprepare(struct clk_hw *hw)
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
+	req->rate = clamp_t(unsigned long, req->rate,
+			    pll_28nm->phy->cfg->min_pll_rate, pll_28nm->phy->cfg->max_pll_rate);
+
+	return 0;
 }
 
 static const struct clk_ops clk_ops_dsi_pll_28nm_vco = {
-	.round_rate = dsi_pll_28nm_clk_round_rate,
+	.determine_rate = dsi_pll_28nm_clk_determine_rate,
 	.set_rate = dsi_pll_28nm_clk_set_rate,
 	.recalc_rate = dsi_pll_28nm_clk_recalc_rate,
 	.prepare = dsi_pll_28nm_vco_prepare,
@@ -296,18 +294,20 @@ static unsigned int get_vco_mul_factor(unsigned long byte_clk_rate)
 		return 8;
 }
 
-static long clk_bytediv_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *prate)
+static int clk_bytediv_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	unsigned long best_parent;
 	unsigned int factor;
 
-	factor = get_vco_mul_factor(rate);
+	factor = get_vco_mul_factor(req->rate);
+
+	best_parent = req->rate * factor;
+	req->best_parent_rate = clk_hw_round_rate(clk_hw_get_parent(hw), best_parent);
 
-	best_parent = rate * factor;
-	*prate = clk_hw_round_rate(clk_hw_get_parent(hw), best_parent);
+	req->rate = req->best_parent_rate / factor;
 
-	return *prate / factor;
+	return 0;
 }
 
 static int clk_bytediv_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -328,7 +328,7 @@ static int clk_bytediv_set_rate(struct clk_hw *hw, unsigned long rate,
 
 /* Our special byte clock divider ops */
 static const struct clk_ops clk_bytediv_ops = {
-	.round_rate = clk_bytediv_round_rate,
+	.determine_rate = clk_bytediv_determine_rate,
 	.set_rate = clk_bytediv_set_rate,
 	.recalc_rate = clk_bytediv_recalc_rate,
 };

-- 
2.50.1

