Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB442F271F
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 17:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169421; cv=none; b=fsbO3ZG+y9GCQ2FrKkqS9wLiC2HczDD7Nc9ver745RBpa9tsUkJDep+mduvBIbeRuaqNkB/X5cKrI1ZKTJfAbdojTzvkqlsuy32Xc2NMoP3E5N5Kpsg57oZJhCxJUlcaev0cfu1XlwgvlOHa9tT3q6oIz646a42+UXoaGlANm/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169421; c=relaxed/simple;
	bh=zHcO3z3+e99osmKzMokPyvWC6/DSceppfY/05RlRXYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oi2xzKfTSqDRP+sOXs2+FxUzF4B1AwQyb86S30FFTDFox1hxDn0ZVRyneAMLK2r8q5PWjpXQN+hKcTiEKfIFVQLLYhKqxI+9ktyxy5tFgeqnyMQPDfGLD0GYUWeWwEIWyxG4W/G2u8ckaAP5olO2pBJLPtkiB0xboAzXKUkogTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gIxkbYzh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gIxkbYzh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752169418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kaCFEBEkzEIEZX6+yQZzsmVx8NsnWbygGYV4RPX8K+w=;
	b=gIxkbYzhzJu9VXAhX0wu0qWinqNz/xR4w9iiOZTxiv+FyLatwWf3B6i73Rwg9HJFIsU6Fq
	XgljN4s7m+HJu5Kow/8aEnc2/vbjHtl+19UvZLc8tQCiPaobidwJYcfwVNuNY9M1W1CTq7
	NWrJnlIh52wp7Z0cEjnEhOI8kby0kq0=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-320-IPjJwMKPNv-_-FqznyR3cA-1; Thu, 10 Jul 2025 13:43:37 -0400
X-MC-Unique: IPjJwMKPNv-_-FqznyR3cA-1
X-Mimecast-MFC-AGG-ID: IPjJwMKPNv-_-FqznyR3cA_1752169416
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fd5e0bc378so24193866d6.1
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 10:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169416; x=1752774216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kaCFEBEkzEIEZX6+yQZzsmVx8NsnWbygGYV4RPX8K+w=;
        b=YI48wbXrtLIi4FCXmbEdz7vUa1yyRGlUmKMw2JEFSLtr7pnBmF/I+MBLUbO6+1fMRL
         wumA4HZKvDWA8uovRq9P3fSbgmAmmtaRmHtGwg7V6x4g9AwKCZRWNGSOFdBTvCiJ+MRQ
         RdHQLJc3fla9FtViH28MAGgAQd+It2UQ8xcVP04snFGmeL4ogAHrLLagrt2pcGdt57tu
         m2DRdbdjqCbbTRWaJ4csJKW0EHTNbwj3YbmMHJibOqznSiZknA8BvghRcs0uxVu5jtM8
         YGAXXYuc9Cw/Asqq1t77IJ+mbnKscTG5LRmGUBpGD+VJgR8qvsUy35HL8v2PbQkBqU9F
         DnJg==
X-Forwarded-Encrypted: i=1; AJvYcCUtxwGCFk3mzi20mskMYckEFvt9sh1tT3I3hbbJuqqTAo6Kck++FLZbT0cHrA2oMvw+2cVRRE1u8Mk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxOjaepLGZJN4Dt4te8telP1uK8Pm83wfNjkpE7O8LmJSEFc0Z
	NAwEoim8ehTb3rTPVzcWvQossSqfZQUa2xYzF8EkSfp2mUb0RR73lkAerKcIxsaFT4vpGu0hp7v
	gnG4caoDX6ORgelDz+7mjlGXqF0Tp2bwCiYML1aP68kuvaWhVJVY3p73cULQHdw==
