Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9482D879D
	for <linux-clk@vger.kernel.org>; Sun, 10 Aug 2025 22:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754866680; cv=none; b=TT+WskrQ68VZ3x8wd0UQQykDh5AWh2apDCn4X+/GiqfS0jylsKWNAlIymltgj9uOshq0nZBYNiRyEBXoZFS6+Idl3nWgaR37jGVC4Wg96exJLWYmEl4ewBErDNpUkR+dUqHKyjIRHg735n37IPqASfa9Uzmhcf95TCmOAQbEoHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754866680; c=relaxed/simple;
	bh=p3ik0LUSdZ7pAUi9CZauKm9YuXyhxLdYH6tXOMz9RD8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cIFOlQJxEf5+/IyuYVozZ6YNH+D68mezhddkL+5BftpdEZmRASsm+LVVOT3mBbV38RAZkU0TJipZquFyng5Bjg3GWZryqaitiVu1swd+L9HzzJPi8fT6SLm2dPE6wv0PCwE4BMVkZxVqY+lMgJVg2s178eisXuReHljVaNvMch0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YGvPqkJT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YGvPqkJT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754866678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dBLZ3cfmxr+kqQkwT3NrM5Of/dkFLZw54pOqr7tKcVM=;
	b=YGvPqkJTqPF18WrxSjlm2zaooXZGPHxoUAYSyqJHo33ZuHpLuBG1QlEQGV9+nZ0PIjS4K6
	pddYqkr/uNMUjWfUP+gIjn9z4sI9HWecPFRMb+bZCoVSmyo9bzH7vevdtjpbcXfI0BGsA7
	szZ7cN2Y64oK9Ry2GnJECugw7HQ1/S0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-N5XGKUVdPLm1dtJggBgp6w-1; Sun, 10 Aug 2025 18:57:57 -0400
X-MC-Unique: N5XGKUVdPLm1dtJggBgp6w-1
X-Mimecast-MFC-AGG-ID: N5XGKUVdPLm1dtJggBgp6w_1754866676
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70771983a52so83235846d6.2
        for <linux-clk@vger.kernel.org>; Sun, 10 Aug 2025 15:57:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754866676; x=1755471476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dBLZ3cfmxr+kqQkwT3NrM5Of/dkFLZw54pOqr7tKcVM=;
        b=tfhqEsqR8PynaNvnB2F/c9GFsKISBj2jR/viXHoZbkS5QinbmoIFKCLkxbU8R/BoXO
         OLo6fhLjQWSuo7FV9qH0/CIw1ghGTKEipBzWgsFz49JDjUKdvDC5UzT5/TcMPlMphWqB
         sgVGYXJSVbTwxRUZ7sVr5Sq948Kd3diFdjVcE1I3wbGrXZ6llQpyzA5OabKiM1I/6Lwf
         Raq8hxvpVlKq8IJKY8S8BYCM/s21Xq/sLUVgqh4ixnLmDl3NhpVvFKh8ZAdFLLNsgbEb
         nm8A6PC1KFAN3EKUiYFtQOSqwhLtA6su4KsUuOC25t/4DsWYXP5ObgYYAxYp4EVCfaHI
         XVeQ==
X-Gm-Message-State: AOJu0YyYVrtJguskDf3eEV3cuK6eB9o09CBYrUQF7lQ83II95yAdo0Ui
	1JuVcBRsomOcaHAE9yB6byVn714ZZs3sEx5vvtmvkyM/Nu38UhIePs7AL4Ju3l8bCIzA9fmmURO
	Ey3cVJaHPZFcNgZj+Fk5aOth/Txmzt+nMuQ5UzsHqDY81nszbfhhRAwtPM5Jffw==
