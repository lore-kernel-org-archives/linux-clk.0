Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF43427877D
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 15:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752160886; cv=none; b=mCAiVECXl25qjDLeFkdEDhlhXVKQAH5LqXfTmcPrr0PtRgeKAOFMZCWSue96i7d4u9Zj0nve+q5Vz+cc4Wc3bInCGn2QcmfPhgBGsAgA5EcnnwIX+8YtwfXIzhQo6P6/rG6hDmyklzXgDoxUn1Zka+cdM83qILVgSyXbLkoC/MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752160886; c=relaxed/simple;
	bh=n49+tG0DWMRf1aqATyzqFiQzu9HDymGoH2RU27/qnxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fMkxVkES9CmkjEM2aZL0xCnECxTPZVtpORIkaNBJ1uiiTa78+iKn+3c1vgLJjQRHU5rygsCQJ7knTUL+QJS2jv4+J5MQ+UqTofgK2jzVePvt9UaDuI8Ft1zRNhxmnG24J0Nlw94bHenyYSYJNsetT4HQTnrOvMPYe0f9FNyu7+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b0ImFRvu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b0ImFRvu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1zVc4uZxRMU4cvDiAS+onbHkVKec91CN3SQjz5cVgQ4=;
	b=b0ImFRvufukVZDUBsfavy/c7dVgTjvZgJz3MepkMVBQXn9maJ1uCo5c9NMMOyis1LN1gXQ
	XPaRPoB2ZaiW3HcNqfOWf/O+PRvd6wmGkL3u7ZAgxiTjqsBv014smwDzCoCW2cSNMiTdk6
	cpJqj683AvhgegyErc9nyVpa12sKqNQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-q3v5CtKKPkeGka-5odib4Q-1; Thu, 10 Jul 2025 11:21:22 -0400
X-MC-Unique: q3v5CtKKPkeGka-5odib4Q-1
X-Mimecast-MFC-AGG-ID: q3v5CtKKPkeGka-5odib4Q_1752160882
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a71914dd25so23041201cf.2
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 08:21:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752160882; x=1752765682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1zVc4uZxRMU4cvDiAS+onbHkVKec91CN3SQjz5cVgQ4=;
        b=ouMR3hOS/F0Bs/2qPeXQ0abj0wmvyDQ52Vpqv6UxCl0om9pJWowDqC6zyOK8YbWwtZ
         +9i1DosJmp5mEjOKuq2rFbgBzxXLSD5WL1E9jnF1Qw9SMxcG57cgUQ8UccwX9mEEr+Kd
         5c8WUJyiBDbambY8sfIODPwtNb4mHT7xYJ98JNNF3ChCZ2LYWjtJNmE1kRbcgSxb/REg
         iCxtxok7k2VRaSx8lMJ945oNnyiuKWEDRCxJQexmWpANNsuxkX94gcnz6a85X+RwFyC/
         Ox6YY6SWBGJFUZuvHFnxvRJaw+nuxCcf+XxE0uEWVXONufY+vAvlRxepcqxj3VoWETqn
         7ahQ==
X-Gm-Message-State: AOJu0YzhsHk0mS+fxaWIx4kgVaet+Yy82XaNv3RBFW+nB3DZGKEhA6p7
	PnggPZFKVrg6IpsvtCgchKyl6c6wsIuCTecqFx7GOk5iEEUWI5ZEECExI6uAZf9Xz9otElqMGVd
	7CrMUDQLMnR+R1KyC13ObLycWk+gfXN1L8n+IrngOV6z9wzDQd4o6z7Iy23nGEw==
X-Gm-Gg: ASbGncv/ImmQieyYCJ7ujcdbBR81RK1QdAyb/DYMmIOgSt320REg+qmD9VhbhgrFE40
	RkLRjdEkw+ddVD36bMGrTDkbXYh9/I9Yn7iFwZkvBCq5e3KaNZq552jh0xshdqtWzg2PmULzQ1u
	xUNo104MRycbs+xolqm66oR7cPZc1SbJc/LBOKUOwPRVeMSuCq/JQctqperl+k2auCQ5wb7WKA6
	B58xqx1XyUUVeQG1KovPrBSxCr6TOBcJQahnWNXfQb/JVUL3ctLTHAhvsfF+GOam6BA1AXOjNst
	1ilNPz0rf49hCRF/51RmWigR3KxRHEuzsT9zhBJAbowNpyZUxqvZvUT44wBJ
X-Received: by 2002:a05:622a:8d0b:b0:4a4:31e2:2e77 with SMTP id d75a77b69052e-4a9f7367d48mr23115301cf.50.1752160881771;
        Thu, 10 Jul 2025 08:21:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/1O4MLvOzk7gKxJZFO5slOGKTVfTHOFq+wSEYq355CZZ1O7svKyn2khuzgSoy03/2j0xmxA==
X-Received: by 2002:a05:622a:8d0b:b0:4a4:31e2:2e77 with SMTP id d75a77b69052e-4a9f7367d48mr23114911cf.50.1752160881463;
        Thu, 10 Jul 2025 08:21:21 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee2c2sm9654471cf.74.2025.07.10.08.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:21:20 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:20:31 -0400
Subject: [PATCH 11/15] rtc: nct3018y: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-rtc-clk-round-rate-v1-11-33140bb2278e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752160847; l=1680;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=n49+tG0DWMRf1aqATyzqFiQzu9HDymGoH2RU27/qnxQ=;
 b=P6B78+RNiRcz4avwFwJ8Y49o2kiWmwP4zkdeQ/qf8zNH+D8uJk3HIGRZAfLT34wdb2ZKqzKoE
 pRY4BcYTZNGDdsBg2fjEfI6IUZY9CLR90bRG/tlSi/EnUAB3F5vgkHc
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/rtc/rtc-nct3018y.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-nct3018y.c b/drivers/rtc/rtc-nct3018y.c
index cea05fca0bccddc6384c462cf1ebdc59b377a24d..cd4b1db902e9f68781787236bec56c2cae8436ab 100644
--- a/drivers/rtc/rtc-nct3018y.c
+++ b/drivers/rtc/rtc-nct3018y.c
@@ -367,16 +367,21 @@ static unsigned long nct3018y_clkout_recalc_rate(struct clk_hw *hw,
 	return clkout_rates[flags];
 }
 
-static long nct3018y_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
-				       unsigned long *prate)
+static int nct3018y_clkout_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
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
 
 static int nct3018y_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -446,7 +451,7 @@ static const struct clk_ops nct3018y_clkout_ops = {
 	.unprepare = nct3018y_clkout_unprepare,
 	.is_prepared = nct3018y_clkout_is_prepared,
 	.recalc_rate = nct3018y_clkout_recalc_rate,
-	.round_rate = nct3018y_clkout_round_rate,
+	.determine_rate = nct3018y_clkout_determine_rate,
 	.set_rate = nct3018y_clkout_set_rate,
 };
 

-- 
2.50.0

