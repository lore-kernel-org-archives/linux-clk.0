Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84AE2F198F
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 17:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752168574; cv=none; b=EV/i8xL2JDjXYiIOsmmWde5cbVKGtGgNo588W9UkHpDuVlACSUTc+lCV2gLdsOrWdunc6fUlgYRfFqjhJHH4pIeITTq2DiQOi3ptl6TjSkWyzWeh1ZkaM0SKuUCK+0t/KNt5tGmJjS+ACET1p1qptigrunwFawC2vCzUg7A29LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752168574; c=relaxed/simple;
	bh=XlP4JTqNj7IvkmiHr9tqG1K/XSMbOVFkEEzDSArtTGE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IIiY64TPryfSRqFQ6qtCW6mOO66wOIBjUj7atPbPblqtsxEc8njQD3xXwD0lTsq88lhnYt57rhU/w7+7U6L1O4rUGNiPQ3ke3LZ0vlm7mpN+Z55eqSpmZexRdE1KaYJlbXo9Y1sq+IZIjn61UjGYY1OSE7JD4KfcmV0pNzG78Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HiUIy2LK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HiUIy2LK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752168571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sJ8oLNxWrU/sJ7CRad317hP+3603UtC2qk2fILpYrUQ=;
	b=HiUIy2LKeuLoYl4LzpnNc3mgpukqjasN8JDR3UeCvAf31VEKO4bYKdk3Gwe73uptWfezRG
	WS9VNPeQGYgrpo9eT2yPXDTbaM2YKm8WNpzZbCXDlJ++dgNa1SwTN3b/kSdWRaCkXK9pT/
	d2yKhRMH5/EAYV+EL4Wx63mSQQiJyfw=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-eMjoS7N6PymZY3U1jEgi6w-1; Thu, 10 Jul 2025 13:29:28 -0400
X-MC-Unique: eMjoS7N6PymZY3U1jEgi6w-1
X-Mimecast-MFC-AGG-ID: eMjoS7N6PymZY3U1jEgi6w_1752168568
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d413a10b4cso208022685a.1
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 10:29:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752168568; x=1752773368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sJ8oLNxWrU/sJ7CRad317hP+3603UtC2qk2fILpYrUQ=;
        b=WlWj0ul+0rnvofS2Xnh/6HlQvlfNzfPDcJWIfQeWNqfGeAhsf875BH+aTf0n8jIzQV
         5/+ur2BTIl4E1hei4V6QC7lFxLAeCxx6x2galpvKN2+E82kgzFtVg51uJ9BmOiseVwZN
         9i34LaFbemInARVdVOm06ai1xgPp3d/RqEdvrT9Gdiwf5HynGS2AuJeOb8GlSvR8JtYP
         dGTsFpPIl8swcmSqOgbEhvFM3Y21LdYxSkRRoJADF2yNM7aAlzZk3pZlvhopqsChjc0Q
         46ilJZA/yBZpkw4K+hWcQR5vT60i8Tf3109r8/29EjnisoFjgBhvKnBu9fx8DbkG64d9
         QgWw==
X-Gm-Message-State: AOJu0YzyzzvsgFX/w74o/zDM20og4gSGMOr/58fuxIai4zASIAIKRHY6
	d98sj7kcvYl8PTXCENHp1rG8KLIoHKBJSvm70s29LBH3A+/IEJUbfIpb6fIgkMzdPv3PtPOnuLE
	mAAV3AkQtMTz2xD75zWwGJqCb+JnLS4t/5kZQUYE9ScYcARS2N2k7KexpMnSu1w==
