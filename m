Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180A13E5EC2
	for <linux-clk@vger.kernel.org>; Sat, 13 Jun 2026 12:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781354208; cv=none; b=e2ycQb8oYatuzInzrIcNRcTNRQv6bxKnzFXj7bJZ1qFpE7HqZ2nWXSVCaiVjo8zUuHiwASgmwKxEsVA/JkaHGnzUOGIqjYF5mqG1vM2ti6f0LpXjfJ9G6Fc2ByCldytmJ080nua7zrJlyKGACjwcYIlh1z0vcnGEoYv7AIL9fM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781354208; c=relaxed/simple;
	bh=gF8RhZhckQfgp5FUn7hjE8vKGpGYjIQAejgafafG/xA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=boU8btJTvX7frJxMInVN8eUUsBWEnRGYr1L56xrRcKFknXJt7CpKQ3NXXgBMGNVYhwTtgNuL9mFBA4s8LxUekEzs2Xpva2XglUcymy0SQfjFaA6GP6uLN2mf5uNFIWz33Q+0aZMdOZ1HX/sWaS+ea4xDHRps6orqZbv6OPd5mvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KOB7FD1r; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KOB7FD1r"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3078e0dcd67so2137616eec.0
        for <linux-clk@vger.kernel.org>; Sat, 13 Jun 2026 05:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781354206; x=1781959006; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1uJk1iRMlpLvy+nj2qKQd9//VxsTadPO7e314oJSE0=;
        b=KOB7FD1rf1nJrf+sZxjQho1LITR7ts1LNZLKIi71o6ucCfmXA142ou0StF1cJFvB9K
         8ARweecCXSL3MYe9PmPKNAGiNDwA5VkUqfOvljxGyuc0k10fcdqfxNR7akvKp5mt89b6
         RvETAZF2u0Q1tKBBlpmQhaKXu20QALklslp4YAQoBLcinYsVfIuzlQrDH27CChpBoxmA
         f8bnR76rkQsjUwYugDkviFPJjCoTM7Yn10LCrrp4ryZapr62lD5/yEBHF7PuPdZMKxAL
         K0SWdU/iN3DbL1mons30PWWBC1GjsELdWQbDt72uWTHsFrerYfe2XeE2YGwqHC66INeC
         sbug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781354206; x=1781959006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y1uJk1iRMlpLvy+nj2qKQd9//VxsTadPO7e314oJSE0=;
        b=XbYQ6JveePvwJdVFwHCvBIM4hNvKJKpG+sP3lG1p/AuSQ4ghxrz1esCAbekjoYBlFC
         vvNUibF3jV/LI79tW+gCGlcHZSOftluyofj/ny1MpaoK3mNtemSdKMGj6NZQS6oS50+M
         W2sJ3lCm3Ac0ruAaQjPBXs/yVSuQ68Gu7GFcvEp+4XAuxu2RGFIMfeqHQzseheSRKCsW
         PI6EsS92pAIhNSYxslye953vx01UpisriBkpccdG8Vtyw4X+BsDVpDGkGFfz8plelSym
         dn3DsuQsPo108uKbH7skd9P0eXf73HVvrqh1HbU1FxaLcK6uYjGvKIYqLn8uaCYOXa3y
         MCoA==
X-Forwarded-Encrypted: i=1; AFNElJ90pectOEVSZC23BK/x2mzvN3U2m7GFUM0f1i6EMRl+UsxQITGDLHtVjLDDQtD1DLt8RjPbZR+WbaE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq47jn7rpWZhFAFzCuJBFA0FleiXJ3c+Jp3o5lZCYEZX/UQMEM
	/lFTNCGVO2qb2a6EkL96IyxuYrRmbQgidHSqZ8+zhcurrbtRIj/Hak8rIjhgqA==
