Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886A92472A1
	for <linux-clk@vger.kernel.org>; Fri, 25 Apr 2025 12:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745583191; cv=none; b=YTRzj1gRTZTb/U3SnwQ/5vsfrDQD+32cBHLZxsieTMM45D+JSJFmGo6gciz/3E4hi0+0c1b+3X4gx4BHMLoRaEWY+wdn2lqNyRbBdijkM/d5hRrrBEkqvDF1MPc3Y+UXCaRtEdOP6R1fxoVoTQhdzf88vGpJsBLRjWltHqJ8kEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745583191; c=relaxed/simple;
	bh=rRwu95YslMvsu+Rcci0u60kslf3hBNp6JZwo6cIo4nA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JQnXWNGtI2qtcCkgFwbl+Lxlr9DG6QCu1wtvLaDjpDXj3OrYPtl4C8QXijwEoFeyILA6bsVc322HGGzojsIIRI+YXYsKSjQ5XoDgNW1eDJv4jyM6LTaNa9iEVMpVRnwsJAApqUX3KRQ1fO5XVp0oyBqh9Ynn99/OjUeWmeYKX/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=jIPlfXVD; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="jIPlfXVD"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so1659873f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 25 Apr 2025 05:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745583188; x=1746187988; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=apngPycupGnScx91Binexdmj4p7UqvtJ5aGetoMuRI4=;
        b=jIPlfXVD98j8Z3PTCcP/WbO/TdBp4An477h9fCT3eyRM3RA1X5ZHCIJv8IEObpOY+h
         Oun8kEAdCElZAb0/asUD9iu7EXgqt1rzCEbxz2Z/9O7cCVutJHwsrnSK1HNTOOLS8euQ
         Gb4BFu1jYOfeOBnriUVNmTEpptgv8SxntS/nhbWN9WEatx/1YAbxnHlK2lXr7Nxzlfh2
         WVC1HBONt7++P/EGp6NlfsQ1LrOTPgmtzd+jWTrzwAPc53kyQgqRIfw0/tHAlSlazHew
         fTZO7VaekqNJPmbTNgcCsngCduUNCyeoS8Yf9ZpEnB7AdcDR7L+LUmPdwaMROSdD5In/
         3XIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745583188; x=1746187988;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=apngPycupGnScx91Binexdmj4p7UqvtJ5aGetoMuRI4=;
        b=DTJ78DMlDo3udrHfPxRsNeqjACvqg5oRFvY5XeJotiTLorgT6WZMmmyK8wCc/S9TQf
         08GaSZKPB0pP3tUEqe4KeHcLgIVnejhZHaPMM+SxEJ/F/9k7OWvSxMstmVlk30luKmwV
         bjgQ/DCHmcmouK03IX0Sd42sRBmnjDxcdLVyuYw99FEb1aF4tW2NeJr0tj0vCAqJBApr
         GqD6LMn77kueFbFHWrUNmL0fVMcT1AgihxW53TCtyhZfYBhob23p/otuOmtHJ8bgIbsC
         tazgf4f4XtXikWjrXu8+yPtzuu7TAbRLyxOq3/Leb0d84IOfvXjPZQVil2pWguaA+CKE
         0jyg==
X-Forwarded-Encrypted: i=1; AJvYcCXtFH3HzelekAHpYOvmqsq9oV+bihqIhlU4NmZooRS81sf9otEZhjik3D3EBLtWNUhfxuG66o6XPyA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXjGRNIvnLoyJesbXOAQuqJ9m7N1vbvxoUwv1OiRH3gcZgrFhE
	VEWrFmAmh/c4/jwvqV13PA6LdqomDvoVJkG2LUAe57LjE6pauiswXtWDiPyp0+A=
X-Gm-Gg: ASbGnctmNZ7o+IOte1a8he99tbo6fOysi6WBuK9bZ+tU5O+o8bE51aQY6guQ3j0W6wc
	oM9NxrJrRGxwBHmH5Pa9jY9SJv8jiRhjf3CT9Jpk2zq0nQgXoRa2HRYEa5JEaZyhWtKax6vUwAj
	P89JOV9GbbYHiCvdIRrgUgWCGSxf5MWHc2gRwojhZYbFJfRyKrRag+bCYKRvsJ79werhN3uKp56
	0UVs5FhApiEmLEl371vg54wmU7zc38RhqrdYEA9GBexm+bt6RwJYbVVf6AmKI6wbxdRS8Iyliui
	T7hPloNn7Uggz2x0/hPawJFcDvZQ96Inoj4raGUaQdbDUjfYQacLbWjnzWw5yYJEXHvYr6YPww9
	QpHMeZxcn/4ps9D4TtYoIlwW7ZMXazf1lRQNhpsj9FFlLgdh0FYcVv7u4
