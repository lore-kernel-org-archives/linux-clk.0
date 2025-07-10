Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B5C2F1FD5
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 16:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752164887; cv=none; b=McJr1ERPzSUtkRIh/if0Ld8rEIABRuO76KH/TUC8E43VYq4B4bfGb0DG9PVj1FeivUPNgccCBdb91KLmOdpEBZjOaE3Txu+JDo+mqxkGKFqV2xqyFH3XkyqgYOkTuMTayrCe/RKNUaZe6eGfg0yrZ8/jfRb8S/a6FX5e0gQ/vqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752164887; c=relaxed/simple;
	bh=9JfaJTYaWcQgtLDo8JR9Ya1ZG9LJ7XkHyQnaRl1pFYQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aD/5CIR/aW4KpFOdbpQfn4G62RLRipjjhV1dd8rekjR61bQxDs9oic7w5H0LBHfxYqFRCs6BhWIWkxgdNVXIZ2uKeNjEs6+na7/JTkGqqZl5JUKQmgHPJvzWpV6kmCSpvKoyVvEvNso8BIL7TibK81CwVPvxvRRykbR18Hz/IqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iIs5qaCq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iIs5qaCq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752164884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6pZ2fEmImzdGenxLPe18zM0sHzB+F4RfmFNy4FQZ+Zs=;
	b=iIs5qaCqvdI8hDGch88/Z6ur4Nru5dQpUgs96RLhzaEZnwaBdP8lFik7nq63SME6VEoAdj
	udjMvWl7RB4Ei1/388dEFE6GrPks6bTDhLB7pytVMUy4Csi0EAHeJ4MVWaEZFP+o58qXLo
	eTX3BRo8Kvi5/EKi8Cj6E7qLtr9kvN0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-396-lE8nkvkgPYCnYp_BFC3Q3g-1; Thu, 10 Jul 2025 12:28:04 -0400
X-MC-Unique: lE8nkvkgPYCnYp_BFC3Q3g-1
X-Mimecast-MFC-AGG-ID: lE8nkvkgPYCnYp_BFC3Q3g_1752164883
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d38fe2eff2so165190585a.2
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 09:28:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752164883; x=1752769683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6pZ2fEmImzdGenxLPe18zM0sHzB+F4RfmFNy4FQZ+Zs=;
        b=s2cblwQ9QAoelEIs/MmgFnWmor9YKhyl87pU8+eoLB1888hzIWwqXexMzzFcG5sCV7
         JdHPyamyp9HY8NfkGRPbHR0X7VYFAee4zKqcPp0sA3GOopYAKhIpDUAxZuiUfjhwwgtY
         JzmI99lFZpwFEP9uObC8nfRm6QV8WY9uRkyq5ms/QwnDRyKRQEEBxNaIygYR8QTZb200
         Hsxsx5btAeaS4OM2tuTtIij8Q+J19Dx60r6xPUKOC3rbfczMpK1Q4xwiYdBxWlvtbDdZ
         J9zgczsVS6I9CaLQKoiHoZ67TmlFnoqh0lGWIIAozJO1x66A7EFTT77EQq0xH3bQ00UT
         xKCw==
X-Gm-Message-State: AOJu0YzAK/GqoWyUOrqVwNTFgRjPZGaeRDDOrFtD0ceAxNuvsvHY8WMZ
	Yn5hsx7DEclcCAYYNO9lG8oANEb5gLOIqiksKARcDK406eyc+HIRQhUWRAK6ThJIZ9ZigYl01yy
	KaRKEPaKz8yZW1rlAHI/olDWhNgMQ7qR2Z+iXW6UtAVh2cDaJ1G4ALfbxshuU/Q==
X-Gm-Gg: ASbGnct2uHfSMZUibogPbsW137wn4n9nvfVt55PYI8VFUu9Dym22cKNC5Rv/IASHHZv
	LEZP6SK/7Nfxi1wL3zA45OfaR3MorcsbwF/+fRAEGWlBlfORjKckva8vagLvWNqb/umUk1PeY1d
	yujH829lk83bjJDRzZe3D1lOeGZz2tNB2AXnTOk5zWXZpwMy60rZf/W2sIQJdEheGKNNlURxL79
	cXsz8UrQliuAarlO8ayy2AXj56oMnoTMlI1h5GkwfVzwkdfLvlRp9UdBg0t6V3nv/qBWO0dOTFh
	3wHHWmPzEcbEyOEy8TA1b/IHdBhtHkwSfwCqAGnp/gM75QPBj4N+7mrUiL+i
X-Received: by 2002:a05:620a:1726:b0:7d3:a6bd:93fc with SMTP id af79cd13be357-7ddebc935b0mr21979185a.28.1752164882015;
        Thu, 10 Jul 2025 09:28:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8nqAlSCWoWvORjsOIeWDgtSIE42hyDBJ1u6hirl8cdDrojUMZfEO6FEu3YLQazTijxe6XZw==
X-Received: by 2002:a05:620a:1726:b0:7d3:a6bd:93fc with SMTP id af79cd13be357-7ddebc935b0mr21974285a.28.1752164881473;
        Thu, 10 Jul 2025 09:28:01 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcdc5df99asm113487685a.49.2025.07.10.09.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:28:00 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:27:32 -0400
Subject: [PATCH 6/7] drm/msm/hdmi_phy_8996: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-drm-msm-phy-clk-round-rate-v1-6-364b1d9ee3f8@redhat.com>
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
 bh=9JfaJTYaWcQgtLDo8JR9Ya1ZG9LJ7XkHyQnaRl1pFYQ=;
 b=VQSi2rvdK2y8CpHnP8Kq87P2EN9sLMIAXn3sz8naTxS61uqPmjG5VbCcKXFPae1OucSiF/EyS
 rtenvdJm/WaADJl4nH/jtBQrvVWU5LOG7EEpXIABxQ7+T5Ia3BPM/cU
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
index 8c8d80b59573a37a4008752b16e094a218802508..dd59b2ed7fa3f53b6a70d20925e4f9cbd5d0573c 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
@@ -629,16 +629,15 @@ static int hdmi_8996_pll_prepare(struct clk_hw *hw)
 	return 0;
 }
 
-static long hdmi_8996_pll_round_rate(struct clk_hw *hw,
-				     unsigned long rate,
-				     unsigned long *parent_rate)
+static int hdmi_8996_pll_determine_rate(struct clk_hw *hw,
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
 
 static unsigned long hdmi_8996_pll_recalc_rate(struct clk_hw *hw,
@@ -684,7 +683,7 @@ static int hdmi_8996_pll_is_enabled(struct clk_hw *hw)
 
 static const struct clk_ops hdmi_8996_pll_ops = {
 	.set_rate = hdmi_8996_pll_set_clk_rate,
-	.round_rate = hdmi_8996_pll_round_rate,
+	.determine_rate = hdmi_8996_pll_determine_rate,
 	.recalc_rate = hdmi_8996_pll_recalc_rate,
 	.prepare = hdmi_8996_pll_prepare,
 	.unprepare = hdmi_8996_pll_unprepare,

-- 
2.50.0

