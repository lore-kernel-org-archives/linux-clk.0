Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBE6246326
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 23:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752191095; cv=none; b=IChQ2deg9zZdJTEuRyupy/kizkhfR/QbS56OqEU8aBCFZEWXHNKRWdKqjnZG+SrLF9HQ3cAuC2Jr5HUqquDU/e0+1Te2v/EU7TygW/CO5JVHV+VumB6mD1NbKTo69mbXz/KX7lIwRLZuYp7vV82dYGQ/nzCwrBm2mYpKy+esyoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752191095; c=relaxed/simple;
	bh=Mg6lKUg0ZmZeW6JyF1mVcF9O9A9v/XbSlh+3Q+sOozQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I7K7IZ/xkzj5QuTTXWnL80OvgdzYxCfP6aCWr7ang/Py+bdZtODw1NFwmWc3gq44BX2dutOCz3MQBBRV1zQ1RFm1yD4hHlCuRvcx9tUisPUQJdABSVKoNELLHuI8OI96plDXpRrYt2yoJ7caEe9IGZVoY4+Rm6sX6ZbPoXtpDV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jUZz/8YT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jUZz/8YT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752191093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C+vFXF+6sAs+f0qJzoysFGKJfCbzyDXKLN+W95anZkc=;
	b=jUZz/8YTb33vxEG+3k9NOgHoNMv6YSQT8dMKWtz/tI7055Y9Q71YxERyhFJXZdNiAOkt71
	3n/pNSPyswT4NNz2YVeI/lPukJkJqqhR9rjFVVn1W9Y++8ULMkWtzH5+SUlYN8QdT5eyVy
	oWyOwmA6XMYafJwBw8Q132Wlu9k+qA8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-216-9qSebqkuNsCOdaj2C3fC9w-1; Thu, 10 Jul 2025 19:42:35 -0400
X-MC-Unique: 9qSebqkuNsCOdaj2C3fC9w-1
X-Mimecast-MFC-AGG-ID: 9qSebqkuNsCOdaj2C3fC9w_1752190955
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6ff810877aaso34686216d6.3
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 16:42:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752190955; x=1752795755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C+vFXF+6sAs+f0qJzoysFGKJfCbzyDXKLN+W95anZkc=;
        b=R1RT5D6zMDhYSw79HA8FPRBXmpyoAyUJzGAffByBCfPEcpokZeezP3LKAAD9NW+aa9
         nT6sWRhkFtw5teHhSpxL58mm0+pKx5QM4M6k4iL7G8pTDNEOWvAMRRgK0+bFl+GBYfXi
         V7QtrQ3a5AI5tohBiacWtbIcDC6bW041CFCM51bLCRW+v8BRvXSIkEqI5QcKxzBr+hcG
         83MKSAkoNK4bFgOasIQnhObOcipQNYxW6NWiXgF+SSBPI4p7nMqOeveHPgtr5C8i3PU8
         HGdj+OZk8g96b1eMAV5k6Cy7o5HU/UnJJkuuWyUsQ12vIqb5QZwT9jSuFOTerUqzpdez
         0RPg==
X-Gm-Message-State: AOJu0YzLho/e3S0nBPFGkqVNNpzyOEpOjxcuSu9tksTeQBRlq2D2SDxU
	6c8z5aecKLYLoVT3Vn+zHSgRoutfASOWZxZZpjmmDO0JP3B9oou/zRbu83OpglH5Tz+FM0S4EJH
	fGOY9JSvgBK+Nob0PsB0kUrpW5QqNnJNU4VNT2Fqj+5CqQQKnSnjaiUn9q3SArw==
X-Gm-Gg: ASbGncuOwZA9GZZYBB8Vlt16cEL+FmTjI0SJwlnO6OGIoaNLfCmxo8tA9Ddi6WTvqIw
	6a3MVR8NIuGeJDghPUnpRNw0z1NUfzh+Mn98Rm+LMKvqIFvSkdPRzawAetfdXBY5ayuZVU23CjH
	pbPNrMtbsnd870ZWdQQqeS80mGJt8XKzYGpWmIIoR9nMyle482Yhntw9WdnmzkOcogS7q8TfqcD
	4x32HlDW4tteUpgQT9QbZOwzInjccLlKpprGR6KDLpCo8MsfFpe5xS6kNFGot0kIICrXPmmRPzd
	M4UPbHWUs9pmTcSKK/aPQiR5FIY7fxiFbom3EwdjJRLnMULw2stjGp28Z5Y+pA+Oh/rs420mxNw
	tPUM=
