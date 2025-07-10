Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C746F2FEE1C
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 21:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752181901; cv=none; b=ECiJq//Dd8b1PJOYQAG9jJthdfKAbrBjikQLZjipZJ2yzNV48KxLba+3r5DSbgG4T2JTbVByu1lxcEZUUt50b7ZDNn3kSVL2WX8tEwcy8V7O2owtlxnnzYNYNCJFlGR8E4/IhI78vd1LuuOR/lSpjww+2wXsgO0OzEUUZvMFLsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752181901; c=relaxed/simple;
	bh=VD/h4deqJxDRtMemjjzR/QMh0EFhcWSP+gpO2FdBBQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=msJKHil5uyFbYKv2Czr+JWHDXXHt3f3Wb8SYT5ibKDxDfwhb04nML3MSuwgUzSJCgyTecnArUTmsJbAwnG0iGE0MV2rVD9JKHcz8KJ847IyccXx6spZL07v1gATQxrfhCWrHt3036Lvf5DF51e5QRjPOb8LTvrs07n7YVHM/9Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=brfZIvRJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="brfZIvRJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752181899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t+c4BMiRqhsfmVjVjooOln1HDcuyuqfAoeFZzGp3Oyg=;
	b=brfZIvRJ6Wns5SQihio3pIO36fJcpmhcfuOsDjFuwZaQKn9QM2uYsaXk+ESTv8kPsEwxao
	7Sv8SRQnFdIKChtjreoZaFe7RmKiVv4aPg3lZunDmskCq4qLyj+ZX11JoTTaJIu4L5ROyF
	MaoY7h11JvP7dp3rvEfcW4lz+ZhLgYY=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-FAwaMErDNjahnJth2qESlA-1; Thu, 10 Jul 2025 17:11:37 -0400
X-MC-Unique: FAwaMErDNjahnJth2qESlA-1
X-Mimecast-MFC-AGG-ID: FAwaMErDNjahnJth2qESlA_1752181897
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-237e6963f70so20619945ad.2
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 14:11:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752181897; x=1752786697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t+c4BMiRqhsfmVjVjooOln1HDcuyuqfAoeFZzGp3Oyg=;
        b=c1gkdoDRWekY/HAO094StJxeJKKK7HCSOZ7pBGvl0J7Pft4KsiXi3EPpTM1D7+I4iZ
         tQ5VfSuiy/XVMA3PsaHlT5BEzD//OdD7iuIEZThl+rDVbxEn9VJCKZBjG9/XqkJYmDvS
         t6BEiUdee2cNCdiIzTrnQ/Xqe/oW1zwu8Lkz5xyfiLiVCsOptTsCn/dHX5jYFBfb85rG
         8R20OBhRNvu9KH2k5cVknlt/0jfRa0f2pd16+kJ6J03zEGyDBJr0o/zA76TLkgiVndrI
         ZbISy1CM3xmTodaaFITdeIkl4mtWbwnmEh7V0cFNECIl+SwjcQZtong0C7P/8ItvBzJ1
         UJDQ==
X-Gm-Message-State: AOJu0YxnnqNXk2/PxNes/7wO6wdRikhLqqBWkA3Vi7oEFNL+ySi4TWkc
	zQpO9jL5sfegU6pa4ZIqqDc5QOKtLllGtFOxOqg+A7brUO90rLzhc7k9EohnAWTg+PG+hIgmJTt
	Wlr7UJYLl/+yM7kka86w/vH/YhVzz59FZDJUG7R29vtb0N5YKj2LGsPxP3E8jzQ==
