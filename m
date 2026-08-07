Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E5E466AF5
	for <linux-clk@vger.kernel.org>; Fri,  7 Aug 2026 07:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786088782; cv=none; b=hKcwJV3z2NBZaVXUtwqRFQrFIMHORVCUtcxBDK5X1echKIYcPTUIXZm6h3xnJx3fUGlF1LqPNVqY1G2nP744tIYKLo/c8SHFBP3DhhUgKp2Z07cmTt0fnMmdzcuOEV87iHFydO2D+qCBaQlapbLyHCz9I72cCd3iLaUkPvHMGnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786088782; c=relaxed/simple;
	bh=cBrRSZBzfiIs4w5x58DH2PbmvBIdxlF5csil5qzrDsE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UFrq551T+ogY3AheJnmMKbXJyd7zsMtQSya7nS33YGBBwmAfE05VdZisAtFRGugfma/gRiQqRX4BEBLlOYYEyZMk8QJnTneTXHyLfcBIYDGKMwG5IVwUmRb7OyFXc4qN8t11iOQXNMTM/+Dp0M0sMIJIHORflzC5HLMfhlY/B8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=cZezGx1P; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="cZezGx1P"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c197e7e4e94so527637766b.2
        for <linux-clk@vger.kernel.org>; Fri, 07 Aug 2026 00:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1786088778; x=1786693578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4EpUKEhPEwG0aI+do6IyxUOmV1XCnX7w9rc+zv1nSjU=;
        b=cZezGx1PDvfa16Xx0hfF8KIaMDWS0wWN4/q6WJ4d721GK4fHocPPvrdlOQ6md76Hod
         yw76g6je1ybeAQxX9kyN6iSOpjljE48ClIVqocBmgpzdbwaHzt4rovs4SwnWZtSkrDzn
         /FGyw1naxb55PrCArDPRSNhMDbRJdwn2+23RehFDBwXNUPQkHTkWa+QF4C+PKW419548
         LrPhf1Ytv8Jc2Z22No8k9Y7WSyXe5K2hopLgEMnU27t5qeo60G+neWWSPKR1yYjnz5oF
         Qo2MYHkrRIhzd91BTBNV0MoiIe0fXM/nGlRrq8IHKJTZJvLUagtPpAMjgyKJkox+/c53
         VY2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088778; x=1786693578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4EpUKEhPEwG0aI+do6IyxUOmV1XCnX7w9rc+zv1nSjU=;
        b=WWCWBYJHCAaLUe4fGpW6Ggb9uQmVggxaIRRsDQLwQc4cY3Qr7z02qdjzf9ESCYfS4D
         452Fz+3OZIrxwktctvl6KYGY1YuSLL6T+QivIlTylBDuHM1Rxivkiya0d+m1kaPL/ulv
         1qOhNLKAxY7S8DaJISh2DpauH+M76aCERjMgLqdBKFk2NFwDnMPvGVyrttupRtuGkX6g
         MSHH2VUhmZI6mWCLcdLvi1tOSBmri2twrBJb8nahyl9/A7krATwXQaiFHBChBHtQfQ4W
         Bw9RGCqqe2chfVGD5guiMHw3jbJ0W/J0LkTcwh2erb3D56tqBeuDi+sM583OhF3dwN1L
         HDBg==
X-Forwarded-Encrypted: i=1; AHgh+RpF0IwujA8YPUw/e9xiUyHzKQIBru5imNAK+c1MP9AweG92fFvZC2Hq8WFyO7u5lDWKEDZEZ0kENyc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKkh2B069+g/HBiNSZ1lXNIaLUM6L95AxfXJCQg4CFoyyYoJgk
	OaMBPTTEqQZHYKVwZbIerzp58dH6+QTVlgk8JWK1CC5JezYJUJjw+noDEjoYGPrE7zD/CIaS1pk
	Fmb31Tlc=
