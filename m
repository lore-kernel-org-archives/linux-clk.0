Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A2B2F0E42
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 23:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752190962; cv=none; b=UCnJNUk0eqOKeK+6Ot5yqKHsJOShIlWUnAftSNHNP3C39S4TVACaNCbbfQi1+8a4fH2EMvGAYQSP6U7C/t/6NFkzgNz9SmLgk2Xu/u8OnaZIefen8KMmO9PfWjxScREqXJd5usFrlGHjDpBwhV88JKs0/Vog4Zu6KVV+Yi8zX+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752190962; c=relaxed/simple;
	bh=EUcAkc+MwYYvI7xJQeU4DcisuArrrCwBemUDYG66Ivw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DllgF0QwKw7vfBvN772M3d+/KJtqTopaTmf9hY6pxxbpk4A5pCVOiENeGSTZTyJ/4Ynx6VdYt59seE39dIhUqzWnJoJJWBPdpwYd/iveWqfvXqDv5ShkKqgARlneU1G2ZLmzt6fFKVDH6pwsGRe9hG8PQ2o7mZJx3irqT/EtdFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KWLsEdq3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KWLsEdq3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752190959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VCr73Arn7lW8l2qhlI4qEFhffjvPwgr/9jG/meQTRwk=;
	b=KWLsEdq32MZRRMTd3Cfuf0/DmiODN/Oq2OS6ZBmeBTJAT7lK9tAQTsMOjHwzOLf39Y6FaL
	cEYHeq0FyMFKHSYtH/Bbr7K2lXzgtBPB95VWsVcPAYb3UAQ9tb38Me48j56Wm7bO6UhvUA
	j5YacV0S4ztxqyWI6SNwFpUbkQnAnEE=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599-FiGsE3HbNZem8fsrrr1wYQ-1; Thu, 10 Jul 2025 19:42:38 -0400
X-MC-Unique: FiGsE3HbNZem8fsrrr1wYQ-1
X-Mimecast-MFC-AGG-ID: FiGsE3HbNZem8fsrrr1wYQ_1752190958
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fad8b4c92cso32131376d6.0
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 16:42:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752190957; x=1752795757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VCr73Arn7lW8l2qhlI4qEFhffjvPwgr/9jG/meQTRwk=;
        b=LdQm7gtOHic3+ZOYyKjnW0cKm3THi+HbCWHNaoT2AR6jS0Ob3xirCP7/gpPWblAWWH
         Idk1MkRPPUr5SVv0CkktGjTDky8ohG6qzmDzvLy8I0LmbTYFst1lOQTlm5znrI3lnRuD
         pgPwhT4YqxMs9rAqmzkD4/Sm9Iz0uQmCmbQ4csJ4SseuKXRX/dFgsn19i2h0on9i5ywL
         Rre2KwgVqISjks74ZlXqYAiYjbaa8YTdjNnfY8sHQonMTPBvFaB6ARNrs5P6iOOptjtt
         lHxZuHuO2pOwUMsKlQZk/RUwZvwsFlTP1VH2VzJD7ggorNcp2eYoTN8pBTIZgyIQ28u7
         s4Xw==
X-Gm-Message-State: AOJu0YwHH3p3u4o/cdbn/H1HfIg4zlxs/nz3pvAywtGfnuwGirSfEeY3
	3JLFp97MUygeFGU9M6uHHW0Fk28C9f0NN1uDWfijVIW7D/OmpzAXIoAwWpWyTMvrjsLLai6qik8
	P3XsBgm+sTJAYyISTk4THQZ2r/CdV5ZvUAqzIQUtVol8iuBjSpgOaRpa3SfPwFw==
X-Gm-Gg: ASbGncu1CGr1O9dQS21qm9QHjP7s9MuQ5+G9Fqs7YuYT6iG+lzlb5+Dc2Ws0Je//+7v
	Q3mPUREuC/9kyeTWp/gGxYyl34xL/7sVTs32lV9hb27yGNcYv76KGnJteC7Z3Ai0gUgAVtM2LIs
	QTBBqEv9QbwG8lL+EyuHp2Hm5t4cofCl+Hws8koimuG8B9t/pS4tlpG71gvqpMvgBHTFcZJV9M0
	ryuVgHnkPMK0mKAyASSuSnImpTgVPufoAw5p5cTK2n/Ndo21zWqIL0q4s/vxxfDgXPIslZhffYm
	SF4VGp/hUaTj0kbJ5PViIyYghHrPCA+bsosVuDfsqr3aDbiL92Uaver9zssxt0TyA0eX4el0H2d
	uYBg=
