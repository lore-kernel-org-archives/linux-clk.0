Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5003B2D8DDB
	for <linux-clk@vger.kernel.org>; Sun, 10 Aug 2025 22:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754866692; cv=none; b=KAHSA3V0w2RSl1ThovPJnBGpqNXfBtwJbwgnIwxzVVlLle+gWYT2tkoanmO2fBLXyW+srvOyAw88axO4LHELYw1Mri06f5s9sR3lhPoJp2NBxtW6TaF03oVHwt+b2afqElixR+nEoyNqp+cySbHb+RNIetWDDl/Ew4E3FC+ojxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754866692; c=relaxed/simple;
	bh=09r1lPX7B14MLSuVQJ4dsJkrsJaORU9d2LSd/fRzU/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oJxnj+WERI6LrBWx3f4vYHwubvegom5l7RebagQb+XoTsfuadxrPi5jiDe3+iYkbOUr/qNhMiozMmSxGCPAyspoPqnJ2u3TgJloDPyHVPMXzGA0UCDRStB7MbnW4p6VuL3Dd58WXiu3FcAaG4owJ222N5OE+eELi5g1v7XOWgA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YwnEkJ9l; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YwnEkJ9l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754866690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fp8kcGzYjp0wtOJJXm9d94iWK2Lu7bI5800+AHFvd0g=;
	b=YwnEkJ9lkwcJbBCkzspTgZ+zonft0gI9bKZdrQNBtzt7/FWpIpWKcIB8uoWSv0soo2qA6P
	na/H3mT49eMYDRNH3qtiZsEgL0OuUoT1pwsTInj1GRJbADg2+k04C29Ab0azscTmi1d+f3
	+kEExL+5XJrkH7/jDOOs+5NyEIdtxzQ=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-Lr8BTve2OLy84dEIuD18xw-1; Sun, 10 Aug 2025 18:58:09 -0400
X-MC-Unique: Lr8BTve2OLy84dEIuD18xw-1
X-Mimecast-MFC-AGG-ID: Lr8BTve2OLy84dEIuD18xw_1754866688
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e65340b626so965110785a.2
        for <linux-clk@vger.kernel.org>; Sun, 10 Aug 2025 15:58:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754866688; x=1755471488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fp8kcGzYjp0wtOJJXm9d94iWK2Lu7bI5800+AHFvd0g=;
        b=MSk6pN0yiOQYzr6MQEVk8lvnnpdYGbyQZzd1xBzePNNkNZ6N0x3mVeznTqcHGZcSbE
         VlHDBSPgDgFsV6Nq3s5TbDfz63bviQodto0kesYDE43mSOgVcC0q9q6xMTXKXY8uqoRn
         Kin/NBw4St1evyFW0QnXtyFx6TY7kaQypfYflzv/I+r+PiVpBLIpDrlRiJI+Cs5oVaGf
         fjlJp1qKCuLaJLf9DofbugGlXSTkrIiJ3pOcFhc0W3CtSo1aS/O8jInD4EIvOyO6DOsA
         cHOpvLiPmC7gZ6sNyqpM2P9djyNy1e2d3lKOTVOqTyp6hS0rWoLKvvzCX+Ape/hJuxyg
         EeRQ==
X-Gm-Message-State: AOJu0YyKx+Mh7Leaczhpc8DweW+oEXC2Y9QYY9vbkjZrIYE59Z1+dTDF
	e3Sm0pTq0FkRMCILY9YeUDV9nvDDOuwSgHvPbvstdhFrFbPRknwFn/qm838LBmWdDV6dobUEeeG
	im9FbzvyHQATf0TXv2r1tCkQGzYFiQYtZ1u0aq6FFKkU6C5n8wKWjB0R/dHGUnw==
X-Gm-Gg: ASbGncuHAepocCO3T8RBXRcbZNWOaleZb/pIghttPxkrJoJpKZwAHiTc97fqGWI+X9I
	qlXhtQCFuWpaVRF/lJQ6sfuYEUY0XEZAWl8MSLB4F8S3o/KY/ce7P69tRoPFU5ki9TOLLE6wSPL
	20WxsCXs6UROtNLtmyLipfnLedM1dZ4I3UUEOxnUlZjZSklyTfD4OGu6TOXEY8FzaEMyCrozwOJ
	x/ttFeu6vY5dcg6dOHrXnACzzE27mJTntgnnzi67zN3JvpCrT0jTJrKxngg2J5HuilNM+zlt9Fp
	/2p4p3Rv9U7UGYIxTh1QWDkzxS69idBb04Z4rAWPf1m7CqsnjCu4TbadTn/kbCf4ErD2+sTNd/E
	us+Uvww==
X-Received: by 2002:ad4:5ced:0:b0:702:d6e2:3894 with SMTP id 6a1803df08f44-7099a283fc6mr144910436d6.9.1754866688432;
        Sun, 10 Aug 2025 15:58:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+GPlWVCW9ekKhJg+4g3e28+6oQCiHZCjU/hLom4Wlvy0t+z7ug+DcZyM9qyvldH93bCaBnw==
X-Received: by 2002:ad4:5ced:0:b0:702:d6e2:3894 with SMTP id 6a1803df08f44-7099a283fc6mr144909686d6.9.1754866686533;
        Sun, 10 Aug 2025 15:58:06 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077cdd9916sm144266336d6.61.2025.08.10.15.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:58:05 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:57:30 -0400
Subject: [PATCH v2 6/7] drm/msm/hdmi_phy_8996: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250810-drm-msm-phy-clk-round-rate-v2-6-0fd1f7979c83@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754866653; l=1762;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=09r1lPX7B14MLSuVQJ4dsJkrsJaORU9d2LSd/fRzU/Y=;
 b=Ltcr7gblllRTjthopo3qUDdfH31xXqXg3Eunr1kVSjwIRzMGT80F8gmAILsYimdJaEURAIIXT
 DQUfMhrW4ldDGWChbsCXStaOBBf3jn9wUuWO/HCkvaN+TS3qKQngYao
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series. The change to use clamp_t() was
done manually.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
index 8c8d80b59573a37a4008752b16e094a218802508..36e928b0fd5a319b6a12b9be52705c067d51c20b 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
@@ -629,16 +629,12 @@ static int hdmi_8996_pll_prepare(struct clk_hw *hw)
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
+	req->rate = clamp_t(unsigned long, req->rate, HDMI_PCLK_MIN_FREQ, HDMI_PCLK_MAX_FREQ);
+
+	return 0;
 }
 
 static unsigned long hdmi_8996_pll_recalc_rate(struct clk_hw *hw,
@@ -684,7 +680,7 @@ static int hdmi_8996_pll_is_enabled(struct clk_hw *hw)
 
 static const struct clk_ops hdmi_8996_pll_ops = {
 	.set_rate = hdmi_8996_pll_set_clk_rate,
-	.round_rate = hdmi_8996_pll_round_rate,
+	.determine_rate = hdmi_8996_pll_determine_rate,
 	.recalc_rate = hdmi_8996_pll_recalc_rate,
 	.prepare = hdmi_8996_pll_prepare,
 	.unprepare = hdmi_8996_pll_unprepare,

-- 
2.50.1

