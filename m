Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58A32FE368
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 21:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752181889; cv=none; b=f8o+IwJa+PNeD3rbkPBFUJ20361rlb/dBOaORfPvVj8GAS/QCG5dVPcYE2j7Jx0fAeFvcJOb+K9/vmU7nMFnwwftUu9DnzXRIabsU+CPfj2Wuspz/qrKdKQVa4+vV3QSb0GhghoKycLS9qv2fPN3mUvrdTCLd7+Nyh8PWlNJ7jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752181889; c=relaxed/simple;
	bh=lPrXiqoaFyoeQgppqZyKjenf8NouReQ9MLOykK27dRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oeaU1QLBYDo214oj1FXVqxXSfaJojuJMtYe9eDRCa2nqcZ9lgkePgoJKZTK1OtWZVMOAno33ZmMa+tNudD1WL6ZnM559TKBClmi0ZmEDkHMMdbZJQRuIyG5E4BJZIxC2yBfIlyuKm6n5kXuM13btv8v975SNSD2HooyoEdfFLP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BQoDoCa5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BQoDoCa5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752181886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zkRmxVF+/QlkSCwSzc3e+U7MwnOjoOleG/kQ/my/S6I=;
	b=BQoDoCa5NKXePxcDt4YRVOFT49fPXKyPpRcLSCXLPLcxJKAaDzdXE+rCbxcV7vufnWAJgR
	uN9NH4Xcc+esIoecieQuy2ggCC423YAd1cxk5rlYOJcZV/POib2RQ+TKk4y86iXfCoi9sH
	8ae+9xgpJLzM74KsnV6KvBUux5tQDKM=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-znZwvGWFO3aWHt2PvOw7aQ-1; Thu, 10 Jul 2025 17:11:25 -0400
X-MC-Unique: znZwvGWFO3aWHt2PvOw7aQ-1
X-Mimecast-MFC-AGG-ID: znZwvGWFO3aWHt2PvOw7aQ_1752181884
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235f77f86f6so13635735ad.2
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 14:11:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752181884; x=1752786684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zkRmxVF+/QlkSCwSzc3e+U7MwnOjoOleG/kQ/my/S6I=;
        b=u3Xkte1Zm4CISCRfN/y3I3PwnlSQjw4UPbl2TH0Cuc3g+pQiw1y3K73IC/3/V2mqqi
         KyyY8MtDqhCqOf6viMOJlHroG7X6WXHI/MVWjGC3doa1WVa4PBfkS19gEgDXdFlPPEqI
         lfnOxK46hh6/9H9k2iQPUsbKQ3Q3M6RG2oeE2JWlXPcH7Og2nM1HRT2bJpLS1c1oufjN
         IdQ8ZoypqAO0PSjcgPNPIh1wLgW6vxB/NgiGY0oJF9OkE3IgIC3Ntn/iEXkP4XthfFp6
         HqVf+aJDV0gi9NZ0JF40DF4rneM//xJUfKIo0MjImMJH/bsOYzKCCldq25vM2/81fTfb
         HCFA==
X-Gm-Message-State: AOJu0Yyj+8Tuw1q9+FSefniEtZXcRi+roQNXCvgy1kcYoe/5tAZByLTI
	aM+Nbw1Rht+CSLTP8XGeyUbJTrAQwcTLFHqzM1d6gzL3Rx+tDhmCAEp6SX3CMfZjCQrIt0K4WCd
	Yuby+7C0F0g0fR8+s4xBqXaIgS/YMpkT20gPnpGsD0h401iY3hoVoIhv/Rx29IA==
X-Gm-Gg: ASbGncvLOUhZGofmmRxtI+dsCpe02hT11gsNunujTQsjBblBxmLYRBw2mZEmNkUsERn
	BTqgBwDFwbsjNKH2neloBQI7QObYm92kMmlAj/mD353QxipuKuhzLBG43j+P4GoyVjik136Vebv
	KTvyxq6mTxV+oxpKtL1dBu3dR8aUUyKNJLjWFa2Qrci/UVc/WwK5jYl8z+kv1t3cyfkTvvP2III
	X9m8IMl7ZgrOS6wpxts4OuhiAKx7/7F0jcE6ZOP1kM8kpB+2Yt6a9oz7fY1D/SCizNglcXcj5Gf
	fnvwSA1OKH5Xsh2PBHSOlQe6hWtpR6BcRNYCYczB0Q7b/A==
X-Received: by 2002:a17:903:40c6:b0:235:f70:fd37 with SMTP id d9443c01a7336-23dee204614mr8506745ad.19.1752181883921;
        Thu, 10 Jul 2025 14:11:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlNa2UCk5k7FTMLWvw6UQJNvfPCttMnQwWDAo/7rPurjR8kL9UheWUSDb7RYnWa9zSSn9KGA==
X-Received: by 2002:a17:903:40c6:b0:235:f70:fd37 with SMTP id d9443c01a7336-23dee204614mr8506465ad.19.1752181883603;
        Thu, 10 Jul 2025 14:11:23 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:7716:65ad:9491:c054:6f2d:80ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de433e51asm27790595ad.180.2025.07.10.14.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:11:23 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 17:10:35 -0400
Subject: [PATCH 03/13] clk: imx: busy: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-clk-imx-round-rate-v1-3-5726f98e6d8d@redhat.com>
References: <20250710-clk-imx-round-rate-v1-0-5726f98e6d8d@redhat.com>
In-Reply-To: <20250710-clk-imx-round-rate-v1-0-5726f98e6d8d@redhat.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752181866; l=1695;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=lPrXiqoaFyoeQgppqZyKjenf8NouReQ9MLOykK27dRU=;
 b=ciEnG1A2klaYkTSHYFvVaoRa/pN2wjKv7PEVsBTn7Kp+Jk8Ywliy431QYRxSaXvfJ65Sw7ubU
 j/w9HsVKxwvCcqSklIqFbpTvivNQM65pYXU2jaE1sXWg+NoqQfSRPs6
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

The change to call busy->div_ops->determine_rate() instead of
busy->div_ops->round_rate() was done by hand.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/imx/clk-busy.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/imx/clk-busy.c b/drivers/clk/imx/clk-busy.c
index f163df952ccc65baf300b62048f4303b0050fd75..eb27c6fee359d12eea8381cda981eab650ddcd50 100644
--- a/drivers/clk/imx/clk-busy.c
+++ b/drivers/clk/imx/clk-busy.c
@@ -46,12 +46,12 @@ static unsigned long clk_busy_divider_recalc_rate(struct clk_hw *hw,
 	return busy->div_ops->recalc_rate(&busy->div.hw, parent_rate);
 }
 
-static long clk_busy_divider_round_rate(struct clk_hw *hw, unsigned long rate,
-					unsigned long *prate)
+static int clk_busy_divider_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
 	struct clk_busy_divider *busy = to_clk_busy_divider(hw);
 
-	return busy->div_ops->round_rate(&busy->div.hw, rate, prate);
+	return busy->div_ops->determine_rate(&busy->div.hw, req);
 }
 
 static int clk_busy_divider_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -69,7 +69,7 @@ static int clk_busy_divider_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops clk_busy_divider_ops = {
 	.recalc_rate = clk_busy_divider_recalc_rate,
-	.round_rate = clk_busy_divider_round_rate,
+	.determine_rate = clk_busy_divider_determine_rate,
 	.set_rate = clk_busy_divider_set_rate,
 };
 

-- 
2.50.0

