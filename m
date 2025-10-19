Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7381DE3A4
	for <linux-clk@vger.kernel.org>; Sun, 19 Oct 2025 17:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760894815; cv=none; b=gGzFemQQPCj+itfICV3rOtCNAlfRHubAIczRTkPYqx3xHmIBGfDRdZQ3zuu+FdORMvrSJKoHQBJqWzRMNrRRwgnaxA/B83AN6XETq9gnNC+5Mf9Oe7ySpI4TWxuyfHLn8LXHlJ5aaguzq+GD3F9lBWxTkIYUIGfEP703EdeaHJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760894815; c=relaxed/simple;
	bh=WKISn3FBpc6krbzD+pqM1hrHFUEYtLB5hDapFGbIkww=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rie/1U5xxeX7GtCbeQuyj+uG33OqXL9B4hEBJcO++coGjqtVpdFxk4VK39CwHUumvauj6rcndfuJWL+9eFdHRDfZzizkjjXJCRHDAKNZKu+2whiFIazXjkkKgynsBWGsAMYmf/45KGlMRy3CGQd5DJFE2JxG+rjavzDmp0sYR0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J3k4fezo; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J3k4fezo"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-471193a9d9eso29840415e9.2
        for <linux-clk@vger.kernel.org>; Sun, 19 Oct 2025 10:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760894812; x=1761499612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rfk3Iz74iG04i8jgiAEKJ+IUy9T7n6c85dOHEZsHbEw=;
        b=J3k4fezoCrYQNxw0OeGbvLKOHwuK4XCqj/7H4BO3Ms2jCQLQw0XK+JxNRaW9m7LoT9
         2BqgNVAPqMmRAAyBSvX5824rm3UTsuwk/Sutu2xxF33EXz8j7+Z4i8FrDr9f9wdcFF9e
         bBMv7LztKwv1eI/MPu1p4hymQiFy9GF8Kr5Qx6WmiUQxVa38DZqcqDw/bQcKPbr1Uuvf
         7wTEhTuT8EMSgokpbpg+OaqzcUui2Fy3MKxGmhSEsIdTbrhUsivwHUwRXr1HWd5KOfz2
         Q3HObYQ17CxCk+uPDwNtJM1I+BVojNccu9ExG9ZStYkbGhze7yGl7VqNIteEtHVDUPwS
         1L3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760894812; x=1761499612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rfk3Iz74iG04i8jgiAEKJ+IUy9T7n6c85dOHEZsHbEw=;
        b=a0CMX4nBNGD9Bx2D1L/LK9oExRSRRPv8KgHalh038GoHeC9T/7lOTEQg434MGNBZgW
         Y05WWOczEF7fNm/Y1SMZpFeTYynLYDJwc2jrL6RqpFsD3a5CUeep3q5Jmq9M9bEvdThY
         8R606sunJ9fES+FTRDJsVolVP0jVhhLU8x/OC/2c08xXHq77C1Dt/bp6aakWM/VbnA+P
         JY4dQkVCo27ajID4La39d4wlqufuFqWlDjRy6ciH3AZgW4pDeqCS8T+iDhGWjd6bXPmy
         Dp747qetKIKjKAeyZHaQipBSDANc4iXakjQZ27NMUnzIREgRkRCwfmy3KtjeuP55B29F
         cjkw==
X-Forwarded-Encrypted: i=1; AJvYcCWbCvkWqEZGIAZFleTCpOevmEuKV2KHeXytv+geZl3Mwc3mjh32ngAXiyfDxRrgrefYPNwuIoqNGMM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYjmhWfic7ynJEsiKK8ZZMgAiYL11F4J6vx5C1Szvc1Ccdy3gh
	qwEC+vs70jQBgwJ3WlFwvyfsWHsAmkcG5D4Eygo9WJkCJwPXdQUNoG+t
X-Gm-Gg: ASbGnctvyvh7qY7FfufPBPT5meFZ0raQdlqb8s+Y7/purO5k75NWdL2sSKs61OfL20k
	j30R3p1r0ZtsRiVsEbSrOFjbwWk3stSQVmpXvPNKP4KCnrYze0+AnnHQ/u2BKGSoQkHyguGtWRd
	ijWD6w+EWKd1N/U7xpUakAoldHWBaMCNPW6h5nfWRPoqNR9gi7iuP+2tft4Mh0yNox684dvdzQZ
	bDRfDdSlGKx+jtNCs/296vaOBLCOZLjNTEFVaWH3RoD7cgPtiee82cjqnNuA/ChBJrdk0wx+rAy
	z/MFbo4ynOlhFaiTV3xWDzhjBA93yL7aOF3Gc3bAbz1ke6KMN89TdW/Eyju/X/ZeJE86UFNrigg
	UJFe21PFp1omK8TPYeDcMGmPnzqiNsLFKqzZBNI0Zby6aBj9ogdhl31qcfF9rUYz6XlI66v6+2B
	Iq5o3RFPwqmgrKt42kiIM1Wix/NkXvkMt3peZd0Vs4EHhSuS7ZK42l516N0Ye4AUPErA0dil624
	Cjr
X-Google-Smtp-Source: AGHT+IEPw1kFE6Cr0CGLWoQL6JabKMRRHciBsQ11hcnzheTmiOhMaQJbH3sEDwu47c9YBtVmkqG8uQ==
X-Received: by 2002:a05:600c:3b8d:b0:46e:35a0:3587 with SMTP id 5b1f17b1804b1-471179174cfmr75189675e9.27.1760894812237;
        Sun, 19 Oct 2025 10:26:52 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4715257d916sm101069715e9.4.2025.10.19.10.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 10:26:51 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org,
	samuel@sholland.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] clk: sunxi-ng: Mark A523 bus-r-cpucfg clock as critical
Date: Sun, 19 Oct 2025 19:26:47 +0200
Message-ID: <20251019172647.80379-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bus-r-cpucfg clock is important for peripheral which takes care for
powering CPU cores on and off. Since this operation is done by firmware
(TF-A), mark is as critical. That way Linux won't interfere with that
clock.

Fixes: 8cea339cfb81 ("clk: sunxi-ng: add support for the A523/T527 PRCM CCU")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
index 70ce0ca0cb7d..c5b0d4a2e397 100644
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
@@ -125,7 +125,7 @@ static SUNXI_CCU_GATE_HW(bus_r_dma_clk, "bus-r-dma",
 static SUNXI_CCU_GATE_HW(bus_r_rtc_clk, "bus-r-rtc",
 			 &r_apb0_clk.common.hw, 0x20c, BIT(0), 0);
 static SUNXI_CCU_GATE_HW(bus_r_cpucfg_clk, "bus-r-cpucfg",
-			 &r_apb0_clk.common.hw, 0x22c, BIT(0), 0);
+			 &r_apb0_clk.common.hw, 0x22c, BIT(0), CLK_IS_CRITICAL);
 
 static struct ccu_common *sun55i_a523_r_ccu_clks[] = {
 	&r_ahb_clk.common,
-- 
2.51.1.dirty