X-Gm-Gg: AR+sD13GWtBMi2lToBZ89PSythHmWao/y5COgsZnpldVd1s8YP+X17Q8GqIh3xj75ul
	9uK88lC94WUu9A9fkVy84us2qnUGBpZhY82FWnOPEp29kTxmKuOYRFmZ0flaHeIZczzdMhHf4Vl
	Upyi7Jyjl1wa8rg9xkRV7/D+IwGLPfGCb/+XjZndxxhcY5XZTrc/AE8gguCGpv83oYVNoNrI+cB
	yCjrdCtKAaMuYS/Glr36G1gz6IhK2aA8aAGknpe76DwJXEoWkpdUB3b9RjsZpdXf0lfLv8FF6IJ
	FCoRfmOIiHuKAt3nX7DH9b/s2D7h4GSm/rD9vXEDbf4zvWVv+Pojp7xHufTKoNjLSEbAovfLLp0
	2divbQzPWjwldyyvQtEge3p1yJQn+f5dcnwbl9smvpa5Pvy0WLwq5jSZcfzHV4sWAdoy6LHB7Eg
	C8ygPdhM+fFABd3Ft7wBE2ngRGJfFTAVQVoi9Rc9waCSLQcNEzD8Not5XpY9DYa0J0xZPQJGDnQ
	2Mn8Cf1tlbAndN1xl+E6i9SdKN4U1rpB2F7lq28PPEe5SsiKrfAzw==
X-Received: by 2002:a17:907:7254:b0:c20:7a96:f7ad with SMTP id a640c23a62f3a-c207a9702b0mr147884866b.29.1786088778088;
        Fri, 07 Aug 2026 00:46:18 -0700 (PDT)
Received: from [172.16.240.102] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080c90494sm19432266b.36.2026.08.07.00.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:46:17 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 07 Aug 2026 09:46:05 +0200
Subject: [PATCH RFT 2/3] clk: qcom: gcc-hawi: Fix always-enabling PCIE_RSCC
 clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-various-pcie-clk-fix-v1-2-5caf78a599d7@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786088775; l=1552;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=cBrRSZBzfiIs4w5x58DH2PbmvBIdxlF5csil5qzrDsE=;
 b=N5RK0Mk+vQJtchHvyGUtX0e274Zxm5t2vp/CvIfbeU1YsvlfMF5mLo3lZ/iCIWtnXm05kIMcH
 uoQK334M5w1D0lj2DhnDrrbXXfCqiyVYQFbYyD+r9H5o9vf9t23S7GE
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The critical_cbrcrs array will get qcom_branch_set_clk_en() called on
each entry which will set BIT(0) to enable the clock. This is however
wrong for these two PCIE_RSCC clocks which need BIT(20) and BIT(21) set
respectively to enable them.

Fixes: 67121dad6cba ("clk: qcom: Add support for global clock controller on Hawi")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/gcc-hawi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-hawi.c b/drivers/clk/qcom/gcc-hawi.c
index 6fb5a3db9586..f1b95753c3a3 100644
--- a/drivers/clk/qcom/gcc-hawi.c
+++ b/drivers/clk/qcom/gcc-hawi.c
@@ -3692,8 +3692,6 @@ static const u32 gcc_hawi_critical_cbcrs[] = {
 	0x67084, /* GCC_PCIE_1_RSC_CORE_CLK */
 	0x43014, /* GCC_PCIE_LINK_XO_CLK */
 	0x6b088, /* GCC_PCIE_RSC_CORE_CLK */
-	0x52010, /* GCC_PCIE_RSCC_CFG_AHB_CLK */
-	0x52010, /* GCC_PCIE_RSCC_XO_CLK */
 	0x32004, /* GCC_VIDEO_AHB_CLK */
 	0x32028, /* GCC_VIDEO_XO_CLK */
 };
@@ -3763,6 +3761,10 @@ static const struct regmap_config gcc_hawi_regmap_config = {
 
 static void clk_hawi_regs_configure(struct device *dev, struct regmap *regmap)
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