X-Received: by 2002:a05:6214:2b0f:b0:6fa:ab49:4482 with SMTP id 6a1803df08f44-704a39c69b2mr21404196d6.35.1752190955044;
        Thu, 10 Jul 2025 16:42:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFumn70XFYKB3ncuCZuDvnrY3eq7TQ8pExUAVWgvlsUQZnKHPa4PRg6OW5Hg6N9pNtleWcQuQ==
X-Received: by 2002:a05:6214:2b0f:b0:6fa:ab49:4482 with SMTP id 6a1803df08f44-704a39c69b2mr21403936d6.35.1752190954732;
        Thu, 10 Jul 2025 16:42:34 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcde422e03sm153989385a.69.2025.07.10.16.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 16:42:33 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 19:42:16 -0400
Subject: [PATCH 1/3] ARM: OMAP1: clock: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-arm32-clk-round-rate-v1-1-a9146b77aca9@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752190949; l=2053;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=Mg6lKUg0ZmZeW6JyF1mVcF9O9A9v/XbSlh+3Q+sOozQ=;
 b=ov92GEq3BT5OONUOsWz17TkRNeO7aRt0ZTlbqbGGEi2UetR1fyivK2G2OnOxYZ6sBy6ucti7a
 gdJoDFLK4SjCrEBjFyAn/syo/iDX4IRPGYT5L0Z4Z0c9YriPb7H9LJX
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 arch/arm/mach-omap1/clock.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-omap1/clock.c b/arch/arm/mach-omap1/clock.c
index 83381e23fab983522ca01b8feffb861b02fee730..afc6404f62d39c4ddbac6f1ee04d889be6c47186 100644
--- a/arch/arm/mach-omap1/clock.c
+++ b/arch/arm/mach-omap1/clock.c
@@ -705,14 +705,21 @@ static unsigned long omap1_clk_recalc_rate(struct clk_hw *hw, unsigned long p_ra
 	return clk->rate;
 }
 
-static long omap1_clk_round_rate(struct clk_hw *hw, unsigned long rate, unsigned long *p_rate)
+static int omap1_clk_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
 {
 	struct omap1_clk *clk = to_omap1_clk(hw);
 
-	if (clk->round_rate != NULL)
-		return clk->round_rate(clk, rate, p_rate);
+	if (clk->round_rate != NULL) {
+		req->rate = clk->round_rate(clk, req->rate,
+					    &req->best_parent_rate);
 
-	return omap1_clk_recalc_rate(hw, *p_rate);
+		return 0;
+	}
+
+	req->rate = omap1_clk_recalc_rate(hw, req->best_parent_rate);
+
+	return 0;
 }
 
 static int omap1_clk_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long p_rate)
@@ -771,7 +778,7 @@ const struct clk_ops omap1_clk_gate_ops = {
 
 const struct clk_ops omap1_clk_rate_ops = {
 	.recalc_rate	= omap1_clk_recalc_rate,
-	.round_rate	= omap1_clk_round_rate,
+	.determine_rate = omap1_clk_determine_rate,
 	.set_rate	= omap1_clk_set_rate,
 	.init		= omap1_clk_init_op,
 };
@@ -784,7 +791,7 @@ const struct clk_ops omap1_clk_full_ops = {
 	.disable_unused	= omap1_clk_disable_unused,
 #endif
 	.recalc_rate	= omap1_clk_recalc_rate,
-	.round_rate	= omap1_clk_round_rate,
+	.determine_rate = omap1_clk_determine_rate,
 	.set_rate	= omap1_clk_set_rate,
 	.init		= omap1_clk_init_op,
 };

-- 
2.50.0

