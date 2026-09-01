Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CD919C54E
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 23:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788306251; cv=none; b=Mvbt9aY5zEdFG4ICNFKfISXUdGs46s1uNgPqLnhXkKNikTFjD57oVl/4WyhvrafIpah6KmKL44L65v6k5CRzajLwkN1VwVVQAAI0jhPElS/V2jiyj7nKfqsN90zdzsKgxHSzXj9OR2+V7agRV5PQkLTRzY2TMp3a8X6Jd98pPW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788306251; c=relaxed/simple;
	bh=xHc9Ycv19bQxy+C9GdFXYsaB1a6KnvftuHLVSsaoVYI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OD6HD0BXe3uhNrYJzB8j8lD2ubqXsb4/akZvZqTFRZgsp5WJN1qiuBpo/OS5a8Cr9E9wWT+bTqxLx8y1EJSLSJb5cfzRRvctwMLl5ji7e1xcUUh1FoDWeIy4J1LKSj0P6TvYjipHut5tLjPbPNnnDwjp5r6Zsvtl1QYzZZg5jp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mmh7Yj8O; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mmh7Yj8O"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d9b60c652aso3984455ad.1
        for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2026 16:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788306249; x=1788911049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q1fny0bMdrHzrb/Y/AQziUWSkRiiitvwLoZ2sKa9vaw=;
        b=Mmh7Yj8Oz9e7rh1VyRWjIMWu2hDpIz+hM7p53mrHmP29fw7cSwh9JcdXO/QtKoEM/s
         F+y31s4TIBOJJMg5/js3Ssq3vhZH84pi2hZnfisc0kEKA/BVowIyThKJDes4lzG/a0/f
         rVnFdtgGdnl+gK4AVP8Cq8kqlia7wvn+aBgeViqfOfUEzNye1gn8TVEt2blg6YaPhOkt
         bRH94WfTceeRPSymdLF7Lp5CPpfmecZYBPJMlmg5T3FiZ8NO5bDy3tW783oNMLuzwKIF
         PixtvLSqs7F45unznvwf9TezAHwj5e3m6TQp9QR8jwB1VX4i9IizVQecpTIudWLtyFA4
         HHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788306249; x=1788911049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q1fny0bMdrHzrb/Y/AQziUWSkRiiitvwLoZ2sKa9vaw=;
        b=lx9S8jBohxJRK4vcKHX8z+YojNLo5R/gdiPkJWC7rNkS9Z/bZhDXn1v3zhEMtU4Xu5
         ogJfiNS2ceRV59UwIoInl9lcHvE63erEqNcZADu9OCr11dClbRlinFCXwMEpwKu7XQrU
         pj8XAOtq3ZVc8TKgvIRRmOUK5q0tZYu8vckBHW7hy9PzyF5AQ5q23qH1h8utUVEThvAe
         jC3OBhc1HKtjJu8ujfXe7iXnVSz6vLEl+mK/5pUW/ONoxPfPjK+UNJfmwQP2gVNJZu3A
         BERDRD5h6A8PG3aBOocLPlbNlBFhkpXpzm4ki4UWpzpbpTp5m/Aygzr8Q694lRsq2n+N
         nuIA==
X-Forwarded-Encrypted: i=1; AKwUvByed+t++pYsCQ62BGIbVFTqgNcFjCQzyvUKOpxFd/QfoIiNpru7+ubek8ZcMIJMQF/LKVzYmagP0k4=@vger.kernel.org
X-Gm-Message-State: AFuF++kk++WKhwNbBMwoI66jtKhu/5OKFS9/99zwjPUg7hAifkaptNF4
	SEZebIA1YFDeuj6n5YuRxff33kmjV1pstmBL9YI34p0XuOGLrJrAavfB
X-Gm-Gg: AYBFou3X8fnbXSCBZeiearNxaYUIraN7FsVP0uYwpdGajm837S0dIM5fZ7zFrLOH4hy
	w/3pJvnVjOs53WUmnwUUL8sCBJyOeZNw6zWrGEz/K+YO6LEotCqLJqy1Un4KDXhCTzWi8F0LrO3
	wzxHX7ZRqGEtkVfXz0FrCjbKFvBejvvMH3t+fePd6P5TdD3LmuyLQDlyURmkjoxi+sNT9JCXR+a
	6O9NpFv/ybTpsjyHMp7SFgyKILlARtHLZT9lqTD9o9PgWv6SXtMM4Mq/jXgJKPnjCewvOM/pyds
	U0YZZjR+U35V/Id9DWmE517uMeA94jrXdhYaaN1PdlKh9fsfvpHRZvRPOSd8DoAsqR5ZnDVC/M/
	G0htdvbm1Cv8UCXC+dG1hblVLPgYrVNNfqcANjFksQgcyk/R7PlzxCcfd3CLKORWClqmo9rmOL/
	DHfXx+sGyIRgQKd6wrbnG1OjQnLuoGXgjTX1BamWbJ8leYMYZ4WzfdbHUHtEq8RYZ8ciDgxFJcn
	KZ4rk6TjJFY269cBjSgucg6Tg==
X-Received: by 2002:a17:90b:3d81:b0:398:c150:e7b3 with SMTP id 98e67ed59e1d1-39aedf5d923mr868098a91.4.1788306249089;
        Tue, 01 Sep 2026 16:44:09 -0700 (PDT)
Received: from anarsoul-xps15.lan (d50-92-231-36.bchsia.telus.net. [50.92.231.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990baaeec3sm8299903a91.0.2026.09.01.16.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 16:44:08 -0700 (PDT)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH 1/2] clk: rockchip: rk3399: add 85.5 MHz rate to PLL rate table
Date: Tue,  1 Sep 2026 16:42:30 -0700
Message-ID: <20260901234351.190506-1-anarsoul@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

85.5 MHz is the pixel clock of the standard DMT 1366x768@60 mode,
which is the native mode of many cheap HDMI panels.

Use a 1368 MHz VCO (24 MHz * 57, already used by the existing
1368 MHz entry) with postdiv1 = postdiv2 = 4 to hit 85.5 MHz
exactly in integer mode.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 drivers/clk/rockchip/clk-rk3399.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/rockchip/clk-rk3399.c b/drivers/clk/rockchip/clk-rk3399.c
index c2b243d7a5e2..db241d2df625 100644
--- a/drivers/clk/rockchip/clk-rk3399.c
+++ b/drivers/clk/rockchip/clk-rk3399.c
@@ -98,6 +98,7 @@ static struct rockchip_pll_rate_table rk3399_pll_rates[] = {
 	RK3036_PLL_RATE( 148500000, 1, 99, 4, 4, 1, 0),
 	RK3036_PLL_RATE( 106500000, 1, 71, 4, 4, 1, 0),
 	RK3036_PLL_RATE(  96000000, 1, 64, 4, 4, 1, 0),
+	RK3036_PLL_RATE(  85500000, 1, 57, 4, 4, 1, 0),
 	RK3036_PLL_RATE(  74250000, 2, 99, 4, 4, 1, 0),
 	RK3036_PLL_RATE(  65000000, 1, 65, 6, 4, 1, 0),
 	RK3036_PLL_RATE(  54000000, 1, 54, 6, 4, 1, 0),
-- 
2.55.0

