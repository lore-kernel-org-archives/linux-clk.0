Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978E11FBEA2
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 23:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752190956; cv=none; b=fw5xGUqlt3n0Cd0DsgvpXA3arnSQH+5scnYDPMbs1ZsTRotKaqOknLtqd54zOGb7lFu4h7moourQzVS528Rb6dkGVn2oV+YmlwgrHIsHHvTo+q9haLhDU/GXVQ7yxtztwIQUyMH1yRFwF6VlqS1rwcearTdNmpvJlSkvnkTmfMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752190956; c=relaxed/simple;
	bh=al6nz9adATLIR7FYrUCMOsShOW+3Oeiwsw0ZybmNjqs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=m5oVe6AV0k1aiQH4a+pRBy0I5mo2Mz6oYiQD+P0kv0CVc+d3X7jWQphPTYYylXv9/FsdRSzCbtQbrbP8LOn2vOGjz7Wdh1X5vHiDtNGvQDOpiIDbulBisM4YN+Zgw6gALBQM4DP3PQyDuve+O0Mmd5iPaQTP5pnnNXoXHH71FYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Syg7dlfq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Syg7dlfq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752190953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=e94ZV7qj0UFkUQZZLwJjFJBBkRpaB6KPVGZwmSboBfo=;
	b=Syg7dlfq0fc2NtwTL2wHQJZRivsOVu8TyZRqic01i8zkGwll58nno+8eYCVW3su7EIbhC+
	EgbF7fkhfN4hlXyUUbRFOuYgbrs+fntHmsp2dDrPgUrFlFn0r8MevaHlXO/zLJk08SMpTx
	jkElJ1D3fbeScu21orEv2oCVRfHeAMs=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-_-XuBSWCPHeIZb77x5W7ig-1; Thu, 10 Jul 2025 19:42:32 -0400
X-MC-Unique: _-XuBSWCPHeIZb77x5W7ig-1
X-Mimecast-MFC-AGG-ID: _-XuBSWCPHeIZb77x5W7ig_1752190952
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fac45de153so21651436d6.2
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 16:42:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752190952; x=1752795752;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e94ZV7qj0UFkUQZZLwJjFJBBkRpaB6KPVGZwmSboBfo=;
        b=AAXGMNSZ+RBDOTYk6j573404nxflCtjrmI0xFSToj5yj4XG7EV5EcxOccoCiN4GQQh
         87oUVSFAIrwzeLL0eJg5Veg0tkchXfvE8lcG1/8vuq230+QHu+y/iHDL5Jxg7clUegwb
         nxMeFFrt6KUnCECU/ZhV0Ar/1ICpAhEKkPEYUSBKK+LP8e36S5KrMkPQ5Lby4tIA3sqM
         Yem7qyVp5CllbZqs5elqz2XwKiyIVDdoGdAN6BB0cuknpHuiVyJ6o+lZU7ZwPnbA50Kj
         3O0wpCnH9WMBYyhmXef2aezm4XFqp3qEqoeM3MERV5Xvb5l9VFIrTEFyAaYgBpvjmcR/
         rE9Q==
X-Gm-Message-State: AOJu0YzcPbL6kQRZzqRBgpT4vAhHwMW5hYiCDavrDwLLHGlKDdktMedr
	TjPxEVrg8HEVDRfMk3cIzcE6sZbCeo7XjH7k8qKwh8crWDn4lTJdpDnCm/GeRItm/Vc3LmiYmrG
	mUQNuVX2Bm+L0Q48T8hxEqU0dI0qrdkSukOg8IF/Ug3jW8qiNpePjm59a7Du0RA==
X-Gm-Gg: ASbGnctsSbV0u43Rt0nRbYv8GZmlt6tXQLMsGCMPzuQA2JJpbuUxDiqwvSFZUZIOgpa
	404qZqMmRfvjeMw1Xxo59uHUcy6wA4Ipy3gIWOq4vMWQjuq1xrLBe45GpKAJKR4BLDjkMxkr+Qg
	ZI7JA4OWmH0XHosUJDn7/dxaNnqQqKbAliBZyekIn2ozK2bSxG1HYzpDy/JLlghvoIyQLs2v71r
	8F7c/mZ4B3p4oMLUyyUqpuny4gpEtAVYVJZ3fYKEjZ+v6zU7eV7ga9JSinTVKVUQMrHw7kLE1mI
	AnSNTKYveQ80RFLZvJpTNEYk1cnREP8UTMFi1UvtzCql3uL8Q+oJl0YGfO+Kp4Ap3VkgdHz2s2E
	EVwM=
