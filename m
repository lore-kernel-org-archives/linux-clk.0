Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21B528C870
	for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 10:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754909816; cv=none; b=K7Qp5YSHcWhjTUcSgsycRSJQ+W/n9l0+IJ+sZkYIdw0jvvFYllM18q/1dHrNMzJqgQEvJjgOluPwxXDe+vVWVKfba6E78yVe14bPJXDXfqsvHQNXjt1ZKko/fJuld3gIT+HDA7ZOy+q17u0IbZYjnczepNF88uGGGhPjU1U2QeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754909816; c=relaxed/simple;
	bh=4SmOn45QQwwyMezbBb5tx+ffOCKNsfDDe6H8Sa9QRwg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B0MKtW4zRaL5NM4ebh61OblM3aKedoNp6Lg6YWZ1/K87sETFyNscvdR2LNepxXWHmjcXvD+0OSj5U+bo8EdlIuxlgy08msWu/xHKfTsh9Hv0K5N5m4GEpgEjQcquS13YLtEjgkRmHnSO+RCcK5/RLqvtsnFh7X6XAPbgHNZS1yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DdgK5j86; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DdgK5j86"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754909813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t+Rztee25JuVOb3qnfGrbYzil++DqREMLNxo1mFDVeU=;
	b=DdgK5j86P6d00GitbptmK7sdrzwJWhHk495pOfAXuttPUG/Uu0Fe9b3Al5GIhEoaCoxEIM
	EHmK91B6O8ufFJtJY7zqfIAAGhiNDeV/LGhzU9srcNY0PrdG5iV/fioHD2f0nAHDWRqq4M
	wJVjksnkloQJx4MXmn/i6tj4crIyWDk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-8El9pk2NNOKYD0x7pWQ0kA-1; Mon, 11 Aug 2025 06:56:52 -0400
X-MC-Unique: 8El9pk2NNOKYD0x7pWQ0kA-1
X-Mimecast-MFC-AGG-ID: 8El9pk2NNOKYD0x7pWQ0kA_1754909812
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e69b0ec62cso874231485a.3
        for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 03:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754909812; x=1755514612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t+Rztee25JuVOb3qnfGrbYzil++DqREMLNxo1mFDVeU=;
        b=XYzYo+++PJdl+yos7tpnrfvHbUq4pa1HigHR1bRZdq/1onCzPQCf9FmosbO+wJ3Hp3
         eGESQjT5LfwmVC1C2r8Kwq/c1hogYM52Q39++t7Wzsp5K4WWi6LPS1nieNR7Uts/cw7Y
         ZirgrzTkl09gpOOYvM59E0RczS2s3kxBWswjrqI3kPc2evfrryHlnw2frXrSetAtYOuq
         uHx55BKVec707yJ13x7fZVsdqYuP9xUvJQuzrStShYdNw4cieuz4YEekWvVnbemK9oqb
         GaFAqcIG/RMucyQUENc5f6xtByp2r4WkaSPXqh6/wXQPGiqtoDT0TWXb/lpZ5Sx4LZs4
         dWjw==
X-Gm-Message-State: AOJu0YwndZww70udSmgRn72pNisu44+7wfE9Vb/9QaIbMSzs109GWq01
	7ZtmDcWyYB1YioBNCkiJwNcqm9Hg5KJCujgdh8SW1OJbi9E2PjL7QQrpNwqm88Ghp8h4x3/f/2V
	RyqHcearVCy9W21ny2BPyQOsPZblNXS81j27ElMfLCFUVFGBMxXs4BBBDdMzzQA==
X-Gm-Gg: ASbGncu8Ynrl9ZuHiNO4SXs4axXVNvqbbUfIOuxtX+odnEjrZ4FU/ohVGE98gX0VLyh
	FLUay/F47daxpmVDsEd8Hp+n0dHsdvwnzAmMCA4ysIt5/dFTLEL6DhyuI770ISb2ZzIrEruDp8j
	/s84PFb3Q9827vcZSvPWk667LAwmMg4SuQlGc1PWxw7OO+8k/+8A7sOSm384sepWzeO7tB7N5vL
	smcmbehYyJ/F/CieTJAj9gG8NON7AY2dBLfFTNZ/oijmE+GmY5l947hf7rw/w50j94+MUHX9jqx
	SED0RG+3IHYD1hiIOEMGTrnFR5JCUsR7rVdv6lbj89ubxjgtgBaB5L/V5dcaytgOER+Tl/TPeD8
	kvoE=
X-Received: by 2002:a05:620a:c50:b0:7e8:1b64:2187 with SMTP id af79cd13be357-7e82c75f958mr1792738785a.33.1754909811716;
        Mon, 11 Aug 2025 03:56:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEK2Etk94d7jqWBuBTsPUBpC0ORVIn7oE21Xh8O9EOQgSk7vq5RIMLYWuxIl1Nwz+nt1Y38MA==
X-Received: by 2002:a05:620a:c50:b0:7e8:1b64:2187 with SMTP id af79cd13be357-7e82c75f958mr1792735585a.33.1754909811152;
        Mon, 11 Aug 2025 03:56:51 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e698de2df7sm1273446485a.80.2025.08.11.03.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:56:50 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 06:56:12 -0400
Subject: [PATCH v2 8/9] drm/sun4i/sun4i_hdmi_ddc_clk: convert from
 round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-drm-clk-round-rate-v2-8-4a91ccf239cf@redhat.com>
References: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
In-Reply-To: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
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
Cc: linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-sunxi@lists.linux.dev, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754909781; l=1693;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=4SmOn45QQwwyMezbBb5tx+ffOCKNsfDDe6H8Sa9QRwg=;
 b=D6lQv4uU9BbCtmlsDXvXPLa8dR0h0DlOWWckbVaEkFndxlEt+IyMNkfDuSVR8NgDYOThGx2MA
 72BwKh/6cLNDsrNiAlNie395a35C4+/kjwVpt/wftlDiaqzAFDkxkOV
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
index 12430b9d4e930f7e7b0536a5cabdf788ba182176..b1beadb9bb59f8fffd23fd5f1a175d7385cd5e06 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
@@ -59,13 +59,15 @@ static unsigned long sun4i_ddc_calc_divider(unsigned long rate,
 	return best_rate;
 }
 
-static long sun4i_ddc_round_rate(struct clk_hw *hw, unsigned long rate,
-				 unsigned long *prate)
+static int sun4i_ddc_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
 {
 	struct sun4i_ddc *ddc = hw_to_ddc(hw);
 
-	return sun4i_ddc_calc_divider(rate, *prate, ddc->pre_div,
-				      ddc->m_offset, NULL, NULL);
+	req->rate = sun4i_ddc_calc_divider(req->rate, req->best_parent_rate,
+					   ddc->pre_div, ddc->m_offset, NULL, NULL);
+
+	return 0;
 }
 
 static unsigned long sun4i_ddc_recalc_rate(struct clk_hw *hw,
@@ -101,7 +103,7 @@ static int sun4i_ddc_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops sun4i_ddc_ops = {
 	.recalc_rate	= sun4i_ddc_recalc_rate,
-	.round_rate	= sun4i_ddc_round_rate,
+	.determine_rate = sun4i_ddc_determine_rate,
 	.set_rate	= sun4i_ddc_set_rate,
 };
 

-- 
2.50.1

