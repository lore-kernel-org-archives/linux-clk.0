Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB172F19BE
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 17:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169411; cv=none; b=O+Wp9g+8D6kt9AC4LO8zXJoq0T3Wdc+ANTYaWO9phsPuzeG5e3uQASe0BnaBnhEeVNknZpoXT6TQQ4I4Yf5ycIjHxEt1ZFiBmShSGsvKh3KVJ3gsaXi3v+ok8ADPwda2gaOkY6vmBV8Qq+hGvx4lUWbw7krBKIZ00GpO2IE9YRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169411; c=relaxed/simple;
	bh=0XNjSSy+sJ0lfEyL4cE3BgJoCrdQCRO7x73pTQQcP6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SnhxgH+ARw9QgibXecvk4pMS3iUwzaVCfpWCdQo0FiHInuHlLON6NX/rmWq/g9OiGG4ft2wMCg/piGuVWC9Ki1urdvU7mzYC7MWC1QjzMeO187zCsQLoPvPkWuPI4bGZtD/KfOm3M1UK40uRPbQKc7DQeptVWSTNikNzrA5SSRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z6C6+DUg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z6C6+DUg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752169408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KBPGyYPlG02EWMpLoXBzNUmSiSLVytWyHaO2lqHRcZA=;
	b=Z6C6+DUg4w1ugVrWNW9WD7XPladdxlXW0J91egWhoYSpM9Q4ezFhvOUX6fcnXk00TKHtDd
	6as/n6Q2VPb8Qk+eMAqJnuc+p1QNa1nZfytaHXEqQBCQ2SfOY00LSvzY0hFPAldqbNWGzC
	URwibWZiy3br+cSDhFQbudAzUvI23pQ=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-110-Zs5gwuE-N7COxFbxbeP5Ew-1; Thu, 10 Jul 2025 13:43:27 -0400
X-MC-Unique: Zs5gwuE-N7COxFbxbeP5Ew-1
X-Mimecast-MFC-AGG-ID: Zs5gwuE-N7COxFbxbeP5Ew_1752169406
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fb5720eb48so38806366d6.0
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 10:43:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169406; x=1752774206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KBPGyYPlG02EWMpLoXBzNUmSiSLVytWyHaO2lqHRcZA=;
        b=KBRQDSUNpuVc0mJy/dzhCWwuRl6aKwTSOuHG401ihegjIxjK3qL/ZfM8Pkwzie35Sa
         yUbNuWkkRULJcVLNy2E7BSG50U97HRbANlMuiAnZGHPIfMA05tf8ojBFj5ibcDXuBXqf
         hj9v68nV2lyyauAgyJuJ1UHp4t63cRpJqaCKRwpPf3+YXSQdey+wKaoBYw/ijttSDC+S
         /1HotVD5G0hRgco8yFPfs+Lo1uQbOxTVhhJfC8fySBt42h9jiQAqVoUZAOxqIEj7S0ZF
         Z3qAQGiGYhX7IN+1U7Xj3HGvUXXQn4eYcLNWXsqRr51ZqiE3UIv3fQMPQWUkjIGpYnmp
         B/Wg==
X-Forwarded-Encrypted: i=1; AJvYcCVu4LKSlSKl8QRt4JjNN5tvYzaTRFc4tpkKMoe08KFiXTXis45a62ocusEL6KmhTD5hYT81bbc2a20=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsVxMujZizkzCv79TymXRcwuyrOtZE2GU3dFTVkQ4eIzQunOcH
	zatWPdmoG1Yj5uVJe2u79zdJ/BX1208fYqe5LwaTHkkyjKBO6+R/mr0k8Indcf5jHHOv9nOVfsr
	pDwpQyiCrWw6LeEuBvyEfPD6wgSnH9BWur0H1DVCdIX2osEY5C+AxLDgJu1ajxg==
X-Gm-Gg: ASbGnctvPCnWJXPhfwBmWmU1bdCvG141EvD4KLMjQSquveabbDP9JaRRDVrqhDSr5RD
	PIlkalbair5BXRYOGo1ps5VJStLGu7Rz0bNv/Kb4xKHgYsxF8zBu9ec/yhNzBJb3jlR/rpaRS4R
	3fYav9cL29swIVLtFLSSMjnh8s15H+5V+/0V3rhTCBYqrembuWFawePtkFawK2CJQGpM7UEuXBb
	4n00zLf0gYnXgd5J8zMLXsG9zw2Gr3nr3LRqbbBtApdRAh2Y7fo9UkT3piv6wkrI4lbJG7YfLyh
	8wFk/ToliOOaqV05Qszd0XFHna7YFsm+25Fg9v4qb1e/+2OPM7lgYhrDYPKx
X-Received: by 2002:a05:6214:3f85:b0:6fa:c22c:f78e with SMTP id 6a1803df08f44-704a3f6fd62mr2495946d6.14.1752169406566;
        Thu, 10 Jul 2025 10:43:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEttkcpvpmW8n4QYixl0+KFt8qbGPFK3Af/cnV1daIlslvCn8CNttD2d7VeOQXKfYZa2Tsq5w==
X-Received: by 2002:a05:6214:3f85:b0:6fa:c22c:f78e with SMTP id 6a1803df08f44-704a3f6fd62mr2495446d6.14.1752169406197;
        Thu, 10 Jul 2025 10:43:26 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:43:25 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:43:04 -0400
Subject: [PATCH 3/9] drm/msm/disp/mdp4/mdp4_lvds_pll: convert from
 round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-drm-clk-round-rate-v1-3-601b9ea384c3@redhat.com>
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
In-Reply-To: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-sunxi@lists.linux.dev, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=1612;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=0XNjSSy+sJ0lfEyL4cE3BgJoCrdQCRO7x73pTQQcP6I=;
 b=96LRUEONivujwIpqQbr8tblgDkupptPSSepp1EfUIk95IM619emUTpzW+J+hude/MQ3kCg+HA
 3yXQuBUEDwkAc7M+xiKSzQ6eV9m9VE+WhiAmImR5xyYrk63QkNrzyzs
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
index fa2c294705105f5facbf7087a9d646f710c4a7fe..82e6225c8d491d44e30631cd5a442fb7c2de3f75 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
@@ -98,11 +98,14 @@ static unsigned long mpd4_lvds_pll_recalc_rate(struct clk_hw *hw,
 	return lvds_pll->pixclk;
 }
 
-static long mpd4_lvds_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-		unsigned long *parent_rate)
+static int mpd4_lvds_pll_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
-	const struct pll_rate *pll_rate = find_rate(rate);
-	return pll_rate->rate;
+	const struct pll_rate *pll_rate = find_rate(req->rate);
+
+	req->rate = pll_rate->rate;
+
+	return 0;
 }
 
 static int mpd4_lvds_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -118,7 +121,7 @@ static const struct clk_ops mpd4_lvds_pll_ops = {
 	.enable = mpd4_lvds_pll_enable,
 	.disable = mpd4_lvds_pll_disable,
 	.recalc_rate = mpd4_lvds_pll_recalc_rate,
-	.round_rate = mpd4_lvds_pll_round_rate,
+	.determine_rate = mpd4_lvds_pll_determine_rate,
 	.set_rate = mpd4_lvds_pll_set_rate,
 };
 

-- 
2.50.0

