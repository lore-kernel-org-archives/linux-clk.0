Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3150466B58
	for <linux-clk@vger.kernel.org>; Fri,  7 Aug 2026 07:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786088782; cv=none; b=H/cYorp/Zg0t1Jkzk3fImbTfSdYfq4LY8RyprMovJXiSi8XhdJB/NVvvp/UVDW0E4Wb8oIOj0M8Mu0QXh4G6FCN5mQ10mPlQFEZBNa2axuqS0rYBINgGznIXdxcfGw7rCAwFkoELYFXjHQ6Vx6YAFeOrmnDIjnXngCeMMNAKCC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786088782; c=relaxed/simple;
	bh=IzuyGpzwH+5W9XFy1kPfgzd/QVcGUIiyKRGNz+cEUck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U0eg90M5VcFKwB7pY2e1hBEQj8lTaNLFNWkWATT22uyTxCZxBX3nn9jNnSRDx4Xs3zPvbFVOAkduMv2+NxB4jHjh3WzDp1ifbQNoQhtV5RICNVvqemEuMfw233ED7/Pc8qJAWZURiqjEWP6wP2MAHRy6kLgy8kO6oYDYPD90Soc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=d7om+9o8; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="d7om+9o8"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2055573c8cso309691466b.3
        for <linux-clk@vger.kernel.org>; Fri, 07 Aug 2026 00:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1786088778; x=1786693578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XzVAhOy/xN1Xk3FHaKTbiIDUKHy3pS/Z2yp40xvvQRc=;
        b=d7om+9o8VMAUqvBZIl+EKRrYsJRtKOpd+tKnYmdXkVU9Dus4bJnkwKIiZvzz7WkG1o
         lEBzdkiJ6KS3J7WVKcBbeys5ec0Fcea3O45UgS8XUoKVg3LOY4nqs6FNr6TnLT20s3fe
         3RcOAkF9UHX9JVAQsqaMr5SeaCSpfS83A6afEBGMJTI7iYeACFOPSPyGPQJCyeFnsfgD
         1fiur5/V8Ds9iKqFDQhh1hWkdCa77OYHnSLiLCOySQ/+cNDZtZ1KJ2EweFmrOb0k8YJJ
         M7h0UOPmjDliuaPNZ9P3piAh8g+49tPyMzG0WziZ+8Zld37EAXlTyOD18N4NUnoqhAja
         YLMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088778; x=1786693578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XzVAhOy/xN1Xk3FHaKTbiIDUKHy3pS/Z2yp40xvvQRc=;
        b=FNMPdCFXdxOjK8hPLIntUnP6N56IIMC3vsgzVw0m7BzskTMVK1gqQehp/hPpSADbIg
         I8oWQBfLv8jCM+PXIxKEbTjkkliB84gaHW+8MlOLDKfwAnoLsXTEMiPOjQFK6YEAWNDV
         Zy9QHXJwtH0qZR/KOYsOG3PXcNH41jU6UQxgiEdbe8P9essjr0xWOufC1vXQc2obY0al
         9N9W7fFrBISktRL7usQqKUnwhJ4S5EH0pV4Z8Co+UweJb3lA5mCyz9IxfBN6N4gK7B3l
         52BVDPylziewHr1NJ6assqo17yNB3PoF1c8aPZZ/SpYXjv8TkSTi+WvQvaUMt3muL0Yc
         UuPg==
X-Forwarded-Encrypted: i=1; AHgh+Rpvlbyw+4cj/nL5oqq8d4APqHUaFaqn7vQzfJFpMsUScTHckMPQwzuqKl+4M5w5cVPwHeF51KK1wF0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsr1k0ShlT2EIw89XQv6X5kyC9VtL32ky2Jj9D0K/ZO34E1aFi
	qtz6ojJP8FPmuiCm0PRM5ME90vMWyxNEiIz/0ivS97TlsXE3JqgVCB7UdLRuGXpqiLEc+OmvXcO
	os3aX3g0=
