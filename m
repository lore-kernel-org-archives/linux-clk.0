Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B629D27FD44
	for <linux-clk@vger.kernel.org>; Sat, 21 Mar 2026 09:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774086671; cv=none; b=GnJP9+n0xjMb9iUC7GhFtdopIvQbmdiS7ZNEsVLrsji1QwdvnmKLBRAdtbjG1M1pJJiTH6hc/irVPH5wTW6yRNNHUg16v4rS+XlIegDCE9GabpBrw69TkNkZ4n/P78jvQx5238i4MdXPpqKW3UfZKg+FFtgDdpxvMT+fEmn86so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774086671; c=relaxed/simple;
	bh=oYGllORQe1KtTW7SJUoYEU6wdznpdgBDarm6BDzeQYs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dJ2wfMNldSch9Do+7DrTcukSTiX4yVOP5xfSWzRVt1hYHHlP9aEJTrZcYFA53WyrY3YH7I8Pt0iuhsHOYCKzk7aW/QaIAe29aWD7JzxR89D7kkTPqZAaflGNY5f0VtC5qf3hWBStfBJspFr/QRH7OwtDgh8eKvNbKlBMG2+3gAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hVm6gEZx; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hVm6gEZx"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ab077e3f32so6280665ad.3
        for <linux-clk@vger.kernel.org>; Sat, 21 Mar 2026 02:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774086670; x=1774691470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bGQi8LEv7kZuoyjue24gJuvJD8zF1I0JZAlNaZK/Ick=;
        b=hVm6gEZx1fI8m0t2TMocpsirmw76ToBGwNd0D8B+sIRgo3O0IJm5XdpATTX3H5fOj2
         hORzgjTH35pT3BQYsMSHSkCWOVt6ZMk+OyuAv5W6bMWcDozHrUKsMBanwa5F+XebkDMc
         scQqf2SJ6oZ92XOwgL93F8fb73i5AJ+AsFpfu4S4VxVh8sXhafNIz+yDojUPLMfE/ZFR
         Uvo5rqBtxWuK/hUIiFTTe7fan+nuZS0gvzUGnpV0GOKCOyxvaK6gQmqtGufT/QjC9ZYL
         QCVna+5Z7gqegkEkKn8pEoaXRalVGEVC+x4KU/iLACmei3kcQwj+cvkHiNxdGD0mBGN0
         bU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774086670; x=1774691470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bGQi8LEv7kZuoyjue24gJuvJD8zF1I0JZAlNaZK/Ick=;
        b=Dmo1roqad9h6z2da/U5FxAaz0VKWuKEq6f6ax+0JpLnuxNOx7YKFMmk02hszEdIs+U
         WHYpXzt/FASPNVzyGA4gTF30QDCgFfOH/1+GVwKnwLVh3wQ2hm0wi50UqkpqwvdUQFOd
         VUm1BhgzRu0p1ZQABqJj0yisEudkHmj3ONZTO3DYg9elMffZVvmJAqNGFki4vBgQRUyz
         5lS9Q57jhx2g+EeafKBgrPlR+Ii2kBgNehbpT/sXTELFwDScGpga6fp8E1NSssfBdUmf
         FlB7JdasIU9F9mZ4t4MVmFtRN1MWNb97KtpQxqDY0Sxyghc/mgZyAqAXGkdV5b5Fd/db
         R+7g==
X-Forwarded-Encrypted: i=1; AJvYcCVBmvFnMkzrzSG64hNDmcpw9TQbMs85rtGcqxBBKZS0mRN2aN97D9+ytK+v/xRNU52uBXB6ohqz3V0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeWtzhtCqTKQQbvlejihdQTQi6M858uOoGWhwY8w0h5E8/WUpL
	LgoHmVEMA2ObvhAlS8PDxmSbuZ/h+woOiCbuXVMYDV9eF4tDiNblXk/o
