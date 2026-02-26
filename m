Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07762426D2E
	for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 18:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772129896; cv=none; b=P//XA7Ua5rwuDj5XFo815viAy5r99kg6dRktnFsbe1p2OXtCDUHICQ4eJoTnJp5YyvlvMcVcDXgY19BcpwIwPaKwNP9JbLfteZPE7uzbKPv0+3fplpdzjkclK2KbyxiAFgLtIsJLbQS6qPHJgQb5/dWTtD7hpVTL4AWyz+agh2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772129896; c=relaxed/simple;
	bh=EKn4D9pfsoVqno50Wtt27Q3vdRSw/o5+RFfqCp9TomM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dPqzjz1QcaRzYftUeThFlsTgD2b4lFlwFnkkHBHETtGSuYi3W/959d4snW4VY06tNj/gmjrSyfcPAlwsnpBU4ars/AG73WxJ5VYp0lpWrvymZ/KUS4APcNJQlRHvwfJH8qCjpQf1Xlr7G24VR6ZHHsHv4kc4azgGD0HTwUShqBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fk93jdKc; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pQrubWb+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fk93jdKc";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pQrubWb+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772129891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R8/8h7E8+kTx8XExpctGhWPiJ0TZXQbqGj0doBuTluE=;
	b=fk93jdKcyn3bQoUfhdSuo5xrrb9Gn7E2H39vON+B4/gIzhCOXJx0irWkd0E4Lttg9tET1f
	ebUqIdZ+VxHCLPvHgm4rmYclW6aM2BmvJCmKM836Igo8oiplOw8IuX9r1MZKMsjTf8TtZZ
	zOCUV8ZAfcsDUlQICKbnFezglIM8X0E=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-Wxm7zTZdNAC2M-T-n-tYwA-1; Thu, 26 Feb 2026 13:18:09 -0500
X-MC-Unique: Wxm7zTZdNAC2M-T-n-tYwA-1
X-Mimecast-MFC-AGG-ID: Wxm7zTZdNAC2M-T-n-tYwA_1772129889
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb403842b6so1020893685a.1
        for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 10:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772129889; x=1772734689; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R8/8h7E8+kTx8XExpctGhWPiJ0TZXQbqGj0doBuTluE=;
        b=pQrubWb+5jWEM5aYtJOrfuSBBVKf6uGuJrO9aYVUr3Y1jyR268vNVQRtkeCXjA8wEb
         kQvpRofLlDkvyMHxHD8OTpPaMfSfMoSuVepWWVx4cV9g9vHD7DdN7fA0n8HTXx0h3EEf
         GyRMi03piGMRPpz3wzgKO2lWwHlSEpRJ0FiPup23NBLp4gmJ9LhQ77SAzh0fleMljGtd
         ZEcwzTBg3uF0uXuHVX5rUojsd4e+W6CyNukv8UcGOGAQLaWISk/+bXAAZtXz3pds8G1r
         FUax7il4PODzodK3JvAKPbaD/DfhWk4+T5IiSbH5RBSuoHFopu/MPLWjC5tNx1gptnyz
         cTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772129889; x=1772734689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R8/8h7E8+kTx8XExpctGhWPiJ0TZXQbqGj0doBuTluE=;
        b=lbXnnrN9MWNbk2j/7golEBVWkuuZQiJm960r2y9sZNuvNNe/jDxLYfoHEdsqgNwLe2
         vZEymqmOkt7JtSHHIfaI3WmGcRWrQkz15RFvR5bR1dmteeWvWzJYz2uhaWZsJypjjriS
         hxbDGq7Cn04ZLAmVFCBkyJB3Mox2ctgjwPRZPJEXtU9KU30JPt4smDqf3kktx8YBHjUI
         FAkPmsxapc6hhb/lzaApsP4i7mFWk7a+PRSJF+dh+38lqyT+nPPbL6uPYvYVJp3lLwKK
         PLf6/r2RHerIJiKcQs9NUBYtWhpxapiE8aVxSJBeZHMk5ubAJmE8sqGJsRNuotSrcGGE
         7cHw==
X-Gm-Message-State: AOJu0Yw06TQGr8A2j0OjakELq9UM+qj3uysTOM0GcnH0JiQ5sxSksQbQ
	b1/xAhY9WWGVFWJ267jGpBaK1CSx8/UAFqxZcRMGv/skFu3t4KRkZjOeeuh2ZWR7Jxp0WwpyA5P
	J/IHMb5ghyNNRz+nGT/OSr1mc7c4fN23u8Mb2qZhHlBwpMmSF4wKPyPufCGxsaQ==
