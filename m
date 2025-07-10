Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6D92F236A
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 16:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752164890; cv=none; b=icfU3/tC9tewiTLQJtRfajkhMq3dz03Gwko34MemNf7eyoW3K+p1SZS8Ij17lCgLQxFWPMtfoW3d2vFMn/WZbkmRn5zvJPWQAeRQQb5i1eym9wA1C62wpZrygUIlhFgIHXmLwrhQijwyKQNBIZV7mUunDfrP0NExZd6HqeoLrek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752164890; c=relaxed/simple;
	bh=BdI4rced+HRKEB2cmVryNQG/zmpG45m97LWG2DtYv+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rCsTCZ5II51nQE+TU/ToOXo4yQ87+1m0EdjqHDUnUzyd/ub2kzKxsCHY7dSwm3L+2NL6ik/3AJuk9QEhE1LwpA9msXDw0aOD4h/mxnFoAbdkLc2N9wKr0RhH32AtPNY5GODwfbXuiD81uVLB3U3x73KIALwk+9BIdUmeMxluu/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BhDKX7de; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BhDKX7de"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752164888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Xtq1jz6n71Dy+bt87oxFW7ajsd8mfrICRfv5Quboec=;
	b=BhDKX7debLqVpjxzuxVkM1qotKIRsZAow12g1BAXnAJKeQF27jjuOMLk57dIAOuanEkltY
	dOXNBA3zI1qFMPJsDoD9/9vfHljRZWjwY4IvbGvoSufpeapF+SONuQhNOM5XC1Mdp2NAs2
	U+wyuuYR4X88OGOCsnnD7RuA3VRsq/s=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-69DaLbsaMsKfFmPZTwNVpw-1; Thu, 10 Jul 2025 12:28:05 -0400
X-MC-Unique: 69DaLbsaMsKfFmPZTwNVpw-1
X-Mimecast-MFC-AGG-ID: 69DaLbsaMsKfFmPZTwNVpw_1752164885
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d399065d55so146061285a.1
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 09:28:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752164884; x=1752769684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Xtq1jz6n71Dy+bt87oxFW7ajsd8mfrICRfv5Quboec=;
        b=LCgihvrbHh/wAymWEyVQfDAx+xGzUoW9fchIcmO/hQCMVRVDr2PL3RRIYZPI/ndxg0
         XiWW0tCgpqsHjq1bNy7MC6JHJm2mYOFQlCebCFKyL2v2mzzhEAS5W5yOAL4la8Jm9Hu4
         /2ycVUdNx/ja1FIS2uA82s8VqHdZ5WrZOVz0j8Y1P6fl9h5ecJC2oqdhGfCp5sFEmxSn
         DWc9TTN8uwP3/EE9eSbq2etUbKaqICE4nMZPQIxl7SqAkfqLaIbrNBVn4iNaPISaMaRO
         V75ZKWnzkSGfxvkIEuMtgUHZh4HzQodnER+zA6NcVpEIf+o0h4PE77gdhMVL4rg8Im9N
         HoNg==
X-Gm-Message-State: AOJu0YyCKeg2n0Wv+wWpaFXtLOmgOAUAbGLfziNZv3JdfpJ6Wf1mYcPx
	PJYhSHb3wxBUqdG386il/7DkPH4QBA+07NT80tko84mV66kAcca4fAAzof09SbAiCSxORn7dvRG
	s1q0eu67xhIhAk+/ifhNg+cQCJ17FyuK32sHrpsXuyRvLYJPPwNx2nzWlS+Cn7A==
X-Gm-Gg: ASbGncvY5ULQo6FHJr3kqRi/2fYXAM2V3kTCZmfYTpvZ52D43YISp4+VRZo2/hhlqYZ
	Q9kdpONKwV/tgmVQxCafOJfT3R37FicisYMOfp60Tn1BZbidO6FEmtb/3qu7ZFuwCUOCN8EVEwT
	jOpD5Hi5ojCsZLb3Y/+QeSXN/Jip1axTZ1Vc70VZBvjI1cJaUSYB3jnl+A7f6Z2dvm79rfRLOXq
	wZ4neJv73r3y+AV6KqdfEzTbKVC8sgWi6zNj75cetA5dl3k5qaRl7Yi2I79KiYlMnGbQrGzHXHm
	7EezvwQouEFnV8z04Fkp8HymPGCPlI/jBAVC4Qf/SMaxAYhIila7KcUpXOoY
X-Received: by 2002:a05:620a:44cb:b0:7d0:97b1:bfa with SMTP id af79cd13be357-7dde99531bcmr30407585a.8.1752164884667;
        Thu, 10 Jul 2025 09:28:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELaboKc3+hjD+wF+4ZlA27Ur9xvHDNgGpesankgXOM9I1Jmb0Ok1BCSCTBE3suBwc7QsxRkg==
X-Received: by 2002:a05:620a:44cb:b0:7d0:97b1:bfa with SMTP id af79cd13be357-7dde99531bcmr30403485a.8.1752164884325;
        Thu, 10 Jul 2025 09:28:04 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcdc5df99asm113487685a.49.2025.07.10.09.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:28:02 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:27:33 -0400
Subject: [PATCH 7/7] drm/msm/hdmi_phy_8998: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-drm-msm-phy-clk-round-rate-v1-7-364b1d9ee3f8@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752164864; l=1782;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=BdI4rced+HRKEB2cmVryNQG/zmpG45m97LWG2DtYv+I=;
 b=TGLhjj+IbzrNkeyKAWH/BPgTzIXuHRUMwL4erGFA0ZAfeBxyeP21kE2dmaW8XV4SrlkFC/vcy
 qZPJbO/GVg3D/lDY67azp4PfWKp8qH7F1AEDRFbNeKNdzHsxXleu+Nf
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
index 33bb48ae58a2da13b7e90ff419c6e05fec1466af..7d6381553eb8cb5b18b898a734d928d34f98ebb0 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
@@ -646,16 +646,15 @@ static int hdmi_8998_pll_prepare(struct clk_hw *hw)
 	return 0;
 }
 
-static long hdmi_8998_pll_round_rate(struct clk_hw *hw,
-				     unsigned long rate,
-				     unsigned long *parent_rate)
+static int hdmi_8998_pll_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
-	if (rate < HDMI_PCLK_MIN_FREQ)
-		return HDMI_PCLK_MIN_FREQ;
-	else if (rate > HDMI_PCLK_MAX_FREQ)
-		return HDMI_PCLK_MAX_FREQ;
-	else
-		return rate;
+	if (req->rate < HDMI_PCLK_MIN_FREQ)
+		req->rate = HDMI_PCLK_MIN_FREQ;
+	else if (req->rate > HDMI_PCLK_MAX_FREQ)
+		req->rate = HDMI_PCLK_MAX_FREQ;
+
+	return 0;
 }
 
 static unsigned long hdmi_8998_pll_recalc_rate(struct clk_hw *hw,
@@ -688,7 +687,7 @@ static int hdmi_8998_pll_is_enabled(struct clk_hw *hw)
 
 static const struct clk_ops hdmi_8998_pll_ops = {
 	.set_rate = hdmi_8998_pll_set_clk_rate,
-	.round_rate = hdmi_8998_pll_round_rate,
+	.determine_rate = hdmi_8998_pll_determine_rate,
 	.recalc_rate = hdmi_8998_pll_recalc_rate,
 	.prepare = hdmi_8998_pll_prepare,
 	.unprepare = hdmi_8998_pll_unprepare,

-- 
2.50.0