X-Gm-Gg: ASbGnct4NGvlkPGyFjE/cfO1HTIHGOuQqVGLtdIrYdP+3kQP9jbdoFGRxEP3M+AktFi
	3XEGm5P6a+xd6pb5STMTnJcNfrhi0AmTtItZ+10wsE/r/l/jlnTF9L/yK6i+FsOASfOUvzR6hTb
	f1Q8gql5rosKuKkMOkLRvXfs51sM42BmDMaDqEqXtk9KG02VZmh2VOR7NIybd//0BETqMlD5qXr
	biSHshxTmtY3mjLe2uPP1k5hja4V1mX1tdYix9Xch6kuw84ws5jGXGFnXB9X7duoUi/sFxZs+hO
	OY/NRy0Gw2agv3LjrsXFyVs4VKMUapUh2rY6ziFw91ASiQ==
X-Received: by 2002:a17:902:d4c2:b0:235:f77b:4b0e with SMTP id d9443c01a7336-23dede8f48amr9643595ad.41.1752181896821;
        Thu, 10 Jul 2025 14:11:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPRMNzco5hMf5jOp7523hX2VWgJWkY++oDzSNhjm8eOYKWsovv/oV4s5Gbjr4r11917Kcp/w==
X-Received: by 2002:a17:902:d4c2:b0:235:f77b:4b0e with SMTP id d9443c01a7336-23dede8f48amr9643185ad.41.1752181896451;
        Thu, 10 Jul 2025 14:11:36 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:7716:65ad:9491:c054:6f2d:80ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de433e51asm27790595ad.180.2025.07.10.14.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:11:35 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 17:10:38 -0400
Subject: [PATCH 06/13] clk: imx: fracn-gppll: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-clk-imx-round-rate-v1-6-5726f98e6d8d@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752181866; l=2079;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=VD/h4deqJxDRtMemjjzR/QMh0EFhcWSP+gpO2FdBBQk=;
 b=5Ui19/xk/tp/Ugea3+/nwqiHWYk2PsB/qQtwW1y5YoHaF9vuntCaSoAbXSlcQ1cptzIm0HmNV
 83NR/q7STAWB/g/gDErKl6FKo4XjXkfr7vonqPw2ysDmESMhgT4SSiT
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/imx/clk-fracn-gppll.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-fracn-gppll.c
index 85771afd4698ae6a0d8a7e82193301e187049255..090d608672508a8819dc68eedec5b8d4a2c140c8 100644
--- a/drivers/clk/imx/clk-fracn-gppll.c
+++ b/drivers/clk/imx/clk-fracn-gppll.c
@@ -134,8 +134,8 @@ imx_get_pll_settings(struct clk_fracn_gppll *pll, unsigned long rate)
 	return NULL;
 }
 
-static long clk_fracn_gppll_round_rate(struct clk_hw *hw, unsigned long rate,
-				       unsigned long *prate)
+static int clk_fracn_gppll_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
 	struct clk_fracn_gppll *pll = to_clk_fracn_gppll(hw);
 	const struct imx_fracn_gppll_rate_table *rate_table = pll->rate_table;
@@ -143,11 +143,16 @@ static long clk_fracn_gppll_round_rate(struct clk_hw *hw, unsigned long rate,
 
 	/* Assuming rate_table is in descending order */
 	for (i = 0; i < pll->rate_count; i++)
-		if (rate >= rate_table[i].rate)
-			return rate_table[i].rate;
+		if (req->rate >= rate_table[i].rate) {
+			req->rate = rate_table[i].rate;
+
+			return 0;
+		}
 
 	/* return minimum supported value */
-	return rate_table[pll->rate_count - 1].rate;
+	req->rate = rate_table[pll->rate_count - 1].rate;
+
+	return 0;
 }
 
 static unsigned long clk_fracn_gppll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
@@ -345,7 +350,7 @@ static const struct clk_ops clk_fracn_gppll_ops = {
 	.unprepare	= clk_fracn_gppll_unprepare,
 	.is_prepared	= clk_fracn_gppll_is_prepared,
 	.recalc_rate	= clk_fracn_gppll_recalc_rate,
-	.round_rate	= clk_fracn_gppll_round_rate,
+	.determine_rate = clk_fracn_gppll_determine_rate,
 	.set_rate	= clk_fracn_gppll_set_rate,
 };
 

-- 
2.50.0

