Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0932FE324
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 21:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752181899; cv=none; b=WO6iUAjzOUD2FoONLiPZm/8jkQ2BNYZZyYliWcgil4Q1g3yS2het7oDOwUJcwNN1tU4KALhWErkP0ehjipk/yHkdgtnJTSjR2fVIQ+yc9MlXwb/yoUQA+hx3c3su40OfkMY1bwKqcuMv6Nz5ZeT700DtVICnRxZl1ik2Q0GmOgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752181899; c=relaxed/simple;
	bh=3XjDCzSMZEsGst/M49lew0bIUSlQF8Nx3FY6tvatUbc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e48psYMkZ2Sut7lp7vmQsov/0f8saVAi2xWt0TW8gofzWPAKdt0dLa86HeIUieDmX/0zbm4cEKQ2/UPR2dPc9HDLX86HPF4uXUTzZAgSzoNNdGuLy+8SM+8W/Y3i4T1SBGFmLMX6lWfThvRzLDFQdQ51wE4tpAUj9/y18DRHCYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BUD33HBN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BUD33HBN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752181896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zz6/HNpI1gHN4fAaBunmqYHsn5vtfJJ4CRMBCE1FAzE=;
	b=BUD33HBNeWRU+mjIjB3WFiBYLRDK49pw9bkJH6sRmqaNZD9AskcRqVsMkLDT5Q+IdcCpFj
	S7UPDUcf13jMlX20/TckZ2PSh/RSY5/qThXQVa+Atm8L1YxlzI1zbVyQW7F06yW7IDSji8
	ttvIvp2bR9+Um45/klIG3jP5M4bnC7E=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-248-USWfe8ltNNCqmu--U0pUZQ-1; Thu, 10 Jul 2025 17:11:30 -0400
X-MC-Unique: USWfe8ltNNCqmu--U0pUZQ-1
X-Mimecast-MFC-AGG-ID: USWfe8ltNNCqmu--U0pUZQ_1752181889
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-236725af87fso22664825ad.3
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 14:11:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752181889; x=1752786689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zz6/HNpI1gHN4fAaBunmqYHsn5vtfJJ4CRMBCE1FAzE=;
        b=aYPv8ANpFNfQ/1HAj1TBHHtj6nTpftMa3VKyJXramnKkSpWJCEM10pjBVM8729IK5a
         IJbQLNzp6gAu1SeGeUeyGMBHYyAurYXMyFGizOZlUBLaOk1b9LRPmQC1u+YhW1c6pdkb
         jQxFNNAkLy0hmSRYrLgo5NKnmHKJvymUo2vdOI0LVcbinZfyMm5Pm7JouTUhBKULoBH1
         mQlzrllpe1xPQ+tvZP6qLCob4B6LYavRqDhXMIkqA5D4LdeJ431Dhi6/HPAupcsaNb9W
         xw26MI0fu3QIvli8yXs813R66UhSY4lqymP+oMTweDo7ti4OKzjPHoHbDLbyl1Bli00+
         /bgQ==
X-Gm-Message-State: AOJu0YyRwmO84R4jJ1c4xLpsMTSggd6aJBCOluY8j1ypirJm9UbmRWV6
	e7+aVuDTKd3oKUqvbSr+SE8CglOP3kb7kY0zUUnSRYXuVCU2TQlOqp5pi/EWdhdqGyFap7qrtq+
	8tYy/4HiEjVeyQl2YCHDCXXtcX92zAiYd2MsgszaOmI4VWmkHgXzZ74+He6LB/w==
X-Gm-Gg: ASbGncsjkf0dnEKucZbB5j6X5NS6vf3otiCwHztFndFmHgHXVqaYa4F5GwgryRXb8Ef
	tWV5V7hWtErXqwWkfLvfeJNvWzlrWY9FXFpDUrRarqBybOgW63ZzGPYaCvSRP7b1/C31c+3YKQN
	ZnfIc2/ny95C6FaKNxYf8aoso9FoyuN9wk3DHntXia4ze/6avbEf/6MCSyiUx3he3sDwA38xJuk
	VfzVF3LWopbLF5ilG0CAvUJCMTZK10XHCY46UHfG9eGKjeBif3DLBHqo5liX2lf1uC9J97brkO0
	8PB4OTVHimCNyX1P3aaT9bP4WWoqOLpz4XALWR51OT2QdQ==
X-Received: by 2002:a17:903:3d0e:b0:23c:6cc2:feb9 with SMTP id d9443c01a7336-23dede9e0bdmr9187495ad.45.1752181888748;
        Thu, 10 Jul 2025 14:11:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH40itlo9Q3VPwkodph6SX00btge58CCSKjrR52Pux2HyjpRrEkkomBu7+5GLThfJJL/+J/yw==
X-Received: by 2002:a17:903:3d0e:b0:23c:6cc2:feb9 with SMTP id d9443c01a7336-23dede9e0bdmr9187315ad.45.1752181888452;
        Thu, 10 Jul 2025 14:11:28 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:7716:65ad:9491:c054:6f2d:80ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de433e51asm27790595ad.180.2025.07.10.14.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:11:27 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 17:10:36 -0400
Subject: [PATCH 04/13] clk: imx: cpu: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-clk-imx-round-rate-v1-4-5726f98e6d8d@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752181866; l=1427;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=3XjDCzSMZEsGst/M49lew0bIUSlQF8Nx3FY6tvatUbc=;
 b=cZExAeUB9HVwWRLw/pA+Ktj6jaDvyzLQbPvJc/XdM+3G/yEOb+NDOTlZV8oaiYClRWR49P9Cu
 xqOnNjF0BFoDoL6ivjtSPWRBoBq1R6/6yfsdfsJwfwgf2c4wsH9udFq
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/imx/clk-cpu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/imx/clk-cpu.c b/drivers/clk/imx/clk-cpu.c
index cb6ca4cf0535bab2d9d519c46a84564711aaf209..43637cb61693845f54b3bd1b92f548b43bc30caa 100644
--- a/drivers/clk/imx/clk-cpu.c
+++ b/drivers/clk/imx/clk-cpu.c
@@ -30,12 +30,14 @@ static unsigned long clk_cpu_recalc_rate(struct clk_hw *hw,
 	return clk_get_rate(cpu->div);
 }
 
-static long clk_cpu_round_rate(struct clk_hw *hw, unsigned long rate,
-			       unsigned long *prate)
+static int clk_cpu_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
 	struct clk_cpu *cpu = to_clk_cpu(hw);
 
-	return clk_round_rate(cpu->pll, rate);
+	req->rate = clk_round_rate(cpu->pll, req->rate);
+
+	return 0;
 }
 
 static int clk_cpu_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -66,7 +68,7 @@ static int clk_cpu_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops clk_cpu_ops = {
 	.recalc_rate	= clk_cpu_recalc_rate,
-	.round_rate	= clk_cpu_round_rate,
+	.determine_rate = clk_cpu_determine_rate,
 	.set_rate	= clk_cpu_set_rate,
 };
 

-- 
2.50.0

