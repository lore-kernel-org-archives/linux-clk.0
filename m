Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391B119E7F9
	for <linux-clk@vger.kernel.org>; Sun, 10 Aug 2025 22:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754865457; cv=none; b=IHexbDfWh7hUiXO3FIgfBTtS67ljFoS+WnP8oA0vUdj8vGnwW5nIw2AW3HFbJRECnfcs4R7btgX3WPXTLTOlRHqZvVCYGGX45Z1Bz3Vzstr+4LH2F9+QccMZzqtOASwFjxCehiRyLIc07iF/ud9RxIRuXjJSTMXPregu9dAsEEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754865457; c=relaxed/simple;
	bh=meq0bX7mDoXROc9zguZ8B+x1Av8NFVxhuJLsAfGxMM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LQTmoNM06y49a9YKOt8/3qpOMmAydKHEiIUZecl1cEFpDw9Mc0L0wwPhKFdCb1XAR+ZBrzXPpMULZ61uIaHdx9hPFhRmY9B8GH6kDmBkb5bS0tKflfW+yolA0w2k3vGinNx1FaY5TtN6JI9a/6YGNfOyrPDGlM/HV5AvIFDw8ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Eq6tYMJT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Eq6tYMJT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754865455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=a+XJl/ofyE5M4mj3w7aAb/RfjRLgr/5H/Di0mrRB1LI=;
	b=Eq6tYMJTrDR387huwTWNZfj9rHDTZrSarTqbK9961jfRVEwMfidT7632B/Xf+5NJNxO81Q
	rsyh22gVR0faHunAZztTd2G6lkkJUb6NnKjmuXK8lpHRj+6xuU1h1DwdXY2UcEVnMVi7fP
	jUt247GaTEbJH77DlbrwnW5z8zgdNsU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-bLe-trIiNqOdYoUkRMUMGw-1; Sun, 10 Aug 2025 18:37:33 -0400
X-MC-Unique: bLe-trIiNqOdYoUkRMUMGw-1
X-Mimecast-MFC-AGG-ID: bLe-trIiNqOdYoUkRMUMGw_1754865453
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70747c020daso79325716d6.0
        for <linux-clk@vger.kernel.org>; Sun, 10 Aug 2025 15:37:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754865453; x=1755470253;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a+XJl/ofyE5M4mj3w7aAb/RfjRLgr/5H/Di0mrRB1LI=;
        b=eHQlNNwrTd7s5RUf5X/oOUxgYsWcNXcFJjnCiHUPucOn6CzgrqqkR+kDnQPAs2srq0
         iY4DSJoq7ZqwGGarTFxdWJWuqNsxfkgr6cxBw/r7UEje3ly2hCgnSAFgaQ4zbKr5VQRw
         ++/6tQ95C7Ien7ymSTMw1DLjIxdCXozuGnzuBBQiRUb/YiCVDFHRT9Kdazsf9SKc+FmG
         9G7uzdcLebJ3PRBU0pBgSdPdLPGZm/P62Uf3ks2bYCUtPBay8MiCSaoW1C5qTvTYDinr
         DhBik1pvJ2rAqg6qpLJOFLaS1xdI1YwLDJcOqqzm86F24KqcI0BClEfHZlKpXjEtradj
         tzKA==
X-Gm-Message-State: AOJu0YycHm1o+wHx5j1imU072ljYo0cuvnCYl41vMyI9GtAbvvUirs+u
	WOGq2/0Avk1SmqRbnf4aUEL5Ndgao5Xm2/13fRxxcUItF1KIXMsd9tBdaIoKPGbaB65X04pVDko
	Sl3gevy0b5iPltnfHGKrP9YHvaoHV2FD0GKLJjB8fyRuRXj3Cbn6a+Ka8fi3udA==
X-Gm-Gg: ASbGncuJ+OLBUGfzs/9dsYvlRdsP3fHwCuFrk0wjbHQWtalAAVLW+wcYITUn1KVsVXp
	qHP2fAgw3eFOZet4SQRrQElJl/WEBQnfHC5A8G/lMiERyjblFPWJ9UGIbSyL7VEt8ar/ECyTz8j
	MB/+vDiPmLpGs6zhG0PEZ1CNc8KGlhp1UQw3tKVPMAzrvHyllrkFe/pPBdTggDe6GgdpannB9he
	LuJBL8HYOaE6DHsW3bPo8oKYs7zAj3eHeBxmqSD1zH+BkgeWVLozK2FYYp7gqJKoNWH/uuMeCrW
	bDe0LpEk4covfJPtHcDWnu9/rqGPe+zqBW2u0Uqgf7TjGOqnIgJB11OR5DwLLspa8emBU2VFVUj
	TwFtrBg==