X-Gm-Gg: AR+sD12/4qbWW0PqwFsoLYLQPzwlAGTHoLR2tSQMoZqCE/vtoPXPIKxm6kgs0QmjYRn
	ieU8AF1b4NY9y1vmPVWEPf/LGCqKjXDHTZd+DkFxMp5bG/cA2w/ETXv22oZX/TRhM7cgGLCe4Jp
	rN2vkopHmfHENDtbeznbdoeESBG1Bt2M8Jwhpt5Mg1ym2HC2RAP+QCEzHvZL8gHgxYulsqR18bg
	4SPI+dCGN2Ycj5cXR2LRP539oIwtRweH1BmK7h9Fp9XCGBMmNHK2x/ezF7BaliYCdj+LJyqAyZb
	ixIcH5YMuR3YPpQD+goa1IRRJ9VMf9PvN67XdX75sJbEasB+rzs1dGmeJdTMR/gKMqfPUNKE7Hh
	dOLPk2I/yVszJ/fukmF7+u2rWJDxaGkg7y/lN8PQoavhgn/CnuJdq3xweHNmaeIkj49Xv+NCU/l
	FxiM+iFeWbi5sXYPlDk5dolba8bS7RaDxucAxYzRaE2UesuD+xfraNZpYBRGJ1TLkRy7dIkyXuv
	ioRTv7ZFUsVCReVhWJ3rLIaHesAJQGi4IcMw6bNo3M=
X-Received: by 2002:a17:907:930c:b0:c1f:1520:4de5 with SMTP id a640c23a62f3a-c2039afb044mr997030666b.1.1786088778628;
        Fri, 07 Aug 2026 00:46:18 -0700 (PDT)
Received: from [172.16.240.102] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080c90494sm19432266b.36.2026.08.07.00.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:46:18 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 07 Aug 2026 09:46:06 +0200
Subject: [PATCH RFT 3/3] clk: qcom: gcc-kaanapali: Fix always-enabling
 PCIE_RSCC clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-various-pcie-clk-fix-v1-3-5caf78a599d7@fairphone.com>
References: <20260807-various-pcie-clk-fix-v1-0-5caf78a599d7@fairphone.com>
In-Reply-To: <20260807-various-pcie-clk-fix-v1-0-5caf78a599d7@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>, 
 Mike Tipton <mike.tipton@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786088775; l=1581;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=IzuyGpzwH+5W9XFy1kPfgzd/QVcGUIiyKRGNz+cEUck=;
 b=ibZFcqfvuGnha1lbV0ra4kA7Omqr82sT0bdZrYoXGclvGIcsj7X/ekS9Ykm5vVp6UAF5vbRSq
 nHdnSPRXZ0iC/7swoRIH1xUKLKPeZRD1lzVpjBd0/twKVSqQbr4I0ta
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The critical_cbrcrs array will get qcom_branch_set_clk_en() called on
each entry which will set BIT(0) to enable the clock. This is however
wrong for these two PCIE_RSCC clocks which need BIT(20) and BIT(21) set
respectively to enable them.

Fixes: d1919c375f21 ("clk: qcom: Add support for Global clock controller on Kaanapali")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/gcc-kaanapali.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-kaanapali.c b/drivers/clk/qcom/gcc-kaanapali.c
index 842c1a70c691..5bcbcd178657 100644
--- a/drivers/clk/qcom/gcc-kaanapali.c
+++ b/drivers/clk/qcom/gcc-kaanapali.c
@@ -3464,8 +3464,6 @@ static const u32 gcc_kaanapali_critical_cbcrs[] = {
 	0x9f004, /* GCC_EVA_AHB_CLK */
 	0x9f024, /* GCC_EVA_XO_CLK */
 	0x71004, /* GCC_GPU_CFG_AHB_CLK */
-	0x52010, /* GCC_PCIE_RSCC_CFG_AHB_CLK */
-	0x52010, /* GCC_PCIE_RSCC_XO_CLK */
 	0x32004, /* GCC_VIDEO_AHB_CLK */
 	0x32040, /* GCC_VIDEO_XO_CLK */
 };
@@ -3480,6 +3478,10 @@ static const struct regmap_config gcc_kaanapali_regmap_config = {
 
 static void clk_kaanapali_regs_configure(struct device *dev, struct regmap *regmap)
 {
+	/* Keep clocks always enabled */
+	regmap_update_bits(regmap, 0x52010, BIT(20), BIT(20)); /* GCC_PCIE_RSCC_CFG_AHB_CLK */
+	regmap_update_bits(regmap, 0x52010, BIT(21), BIT(21)); /* GCC_PCIE_RSCC_XO_CLK */
+
 	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
 	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
 }

-- 
2.55.0