X-Received: by 2002:ad4:5b82:0:b0:6fd:3a4d:363a with SMTP id 6a1803df08f44-704a359027fmr22077546d6.25.1752190957603;
        Thu, 10 Jul 2025 16:42:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLz6ZETzSGQzjCyDHW99TpL/CMMlr/fLIeK9Mwj1zXQh8KrDMwNBRoioYOOVVqlEpleU2jMA==
X-Received: by 2002:ad4:5b82:0:b0:6fd:3a4d:363a with SMTP id 6a1803df08f44-704a359027fmr22077216d6.25.1752190957272;
        Thu, 10 Jul 2025 16:42:37 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcde422e03sm153989385a.69.2025.07.10.16.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 16:42:36 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 19:42:17 -0400
Subject: [PATCH 2/3] ARM: OMAP2+: clock: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-arm32-clk-round-rate-v1-2-a9146b77aca9@redhat.com>
References: <20250710-arm32-clk-round-rate-v1-0-a9146b77aca9@redhat.com>
In-Reply-To: <20250710-arm32-clk-round-rate-v1-0-a9146b77aca9@redhat.com>
To: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752190949; l=1927;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=EUcAkc+MwYYvI7xJQeU4DcisuArrrCwBemUDYG66Ivw=;
 b=N+7e5WUdWe0eSqdVYYqPWF410agqUBM3oaZotQ0G8zXJXUkdVBjHFser4LNyGdI4AwRnWbRfy
 5UkEbXLMQmiAkXM1KekVeBLxlTf9LNC8v14IEIyHzxm7lTWB1d0OHWe
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

The change to virt_prcm_set_ops had to be made manually.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 arch/arm/mach-omap2/clkt2xxx_virt_prcm_set.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-omap2/clkt2xxx_virt_prcm_set.c b/arch/arm/mach-omap2/clkt2xxx_virt_prcm_set.c
index 011076a5952f0bfb24eadd13b8991b41b8115bae..96c5cdc718c8b9449a4372e1bb83582eaa91440e 100644
--- a/arch/arm/mach-omap2/clkt2xxx_virt_prcm_set.c
+++ b/arch/arm/mach-omap2/clkt2xxx_virt_prcm_set.c
@@ -70,8 +70,8 @@ static unsigned long omap2_table_mpu_recalc(struct clk_hw *clk,
  * Some might argue L3-DDR, others ARM, others IVA. This code is simple and
  * just uses the ARM rates.
  */
-static long omap2_round_to_table_rate(struct clk_hw *hw, unsigned long rate,
-			       unsigned long *parent_rate)
+static int omap2_determine_rate_to_table(struct clk_hw *hw,
+					 struct clk_rate_request *req)
 {
 	const struct prcm_config *ptr;
 	long highest_rate;
@@ -87,10 +87,12 @@ static long omap2_round_to_table_rate(struct clk_hw *hw, unsigned long rate,
 		highest_rate = ptr->mpu_speed;
 
 		/* Can check only after xtal frequency check */
-		if (ptr->mpu_speed <= rate)
+		if (ptr->mpu_speed <= req->rate)
 			break;
 	}
-	return highest_rate;
+	req->rate = highest_rate;
+
+	return 0;
 }
 
 /* Sets basic clocks based on the specified rate */
@@ -215,7 +217,7 @@ static void omap2xxx_clkt_vps_late_init(void)
 static const struct clk_ops virt_prcm_set_ops = {
 	.recalc_rate	= &omap2_table_mpu_recalc,
 	.set_rate	= &omap2_select_table_rate,
-	.round_rate	= &omap2_round_to_table_rate,
+	.determine_rate = &omap2_determine_rate_to_table,
 };
 
 /**

-- 
2.50.0

