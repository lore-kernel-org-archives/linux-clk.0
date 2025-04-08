Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBD14A02
	for <linux-clk@vger.kernel.org>; Tue,  8 Apr 2025 06:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744093907; cv=none; b=Ci0RZHVwMbM4wC8YTESAxae02Ji8hoNimHTBfVxgDeL7dH0cQPXHEAqc99Wg9Kna5LwqTWtYiJtNuPZH+X02rlvvVqBoIiFQKFHUjXjLVxbxSEv22Kku0+jN4h2vFhIlg96STXMyx4hZ931+Eaer0AV1tF0MgyKJ3k/jkSqZ3LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744093907; c=relaxed/simple;
	bh=LDWixMiieb1woTIF67um7GW6klgK8GFDQr9+HrDmrCQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Dvn4n/JwNqBWKETw0/Qhisw3puFIs8blwY+9UiotgHI5DIi4nySpPzeiGtnLI5MwcMATpZ1jPK+HGJYKWpqYczpehhLm69quH1y6GxJ1tKdOqavXyZtjypLI6bk1ocLMulpz24pq7/yHTnML51s30F3NS1mBKuO/WXhd966OXWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=di2XA9Yy; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="di2XA9Yy"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30db3f3c907so47256331fa.1
        for <linux-clk@vger.kernel.org>; Mon, 07 Apr 2025 23:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744093903; x=1744698703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ORX98YSk1SNy2hJueg/F5TqpKLL+TPlVQ1FPNGGwME4=;
        b=di2XA9YyJ/JAMnksbFzpD0Zv/AmKwOzOX+r1gdAdsHh16HZVLoosiAhc7jZZWu1Ewy
         GSLTFl7IjD9q97b6Td2zlYCXk3Tg7ksb5CFM4S6H9pUTq0ooLjfxwZwpew1TXR58KOwo
         SuF9W3CjHCNg/X3cLxxLgEa1R2jUeGjHyuwDDAdDyTuB6CiwhnP14paIGofsoQDRs1Zz
         OlL9LvJ8KPXynpykj+eszRCXoqow29KUOFgMwIVgFxOTBE7H1+AjqZhmCQyQsVzeKtlv
         N6147qifPyJd8gD1n+pPhzNL0QfaYE6I0UoO6csia9+F4kWFRUeO4FK55pjp5aLhFZf6
         tqxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744093903; x=1744698703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ORX98YSk1SNy2hJueg/F5TqpKLL+TPlVQ1FPNGGwME4=;
        b=JDIkpOHduN3Y+vgcbd5dETzzM+O3QUjCL8tnR715kQddE3o71UmitD6v3h3F4Y/B0t
         kvqTK0721TSQkhRPp4hA3lc/BK+qFkBeWOd0x+d9vGaFm27yrceCxpQslzgZlw4hvfK0
         SqEDdc+jLALeWaMqBGrVMarp/nCcUkMu4cHdOrcEdFMi5IGXF+BU+pnd1PJkvG7RsFTR
         fDxt77KB3pwIqgEwkgb+vX5wWi+S3B+nfLPiPNEag7UlfpXoPObvtkNeK/QbTsoTm91g
         fBWjMRrRmqS9MRn48lcht9STL0/RW+qg+EXiXrgBwxEQGjSJSOo5U0E/et+9s0VWbzaY
         Yofw==
X-Forwarded-Encrypted: i=1; AJvYcCXLQzeMx4zQrOXWujD8dqcEKZ8Xfnict49srFiZqRCtYcWC9HpxU3LIJwI7Gb2EQPoKvlrqcfc7PK4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjUdR5STttzXpRRI/SilYt0fMChTeB0+NbJGXZrpWwT2+y//qq
	FrxuQNXm/nVJbMntDLc8m+6JmNSmdL6DeSR0k5UZ0J/fvhGg+1pt
X-Gm-Gg: ASbGnctyqRObR6bf+h+Tdod6CrjoMxVyvrkIKDxhOEpVFnSt1nLCW68Wahqj6NDcZB6
	adVwhGxd+LWi5jdSTVu8q9MN8wmSOATFb6pvuQmYg6Y3Blhh/V+RsdgMa/lFOi+SASAEqLM8E1g
	/ybiLCPG851S18D37ew1kmoCbtaZ6acOPcQxYwHOW5iXVc4bnpCEu/eAcLHH+9xAWvpuXtcVWFQ
	56oCuYEvytrOftyjN0CMTO9YHB9t0kY1G4b8/WP2OJOT2P67Vu7sIDJWrEJQNqRla4O+xZ7H864
	iUqjEtDcTD9VbT1aYl1tcaiEPeKlUqwkFO9wRfXwmizKo4/OGXp7lsiWhkdDR1ECVGE=
X-Google-Smtp-Source: AGHT+IGVMk4G7cBj7vxqRy8K2XvNzy6mPoK2OkwsHGUDZkSEYRt9KAqJNzY8PIdw+o5TykPCy55P3A==
X-Received: by 2002:a05:651c:1442:b0:30c:1002:faa8 with SMTP id 38308e7fff4ca-30f0a0f0a65mr45654541fa.7.1744093902472;
        Mon, 07 Apr 2025 23:31:42 -0700 (PDT)
Received: from localhost.localdomain ([188.243.23.53])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f03125862sm19141801fa.3.2025.04.07.23.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 23:31:41 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH 1/2] clk: rockchip: clk-pll: Fix CRU_xx_CON2 register usage
Date: Tue,  8 Apr 2025 09:31:25 +0300
Message-Id: <20250408063126.38904-1-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to RK3588 TRM, CRU_(CPLL/GPLL/etc)_CON2 register
(rate-k value) does not use highword write enable mask.
Lets fix this.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 drivers/clk/rockchip/clk-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pll.c
index 2c2abb3b4210..77ba4d6e7b5f 100644
--- a/drivers/clk/rockchip/clk-pll.c
+++ b/drivers/clk/rockchip/clk-pll.c
@@ -959,7 +959,7 @@ static int rockchip_rk3588_pll_set_params(struct rockchip_clk_pll *pll,
 		       HIWORD_UPDATE(rate->s, RK3588_PLLCON1_S_MASK, RK3588_PLLCON1_S_SHIFT),
 		       pll->reg_base + RK3399_PLLCON(1));
 
-	writel_relaxed(HIWORD_UPDATE(rate->k, RK3588_PLLCON2_K_MASK, RK3588_PLLCON2_K_SHIFT),
+	writel_relaxed((rate->k & RK3588_PLLCON2_K_MASK) << RK3588_PLLCON2_K_SHIFT,
 		       pll->reg_base + RK3399_PLLCON(2));
 
 	/* set pll power up */
-- 
2.39.1

