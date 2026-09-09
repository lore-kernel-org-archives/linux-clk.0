Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F005552947
	for <linux-clk@vger.kernel.org>; Wed,  9 Sep 2026 13:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788959662; cv=none; b=rjRCH9V+ydKAlygbEAdbItK2zYpUUyroVwB0NN3OfHcMLPrXKGgyeGY6SVHpmo7dQT36KXEvvsS5P/QMlQEGOg1laWdXfYN4TPNjhzwkkyYUUiyUg4X0PwV3kQ4ef3Fgmv21zZi0bx6ux+s05nkJ/ED8rr+wEsV7KuJCOhtfK70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788959662; c=relaxed/simple;
	bh=AKMhHGbu6wwvL+v2qkm2nawtiZ7eESFgO0bgi+Z3x0A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MCc7155r3iXL+YcEHFFDntYA5CNwYol1YCHsTeek4MarbWCQ12xNAVMAZV9Z2W9TWYKfHTLgiqKbi2irG8ZhUlDz9COrVuBxzCIAqPWnoT0BD4E2f6lKDDASkgDB+w8MmFdKIjYWiFdqDAWeo/T9RilcmEw18Nh3C08PaKHGv+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kMuTJuxY; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kMuTJuxY"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2db858d60e0so17453565ad.0
        for <linux-clk@vger.kernel.org>; Wed, 09 Sep 2026 06:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788959661; x=1789564461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TdxIn0BZ6mG5tW5oexMUWl9FnSMl6rOPl062FM+q3lY=;
        b=kMuTJuxYud2pWYrlAeE1qFoKIICjZEfX4ZWH1xelAplZn80UeBI9ceYg4NX+w+4IZN
         ia5gjvVju7H49ho5zLId1YljbBND1CnD7RKPhmjbkEFa/b1Wpk0KI84RgKai0mn8qQqo
         ApL/D8UTTHlif+h6L/GIHOG2guA5AO0U1BEsKzEAk/uhY8IsRlDmFT4wzJtNKgBt7yMP
         xI41OMZ1C9fxRYD1h3EGU2pLxDB6CDJVdSn6zKgP/lYs4yg+lvK7nVuwx4bfzaNARzsV
         PhQfsxf9waTZID87kfP90ZLYju5J8zTbnAtPM4DTmoTLlaDP890n0JZZOyGh2SSzP4g0
         b/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788959661; x=1789564461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TdxIn0BZ6mG5tW5oexMUWl9FnSMl6rOPl062FM+q3lY=;
        b=dcuoD+U1I6/+mTgWfJqxwBTd/VTr5TsnYx+ttwq5L25SDRYtO++8BK0cube1oeFQi2
         xqQJ2WGLXSLcO/n+WKlzAOZnFyPdKUto2ROL39lEaE2dRFWcDJM3GVuf97bNgrMSWHWu
         u9aScIotBbSiQsLf/abM6ogfayfUygx7sA4DAcKK8R2YgjOl4m5HRd1JTrEPvw59RSQo
         o1GPGRrgcWGlLZ877MeV5LlAoq8/EjfK0f30h8Cg4NBa3PF/xLH363QCEafa3tHMM9dA
         T4HhEiwRacV1bjA9twvcU43pT/96wkjLokd/F9uA8oUch/20XYMfsBXYE53U2eaZXKYv
         PGnA==
X-Gm-Message-State: AFuF++mDdkQyMKdqSiDIsIfrioNqfQfAaG8zxsj5YwWWamIHiyEWV83s
	DQa7iyAsHLKzm4XipX4ulwl2EThjU9IBdbws7G1ceMP24QkXfaIoEfkJ
X-Gm-Gg: AYBFou2NCkm50YeQoD3sDI/dnc/J45I065pDRM45ZRIxXvDNNnxUMEQO+wgbxdPwNVH
	kRjSaDNEjQNoN16D69nRAdFNldfAh4fPRTisUyqFiKndAiupPjcC94VlAy6PFlqnb7UEsfz0qa8
	7B4t9U/wJFJWiL4mgiLOi54TG6XgNvFlai5wIdJYpsLb6he05j8xQnKqGr38UJiDCUAaBD7Ztf2
	EApUxgbQW1ahGKeiAbFd5nNBNtHGibkO3E8Uxr5cobq67IoU2TqBxFGe2gQ4C6/i+SlwWBLAS6E
	Vj2ttFN+fqBrNnTt9ffDGp/T4qMRoxiDAh3CGyyDQRdHIrWBhlOQvs7tyq2I/eTDyS1Ushqq9zm
	x3B7Wqr0WcjKUy+VNaoEtUBVsbDRFcYtJw5mKRdCzx5Lxha8gIJcrhRSkkNXPu+5L5MfNcxMVj6
	5jh1ioRn3AyVgT/7lL7pTqHnnPIli9dtqlOVcnCbcFR8jYLfvVbv9zYUHk6Abpp/c/XgI=
X-Received: by 2002:a17:903:2c9:b0:2c9:e846:a57e with SMTP id d9443c01a7336-2db12147668mr533464705ad.0.1788959660640;
        Wed, 09 Sep 2026 06:14:20 -0700 (PDT)
Received: from zynq-vm.. ([101.71.232.51])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae8af3sm72283255ad.80.2026.09.09.06.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:14:20 -0700 (PDT)
From: shaopeijie@gmail.com
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	michal.simek@amd.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peijie Shao <shaopeijie@gmail.com>
Subject: [PATCH] clk: clocking-wizard: Fix overflow in clockout0 divisor calculation
Date: Wed,  9 Sep 2026 21:14:12 +0800
Message-Id: <20260909131412.3051635-1-shaopeijie@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peijie Shao <shaopeijie@gmail.com>

On 32-bit platforms (e.g., Zynq 7000 series), parent_rate * 1000
may overflow, leading to incorrect divisor calculation.

The issue was first found on Zynq7020 with "parent_rate=1GHz"
and "xlnx,nr-outputs=2".

Cast parent_rate to u64 and use the ULL version of DIV_ROUND*
instead.

Signed-off-by: Peijie Shao <shaopeijie@gmail.com>
---
 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index edf8c0eaca27..5abbc6b83b72 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -881,10 +881,10 @@ static int clk_wzrd_dynamic_reconfig_f(struct clk_hw *hw, unsigned long rate,
 	struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
 	void __iomem *div_addr = divider->base + divider->offset;
 
-	rate_div = DIV_ROUND_DOWN_ULL(parent_rate * 1000, rate);
+	rate_div = DIV_ROUND_DOWN_ULL((u64)parent_rate * 1000, rate);
 	clockout0_div = rate_div / 1000;
 
-	pre = DIV_ROUND_CLOSEST((parent_rate * 1000), rate);
+	pre = DIV_ROUND_CLOSEST_ULL((u64)parent_rate * 1000, rate);
 	f = (u32)(pre - (clockout0_div * 1000));
 	f = f & WZRD_CLKOUT_FRAC_MASK;
 	f = f << WZRD_CLKOUT_DIVIDE_WIDTH;
-- 
2.43.5

