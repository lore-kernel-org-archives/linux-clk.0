Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850072DFA22
	for <linux-clk@vger.kernel.org>; Thu,  3 Jul 2025 23:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751584997; cv=none; b=me3J+m/BF+Buvj1otHNmjYQ1QDTEtw9t9jLq3V4uVBNBDkffrz0npJKo7l+RMn5+J+DKOY8EdmUWhNcOIQ1NG/O5AlPINZx0nib0FPFY8u7VobtTMB57PE/CQwfype5r/nBtSIHwjvX1puXNYnWZ3ByBFYsOAXCR+9p/PW/fH7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751584997; c=relaxed/simple;
	bh=JjW2YpRPz+0lPSN1r9ZPq4mBQxxVW0XXtxuqTB96kpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MF4UD5KRgneIAX4GeZ8wasU4ubaSh1fqmRwGW1vSgyQMlABiakoqYAx+XhyGH+O2n6FtPd7egx/fM8AO4N2giAug+t3PCpq8iRRjFB53EAZAKd27GJdrCWCtA3ocLlJneuTl5Ns+iWHSZPN4apifiM24BJpsRFijLapJLg+sbCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YOXyJMyh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YOXyJMyh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751584994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V9SM1r4kZ+sX81Mdumv2hWNVumjYJEFhq1ifXw5ch4g=;
	b=YOXyJMyhrjqLNmaPETD/Mj0hVV/EMkIsZrABqM8EyRy8FjtH6WWhZf6tm2itHlxNqqZf1i
	yqc10idhC3gH8DyfzQ0BV+fAyFemmjoMoFPrP+qBepHYZf/tv/9bm1/mYWlrVgy3puQ56y
	iY7ReRbJJ+GWZwTAQbclK0B2MUsQNTw=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-602-SgarF2tHPXassqoAZ1erJw-1; Thu, 03 Jul 2025 19:23:13 -0400
X-MC-Unique: SgarF2tHPXassqoAZ1erJw-1
X-Mimecast-MFC-AGG-ID: SgarF2tHPXassqoAZ1erJw_1751584993
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fabd295d12so6052226d6.1
        for <linux-clk@vger.kernel.org>; Thu, 03 Jul 2025 16:23:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751584993; x=1752189793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9SM1r4kZ+sX81Mdumv2hWNVumjYJEFhq1ifXw5ch4g=;
        b=peNmk/PMdmPhBug9FMQNRyWpaTcEwhw0W7DwN9mvGTCGTPgy6joiCIP+AiHCZJ7k22
         OfsE52tOuUnQZCP0eHnelZKBQvmYEDfLp60jI3ggC58/EKwcwAw5+9a4GdyltAecmxfd
         wL5odXRKhCFMKTCWnmKz2JMyTDud6FMkaDhvU/2IfW6gnoiRTcUvPUKCNIrV2V7rm9gi
         +QVnEA95qfTnWcTBudipEGP1RNAN9N4+f9EisLrZT1WnTa1t8kca3BVyyDvAwhMaYq04
         069qU4y+EPDIQ9/sWn6aiAA9VFoHFO19hnYW4C5HGOm+Mj7ifll7F60yMiw3zSXvWKpB
         zCHw==
X-Gm-Message-State: AOJu0Ywh0hwYshvj0UgDRwXh3Nyhd4+XnLOg5HKqDV0vYCku2RqnwdUv
	KCgGh6Z17VR272VL60sstg2tZW51cMogkSpcerUWala7t2Z8JOkHmPTE8OZRZQvpriY1TuvTSQa
	l0bNpcXIZhSFtzEuUSN1HpLu5Xf+8tKcN3ciuB+JzTJqRpg7DwOFv0wWalYzDBA==
X-Gm-Gg: ASbGnct/aKolkVGgagI9PM5BerJ/sXIXytSoNclwbhS+JDHr8EFv/MNqxfTp3eERK5q
	PY2uCbNCCAtLEwVAz2OPRYhWDmoKSBFPjh0h5e6VzzwUpbANpMuZ+GCA5uVQWod7df3fRO6RPW5
	ecQ3XhXF/ett6G4HvEE5eQMFDLygE+e9XYcWv+1VxXxstAw1qZp/R0hg4MX/M0R447/ojWVlD2+
	pHuAv/v81SOVPtfRgXXRzoIqZ7SKddTHQo5qS7pFDk2uGepFOQ6AMuQcBwjJrSXLuFSgD16Qh0+
	rQXWw0PKtOJMEYtAFnRv3jwC3EjPUgj9nwx6yyr4xRE6HA12yNWLnrACsYBGeQ==
X-Received: by 2002:ad4:5def:0:b0:6fa:a4ed:cce5 with SMTP id 6a1803df08f44-702c6dd6d2cmr2496396d6.44.1751584992858;
        Thu, 03 Jul 2025 16:23:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGI3ipPg2Jg+5GD7hTnCiXfrGoYgoIQ3H/qFVOQMX3H3uHxeS2iTGlz+BWau3PM9f3haP1PQA==
X-Received: by 2002:ad4:5def:0:b0:6fa:a4ed:cce5 with SMTP id 6a1803df08f44-702c6dd6d2cmr2496116d6.44.1751584992485;
        Thu, 03 Jul 2025 16:23:12 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5a958sm4469956d6.84.2025.07.03.16.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:23:09 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 03 Jul 2025 19:22:28 -0400
Subject: [PATCH 04/10] clk: qcom: rpmh: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-clk-cocci-drop-round-rate-v1-4-3a8da898367e@redhat.com>
References: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751584976; l=1326;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=JjW2YpRPz+0lPSN1r9ZPq4mBQxxVW0XXtxuqTB96kpo=;
 b=zf4/vhBsMxt+TAFqD7aUPTk19Bt+lcfBLX/WML5Wb9wvluceirqF+3xXA/SRJdeeVovfmzXVw
 wjKAv88CuWoAzAa7aZ5FVjlB+6EYYOYea3w9xYISlQIYpuJFVJ7J6Lu
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/qcom/clk-rpmh.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 00fb3e53a388ed24ed76622983eb5bd81a6b7002..74b052ac1ee10bdeeb59880019fb06ad58db3f74 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -321,10 +321,10 @@ static int clk_rpmh_bcm_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
-static long clk_rpmh_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *parent_rate)
+static int clk_rpmh_determine_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
 {
-	return rate;
+	return 0;
 }
 
 static unsigned long clk_rpmh_bcm_recalc_rate(struct clk_hw *hw,
@@ -339,7 +339,7 @@ static const struct clk_ops clk_rpmh_bcm_ops = {
 	.prepare	= clk_rpmh_bcm_prepare,
 	.unprepare	= clk_rpmh_bcm_unprepare,
 	.set_rate	= clk_rpmh_bcm_set_rate,
-	.round_rate	= clk_rpmh_round_rate,
+	.determine_rate = clk_rpmh_determine_rate,
 	.recalc_rate	= clk_rpmh_bcm_recalc_rate,
 };
 

-- 
2.50.0