X-Gm-Gg: Acq92OGrEvtq5XtFW6m2yFzRxO7/gfrcvPwphFrox8zuzQObfryZ/0N5BdVDXA5JsIh
	l3Yca1qNMtYNclNjcCVHPNDQkwkbh7GlFBoO+X0M2p8AZ+rAsmPetYHZlOG4Can44H+cuaKGfAC
	8Fore4jHuv+d9p3gqldLkMVWMZFLKnpNEJdBXxWK6EZBrl8ic275l+TBAfYJ4L/rG51wU/GWL4l
	+78PzlzxCr0L05uQGoLJ1UDy6UQYc0ROwUXuF0+AyQKQhMOOt4Iqe3uRZh8MrE8XCu7knPQqfMq
	KK+HbBdEbmJjJj8Oy43ffOH1ilK5oVBKneFJgu2NQcRihg4zrJ5AM2xd9QC5oYBs34wwk+RhpBa
	fy8ByQdIwLseV97KVn/aQpt918onb/EWj1bxgKauXYa8F9J57YiTWEjyEXTaaBbsFCzLdpXFv+w
	6f1V7er1EgLQwWuwAKvBANWO4iqCbD
X-Received: by 2002:a05:7300:2393:b0:2cb:4b8f:b2bd with SMTP id 5a478bee46e88-30935239ecdmr1925414eec.6.1781354206251;
        Sat, 13 Jun 2026 05:36:46 -0700 (PDT)
Received: from [127.0.0.1] ([38.252.222.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb95450sm9176630eec.28.2026.06.13.05.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 05:36:45 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Sat, 13 Jun 2026 07:36:17 -0500
Subject: [PATCH v3 2/3] clk: samsung: exynos990: Add PERIS TMU_SUB_PCLK
 gate
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260613-exynos990-peris-fix-v3-v3-2-2b230db78ae4@gmail.com>
References: <20260613-exynos990-peris-fix-v3-v3-0-2b230db78ae4@gmail.com>
In-Reply-To: <20260613-exynos990-peris-fix-v3-v3-0-2b230db78ae4@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781354194; l=1529;
 i=wachiturroxd150@gmail.com; s=20250819; h=from:subject:message-id;
 bh=gF8RhZhckQfgp5FUn7hjE8vKGpGYjIQAejgafafG/xA=;
 b=o2goOlTWbYYDbCUO60rEqg8J8rmMntEATawlz4rjphBqaqRbECb5WySBkhToLSZlfPV9X+FcU
 8+sOKLSNt3fB/j+xobBQnlKfaA39bvs/+jBurupW+OOY41YPH+N4o97
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=qNvcL0Ehm3chrW9jFA2JaPVgubN5mHH//uriMxR/DlI=

Add the missing CLK_GOUT_PERIS_TMU_SUB_PCLK gate clock for the Thermal
Management Unit sub-block and update CLKS_NR_PERIS accordingly.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 drivers/clk/samsung/clk-exynos990.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-exynos990.c
index 4385c3b76dd6..ee3566b8e57c 100644
--- a/drivers/clk/samsung/clk-exynos990.c
+++ b/drivers/clk/samsung/clk-exynos990.c
@@ -21,7 +21,7 @@
 #define CLKS_NR_HSI0 (CLK_GOUT_HSI0_LHS_ACEL_D_HSI0_CLK + 1)
 #define CLKS_NR_PERIC0 (CLK_GOUT_PERIC0_SYSREG_PCLK + 1)
 #define CLKS_NR_PERIC1 (CLK_GOUT_PERIC1_XIU_P_ACLK + 1)
-#define CLKS_NR_PERIS (CLK_GOUT_PERIS_OTP_CON_TOP_OSCCLK + 1)
+#define CLKS_NR_PERIS (CLK_GOUT_PERIS_TMU_SUB_PCLK + 1)
 
 /* ---- CMU_TOP ------------------------------------------------------------- */
 
@@ -2619,6 +2619,10 @@ static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
 	     "gout_peris_d_tzpc_peris_pclk", "mout_peris_bus_user",
 	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_D_TZPC_PERIS_IPCLKPORT_PCLK,
 	     21, 0, 0),
+	GATE(CLK_GOUT_PERIS_TMU_SUB_PCLK,
+	     "gout_peris_tmu_sub_pclk", "mout_peris_bus_user",
+	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_TMU_SUB_IPCLKPORT_PCLK,
+	     21, 0, 0),
 	GATE(CLK_GOUT_PERIS_TMU_TOP_PCLK,
 	     "gout_peris_tmu_top_pclk", "mout_peris_clk_peris_gic",
 	     CLK_CON_GAT_GOUT_BLK_PERIS_UID_TMU_TOP_IPCLKPORT_PCLK,

-- 
2.54.0