X-Gm-Gg: ASbGncuPiO0HHWK4tj2sQlq1AEjmm36bLV+M6iXfXOrYsbeXUtxtpEh+Zh4hxuAZQt6
	VyTu95DoRiyUDiNrJpEmSvjQJsEgys/+hQCI5SqP0OH0VmQZXKBYovE+TwykNcrkwQVjZawvroy
	Vy5VrEAob1C2TZ5UTQbq6WGutphGmU8royxvgv8Q6ToFTdIUvsMcyJ+tNNQqyde1O7UAtf6f0no
	8u4ztEpk3jYvRvDS1xHOoRwA8iQhtLjAOSDdC1p34vxsSoFvbjPHqC/H+tWOVboS89i4kCzIb1y
	o4UMYtZwxZnNVh4rXOlz0bOkO8qNwvHDyvRLgcl+978n+FNNXEatb20BGO/D
X-Received: by 2002:a05:620a:424f:b0:7c5:4b18:c4c3 with SMTP id af79cd13be357-7ddec176d88mr56986985a.30.1752168568023;
        Thu, 10 Jul 2025 10:29:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEASrri2Ld/AclC/23zcGLdVmOlP5lvu7yYNmYy6RQLVdGij7562wfMkwtg24N0RU6BEOMwFw==
X-Received: by 2002:a05:620a:424f:b0:7c5:4b18:c4c3 with SMTP id af79cd13be357-7ddec176d88mr56981985a.30.1752168567532;
        Thu, 10 Jul 2025 10:29:27 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcde806297sm117728785a.82.2025.07.10.10.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:29:26 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:29:07 -0400
Subject: [PATCH 2/4] media: i2c: max96717: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-media-clk-round-rate-v1-2-a9617b061741@redhat.com>
References: <20250710-media-clk-round-rate-v1-0-a9617b061741@redhat.com>
In-Reply-To: <20250710-media-clk-round-rate-v1-0-a9617b061741@redhat.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Julien Massot <julien.massot@collabora.com>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752168561; l=2000;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=XlP4JTqNj7IvkmiHr9tqG1K/XSMbOVFkEEzDSArtTGE=;
 b=IZPrkyx5Mx/8rBmNEE2ncfwsaqrkNnJFwwc7DbA4LaSSjI43xyS4g6weDKPwkio7sUyOo7nCy
 eIITtwSJALwADRT1UZ4AYdPz7Y6HuPxE/mWTpvF7wnFYYBBRCfgrPZA
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/media/i2c/max96717.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
index 015e42fbe24629cc0268825ec640532a145e563b..17625fa72367bcce59b2178b8ca4fba795187d11 100644
--- a/drivers/media/i2c/max96717.c
+++ b/drivers/media/i2c/max96717.c
@@ -782,21 +782,23 @@ static unsigned int max96717_clk_find_best_index(struct max96717_priv *priv,
 	return idx;
 }
 
-static long max96717_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *parent_rate)
+static int max96717_clk_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct max96717_priv *priv = clk_hw_to_max96717(hw);
 	struct device *dev = &priv->client->dev;
 	unsigned int idx;
 
-	idx = max96717_clk_find_best_index(priv, rate);
+	idx = max96717_clk_find_best_index(priv, req->rate);
 
-	if (rate != max96717_predef_freqs[idx].freq) {
+	if (req->rate != max96717_predef_freqs[idx].freq) {
 		dev_warn(dev, "Request CLK freq:%lu, found CLK freq:%lu\n",
-			 rate, max96717_predef_freqs[idx].freq);
+			 req->rate, max96717_predef_freqs[idx].freq);
 	}
 
-	return max96717_predef_freqs[idx].freq;
+	req->rate = max96717_predef_freqs[idx].freq;
+
+	return 0;
 }
 
 static int max96717_clk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -847,7 +849,7 @@ static const struct clk_ops max96717_clk_ops = {
 	.unprepare   = max96717_clk_unprepare,
 	.set_rate    = max96717_clk_set_rate,
 	.recalc_rate = max96717_clk_recalc_rate,
-	.round_rate  = max96717_clk_round_rate,
+	.determine_rate = max96717_clk_determine_rate,
 };
 
 static int max96717_register_clkout(struct max96717_priv *priv)

-- 
2.50.0

