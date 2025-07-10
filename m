Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026132FEE3B
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 21:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752181910; cv=none; b=bX4eYYDsLd8KpLG0Uq/EU1kp5GTUAT/xRW9KH6xaevReuMaTVLH4ts93k3u6hSJDW2r1qBEHKcDNj8st8IkIbMD5mi57rKobvDGsDLsK99FMau6oECsVluaw6fSbHTzy5O039NhdiZtmXTSoKQX83j8ZgonxohYPfLUztlQpx7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752181910; c=relaxed/simple;
	bh=Z9Uj9Ryz7NpcBIB9QkaT0/fa95nPsbwVCXock5kE31I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b2Kqm+zulms+AXjHIhWCbg12G6APS4DnpTl8xxHGtysSISYAwd0gQhd1E4/qHQ5W5dlkfk2BEC5Ttj6OuKNfMTlLZnaLio3U+ZWtpA7f6FyDI71zvW3L5yKLMmO/gVUQXwiBa6gepNvso52zsnyPWv0Cjo1TIshm26KeKIhm4GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XW3g5yzD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XW3g5yzD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752181907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6wMxlB9MZ68orKi/UWzRs6IFytl0SMGxxkXzUhmjEdQ=;
	b=XW3g5yzDlHkoyjz9qC7XMVgEvOo/PfHGCF1lxP9dCcTx/T7jeiEjTe66TbIo2NUPQ+J3tN
	jTm6WFQh4Qrj1n99SHZ1gx0Z/ygutwGhuSU+jOmV44e3MAZNEO6S9mD0sztQUmS3wjcGGk
	IRMLPDmp4i+Ggf5rZUKaCO4F0DUJXcs=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-wvtjuwhXOyeIE4Eohg9jPw-1; Thu, 10 Jul 2025 17:11:46 -0400
X-MC-Unique: wvtjuwhXOyeIE4Eohg9jPw-1
X-Mimecast-MFC-AGG-ID: wvtjuwhXOyeIE4Eohg9jPw_1752181905
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235089528a0so21471875ad.1
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 14:11:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752181905; x=1752786705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wMxlB9MZ68orKi/UWzRs6IFytl0SMGxxkXzUhmjEdQ=;
        b=keXEk5X8+0u8wQ62IDrtUHiIx0zWF2gkeRXaOpoMrDpgu8sBd8oJBJ1SyUqAzldCf6
         KSXUZNWja+NBeKRhPzWglcjtsm1VzlzXpaVD8zQkg3qSoaWXNlmyGREno0BBCf9lgUbh
         si5wNbGiIDUHStgnSU40xTqJMB759aZBvUF6+nrDwns+YOAwKEEZExLu435SVzNq25Jh
         VVJBDMHUvTN10E07SgLHjIekc4TgwVPdo8jJmYyu45VRY8qS3DUcZr9RriugOyPoJqGv
         Ik6q7/OGskOB/xp9xvnEm5rIn3ZT1WAZCI9yPnmxNxcaWTY9KCeMkrJ7o7ErYMM6tDEP
         fUDQ==
X-Gm-Message-State: AOJu0Ywkh34zfEROknNxEdrMXrZWwECjWROSVDWXbs8Td0SwdTdHFKau
	lqivj8OkkhwFBiMomM5cg27/1QOiqFVa4hwb2VBtQhmcFwotAFWXmm7n6oOou4+kNuTHqMI6ogZ
	YQ5P2rIZu97+Ji2AChn3PSK1vGwp4e4AEwKkJuNdgyM+und9hKWBTvgF1UYJK+g==
X-Gm-Gg: ASbGnct0fCLVUeOKOqWepVE6qeqBBKnx/lBj/jmuStB7nhKEiZIj1vSbNSfvDma9g7l
	vFdrSByONUpcDbT17sLl2m6bf4wH/tvTGVwPAiXRpUsGgXw/RSTAu/XzFflBa40GGtVmKF9jr+R
	xqvXTqMjkKcl2sLlUXmXFMNZbh/Wc2wyBunIIgXlOAUEh3aki3/06xHS6aL/3JTe5i82DKoD1H+
	w7eF0RIqg/OmweRi+Wc2aQSHSiPDdz5OcdGsYNsalHQQyFtDy77ENZi8XCJVjUnsutOKKJ7QaT6
	xjynb1wPS02HcHgq9j7IjtjjbtCtSAFdGGs4BOJh+HMCBg==
X-Received: by 2002:a17:903:2286:b0:231:9817:6ec1 with SMTP id d9443c01a7336-23dede5b1camr9198205ad.17.1752181905405;
        Thu, 10 Jul 2025 14:11:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGroYVRzkeih8y5j6Ie9SEEmZ3kfxnIjBvUsUsEOP6IfwHOfSj6KsTc2VE9xDkcqDujs4HIQ==
X-Received: by 2002:a17:903:2286:b0:231:9817:6ec1 with SMTP id d9443c01a7336-23dede5b1camr9197865ad.17.1752181904996;
        Thu, 10 Jul 2025 14:11:44 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:7716:65ad:9491:c054:6f2d:80ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de433e51asm27790595ad.180.2025.07.10.14.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:11:44 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 17:10:40 -0400
Subject: [PATCH 08/13] clk: imx: pfd: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-clk-imx-round-rate-v1-8-5726f98e6d8d@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752181866; l=1703;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=Z9Uj9Ryz7NpcBIB9QkaT0/fa95nPsbwVCXock5kE31I=;
 b=+e2l99hJrkomUi1x/QO1jHP0TlIqBGTOsAEf4gqKRSSSU7Bv5oOTumLrGf/XmrQ4c+hLQ7k7v
 OvjZou/OgaEDDrvA/1mdGibI94pnaOY+YblxFxdbczcHsxklPFhyqzb
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/imx/clk-pfd.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/imx/clk-pfd.c b/drivers/clk/imx/clk-pfd.c
index 5cf0149dfa15aab8b4cee47c8120753e3df45dac..31220fa7882b601f3535ad125114dba1eec95a9f 100644
--- a/drivers/clk/imx/clk-pfd.c
+++ b/drivers/clk/imx/clk-pfd.c
@@ -62,24 +62,26 @@ static unsigned long clk_pfd_recalc_rate(struct clk_hw *hw,
 	return tmp;
 }
 
-static long clk_pfd_round_rate(struct clk_hw *hw, unsigned long rate,
-			       unsigned long *prate)
+static int clk_pfd_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
-	u64 tmp = *prate;
+	u64 tmp = req->best_parent_rate;
 	u8 frac;
 
-	tmp = tmp * 18 + rate / 2;
-	do_div(tmp, rate);
+	tmp = tmp * 18 + req->rate / 2;
+	do_div(tmp, req->rate);
 	frac = tmp;
 	if (frac < 12)
 		frac = 12;
 	else if (frac > 35)
 		frac = 35;
-	tmp = *prate;
+	tmp = req->best_parent_rate;
 	tmp *= 18;
 	do_div(tmp, frac);
 
-	return tmp;
+	req->rate = tmp;
+
+	return 0;
 }
 
 static int clk_pfd_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -117,7 +119,7 @@ static const struct clk_ops clk_pfd_ops = {
 	.enable		= clk_pfd_enable,
 	.disable	= clk_pfd_disable,
 	.recalc_rate	= clk_pfd_recalc_rate,
-	.round_rate	= clk_pfd_round_rate,
+	.determine_rate = clk_pfd_determine_rate,
 	.set_rate	= clk_pfd_set_rate,
 	.is_enabled     = clk_pfd_is_enabled,
 };

-- 
2.50.0