X-Received: by 2002:a05:6214:4286:b0:6fd:75ef:3dc3 with SMTP id 6a1803df08f44-704a3878fe0mr20570976d6.28.1752190951847;
        Thu, 10 Jul 2025 16:42:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJPET4l5Q7pb7AJesD0qMFA+J1X+JY68upvMvP5yWTEV64eVycbSgaCQEqLya1yThh36Ihxg==
X-Received: by 2002:a05:6214:4286:b0:6fd:75ef:3dc3 with SMTP id 6a1803df08f44-704a3878fe0mr20570546d6.28.1752190951467;
        Thu, 10 Jul 2025 16:42:31 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcde422e03sm153989385a.69.2025.07.10.16.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 16:42:30 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/3] ARM: convert from clk round_rate() to determine_rate()
Date: Thu, 10 Jul 2025 19:42:15 -0400
Message-Id: <20250710-arm32-clk-round-rate-v1-0-a9146b77aca9@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANhPcGgC/x3MQQqEMAxA0atI1hOo0TriVYZZlDZqGK2SOiKId
 7e4fIv/T0iswgm64gTlXZIsMaN8FeBHFwdGCdlAhqx5lwadzhWhn36oyz8GVLcxsqXQ1pabljz
 kdFXu5Xi2n+913bQdPmNmAAAA
X-Change-ID: 20250710-arm32-clk-round-rate-e52d845e682c
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752190949; l=4739;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=al6nz9adATLIR7FYrUCMOsShOW+3Oeiwsw0ZybmNjqs=;
 b=3Q0yi8DRBblqOemRVD6yfPZ3j82f3KJqt3sROeWm+I3JnvzPuG213PuuABwJdF06b5Zc7bIdB
 TQ/efS5E36aDaYQpeIWnskVhTOg8xT7IYWoLqgf2UhPz/Z0uU8VOGHc
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated in the clk framework in favor
of the determine_rate() clk ops, so let's go ahead and convert the
drivers in the arm32 subsystem using the Coccinelle semantic patch
posted below. I did a few minor cosmetic cleanups of the code in a
few cases.

Coccinelle semantic patch:

    virtual patch

    // Look up the current name of the round_rate function
    @ has_round_rate @
    identifier round_rate_name =~ ".*_round_rate";
    identifier hw_param, rate_param, parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    	...
    }

    // Rename the route_rate function name to determine_rate()
    @ script:python generate_name depends on has_round_rate @
    round_rate_name << has_round_rate.round_rate_name;
    new_name;
    @@

    coccinelle.new_name = round_rate_name.replace("_round_rate", "_determine_rate")

    // Change rate to req->rate; also change occurrences of 'return XXX'.
    @ chg_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier ERR =~ "E.*";
    expression E;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    -return -ERR;
    +return -ERR;
    |
    - return rate_param;
    + return 0;
    |
    - return E;
    + req->rate = E;
    +
    + return 0;
    |
    - rate_param
    + req->rate
    )
    ...>
    }

    // Coccinelle only transforms the first occurrence of the rate parameter
    // Run a second time. FIXME: Is there a better way to do this?
    @ chg_rate2 depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    - rate_param
    + req->rate
    ...>
    }

    // Change parent_rate to req->best_parent_rate
    @ chg_parent_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    - *parent_rate_param
    + req->best_parent_rate
    |
    - parent_rate_param
    + &req->best_parent_rate
    )
    ...>
    }

    // Convert the function definition from round_rate() to determine_rate()
    @ func_definition depends on chg_rate @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier generate_name.new_name;
    @@

    - long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
    -               unsigned long *parent_rate_param)
    + int new_name(struct clk_hw *hw, struct clk_rate_request *req)
    {
        ...
    }

    // Update the ops from round_rate() to determine_rate()
    @ ops depends on func_definition @
    identifier has_round_rate.round_rate_name;
    identifier generate_name.new_name;
    @@

    {
        ...,
    -   .round_rate = round_rate_name,
    +   .determine_rate = new_name,
        ...,
    }

Note that I used coccinelle 1.2 instead of 1.3 since the newer version
adds unnecessary braces as described in this post.
https://lore.kernel.org/cocci/67642477-5f3e-4b2a-914d-579a54f48cbd@intel.com/

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (3):
      ARM: OMAP1: clock: convert from round_rate() to determine_rate()
      ARM: OMAP2+: clock: convert from round_rate() to determine_rate()
      ARM: versatile: clock: convert from round_rate() to determine_rate()

 arch/arm/mach-omap1/clock.c                  | 19 +++++++++++++------
 arch/arm/mach-omap2/clkt2xxx_virt_prcm_set.c | 12 +++++++-----
 arch/arm/mach-versatile/spc.c                |  9 +++++----
 3 files changed, 25 insertions(+), 15 deletions(-)
---
base-commit: b551c4e2a98a177a06148cf16505643cd2108386
change-id: 20250710-arm32-clk-round-rate-e52d845e682c

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

