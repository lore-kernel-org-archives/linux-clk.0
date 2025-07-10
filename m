Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8D12797AC
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 15:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752160892; cv=none; b=POk8rvYMDiOkJTX/FGSIqmSWk4s3ITzE96Jqpdof9M0jHD8Ytwur2JzyUo8ed/f+UNG73cAQER9KEKhTQCtYCxThiVJy7Th+oYbYWvD7V66ti2BzSF3ZnHe5h8cFM42A4vL5lGVDh83GFjBcU+dwBE9HgHgqA2PX+9RZyb4tgVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752160892; c=relaxed/simple;
	bh=kz71FhpXSJiP4LK6NL3EGhiadR4ZZmwclRrRnYVh4iY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YGSdSSYjcuZgZRvhKU9VvXOxfLifvTYM888c4grLwV09e9Ygw3g3Om30p5B+r9Uy637a59ztJ/icBrCPCOWRFgCoTjA3eM1mqfCmiZU4+K3MnPcbLI9b4+yIyJm37WDl54MM9MsQckn1XBvAQv7+PuT3Mp0YVi9qDNcUO5Ywrjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RL+RVXDG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RL+RVXDG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=04UKgY3FpDD+wMR4UcUZHAzB+dZfsOo83mvFGeazY6c=;
	b=RL+RVXDGsffDhwzv9Hp/DhOf1lrgPdXiYBIZ/8IeXvh2nLvoPueL850U7wFcdP36oAbiej
	prBGc+PtFjguq34yOz2OjnHTN6v+StYkMqCxXLUDZ9j79ZZVkabHdTHAqNtaTm/6ytjTzl
	r+8f/DsH7Ogla1KRXHpqNYcOrB1vwO0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-407-ylnnhZpQO7id6pcMDNTJAA-1; Thu, 10 Jul 2025 11:21:29 -0400
X-MC-Unique: ylnnhZpQO7id6pcMDNTJAA-1
X-Mimecast-MFC-AGG-ID: ylnnhZpQO7id6pcMDNTJAA_1752160888
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d3d3f6471cso168283385a.3
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 08:21:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752160888; x=1752765688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=04UKgY3FpDD+wMR4UcUZHAzB+dZfsOo83mvFGeazY6c=;
        b=PIDTpLg5FXJb4aDVkhLpdr9E1fNEEbUx+z+/HChfxod5jXzMzKCjMdbIyEODXQGkrb
         0jniMWCjoK7AM4kg6Zt9RnMuaU8aDyRw1AsOwki/7/2Js8xBLo5wyUYuYGB9AZ8gSt16
         4OoYFtzix+HzC0ttY1UCZlb1CWOsseIoCkGe4/8z9Zgp3e3H86X/kjnh+RMKZPIF0O/T
         eflA/fBeHsC+NM3P9lRFyYquq1ysrkSkPhAjdvvHlJhRGGOCj2AII6vGcY/H0RqYQypi
         EOXwdZMEpbNJoGiA9E3gHTg3z8GgAsfA7kAHMcIn+hqyOlHA9Liu98C9JxZn0FWOpan8
         c/bg==
X-Gm-Message-State: AOJu0YziV+baAB89wTz7rJtXCg3uK7KHtfe82FwqDuRNdoIv8s0xJg3p
	i31VA5LSoT5R4lZXaD/LJf5DDTa8eB4+8SqT+HpG3KatEvXyXfD7Zg8wbryUUnn3cDYvbZwCaB9
	5OnTv1LXXvVn+CbT6mZUeP+HJqo1+obfroaK8fkM2/j+cEcpYt9dhVZxcFUuoBXCuHYB5Ag==
X-Gm-Gg: ASbGncuie01QEasQjDdVv/imgsXUACa72snaSJBva1NytT31UkSnSBsI+InXB9bK5if
	fGjOKjoapM/kqGGyoft4rCWxwDakoOcZqRp0PqEPAnbCF9pLFtk18i0fPLg7Ak1dGGzm8ssQQKm
	31SqadhuprcXfaqlF3EB86Dp6okTIJWOkKnQ+sRm8dXIy49RSXkdmO7fRwkXYGsD2lcKr0Hp7Z0
	Cs7U7L0dsQS0vP7QkZ6WcnTN4g6yc55ubAAY/JWnK6R6eFU25pNI9aS88cpXfqwPve94cQP5Wtp
	W7P9I4tw+SzIG8Rr6Tx4V4QjjrgQKGnVP8cIjfinzzwbMBLlYa+czNHT/v1K
X-Received: by 2002:ac8:7f55:0:b0:4a9:a2e9:6fb5 with SMTP id d75a77b69052e-4a9e93278f6mr61243041cf.14.1752160887558;
        Thu, 10 Jul 2025 08:21:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGp+rjgrTFYPXr2yzX0xKnPs2naabQOdY6kOTU0JwDVLzTwczVY74hpEf/KJzdR2RHlWtIYeg==
X-Received: by 2002:ac8:7f55:0:b0:4a9:a2e9:6fb5 with SMTP id d75a77b69052e-4a9e93278f6mr61242511cf.14.1752160886948;
        Thu, 10 Jul 2025 08:21:26 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee2c2sm9654471cf.74.2025.07.10.08.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:21:25 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:20:33 -0400
Subject: [PATCH 13/15] rtc: pcf8563: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-rtc-clk-round-rate-v1-13-33140bb2278e@redhat.com>
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
 bh=kz71FhpXSJiP4LK6NL3EGhiadR4ZZmwclRrRnYVh4iY=;
 b=HtQpQzElJ4/cj2HXLwu5RWF2ZoeaJHJijPuStkArACrAwIcV9r53z/PCLSYCNvmBtXTczzLvw
 Yx0zin2Ti9cAacdRJfzbIpFg3t0sPGRc5CfQjMz4BP5O3od8ES6UfXo
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/rtc/rtc-pcf8563.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-pcf8563.c b/drivers/rtc/rtc-pcf8563.c
index a2a2067b28a127bafec66328cd75f50aa4277986..4e61011fb7a9672ee356f6328a7691ca413a82bc 100644
--- a/drivers/rtc/rtc-pcf8563.c
+++ b/drivers/rtc/rtc-pcf8563.c
@@ -330,16 +330,21 @@ static unsigned long pcf8563_clkout_recalc_rate(struct clk_hw *hw,
 	return clkout_rates[buf];
 }
 
-static long pcf8563_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *prate)
+static int pcf8563_clkout_determine_rate(struct clk_hw *hw,
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
 
 static int pcf8563_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -413,7 +418,7 @@ static const struct clk_ops pcf8563_clkout_ops = {
 	.unprepare = pcf8563_clkout_unprepare,
 	.is_prepared = pcf8563_clkout_is_prepared,
 	.recalc_rate = pcf8563_clkout_recalc_rate,
-	.round_rate = pcf8563_clkout_round_rate,
+	.determine_rate = pcf8563_clkout_determine_rate,
 	.set_rate = pcf8563_clkout_set_rate,
 };
 

-- 
2.50.0

