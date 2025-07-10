Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A92274B4E
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 15:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752160881; cv=none; b=sh2SB7gZPQDQX9pJwEKp90tRn55/0yt4wLL+3sI2WRzPg/0AIW577kyiYul/lRnt3hhC1JoO/P2Pky+46ueHkUMBp4c4hGGZAPQgEvisDA8S0MP2ufeioVrQ7NHsxWxMtPyWlpDpzyONuDWAc+jjjh1RchKKH5ooRP+bL3P5d78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752160881; c=relaxed/simple;
	bh=gRYxCnwkm6+irA6938Yxi6DImy0GX438/iYdpVHvAEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cktn81o0ly80WZsFhgl7C8yf8IHfEY31ETSERY7Bah9reyDpfQieTHGCXKRMMSwlJAz24qglMk1D4nBlWWR7jnJhTqLHeHq3zUed5uio6J1CaM9T7WrDloaZcF/H5Dyx6hjwTxadM/UBAs1SWGGSOZ5Nmr6HD3Ci4bvzu+G2t4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P/uFT9xh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P/uFT9xh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jCRaT6dha/0glQCxVFquzDYHmbhYyDuNPuL1J0w4X+8=;
	b=P/uFT9xhlZyA7A8Qlg5akb/ck/XP/UpFNUHX8OlRhkfR8alCsZBakRHZKaRRUyj9GTgtZy
	WkwpBoL2UgV31As7k7XtJK40Da+M5S2UqNL/PVCZisefXBPVCS6DRcOdgb4KqX9DH2zoal
	8OGTzK0gKQE2/+WLl2n3USYPN4NDB68=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-299-BUUNRbKvOLmsUox4yQCAIA-1; Thu, 10 Jul 2025 11:21:17 -0400
X-MC-Unique: BUUNRbKvOLmsUox4yQCAIA-1
X-Mimecast-MFC-AGG-ID: BUUNRbKvOLmsUox4yQCAIA_1752160877
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a581009dc5so21118691cf.0
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 08:21:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752160877; x=1752765677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jCRaT6dha/0glQCxVFquzDYHmbhYyDuNPuL1J0w4X+8=;
        b=fJoSBSDgrF120f+B4Ao3N+4BrNBXn1xdB5SvHNWcYYYGZBpg8dqH7elagZ3wQXXKDB
         2rvUXkA31UqpiD+TFRbht4+z6unvz8qZBoGLFfuHTEV50cncqUzaEzjDfiWUu2rV2dqV
         JoWY1DEqGeNpqTO0VbVquWVqGOQpROOURhENOy2xd0UF3svKwXzW/K5A3KhyUNS/Htfn
         TYXmv0FikrntJqAqcdMG1mffY+2ybtg/ojimSFZKG+EnRIBgqfGFQRkjuarf6Sy3M8SH
         XT/P0r7G1nkJ/jVwSb6G1qwNQUu8w9A85ZUV+6r08FYM3ZpgjI01qogMXN42sMBu8DRZ
         h0Tw==
X-Gm-Message-State: AOJu0Yx86l2C7W/RW31T058h/2rw0tcbPePGjMIEvJIxMLzRHfanfzEr
	FJz5ai07MQOA+NSQmc2t59daZI8U2hrvbhsgZl4xP5ydG9PIfZBEUxGVpGHoSbvH8lz7Cl+9Hrf
	3up9vJYft6iLri9M6NN8sxCLYwkQaMUCIpl8SWmFCXpgkNHB0CM3rVkKgE/lL0g==
X-Gm-Gg: ASbGncvYBlCr3P9pyXOlVIaIbwQdbSnXiQfr+MbKh1ThKxb3eZj9MeBW/tbVX9USP8d
	pvMEph9tOP60m98dopPTQNbX5xzqvyml2kbng2qLiFrF8h0gBeJBmEOz72Add5609kzD/yVMlxL
	vxZ6AfDEnIlX60qWnwO/1R6WfDEuco/sfstJ8wD1G+0wvtjaQGBCSMoWafq+BZv6CESyurVOFsi
	96UQcr3GYefpuYRHUDuQEs68tFmrdPUqxr/xNUQ8ZQDGMSa64uPlyemf/CRhq7vJyPmqiYMSwRE
	+BUmXri070KW/VKa53W+OuxWB/UwY7dOTe3eSABZ3AEvLBh9HjnD8eUr6zMm