X-Gm-Gg: ASbGncuL8BdPtKSq/X5hQFRsXvJULm2Q1VJkV0zAHSknmlNrr52KUpIJlrVAy12XHEt
	tEyRK3qfGyS2t0CTOtL4tqY88jvY8d2zAN8np4zMVPZP+s9YDcJb8Jl6cTdqQH2EHjSC04ILsT1
	It3oztVmSAObGiu6xvyndlvIgyssRkBPUwhbRzYaX2xcuDH+KHbpNNbCkPL9rqjAHbNduaT4oxK
	VeJKEn7czI8bntqeMRHFMsJ+yFQuuNLwo3vKAWRzTIsVoSCVYDBTApIjy3bq0UJHHprrm4DltzE
	U5hec42eu/rlDLk6DK8MhPyQPUzM2XlK12uxmL+2VmUMrK4p7Pt7PpFAJDs5pu1o60mqxBz633+
	766J54Q==
X-Received: by 2002:a05:6214:4585:b0:709:b911:5f9a with SMTP id 6a1803df08f44-709b9116168mr79859966d6.15.1754866676476;
        Sun, 10 Aug 2025 15:57:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGd1TtWL5ynfgJb6QbL2wAAD9tHrHovMXdTygkPUrPT2VeRi/mGn+68aKi3/k5cra2LUregkg==
X-Received: by 2002:a05:6214:4585:b0:709:b911:5f9a with SMTP id 6a1803df08f44-709b9116168mr79859716d6.15.1754866676119;
        Sun, 10 Aug 2025 15:57:56 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077cdd9916sm144266336d6.61.2025.08.10.15.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:57:55 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:57:28 -0400
Subject: [PATCH v2 4/7] drm/msm/dsi_phy_28nm: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250810-drm-msm-phy-clk-round-rate-v2-4-0fd1f7979c83@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754866653; l=2571;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=p3ik0LUSdZ7pAUi9CZauKm9YuXyhxLdYH6tXOMz9RD8=;
 b=R7LKKqyn/rze/YXErkV3FfpM8ZZMu5HZaOQr/tvP8aTxcbbN5RaDR0RWZNNF6WqbyaV3q+ft9
 fhWV9Cc8U6ZAQX8LrMGjTqjByHpN1lvRTa0Cj7+2O1r3z78hDY0dUWJ
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series. The change to use clamp_t() was
done manually.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
index 90348a2af3e9dac72924561b23b169a268abc3b0..d00e415b9a991cd515e01d78a48ac6fe3e830b04 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
@@ -533,21 +533,20 @@ static void dsi_pll_28nm_vco_unprepare(struct clk_hw *hw)
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
+			    pll_28nm->phy->cfg->min_pll_rate,
+			    pll_28nm->phy->cfg->max_pll_rate);
+
+	return 0;
 }
 
 static const struct clk_ops clk_ops_dsi_pll_28nm_vco_hpm = {
-	.round_rate = dsi_pll_28nm_clk_round_rate,
+	.determine_rate = dsi_pll_28nm_clk_determine_rate,
 	.set_rate = dsi_pll_28nm_clk_set_rate,
 	.recalc_rate = dsi_pll_28nm_clk_recalc_rate,
 	.prepare = dsi_pll_28nm_vco_prepare_hpm,
@@ -556,7 +555,7 @@ static const struct clk_ops clk_ops_dsi_pll_28nm_vco_hpm = {
 };
 
 static const struct clk_ops clk_ops_dsi_pll_28nm_vco_lp = {
-	.round_rate = dsi_pll_28nm_clk_round_rate,
+	.determine_rate = dsi_pll_28nm_clk_determine_rate,
 	.set_rate = dsi_pll_28nm_clk_set_rate,
 	.recalc_rate = dsi_pll_28nm_clk_recalc_rate,
 	.prepare = dsi_pll_28nm_vco_prepare_lp,
@@ -565,7 +564,7 @@ static const struct clk_ops clk_ops_dsi_pll_28nm_vco_lp = {
 };
 
 static const struct clk_ops clk_ops_dsi_pll_28nm_vco_8226 = {
-	.round_rate = dsi_pll_28nm_clk_round_rate,
+	.determine_rate = dsi_pll_28nm_clk_determine_rate,
 	.set_rate = dsi_pll_28nm_clk_set_rate,
 	.recalc_rate = dsi_pll_28nm_clk_recalc_rate,
 	.prepare = dsi_pll_28nm_vco_prepare_8226,

-- 
2.50.1