X-Google-Smtp-Source: AGHT+IFMnL5Y8LnDzduEntxEZZxc1p4leSZZCUul64oK8/Sk8x9QSKK3+zlLR+4iOPsIDWxwNHw62Q==
X-Received: by 2002:a5d:64a4:0:b0:39a:ca0b:e7c7 with SMTP id ffacd0b85a97d-3a074f151d7mr1473277f8f.36.1745583187809;
        Fri, 25 Apr 2025 05:13:07 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46501sm2147310f8f.73.2025.04.25.05.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 05:13:07 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/4] Add *_wait_val values for GDSCs in all SM6350 clock
 drivers
Date: Fri, 25 Apr 2025 14:12:54 +0200
Message-Id: <20250425-sm6350-gdsc-val-v1-0-1f252d9c5e4e@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEZ8C2gC/x3MSwqAMAwA0atI1gZqNCpeRVwUjRrwRwNFEO9uc
 fkWMw+YBBWDLnsgSFTT80go8gzG1R+LoE7JQI7YVcRoe12yw2WyEaPf0Luipoap5WqGVF1BZr3
 /Yz+87wfp1I/pYQAAAA==
X-Change-ID: 20250425-sm6350-gdsc-val-a0162752854f
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

As described in the commit messages, keep the GDSC configs aligned with
the downstream kernel.

For reference, this was checked using the following code:

To: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht
Cc: phone-devel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index fa5fe4c2a2ee..049fcbefba50 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -402,7 +402,7 @@ static bool gdsc_get_hwmode(struct generic_pm_domain *domain, struct device *dev
 
 static int gdsc_init(struct gdsc *sc)
 {
-	u32 mask, val;
+	u32 mask, val, tmp;
 	int on, ret;
 
 	/*
@@ -420,6 +420,14 @@ static int gdsc_init(struct gdsc *sc)
 	if (!sc->clk_dis_wait_val)
 		sc->clk_dis_wait_val = CLK_DIS_WAIT_VAL;
 
+	regmap_read(sc->regmap, sc->gdscr, &tmp);
+	if (sc->en_rest_wait_val != ((tmp >> EN_REST_WAIT_SHIFT) & 0xf))
+		printk(KERN_ERR "gdsc_init: %s en_rest_wait_val mismatch: (new) 0x%x vs 0x%x (reset)\n", sc->pd.name, sc->en_rest_wait_val, (tmp >> EN_REST_WAIT_SHIFT) & 0xf);
+	if (sc->en_few_wait_val != ((tmp >> EN_FEW_WAIT_SHIFT) & 0xf))
+		printk(KERN_ERR "gdsc_init: %s en_few_wait_val mismatch: (new) 0x%x vs 0x%x (reset)\n", sc->pd.name, sc->en_few_wait_val, (tmp >> EN_FEW_WAIT_SHIFT) & 0xf);
+	if (sc->clk_dis_wait_val != ((tmp >> CLK_DIS_WAIT_SHIFT) & 0xf))
+		printk(KERN_ERR "gdsc_init: %s clk_dis_wait_val mismatch: (new) 0x%x vs 0x%x (reset)\n", sc->pd.name, sc->clk_dis_wait_val, (tmp >> CLK_DIS_WAIT_SHIFT) & 0xf);
+
 	val = sc->en_rest_wait_val << EN_REST_WAIT_SHIFT |
 		sc->en_few_wait_val << EN_FEW_WAIT_SHIFT |
 		sc->clk_dis_wait_val << CLK_DIS_WAIT_SHIFT;

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (4):
      clk: qcom: camcc-sm6350: Add *_wait_val values for GDSCs
      clk: qcom: dispcc-sm6350: Add *_wait_val values for GDSCs
      clk: qcom: gcc-sm6350: Add *_wait_val values for GDSCs
      clk: qcom: gpucc-sm6350: Add *_wait_val values for GDSCs

 drivers/clk/qcom/camcc-sm6350.c  | 18 ++++++++++++++++++
 drivers/clk/qcom/dispcc-sm6350.c |  3 +++
 drivers/clk/qcom/gcc-sm6350.c    |  6 ++++++
 drivers/clk/qcom/gpucc-sm6350.c  |  6 ++++++
 4 files changed, 33 insertions(+)
---
base-commit: 9c32cda43eb78f78c73aee4aa344b777714e259b
change-id: 20250425-sm6350-gdsc-val-a0162752854f

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

