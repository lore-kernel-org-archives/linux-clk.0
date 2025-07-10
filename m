Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8945C2F2C4B
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 17:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169427; cv=none; b=dTOIaWmJIzojpYW8Sgc7D1OCpCBZn7Vf2DbwOAMgyl/GI/xnXuySEjaxoWQ0oAwr1mp+24uO6drwX3jgpMeMiJUSKJ+yovzFWueh2xDLMJxrQyICAv9/xj9UdjDXOvcDfWqw196zk0ecC32/8w7J7afp54i88oRvd2sx/JwKj4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169427; c=relaxed/simple;
	bh=OHsRnwsdtf93oenlkpM8OGpjPNCqkqTYz1ncE/Hukgk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qxbuigtcmmaCzaZd2QPYG3lWV3MQHQa6A1QD367StbmqxoONt+D+lrA0cOmZUXp7gpd5GVB8/9Fwa2hEELOlCGtEyWh9tGKy8624jTXhcqLrY5ViJC75sJtbuOzwE5gKUl+1ZrImfIDT2oqSOoeejWCqXeXBbyyZsyQkTqO8JVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FNh7qlXD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FNh7qlXD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752169424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=exSjMafszsHf+hPI+jA3EKbDPNjmXxeN/VchItvqKMU=;
	b=FNh7qlXD6m2QLcZ3QRT4K5kIxg92JTM+rUjeJk25DvzaNoB/evf4izVsHdYE8cqlmUJqOq
	yiRnOq67x67x4T2EwgevrqcJJHL56py6c0HPE9dmZBN21DAgRpOBHaW2qTO/4ta4i+gN4K
	dlNe6TpPpmEbjjMS2z/n9CJsbSfV2lU=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-602-DD-X_FtmOrOYPNzx7b8mQg-1; Thu, 10 Jul 2025 13:43:43 -0400
X-MC-Unique: DD-X_FtmOrOYPNzx7b8mQg-1
X-Mimecast-MFC-AGG-ID: DD-X_FtmOrOYPNzx7b8mQg_1752169423
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a9764b4dc9so22515961cf.2
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 10:43:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169423; x=1752774223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=exSjMafszsHf+hPI+jA3EKbDPNjmXxeN/VchItvqKMU=;
        b=JCUOmBXt7vReDxdwsfErMV6bl3v6vOmcgPH+pX51phNlfbKsaGlb3xUqk5y68TF7Hh
         1EzB3X6lk2zgdJEKuGfsbOsy3w/1lt10KTYGk1S+QOPjyUIcAxad8EvA1bwzGcN20BSq
         nDFQ8jEbwnmZKV07nlRITcbp4DWjZl6oFkC3DJwBcKDEm9h61qRLnwzYEa4caPXiMEMS
         zZDewlohNmqlfY+nUz5bpN6Mkh8puMXULwMn+OxezXUgp00ICd1S7TTkPlcB3fgd2kzB
         WjuKZYU7L9tmpEn+FJfZmQ9W7OW8XmtMC+2hPKxuuxOpYja6lzhkfioJ7xzm3LGq5mOu
         aSjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUr58nWiUlN36MqGSnKJK5uKRZDXJEGLn2BbmN5O8T9i84kHS25wtDO/JqEnZRWFOWJn04rvC1QJDw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxhyca7OMF+nWSUnqu+Osy5sRGsh1aDa+Net1tIChFQ71cTVjQ
	evK9ESgHU0h7HHyWA954KvwlW/TzpEoq93+Mq3Ah+deLA7xnRvOV7e1ro8NtuH+DZQkVJgxMPlp
	RNAZS2avb6nVY7hIXsn24WVO99eQiB1FlGPWEWIhBHQLIm1+rLdmM9ITPylYvMA==
X-Gm-Gg: ASbGncvZ51T+8eC8xHMY2L4EdVB+j6wjmhb2C2U6VHxib1mfepP7punLow09sb9NxYo
	mzk/7xvADXyEN6FbR1hDTbGksynH8jx3H6OAiMQqVnXsLep9RSuh9HQjITlk7n5NYoOzLtq4GBb
	JOtk0PQFAQaYDBHxhm76uN03UDyOEc36LNpx0EvVuYo2z1s6l67pGaKbHzjogitvAJBVifjNhPe
	AZiPf9fXJRXd3BPXnFW8WOvSvDqZVFhqvJrwohqcPptXqX4awWzE+kk8nBk30youupamDcgYJe6
	HQkhkA67A26qKKSpJViClHcTDMKt8+q0uc4oEsFmk6vLaeuQFVGk/yYofZei
X-Received: by 2002:ad4:4eab:0:b0:702:d7e1:9a61 with SMTP id 6a1803df08f44-704a4325359mr1692716d6.32.1752169422752;
        Thu, 10 Jul 2025 10:43:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE946PzHD0RXk4GY5dDiYIFHgj5udxSitTpswAFFe0EalaGRnpP5sdgmvG0/oOdFa+px1bfeQ==
X-Received: by 2002:ad4:4eab:0:b0:702:d7e1:9a61 with SMTP id 6a1803df08f44-704a4325359mr1692226d6.32.1752169422349;
        Thu, 10 Jul 2025 10:43:42 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:43:41 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:43:09 -0400
Subject: [PATCH 8/9] drm/sun4i/sun4i_hdmi_ddc_clk: convert from
 round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-drm-clk-round-rate-v1-8-601b9ea384c3@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=1647;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=OHsRnwsdtf93oenlkpM8OGpjPNCqkqTYz1ncE/Hukgk=;
 b=ho7GtAWEeFJp5Ux6aTEtHmHkJKzsUOAKpGEfNDI+F7l5XbF1qK2v1eRvTIse1y82RTcxYpTS9
 vSPNZAJFAqpDDKhg/zIW7SbizIxqSMy8J+QnCYzoa0xmplhJw/HPvrO
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

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
2.50.0

