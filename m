Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0B53B27DB
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 05:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778651810; cv=none; b=EW8bt6k5yABODSu3CI1XCmVoGh11n2FAPYg9nPzlEMcGwIBuViB07NYJWOnB1Urwbn/0BFvlUYS7jMZGQatCWxLOEXI9KJvwaZZa2H+HvK53gFWDtva8DlLjP9prXcc/5FCpOXki3TqjPhb6I0SMfDW2uJ1nK/oNM6AmHqv3B6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778651810; c=relaxed/simple;
	bh=YoneJ14NuJ2KGDyxsoP31mSMcon3m5xuAOTGJJPt2kY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XEn7BnFLMT+SZtgBckWXtKi7KXa68zXXzNxYSEVynKXJlSQl1wnj0p3h3SBl7ivxeehUtPeTjsx9pHcVxuJnrqusY8U8aDjy0t9+YOvXAa0PQFruh7lU0LKjDhTgnK8tG8VUhIrYL4FBUnHFJ/E1iurx1lGqD3n67CJv6q+IbX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mo2eQ8a8; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mo2eQ8a8"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-366375c43c2so3728497a91.2
        for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 22:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778651806; x=1779256606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ra8FK+IjnzcQJElh4Bz008lPaSmGodsKw8/Zi9VAbNE=;
        b=Mo2eQ8a8s7Jsbw0gt3miP4XT3sYMHkOSzDUSqtDB9X1BMyH9HOeW8a30u8oqo0+USp
         kxv+SyMAgoUq7st2imtV+jkXxgnNDTwzLL5J8za6U0VKleOPtEIxtgaHOxCYwmVDfXaN
         x/mVh18q/RgqJLfL6hyeofaPxWIkyuOFd/FNlnHBZGRdxP9SBXfXW+VOgemudWudClIM
         wjDdw2M9KYRsaVNgQHtcRsjNFjYeUFJ9SG97FR6YuxrjFgl1dhMjBjLVRhC+Rvr3RwA1
         o7+PchGetUlqQlJCNMVL+hmcAQJiB+OGN/rVx96uDmSYdAw4fiexNWcPKxe2n+jd4tp2
         pWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778651806; x=1779256606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ra8FK+IjnzcQJElh4Bz008lPaSmGodsKw8/Zi9VAbNE=;
        b=HHIVu0aofjmpCxE7ADizG9nvKG2vxuqRPSNyy4ZtiEo8BVMQ9DgdZu+lpTOevepTGV
         VshsI7IL1iUMMsNyCtxvfLG/fgQpz9BTB1YWOZv2J0i3F/s8Y6o/JihWPNA2QYxi9VK5
         87l7D+6lHT+kzcPRTYJif3v6PX7WEuHawSWq8Ra1XbBY9c3nr8X454vRKzJRN+eSbkCb
         r9tOIYRHejAQfJ22hdkZdq5I668aF/0ticB2NEfHafwPYD8tdpcuW2zdaBdreibD/ZAV
         6VVHN77jPZokibIoBS4QorG5TlbytpwL2ljPUWLZZGLuaONOHiFjsJK5HkxH8ZFoy7IA
         jS+A==
X-Forwarded-Encrypted: i=1; AFNElJ/wFxVmIfV98e8/BVmbF/NhLfabY8M9X83o1IGA2mLHzDZk1yd7j2yUhdqpEOsd9dnezvgpn2dYMQM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5BkkIIgfAMA1DBBq5uAaX9/3iRqF+G7y8TIV0yLyDmBB4aNvQ
	FYuvB4cQ3Ql410WOfJtWjUJpw2pLXsLtd9eOFY4evI6+OBzEDY039BImZeJKDw==
X-Gm-Gg: Acq92OGv+8EsRJHQ43RCKr+nfdCC9tqk09xIOQlgXxL1zdHjgj72O1F9QcrrUD4N13f
	ymImcD0T0V2GYvzupoJ1JHWCbU0n/oC8/5zObI+IU27Wm57OGk8UWQ5Za34tlsdRtUhWBLIw02e
	XVTHn263kUFUWRPhpiLHDyaFkBYafD2LDdQAS5FU1CvA8u/LTOGG8Ah1QNOAFbUlmUqlTe2W0Zt
	d87rXOqbwyF3WWmGZYRyIrfkBi608jtyF2Ipl+mvAT42iWPD9W8JJ8XB/0ZI3pWSCb8Ut4euBVl
	ukk2B8VI19NfKqDYGVt5ZVm+SHeGZgb/5USgrDPp9Xnbku6WQugNU97J0fnKr3QH3nmSGRtp1xu
	GMDdzKjZeXwsqNjuvRUa1p+g71urxjXZ0D9ZCpCFMAh1weSXO+DpNCx/bJicrv1fp9ZDSHE+6xT
	F2+Mgws6hRYxpYXt9N2RZ1fqZp+eZeEr3GLC097J3E9aIShP2LoIE429G3UVfTub2cBd7GmveQ9
	GmyCbPAcN5N
X-Received: by 2002:a17:90b:1d4e:b0:368:2289:42cc with SMTP id 98e67ed59e1d1-368f4092542mr2283215a91.24.1778651806092;
        Tue, 12 May 2026 22:56:46 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368ee32822asm1785492a91.12.2026.05.12.22.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 22:56:45 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v2 1/3] clk: nuvoton: ma35d1: fix ignored div_u64 return values in PLL freq calculation
Date: Wed, 13 May 2026 13:56:24 +0800
Message-ID: <20260513055626.1070533-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513055626.1070533-1-a0987203069@gmail.com>
References: <20260513055626.1070533-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

div_u64() does not modify its argument in place; the return value must
be assigned.  Both ma35d1_calc_smic_pll_freq() and ma35d1_calc_pll_freq()
called div_u64() and discarded the result, leaving pll_freq holding the
undivided product and thus returning a frequency orders of magnitude too
high.

Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/clk/nuvoton/clk-ma35d1-pll.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1-pll.c b/drivers/clk/nuvoton/clk-ma35d1-pll.c
index 4620acfe47e8..bfedd45bd04b 100644
--- a/drivers/clk/nuvoton/clk-ma35d1-pll.c
+++ b/drivers/clk/nuvoton/clk-ma35d1-pll.c
@@ -92,7 +92,7 @@ static unsigned long ma35d1_calc_smic_pll_freq(u32 pll0_ctl0,
 	p = FIELD_GET(SPLL0_CTL0_OUTDIV, pll0_ctl0);
 	outdiv = 1 << p;
 	pll_freq = (u64)parent_rate * n;
-	div_u64(pll_freq, m * outdiv);
+	pll_freq = div_u64(pll_freq, m * outdiv);
 	return pll_freq;
 }
 
@@ -110,7 +110,7 @@ static unsigned long ma35d1_calc_pll_freq(u8 mode, u32 *reg_ctl, unsigned long p
 
 	if (mode == PLL_MODE_INT) {
 		pll_freq = (u64)parent_rate * n;
-		div_u64(pll_freq, m * p);
+		pll_freq = div_u64(pll_freq, m * p);
 	} else {
 		x = FIELD_GET(PLL_CTL1_FRAC, reg_ctl[1]);
 		/* 2 decimal places floating to integer (ex. 1.23 to 123) */
-- 
2.43.0

