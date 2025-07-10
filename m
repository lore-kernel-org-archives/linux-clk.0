Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E4C278E77
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 15:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752160888; cv=none; b=DIO9bZofS6VO6k2ED7/0/KhpX/s3x5pT4BUSWayGc7jawZ12C/9ZOUq1KC9jo5iFmVjwBGdKy6al5GrvwvPvwgxazMFrtU2htL4HCOqLDUsYcBFm+c1s6DkSUZGTq6IcsIT0Cjhe9kFwLmB6rsgX4sdpDEpJAvkU1ET+bc0tfo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752160888; c=relaxed/simple;
	bh=UPXy6/C/RD79zBD8+YjC+4PQ2wHdzGnij5BrRNttYFg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UZ7/dAuBgtwM0iX2g7EKrVWLIEGlmIhxNJ0D2gL+ctahLUBzZVSof0FATMHq8LSU615QuCn9rY9MUQEcqTWqyr6HQxkl8rVtKcDnX9tpeq8JGZRkQROAciaBn5ztd2QhtdKv4xelP9zJlXrlVSymODTjhRipGGNcfLRyDVrdcNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C6P6d46c; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C6P6d46c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8TcSjx0C2BwMhGthThgDZI0WYIDHS3xoAOaKbpomAhE=;
	b=C6P6d46cAnrR/cwXjvAMh+2T2maOyYO3gOT2RAnGbMzaIyBzK6pEIZXjLRpdv1CxhEUXds
	zgfjrO5yMe26N7ZBkH83kFVoClZ/OBbVDmXdAt46H8omKBZdD4hEgC/IhZXrbXsfs9voap
	9eZHxLrTBqxQdhMf7OyNKv3oNREKQrU=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-itNoiPvvM_aaN25MHnoSmg-1; Thu, 10 Jul 2025 11:21:23 -0400
X-MC-Unique: itNoiPvvM_aaN25MHnoSmg-1
X-Mimecast-MFC-AGG-ID: itNoiPvvM_aaN25MHnoSmg_1752160879
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a587c85a60so23111451cf.2
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 08:21:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752160879; x=1752765679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8TcSjx0C2BwMhGthThgDZI0WYIDHS3xoAOaKbpomAhE=;
        b=bSozvs0CqUGxuE7ohLeSpmmH45U0czYIMpEXX2PLnkpz+EGYSFnKyMFjLfL1HMM2qR
         GawMqeRPar7NYgMkm7F0PiU+3BbV0boUikpkZzAvfiXxOo6qAMNo/VA8a1rC8XYGcwqE
         Cu6gg8e2faStJJazI6FuRLhS0CtDKt7GRuUqxmNjStl7SSWOgKx5dKGyooYQ2B72qD04
         WXeVI13+jlRsxu5ACbFXt6jOMAXON5O37MGQbygFhOTXMRj0g3IbblWFzkGOvs6RE+1t
         0KSDfJ2P39csnXxpMrN9k5cclNdxn81qrH9SJKnG/s9pGp4KsVIRcFoEXboqfTwhCOMB
         XwNQ==
X-Gm-Message-State: AOJu0YzcdfjqkL59tnbYbH4kIqyMPbgcjeW5nPGTT7KaMNiC4O5sgM3k
	Vy+4+EActQR/jaDmr1tZlOnfAQaqXs0XCsr0FhFBk9A9h0SktPzK8QCGsE595dA83aJAmXV8vHK
	IcUJ1syoJaiZPv2DwlhZT2zY8DG4e5FRokXTnTEGXozXj10lQMOISyPsV0iBjgw==
X-Gm-Gg: ASbGncsnLUyeOMMKZYigDU4eYN3Img5XiYxj/kxdm9O2fN6BWz7ij3uZjbjoKUY0qMB
	/R+fr0FMubboFJUJeaatbhKJMX/6GfF0dmDC1RcIm+RJS78LRkydV/wK4gn8xpSeaPuOo/lSVut
	VRRkcbQy0D6eSiS9XMCckuaVhnxc0+vzpXVV7VN4wF10AknOsScGBZg03WWCgKZoAIQkEqNZuzT
	SRiXCFTqrnPP6Diz4/x4E8EqcqFiNXmdrUyvEFVjzGbkw7FMJV4jLMV9CDSM0dqUGQrqLA3982Q
	kz7tKFIQU5zx/+htGJC1r4POJCO9ZAOUWL+EgI4pY8gJZMaYO7hmeVREl7ge
X-Received: by 2002:a05:622a:2cd:b0:494:9455:5731 with SMTP id d75a77b69052e-4a9dec1f0b4mr69146481cf.7.1752160879122;
        Thu, 10 Jul 2025 08:21:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOYaK+S6nKLNB0+onalYZ18FMGM4SU1Pk1Rw8vuZDxj3sx1uTSsbM+HxfhIu/O6GetrMHApA==
X-Received: by 2002:a05:622a:2cd:b0:494:9455:5731 with SMTP id d75a77b69052e-4a9dec1f0b4mr69146151cf.7.1752160878737;
        Thu, 10 Jul 2025 08:21:18 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee2c2sm9654471cf.74.2025.07.10.08.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:21:17 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:20:30 -0400
Subject: [PATCH 10/15] rtc: max31335: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-rtc-clk-round-rate-v1-10-33140bb2278e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752160847; l=1704;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=UPXy6/C/RD79zBD8+YjC+4PQ2wHdzGnij5BrRNttYFg=;
 b=VczBglJXF7c0OhaNV6IcNJHendkDjPzxJK9SOdtvRnVBdd83JQDd6pRndtaJb0pB6PnPQgE6n
 YzmdtsurZ5VCbLJUyfz/1pItIEplDMwKOk1THQ06/VWvI4nd8eqLOL0
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/rtc/rtc-max31335.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-max31335.c b/drivers/rtc/rtc-max31335.c
index a7bb37aaab9e6e315db70bc6bc0dbaa553fdecfa..dfb5bad3a3691d0968bac78cbc9d54a2ea7662ba 100644
--- a/drivers/rtc/rtc-max31335.c
+++ b/drivers/rtc/rtc-max31335.c
@@ -497,15 +497,17 @@ static unsigned long max31335_clkout_recalc_rate(struct clk_hw *hw,
 	return max31335_clkout_freq[reg & freq_mask];
 }
 
-static long max31335_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
-				       unsigned long *prate)
+static int max31335_clkout_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
 	int index;
 
-	index = find_closest(rate, max31335_clkout_freq,
+	index = find_closest(req->rate, max31335_clkout_freq,
 			     ARRAY_SIZE(max31335_clkout_freq));
 
-	return max31335_clkout_freq[index];
+	req->rate = max31335_clkout_freq[index];
+
+	return 0;
 }
 
 static int max31335_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -554,7 +556,7 @@ static int max31335_clkout_is_enabled(struct clk_hw *hw)
 
 static const struct clk_ops max31335_clkout_ops = {
 	.recalc_rate = max31335_clkout_recalc_rate,
-	.round_rate = max31335_clkout_round_rate,
+	.determine_rate = max31335_clkout_determine_rate,
 	.set_rate = max31335_clkout_set_rate,
 	.enable = max31335_clkout_enable,
 	.disable = max31335_clkout_disable,

-- 
2.50.0

