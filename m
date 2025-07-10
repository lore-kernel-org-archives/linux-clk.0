Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B751D277C81
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 15:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752160879; cv=none; b=us+dTX4xTPJ1RO8snxMFyRb75Xx0Yez4c7cKc3DH8yRg3GwNhvL5oPrwGqt1C8Sa+rxROuAsAuDytGac6RixeqeDcTJIiS+6RTi7qMoNwQ9xUPlb0KoE0X/jJKpCG44WAEV8B5Z5mZAmpuCuyVx8jEKi3ZD5wfG6Buf+lA9N4U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752160879; c=relaxed/simple;
	bh=HosgLre4sOV32zuup5VY1mXTPGrX7i+9z9+0wka2BHE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AKJPYd94K5SCfNQ51EYbN9wAzEY11HUNFxNpdpM/j5OyGSOMOHXHEw4+MrIhD3y3lV6wExHD9h3/1X9IalFzRlqcyIQ8uUZLzfjKChIlU/1cNk0/boDpHRHoUqn0oQVKE8v1ohGTSuZAmar2w0qgDIFjcuVbcYtGy3bvzVHuXB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TcH6tSbT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TcH6tSbT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yh9qOs9b+m1+CWu/fchTdf6WvDYvTJKqRPUm/8N3WTo=;
	b=TcH6tSbT3ufJIBA8dFKBgpzAqUgMddL9GyVfDSjxAwiq4LU9iYNYkOU6yoXlW3piF0OgQF
	9R0UcWUx3pE0BsBsdblvbCePsSA/yRIhd9jm2t47B1LrF4YotfzszdbM2T/ykdGI+8Xcg7
	QcWV5Oj2zLoOC6GmVWE+n28JpazF2uQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96--QltnSDdNrGC5d_IlZ2BIg-1; Thu, 10 Jul 2025 11:21:14 -0400
X-MC-Unique: -QltnSDdNrGC5d_IlZ2BIg-1
X-Mimecast-MFC-AGG-ID: -QltnSDdNrGC5d_IlZ2BIg_1752160874
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5cd0f8961so208906685a.1
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 08:21:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752160874; x=1752765674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yh9qOs9b+m1+CWu/fchTdf6WvDYvTJKqRPUm/8N3WTo=;
        b=Abkwzjiy6fdaKRZb+XMkJBLnTYIclV8A5FF7BGUFZXMwXu/fNv+TkGHCUh1/UIpegY
         h8nierwMQoMhk4RPJcRqapWIVyAh10DnA8z40hhp9YcPIyfkC65bnkJTwjJl4EXY8nta
         rPVyRnnvUPvVZVUmHnfHX4XsE/Z+mEWEl0X31KWhqpkwXyYQOubG1Pbs7st7bXjGmitd
         9NR+AOdGJQlmaFGOW4oa/z5I9p6MfK84cqb2JZZf5pRjgQaQkINQurB5eS1xKa9Luo2L
         78A3LZul5ZB+bPepDuOM3Q3t5b8XbJE/9/BInBZi+74kS+qOodu7L/n6DpPhblRjD2aE
         eUng==
X-Gm-Message-State: AOJu0Yw7kTeInOt3eR3j48K4IBb7sEj3byIbRueE3Unb5uVlZOqQdlhR
	4QdBHFb361r5pbyygM4Nu69Blp0xHX1TLXF3yhjeWo91diKrUZNM7q62957UbGBgfctpRTIam+X
	7guwmRXixYCaqCpS8RvmbOX+Wf+ClFkSicpiQqT3BLPMknwTBRxqity9ZCIgWDA==
X-Gm-Gg: ASbGncuG0qFwbQlbDISWeeCYqBZhhbVlKoeK6g+H/MCkb2mZz2YpG4EczPYzwt2Ve+J
	6rWcl1I3CR5Yawyot//XdRgwMSzYwb4IFv4z35tRmdOsqJl8UmWxV7jhiPUk0nu4T+ctaHnp+cg
	cAMhQoZcAAElw3r6bttypRMheqDzg+x3ohWzdFbUxTw2WWkg3hzftuCK9BQ12HGTQURD742w5YS
	/tAdzE9yDzz9wv5FLW/zvATq7Jjop6JiaxXuZMaVjaKoaD4lOQV4fDVRDqQzJEIGx14Dx6y4E/r
	2yogdEGZ29/PgQU5B8dYG5W3WaGzyOeNt+UKSCNcQ3UFtgMS5G+vMRzlG/Pr
X-Received: by 2002:a05:620a:4414:b0:7d4:277c:7116 with SMTP id af79cd13be357-7dcccbae331mr486940285a.51.1752160874125;
        Thu, 10 Jul 2025 08:21:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5eH9L7io++DOG6EoLD7uLEBnCEDCHEDGmoS7FTL8+M99Rr9LdDHR9Ug5tFrdjn3kFCzmWmg==
X-Received: by 2002:a05:620a:4414:b0:7d4:277c:7116 with SMTP id af79cd13be357-7dcccbae331mr486932985a.51.1752160873576;
        Thu, 10 Jul 2025 08:21:13 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee2c2sm9654471cf.74.2025.07.10.08.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:21:12 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:20:28 -0400
Subject: [PATCH 08/15] rtc: hym8563: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-rtc-clk-round-rate-v1-8-33140bb2278e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752160847; l=1660;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=HosgLre4sOV32zuup5VY1mXTPGrX7i+9z9+0wka2BHE=;
 b=ub/cp96oaMsM4GvzWf+fAuWAKwOmG1F2KhV0jGfn1QS+ylEuMZ1/zZzX8TbakzDsX+uDxdWl5
 YBJs96EaePoDm7hbah3U9wXmseNz+pETLmzurmldCyeTiHswKmzq9vD
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/rtc/rtc-hym8563.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-hym8563.c b/drivers/rtc/rtc-hym8563.c
index 759dc2ad6e3b2ad57072b35a2642ec5bb78cd98c..7a170c0f97109f9a2bc08946845cb8bb5a377bd7 100644
--- a/drivers/rtc/rtc-hym8563.c
+++ b/drivers/rtc/rtc-hym8563.c
@@ -285,16 +285,21 @@ static unsigned long hym8563_clkout_recalc_rate(struct clk_hw *hw,
 	return clkout_rates[ret];
 }
 
-static long hym8563_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *prate)
+static int hym8563_clkout_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
 {
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(clkout_rates); i++)
-		if (clkout_rates[i] <= rate)
-			return clkout_rates[i];
+		if (clkout_rates[i] <= req->rate) {
+			req->rate = clkout_rates[i];
 
-	return clkout_rates[0];
+			return 0;
+		}
+
+	req->rate = clkout_rates[0];
+
+	return 0;
 }
 
 static int hym8563_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -363,7 +368,7 @@ static const struct clk_ops hym8563_clkout_ops = {
 	.unprepare = hym8563_clkout_unprepare,
 	.is_prepared = hym8563_clkout_is_prepared,
 	.recalc_rate = hym8563_clkout_recalc_rate,
-	.round_rate = hym8563_clkout_round_rate,
+	.determine_rate = hym8563_clkout_determine_rate,
 	.set_rate = hym8563_clkout_set_rate,
 };
 

-- 
2.50.0

