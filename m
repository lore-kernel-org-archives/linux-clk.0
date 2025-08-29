Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCB7224B06
	for <linux-clk@vger.kernel.org>; Fri, 29 Aug 2025 00:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756427939; cv=none; b=EUaF8MY5lTZaK4HIqikmJTqVUcI5Avu55we4SVGh0qeWDxIs9ur7R+99roMi3mKIMNDK2kvF/NdpmP+1BSu4GKWb8pKEepwY0ldAHW4nb3IqQJdfaRAr2lR+3tmy1ivu8qcXC5wWVWrzxr3Fnrk1oCbYEF9+cjSon7UWXTx41Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756427939; c=relaxed/simple;
	bh=WJxAzEZ/y8gMiDjK9rGa4K/3JOojl4uHZ0X5uecFxfU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dalpQqV4DuyyfT9JxW0tRsKwaxEF7Ly94nTiyDVMgNbQyUJ7tdMZ0EauHnm1sFFpLPr5w1enAtc4hxxLHmtqbPBf40OUqunqfgN21vfgUUIw1stbwxpWOOkQAcWgZDVPSmLuSeSVNdkfyfln+vJPgBg76HAEv6vVIq/gPR9W+Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KAut4dIs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KAut4dIs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756427937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dhN2zcFUEER4o0mfl+Pf8YKEeY54fmHrDhnJHsDDNpg=;
	b=KAut4dIsJZ+L8rjcjn91zhxYgeEUBOYlBhmkMyuF/NWwuppZ8Pq5L36CGO9YcZXX6NFZs7
	Ty5oFmgfsJc36g+uh1Y05okrbegLgNKmMnP/tuApBRJ+3ouXeCaSeUliCgefudAzrpV/z1
	wbMMnIYFtnywwpKvMVY0LJ9/rhkKIsw=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-TGscyzdRPAK6IBiua3h2qQ-1; Thu, 28 Aug 2025 20:38:55 -0400
X-MC-Unique: TGscyzdRPAK6IBiua3h2qQ-1
X-Mimecast-MFC-AGG-ID: TGscyzdRPAK6IBiua3h2qQ_1756427934
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70f9ef271a4so833816d6.0
        for <linux-clk@vger.kernel.org>; Thu, 28 Aug 2025 17:38:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756427934; x=1757032734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dhN2zcFUEER4o0mfl+Pf8YKEeY54fmHrDhnJHsDDNpg=;
        b=SzA77kwa1++VFsGh6a2js0AWULEYqpesbEDM+7bgm61pToXgMgzfxuT32eq8XASr7x
         Y20In2DJKM6atH2hg9X42Uv3/b2lrdqTzUXVq8XEsxfg17u+iqwTNK3e67mvXOr3Eg7u
         eeX/XxxLXtPU+5ORY/rT7oZItinRF4IKMkqSJZV0fUem7qTKelIs65oqeKSHszfK2LMP
         uUKbKPC/kkdj/yUaYNKS4dehA+m5J1d7n/WKUnTDe08oGVUU79UqnJmwV0u5yd1t8Kkb
         TcViVzje5I041gZfZwKcjom2qP+5LawUj3S/X9DlVJklj09eryjlKJ23Jp/+Lvdks3lV
         /I7Q==
X-Gm-Message-State: AOJu0YwuPhxqr3TSZKrCq8CxL7Fmv7Zu/Nmin50vJyc6tjyI71tRIdjC
	fauQQlIHmeGi2EkBisoTcwuCgmbuZlO6Dl9I/BPb9ZrZeFZtfXw/mNk0t9mM4rCt7fDsn+NM8SZ
	IM4CSbO5ugwEdgGA9ci0RM04P7TDJnHxHm2OrTlEOvbtEhJ0A3uk7Msi0VDzHMA==
X-Gm-Gg: ASbGnctBSATZMw2e/CS6BxP8Ovh5vm3Z4mOPNk/s3DjCcFNh9AYh/VhAJFbVusEKiCJ
	vlPZAWRgcBdO0aHENOzXJpXDhpNk70Tx8J4D/7JPmaSx3FGG8tOUR2t/rin9IO26VzwEMa17pHZ
	+jGWuImsnU0CpsgFbRMTDN2ZEgPg2ibEjsAhcoSOerm6lMgNLntTt7kd0rdDvxUrHAHGsuWpwdO
	NxinQZFcEp4JXIpI/flbXEs0kxu1jcKto5U+wsiyQfl92mmSeh+amCH5aEcGvMcCaAvnsB5X/9w
	77zoHDzabvufGDiWrhB+TcKWxfEiHvAsn/5+iCPWXe+4UF1P8BVfB/FG3oXfTphPdt/9KaNIHBT
	PzOuiDnjb2eyPkoX1yZwLCyKemiMFG6j6aQ==
X-Received: by 2002:a05:6214:48f:b0:70d:fd53:7256 with SMTP id 6a1803df08f44-70dfd53763bmr29827756d6.3.1756427934562;
        Thu, 28 Aug 2025 17:38:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEijYzk7GkyvAnuURsnBocI4vkkc9uguNYcxLJSHaK49JimJzbCk2zB1vtZtqve+KQwqSmw3A==