X-Gm-Gg: ASbGnctD+o8vmec1WHjyYLSqxnvd4EeG5WFjGmT80+q/S5CvgrX9DIQMYjEjvle2IYs
	5mrj1ZLGddYu1PYxRWMmMr3Sfs20cYxL8mNRo0WnmQ3wt0TX+PSAHr1++gjYeXL0P9HiyhpwO89
	PCqbWKYcJdQsIisintTTQNJvIo27nl62++bwZEWUSUjXVDax4Wy2B6WU9JICXNyohGC4gSpxfpu
	OoZ1O9e/1waugBSXBgc+qvSMwPOMh9h6RUx77MwBwcsQL6/I8kAil7mht1NVbDRTcr8hBRXxUQH
	MntkviiaEUN4sn7TFUGdNsC98y/E564KXy/zU7YsP3UsjOFB272cA4Wd3a5j
X-Received: by 2002:ad4:5f89:0:b0:704:7f0e:ca9d with SMTP id 6a1803df08f44-704a3885c2emr3440086d6.24.1752169416331;
        Thu, 10 Jul 2025 10:43:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSS2Rzm0JfKmIyrTldYCoa+GfaWxjePB16xygyyHje51M4cEE7holVyPZ8C5FzqtnGtvcUbQ==
X-Received: by 2002:ad4:5f89:0:b0:704:7f0e:ca9d with SMTP id 6a1803df08f44-704a3885c2emr3439666d6.24.1752169415753;
        Thu, 10 Jul 2025 10:43:35 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:43:34 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:43:07 -0400
Subject: [PATCH 6/9] drm/stm/dw_mipi_dsi-stm: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-drm-clk-round-rate-v1-6-601b9ea384c3@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=2405;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=zHcO3z3+e99osmKzMokPyvWC6/DSceppfY/05RlRXYo=;
 b=QXQyVz/ESQN/1lpuOY+kiAZj2ii+/13EpYKJAuvi9VgjSVMZZp3cWkyo089YF/6/d4LrccG+3
 IcOoOTC43L3AvbwBhN/wVyDOB1m1IcbEamuqRU2PQsvtkEzD5/kz2nO
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
index 2c7bc064bc66c6a58903a207cbe8091a14231c2b..58eae6804cc82d174323744206be7046568b905c 100644
--- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
+++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
@@ -274,8 +274,8 @@ static unsigned long dw_mipi_dsi_clk_recalc_rate(struct clk_hw *hw,
 	return (unsigned long)pll_out_khz * 1000;
 }
 
-static long dw_mipi_dsi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-				       unsigned long *parent_rate)
+static int dw_mipi_dsi_clk_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
 	struct dw_mipi_dsi_stm *dsi = clk_to_dw_mipi_dsi_stm(hw);
 	unsigned int idf, ndiv, odf, pll_in_khz, pll_out_khz;
@@ -283,14 +283,14 @@ static long dw_mipi_dsi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 
 	DRM_DEBUG_DRIVER("\n");
 
-	pll_in_khz = (unsigned int)(*parent_rate / 1000);
+	pll_in_khz = (unsigned int)(req->best_parent_rate / 1000);
 
 	/* Compute best pll parameters */
 	idf = 0;
 	ndiv = 0;
 	odf = 0;
 
-	ret = dsi_pll_get_params(dsi, pll_in_khz, rate / 1000,
+	ret = dsi_pll_get_params(dsi, pll_in_khz, req->rate / 1000,
 				 &idf, &ndiv, &odf);
 	if (ret)
 		DRM_WARN("Warning dsi_pll_get_params(): bad params\n");
@@ -298,7 +298,9 @@ static long dw_mipi_dsi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	/* Get the adjusted pll out value */
 	pll_out_khz = dsi_pll_get_clkout_khz(pll_in_khz, idf, ndiv, odf);
 
-	return pll_out_khz * 1000;
+	req->rate = pll_out_khz * 1000;
+
+	return 0;
 }
 
 static int dw_mipi_dsi_clk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -351,7 +353,7 @@ static const struct clk_ops dw_mipi_dsi_stm_clk_ops = {
 	.disable = dw_mipi_dsi_clk_disable,
 	.is_enabled = dw_mipi_dsi_clk_is_enabled,
 	.recalc_rate = dw_mipi_dsi_clk_recalc_rate,
-	.round_rate = dw_mipi_dsi_clk_round_rate,
+	.determine_rate = dw_mipi_dsi_clk_determine_rate,
 	.set_rate = dw_mipi_dsi_clk_set_rate,
 };
 

-- 
2.50.0