X-Received: by 2002:a05:6214:f21:b0:707:3c3c:39ed with SMTP id 6a1803df08f44-7099b655f18mr151097656d6.0.1754865452736;
        Sun, 10 Aug 2025 15:37:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzCJW32oe98GKQXmd85A7B5PLB1EPuwgRFHWt7z/lpPyjUYJGVx8hiHq2jmHPMRcrjYmpBNQ==
X-Received: by 2002:a05:6214:f21:b0:707:3c3c:39ed with SMTP id 6a1803df08f44-7099b655f18mr151097446d6.0.1754865452269;
        Sun, 10 Aug 2025 15:37:32 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077e263efcsm144763386d6.85.2025.08.10.15.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:37:31 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:37:10 -0400
Subject: [PATCH] clocksource: ingenic-sysost: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250810-clocksource-round-rate-v1-1-486ef53e45eb@redhat.com>
X-B4-Tracking: v=1; b=H4sIABUfmWgC/x3MQQrCMBBG4auUWTsQA02rVxEXYfJrByWRiS2F0
 rs3dPkt3tuowhSV7t1GhkWrltxwvXQkU8xvsKZm8s73bvA3lm+RTy2zCdjKnBNb/INHRIQUnCA
 M1OKf4aXrOX489/0A3e4FmmgAAAA=
X-Change-ID: 20250729-clocksource-round-rate-8eae6d60ce67
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Maxime Ripard <mripard@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754865441; l=6634;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=meq0bX7mDoXROc9zguZ8B+x1Av8NFVxhuJLsAfGxMM0=;
 b=07y06Mp/1nerDBs5szSBwoA7sp3zjViOMSYcOsDPZb+WUlA1fKy2L1L81AmRJOd0xc9hPleCU
 QLTx6xjR1Q4D3KozgqTJNjP/ytvNAnO63+PhgerzVjEZw+tzt80P+8I
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
appended to the "under-the-cut" portion of the patch.

While changes are being made to 'struct clk_ops', let's also go ahead
and fix the formatting of set_rate so that everything lines up as
expected.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Coccinelle semantic patch is below. It's large and I don't want to
pollute the kernel changelog with the same code hundreds of times,
so that's why it's included under the cut. For subsystems with more
than one patch, I've included it on the cover letter.

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
---
 drivers/clocksource/ingenic-sysost.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/clocksource/ingenic-sysost.c b/drivers/clocksource/ingenic-sysost.c
index cb6fc2f152d467bbb2777f39eca94eb33dd4e179..e79cfb0b8e05f68896bc4e6caf6597bfe41c91a2 100644
--- a/drivers/clocksource/ingenic-sysost.c
+++ b/drivers/clocksource/ingenic-sysost.c
@@ -127,18 +127,23 @@ static u8 ingenic_ost_get_prescale(unsigned long rate, unsigned long req_rate)
 	return 2; /* /16 divider */
 }
 
-static long ingenic_ost_round_rate(struct clk_hw *hw, unsigned long req_rate,
-		unsigned long *parent_rate)
+static int ingenic_ost_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
-	unsigned long rate = *parent_rate;
+	unsigned long rate = req->best_parent_rate;
 	u8 prescale;
 
-	if (req_rate > rate)
-		return rate;
+	if (req->rate > rate) {
+		req->rate = rate;
 
-	prescale = ingenic_ost_get_prescale(rate, req_rate);
+		return 0;
+	}
+
+	prescale = ingenic_ost_get_prescale(rate, req->rate);
 
-	return rate >> (prescale * 2);
+	req->rate = rate >> (prescale * 2);
+
+	return 0;
 }
 
 static int ingenic_ost_percpu_timer_set_rate(struct clk_hw *hw, unsigned long req_rate,
@@ -175,14 +180,14 @@ static int ingenic_ost_global_timer_set_rate(struct clk_hw *hw, unsigned long re
 
 static const struct clk_ops ingenic_ost_percpu_timer_ops = {
 	.recalc_rate	= ingenic_ost_percpu_timer_recalc_rate,
-	.round_rate		= ingenic_ost_round_rate,
-	.set_rate		= ingenic_ost_percpu_timer_set_rate,
+	.determine_rate = ingenic_ost_determine_rate,
+	.set_rate	= ingenic_ost_percpu_timer_set_rate,
 };
 
 static const struct clk_ops ingenic_ost_global_timer_ops = {
 	.recalc_rate	= ingenic_ost_global_timer_recalc_rate,
-	.round_rate		= ingenic_ost_round_rate,
-	.set_rate		= ingenic_ost_global_timer_set_rate,
+	.determine_rate = ingenic_ost_determine_rate,
+	.set_rate	= ingenic_ost_global_timer_set_rate,
 };
 
 static const char * const ingenic_ost_clk_parents[] = { "ext" };

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250729-clocksource-round-rate-8eae6d60ce67

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

