Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3632D8DC8
	for <linux-clk@vger.kernel.org>; Sun, 10 Aug 2025 22:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754866694; cv=none; b=SKWp+LDgooxlfEn1OP11tZ9XfrQoNnwDgB/ePJYFTLPj9bK6XjbpOsXMHwvqq2nGQTSHNIzyi3K1QW0m/f6z+y+xFy8xaKEtB7unNaeauBvNLMXn7dyi+1/Xz5OGwxAGBIpwRiHyom4JdjVIaSOeo0UN4V0NPR0FhSKXzYZOXyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754866694; c=relaxed/simple;
	bh=b3lpeRdsfILZNbKt0s4jDvsKWYmd9ZM6thqzD9ovEpA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MPYkeRUw/bzXjdZesbnR+1x7sT7dae3XhLwW2RwshDEo77KogEHHWcQln68eGBqoMjp/iSkL/Z902NymEmgKnuJ7xMfZ4AjSI5Fw1HZK2/pMM2ZC+j8HVVWZAuYZkBXmRtqjGn+SKXyq+0ru46dFdILm2jb1mEVqoL/9fcolW1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D2kM4GYt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D2kM4GYt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754866692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FbrTb5TIWzNpxLExdP2beMCh0zMQGTK+0dHd5wdG15k=;
	b=D2kM4GYtpy3MRtgGqEIc73oaruJOEH5xA+MD5zSi2oR3aKMcCc9+MdOSLk12qiBL8v5MuB
	NeMIMe4KNmxCPrAGR3TjljxLmpM5GmAmMhj8DTCFuc+TMxy2IUgeTpRCyYzUvKVyx8vBG4
	HNclJAcJUJtyp7KcEl/1RqDeocrY4+s=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-xK4ekBhYOmCMecf-awf0hg-1; Sun, 10 Aug 2025 18:58:11 -0400
X-MC-Unique: xK4ekBhYOmCMecf-awf0hg-1
X-Mimecast-MFC-AGG-ID: xK4ekBhYOmCMecf-awf0hg_1754866690
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-7073f12d826so108756526d6.0
        for <linux-clk@vger.kernel.org>; Sun, 10 Aug 2025 15:58:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754866690; x=1755471490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FbrTb5TIWzNpxLExdP2beMCh0zMQGTK+0dHd5wdG15k=;
        b=QtOKbMqh37CJMVGHuqYW5WtArkRRus54KCuMkweMcClKTKDmD4tzbNqgVLwbW/pKFT
         et0opR4SKqSUHvkdcVHGxOqwzXKtsmIC1AbEwwqik2hvZ4SBXDGJl/fRUbk5fO2jAOwZ
         CV+9ljaUxbr//LGS+RDEIKwyUF8shvsEpI0zITsZ4Pc6IG99AJ6drEUEvEIikhXtYYJB
         H331CKJHi4Iewdr/e701vp1nLdHll1bWX+gvpvHVPu4xczOsPTkBp0ox6rUJRxjzjys2
         x88v0ukaRXPUOSxaP4l+YAb0AtFT+EsOzwC4kRdo36sOXO/WEcI5wjL0FI53vaRGxFVT
         uLag==
X-Gm-Message-State: AOJu0YzdMG05E/X1ivSWAEoWehu7SbGJJJzL2ltewL3S9Ui+zXI5Ivbr
	vI3vbGxDotsKi8YKoViJg1DU5ogDK7gxM7RSQ+atW++BNckjZynpeRehd6O/L0ew+LASp8h49rl
	ywUm2ra3OJ8F5QMlsjLmtXp4yp4+J7idh3zDimgDpdAhLgKUa5yT3VMDfpPFuHw==
X-Gm-Gg: ASbGncv7w3F1iW3tR2kMP4duebRHtE13MCqRfQPdtgMSRAzpKB5hxYEE7Y8FvozcDp9
	L1qF2vNNuFMcg2gub8EP2AFsB/Bg32aQ9BrJK9QxBKNpsSwl02JfCwO9Lav1zQbIwA+om9/z5Bt
	YxwXd+Nlr0Tx0mCSKxSOmCZhnAR0SchyYmHp+JllzzXWsw8znU4dxZ5r/XomTo2scp/Ukr2QcDC
	MC91v6YZjxyDy1vxh8kGeFGBtwz1BQDtXxGQuorFvq/oGYDVTqZkj9IjXstgsJpfxNBvpzGJPs4
	nEdhya8jFU87B934hvqSL/rEnaGdxnuLSsuME6KyZftYaXyVhB1L0KRnIY3xvAGJEFkTRyvA+w8
	QrwBPCQ==
X-Received: by 2002:a05:6214:2469:b0:707:48b6:bcd4 with SMTP id 6a1803df08f44-7099a51356fmr150862586d6.48.1754866690662;
        Sun, 10 Aug 2025 15:58:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGUGt1AwSBne/o9+rNR3LtSm/WoA2RbHO8v9LNVgg4wnAMJx+OP+IR27C+Pk0SSrEVzMCAAA==
X-Received: by 2002:a05:6214:2469:b0:707:48b6:bcd4 with SMTP id 6a1803df08f44-7099a51356fmr150862326d6.48.1754866690271;
        Sun, 10 Aug 2025 15:58:10 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077cdd9916sm144266336d6.61.2025.08.10.15.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:58:09 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:57:31 -0400
Subject: [PATCH v2 7/7] drm/msm/hdmi_phy_8998: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250810-drm-msm-phy-clk-round-rate-v2-7-0fd1f7979c83@redhat.com>
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
 bh=b3lpeRdsfILZNbKt0s4jDvsKWYmd9ZM6thqzD9ovEpA=;
 b=bPI+bgndtQjl8U/B8CPlCWIm4ICh/KSI/9pQqEc+JGzlNlWdm7ffMObXa6FktebNdwMw2IQ7l
 yRXvUD2K69rChwg8WTjpcfmYgZ91P/5xMLfzNQFm4R78kNC3NkqT/fj
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series. The change to use clamp_t() was
done manually.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
index 33bb48ae58a2da13b7e90ff419c6e05fec1466af..a86ff370636972168124da19e114f0acab2249d2 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
@@ -646,16 +646,12 @@ static int hdmi_8998_pll_prepare(struct clk_hw *hw)
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
+	req->rate = clamp_t(unsigned long, req->rate, HDMI_PCLK_MIN_FREQ, HDMI_PCLK_MAX_FREQ);
+
+	return 0;
 }
 
 static unsigned long hdmi_8998_pll_recalc_rate(struct clk_hw *hw,
@@ -688,7 +684,7 @@ static int hdmi_8998_pll_is_enabled(struct clk_hw *hw)
 
 static const struct clk_ops hdmi_8998_pll_ops = {
 	.set_rate = hdmi_8998_pll_set_clk_rate,
-	.round_rate = hdmi_8998_pll_round_rate,
+	.determine_rate = hdmi_8998_pll_determine_rate,
 	.recalc_rate = hdmi_8998_pll_recalc_rate,
 	.prepare = hdmi_8998_pll_prepare,
 	.unprepare = hdmi_8998_pll_unprepare,

-- 
2.50.1