X-Gm-Gg: ATEYQzy+A2jwJOy5D8BZtrg4mOZvZ3+5LhfHfa9Ayt8j3qB/PnvfGZklKrd84fWeq+w
	aNPBWpsKFnwvS8ksgjh9CBgqdzcRmEpH0SwfcEoftu9SUczt7Z9+CpJoPKnl3zTTx53Gj8A8n5i
	caNMNNIudI+KAfJrMbC+51LiAN2VI1q8Wa2Xd0oHjgknjAqNrPrm0wkHxZVPc3JeeeUuUnDDYWN
	wYVVbosemuEfnhu8D2KXMDjsodZDzgieJ1V8+GYX4ddagqKRZHU8HXQXMlI1AxdCSAcE8GfVBtZ
	cf5N2bDyYtSaXxk2Tf5XT4JEh/qBlB5asKMW/NZbj80IrYrVO1CWHCVwk1NJ8z8LGNFk/bgSt5W
	OKIli1pIcuMkz5SPLi2C8RdbQ0wi73Bq7fryXJF5ECgJwM24YNx9LW8eQCkHjVlnNWGxQgNLD3i
	wnCDqBZLoV0SLDwbR9cnESspJi
X-Received: by 2002:a17:902:cece:b0:2b0:69bf:a3df with SMTP id d9443c01a7336-2b0827a4fd6mr56886375ad.27.1774086670002;
        Sat, 21 Mar 2026 02:51:10 -0700 (PDT)
Received: from nuvole ([5.180.78.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083549f63sm46739095ad.30.2026.03.21.02.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 02:51:09 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: rcg2: expand frac table for mdss_pixel_clk_src
Date: Sat, 21 Mar 2026 17:50:28 +0800
Message-ID: <20260321095029.2259489-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recently, when testing 10-bit dsi C-PHY panel, clks are different
from the usual. (dsi0_phy_pll_out_dsiclk's parent is dsi0_pll_bit_clk
now (dsiclk_sel = 0)) And we failed to set dsiclk's children.

dsi_link_clk_set_rate_6g: Set clk rates: pclk=172992000, byteclk=108120000

byteclk was set first to 108120000, so the vco rate was set to
108120000 * 7 * 1 * 1 = 756840000. When we was trying to set
172992000 on mdss_pixel_clk_src later.

Since there was no matched ratio, we failed to set it. And dsiclk
divider ratio was set to 15:1 (wrong cached register value 0xf and
didn't update), we finally got 50455997, apparently wrong.

  dsi0vco_clk                1       1        0        756839941
     dsi0_pll_out_div_clk    1       1        0        756839941
        dsi0_pll_post_out_div_clk 0       0        0        216239983
        dsi0_pll_bit_clk     2       2        0        756839941
           dsi0_phy_pll_out_dsiclk 2       2        0        50455997
              disp_cc_mdss_pclk1_clk_src 1       1        0        50455997
           dsi0_pll_by_2_bit_clk 0       0        0        378419970
           dsi0_phy_pll_out_byteclk 2       2        0        108119991
              disp_cc_mdss_byte1_clk_src 2       2        0        108119991

Downstream clk_summary shows the mdss_pixel_clk_src support the
ratio(35:16)

 dsi0_phy_pll_out_dsiclk             2       2        0        378420000
     disp_cc_mdss_pclk1_clk_src       1       1        0        172992000
 dsi0_phy_pll_out_byteclk            2       2        0        108120000
     disp_cc_mdss_byte1_clk_src       2       2        0        108120000

After checking downstream source, 15:4 also seems to be supported,
add them two.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/clk/qcom/clk-rcg2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index fc696b66cc..6064a0e17d 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -1117,6 +1117,8 @@ static const struct frac_entry frac_table_pixel[] = {
 	{ 4, 9 },
 	{ 1, 1 },
 	{ 2, 3 },
+	{ 16, 35},
+	{ 4, 15},
 	{ }
 };
 
-- 
2.53.0