X-Received: by 2002:a05:6214:48f:b0:70d:fd53:7256 with SMTP id 6a1803df08f44-70dfd53763bmr29827556d6.3.1756427934193;
        Thu, 28 Aug 2025 17:38:54 -0700 (PDT)
Received: from [192.168.1.2] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70e6264141asm5588696d6.65.2025.08.28.17.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 17:38:53 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 28 Aug 2025 20:38:26 -0400
Subject: [PATCH 7/8] clk: x86: cgu: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-clk-round-rate-v2-v1-7-b97ec8ba6cc4@redhat.com>
References: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
In-Reply-To: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Michal Simek <michal.simek@amd.com>, Bjorn Andersson <andersson@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Andrea della Porta <andrea.porta@suse.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756427914; l=3470;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=WJxAzEZ/y8gMiDjK9rGa4K/3JOojl4uHZ0X5uecFxfU=;
 b=FRh6Dtp6Qu3xMrqG77h69FKmubrcLmD1DaQdhlvkUw0E6UlxV5Rv3RQ4Eg7iODuTrLGqcr72p
 gQO+ywq9rn/BM+b5lX8Ga2Eu2EAvxju51YKn1XwPasJWhPgQyJz0Qba
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/x86/clk-cgu.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/x86/clk-cgu.c b/drivers/clk/x86/clk-cgu.c
index 89b53f280aee03b7838e4656eae3571f00eaa263..d099667355f8d80785b0f43097ad10c274dd61ea 100644
--- a/drivers/clk/x86/clk-cgu.c
+++ b/drivers/clk/x86/clk-cgu.c
@@ -132,14 +132,15 @@ lgm_clk_divider_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 				   divider->flags, divider->width);
 }
 
-static long
-lgm_clk_divider_round_rate(struct clk_hw *hw, unsigned long rate,
-			   unsigned long *prate)
+static int lgm_clk_divider_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
 	struct lgm_clk_divider *divider = to_lgm_clk_divider(hw);
 
-	return divider_round_rate(hw, rate, prate, divider->table,
-				  divider->width, divider->flags);
+	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate, divider->table,
+				       divider->width, divider->flags);
+
+	return 0;
 }
 
 static int
@@ -182,7 +183,7 @@ static void lgm_clk_divider_disable(struct clk_hw *hw)
 
 static const struct clk_ops lgm_clk_divider_ops = {
 	.recalc_rate = lgm_clk_divider_recalc_rate,
-	.round_rate = lgm_clk_divider_round_rate,
+	.determine_rate = lgm_clk_divider_determine_rate,
 	.set_rate = lgm_clk_divider_set_rate,
 	.enable = lgm_clk_divider_enable,
 	.disable = lgm_clk_divider_disable,
@@ -487,15 +488,14 @@ lgm_clk_ddiv_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
-static long
-lgm_clk_ddiv_round_rate(struct clk_hw *hw, unsigned long rate,
-			unsigned long *prate)
+static int lgm_clk_ddiv_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct lgm_clk_ddiv *ddiv = to_lgm_clk_ddiv(hw);
 	u32 div, ddiv1, ddiv2;
 	u64 rate64;
 
-	div = DIV_ROUND_CLOSEST_ULL((u64)*prate, rate);
+	div = DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate, req->rate);
 
 	/* if predivide bit is enabled, modify div by factor of 2.5 */
 	if (lgm_get_clk_val(ddiv->membase, ddiv->reg, ddiv->shift2, 1)) {
@@ -503,14 +503,17 @@ lgm_clk_ddiv_round_rate(struct clk_hw *hw, unsigned long rate,
 		div = DIV_ROUND_CLOSEST_ULL((u64)div, 5);
 	}
 
-	if (div <= 0)
-		return *prate;
+	if (div <= 0) {
+		req->rate = req->best_parent_rate;
+
+		return 0;
+	}
 
 	if (lgm_clk_get_ddiv_val(div, &ddiv1, &ddiv2) != 0)
 		if (lgm_clk_get_ddiv_val(div + 1, &ddiv1, &ddiv2) != 0)
 			return -EINVAL;
 
-	rate64 = *prate;
+	rate64 = req->best_parent_rate;
 	do_div(rate64, ddiv1);
 	do_div(rate64, ddiv2);
 
@@ -520,7 +523,9 @@ lgm_clk_ddiv_round_rate(struct clk_hw *hw, unsigned long rate,
 		rate64 = DIV_ROUND_CLOSEST_ULL(rate64, 5);
 	}
 
-	return rate64;
+	req->rate = rate64;
+
+	return 0;
 }
 
 static const struct clk_ops lgm_clk_ddiv_ops = {
@@ -528,7 +533,7 @@ static const struct clk_ops lgm_clk_ddiv_ops = {
 	.enable	= lgm_clk_ddiv_enable,
 	.disable = lgm_clk_ddiv_disable,
 	.set_rate = lgm_clk_ddiv_set_rate,
-	.round_rate = lgm_clk_ddiv_round_rate,
+	.determine_rate = lgm_clk_ddiv_determine_rate,
 };
 
 int lgm_clk_register_ddiv(struct lgm_clk_provider *ctx,

-- 
2.50.1