X-Received: by 2002:a05:622a:2e8b:b0:4a8:18ec:8ce4 with SMTP id d75a77b69052e-4a9e9ccb481mr50515811cf.21.1752160876757;
        Thu, 10 Jul 2025 08:21:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEktnXBUPzvGbZoA7Bfbi7aUOBKs0QSJoWa7pWCkvWbCkOdt87sQ9haOuMdpsEwCBfM0IV/Rg==
X-Received: by 2002:a05:622a:2e8b:b0:4a8:18ec:8ce4 with SMTP id d75a77b69052e-4a9e9ccb481mr50515221cf.21.1752160876213;
        Thu, 10 Jul 2025 08:21:16 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee2c2sm9654471cf.74.2025.07.10.08.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:21:15 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:20:29 -0400
Subject: [PATCH 09/15] rtc: m41t80: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-rtc-clk-round-rate-v1-9-33140bb2278e@redhat.com>
References: <20250710-rtc-clk-round-rate-v1-0-33140bb2278e@redhat.com>
In-Reply-To: <20250710-rtc-clk-round-rate-v1-0-33140bb2278e@redhat.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Akinobu Mita <akinobu.mita@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Heiko Stuebner <heiko@sntech.de>, Andrew Morton <akpm@linux-foundation.org>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Mia Lin <mimi05633@gmail.com>, 
 Michael McCormick <michael.mccormick@enatel.net>, 
 Heiko Schocher <hs@denx.de>, Parthiban Nallathambi <pn@denx.de>, 
 Antoniu Miclaus <antoniu.miclaus@analog.com>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752160847; l=1772;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=gRYxCnwkm6+irA6938Yxi6DImy0GX438/iYdpVHvAEg=;
 b=kdySgV3nLQK/nOox4fwHOlhGEFmW0wqNr9VHY7vGwOwPSM+A7pKrKapXwM8vxkIukREKQD7cC
 HuxCZizP8wRCrbf5QFXxnXIAg7hjFGFve1Y1H3RLVpUJwKN6oL6+xHw
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/rtc/rtc-m41t80.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
index c568639d2151702440d726030e9f08a0eb514da8..719afb9de9a831a4f335f505e3a0eae5293ad6c8 100644
--- a/drivers/rtc/rtc-m41t80.c
+++ b/drivers/rtc/rtc-m41t80.c
@@ -484,16 +484,17 @@ static unsigned long m41t80_sqw_recalc_rate(struct clk_hw *hw,
 	return sqw_to_m41t80_data(hw)->freq;
 }
 
-static long m41t80_sqw_round_rate(struct clk_hw *hw, unsigned long rate,
-				  unsigned long *prate)
+static int m41t80_sqw_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
 {
-	if (rate >= M41T80_SQW_MAX_FREQ)
-		return M41T80_SQW_MAX_FREQ;
-	if (rate >= M41T80_SQW_MAX_FREQ / 4)
-		return M41T80_SQW_MAX_FREQ / 4;
-	if (!rate)
-		return 0;
-	return 1 << ilog2(rate);
+	if (req->rate >= M41T80_SQW_MAX_FREQ)
+		req->rate = M41T80_SQW_MAX_FREQ;
+	else if (req->rate >= M41T80_SQW_MAX_FREQ / 4)
+		req->rate = M41T80_SQW_MAX_FREQ / 4;
+	else if (req->rate)
+		req->rate = 1 << ilog2(req->rate);
+
+	return 0;
 }
 
 static int m41t80_sqw_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -564,7 +565,7 @@ static const struct clk_ops m41t80_sqw_ops = {
 	.unprepare = m41t80_sqw_unprepare,
 	.is_prepared = m41t80_sqw_is_prepared,
 	.recalc_rate = m41t80_sqw_recalc_rate,
-	.round_rate = m41t80_sqw_round_rate,
+	.determine_rate = m41t80_sqw_determine_rate,
 	.set_rate = m41t80_sqw_set_rate,
 };
 

-- 
2.50.0