X-Gm-Gg: ATEYQzwxjZKDuhbuCtJHHBEEjwWU6zsIAkoVs0F67fFHrLneuxZEnRgPr1XWIjcI8Qo
	7JfgaY/x7ZeJ/xajpeRMhulmvV7SF6U0RilTNKE11JqOjv6nsiHyRQ+1rW4SMHLUkBZyFa2vQhT
	j1fz9VyAZEUw27wQF3f0WK/KQJyiVAvyM1gvWic97QAArD7Vz2GnOvkAb6ekwAfMJdvbaTkJ+Sd
	Wh0ufb2xvi3Aq40pWY5oW8Lojsvz2WVXaV9b5Oh3wZSSlL/RcunO7ahVA3NJ6Pv7cx+EPmTa2j9
	d/f0Odn8YFmiwRaIYhHAtpfflEys8xpddpVgJWu3LBt97+/AGoDiwvxVWwShuWKLG7TWaF2s6kT
	LnM5TW6eiR1XkW8BXRjBXOOMDdpMYAB1ieOtAoeug3Tei9ghICC0YEvIs7Pm6
X-Received: by 2002:a05:620a:1929:b0:8c7:1119:2994 with SMTP id af79cd13be357-8cbc11c90edmr372521885a.64.1772129888793;
        Thu, 26 Feb 2026 10:18:08 -0800 (PST)
X-Received: by 2002:a05:620a:1929:b0:8c7:1119:2994 with SMTP id af79cd13be357-8cbc11c90edmr372514385a.64.1772129888155;
        Thu, 26 Feb 2026 10:18:08 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf717f2bsm247046685a.35.2026.02.26.10.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 10:18:07 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 26 Feb 2026 13:16:56 -0500
Subject: [PATCH 12/13] clk: samsung: acpm: drop determine_rate op and use
 CLK_ROUNDING_FW_MANAGED flag
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-clk-det-rate-fw-managed-v1-12-4421dd2f6dc6@redhat.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2091; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=EKn4D9pfsoVqno50Wtt27Q3vdRSw/o5+RFfqCp9TomM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIX9JnE56s1Tph83jdWa1ac1Xd1ndm6PdfP9a954bFZU
 u7qtmrljlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACYyk4Xhn1mY9srEzJmn5rw2
 sTu028dALKgiO9zoj86bnu7Itz0FLgx/hVjYW249tN4UzXhUxVZ7JXeVc79zU9+1uvMnjU3v3rF
 jBAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

This clk driver has a noop determine_rate clk op. Drop this empty
function, and enable the CLK_ROUNDING_FW_MANAGED flag.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: Chanwoo Choi <cw00.choi@samsung.com>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org
---
 drivers/clk/samsung/clk-acpm.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/clk/samsung/clk-acpm.c b/drivers/clk/samsung/clk-acpm.c
index b90809ce3f882c489114c9d7299417d7fe373749..e2dffbfcdf221e31a4302074475a42481d6a829b 100644
--- a/drivers/clk/samsung/clk-acpm.c
+++ b/drivers/clk/samsung/clk-acpm.c
@@ -72,18 +72,6 @@ static unsigned long acpm_clk_recalc_rate(struct clk_hw *hw,
 					clk->mbox_chan_id, clk->id);
 }
 
-static int acpm_clk_determine_rate(struct clk_hw *hw,
-				   struct clk_rate_request *req)
-{
-	/*
-	 * We can't figure out what rate it will be, so just return the
-	 * rate back to the caller. acpm_clk_recalc_rate() will be called
-	 * after the rate is set and we'll know what rate the clock is
-	 * running at then.
-	 */
-	return 0;
-}
-
 static int acpm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 			     unsigned long parent_rate)
 {
@@ -95,7 +83,6 @@ static int acpm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops acpm_clk_ops = {
 	.recalc_rate = acpm_clk_recalc_rate,
-	.determine_rate = acpm_clk_determine_rate,
 	.set_rate = acpm_clk_set_rate,
 };
 
@@ -106,6 +93,7 @@ static int acpm_clk_register(struct device *dev, struct acpm_clk *aclk,
 
 	init.name = name;
 	init.ops = &acpm_clk_ops;
+	init.flags = CLK_ROUNDING_FW_MANAGED;
 	aclk->hw.init = &init;
 
 	return devm_clk_hw_register(dev, &aclk->hw);

-- 
2.53.0

