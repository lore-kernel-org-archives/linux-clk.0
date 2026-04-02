Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF0F344040
	for <linux-clk@vger.kernel.org>; Thu,  2 Apr 2026 02:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775096432; cv=none; b=EW5crOeMyOnU4yh62iTlcXJ9JPUKVFJqGb1Ff4MRrNmpULMbAILcXlmAFNkAeiFDRJJXo7IV7p9XSl3wiVBIAp+vLi7CPwWRa4FI/2PiMMQUlQI1L2CQPJhjC08KlmotyDyEz9kJwGkyJPDMj12gRY1+hjj0nFKt3iPUcTVOP2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775096432; c=relaxed/simple;
	bh=3crEO+O89xHnAa9Qv2tmtZDwzd9lKKYN3FD110HX30o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GZrRa9TkKFVrmqFzR9A3H1Z4x6FB2GLwY3RDS6i7C4BNQf6beXdYBPuVGT5UNx0mX2Z/pROhlqYmocmenR2e4MkttCRu8Vj9FhNaOTc/WTMBSGPXP+DEdRfMplFxq0Ej5C8P8N/bvOOsbpbrve/4uqZIiVpEUUnBfzsfKxl5/ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W3Zc8f2O; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W3Zc8f2O"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48704db565eso3468805e9.1
        for <linux-clk@vger.kernel.org>; Wed, 01 Apr 2026 19:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775096430; x=1775701230; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZXxuQ24FqzoAKF907nAmIWTd8J/1fw9cSv99fr9M97Y=;
        b=W3Zc8f2OLkS9VvTh4QuFfE7szRa3l2eqqbWwgAjn3qtW8C89Hhr5uj9FefKPw3LROR
         GKtU684io/ZJ71Q+CX9+rbZU1ivICPtcq/T/17KMp8T1GQPal3kvlnUGDunm+0I8bAkN
         sQf51CiaeCgvHHNiWhJG7/Sx3ZZwVzBfvWgTV8Qi6xpGaTDSOoBO4x95Wdq2WJx9bRGB
         WY0tUDfEMlKtIPxphLqN2ieb3Aq/qebr9aLE2jYunEB7+3rzjE1ldBVFeUBX+j1xY3j6
         kfaDnso6JVgiSynu3NCrEZNKV+NFHWcLmgizVL5yDT35c2/j3Nar9Hc+b6Yu9spcuWXM
         26Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775096430; x=1775701230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZXxuQ24FqzoAKF907nAmIWTd8J/1fw9cSv99fr9M97Y=;
        b=e5I+NaRH4ulJ9nT0+nvlPiLnZ5vdJ1ZRVUq838DPIwMp2GyVUa1Yce6uX+b+avshq3
         evZwgxSVvEhS+Hp+kM3Ve6JVSNcXKgEK5el019DyQA06OWK9lFY2Iuy+RgTLgVAaLPwL
         kdRCSCdAlMYuym7ic3bM+nTB15OhZb+gtcg4AEvjX6VVrPv51+/NidGrFwrUxx7pTyFW
         7jfxM35J3zAqsc9fxtYBRLlvvcYINFbIWL7pJ+KlCnEY0IdiShUSxRhoj3nTwMKAXU/n
         v2bnPrwh4poMNNuSqyqeO11Wj2c+XuQR/SNplOpwaevxI3LjzXb8yg4rZ0iq4bZPd3t6
         +AgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVM6q6OdLUBdqiNUTd5me6A8YIIH7bzhFdwZwteaNF+q3At9Pz4KawqRZS8uUPLGinE1dPItc/N304=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUA3uJLLk2ZPvctnHi3GGZ/n1tizF+ghf3cTJc+Jlcp3daAdmF
	C9W2he57k2P7dib8gT7+rDI7v8d4HxTV136HkAPJStqHXL6vW5R1mv983jCP71rYN1I=
X-Gm-Gg: ATEYQzyCoKFkM+MuM26dCzKQZsHjqaigu+rvdveyLmTRaYEFhKZJFV6ggcyUoG3og5v
	NpCkl+v7jKjNL/wVB7tjGVbiWr8+rRDNomjDsWNTwRTxmZZhg44mv2T3vZ3myLuBB/9Dk0cK0oD
	MtPj8uvyD4MF6HPx5SQYXW7mdqCnU7upzBHT/izsL9tyN8v8jrqaAIe2yV2EEircWcBOPMdo5Fz
	B5VmZWSDnNUKFEdQMmSz988/p8bp8x5RqlOcfjOxV4KDkJHCVSBd33DhMkdtbjxGytz/MYqSzk9
	5W4cEIsPwHSyT4DoyJzS8PXAaf8/K0rBLvAUMWXYO5/l8Lck3+M6H8Z6fxIJGDo5aJmz7X/Q0WA
	UJCXnQW9FOgPlq8HFCUzAXQ5K4KLvHK3NcwwguFfjom0CGn7HYt+HaMVo4DyCbgi9tni9OTVQcK
	2zwEDOt3AUOtOd7Zy8n5eNG/G8kGvzc1PjWuRrlAQ9OzwRc+X1Yg/slXNVdMfazKpTOiZoCSWAR
	SDeZmx2ac6fm0w1
X-Received: by 2002:a05:600c:310b:b0:485:531d:28b9 with SMTP id 5b1f17b1804b1-4888b769851mr25032405e9.14.1775096429980;
        Wed, 01 Apr 2026 19:20:29 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887aacb88fsm56379725e9.2.2026.04.01.19.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 19:20:28 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 02 Apr 2026 03:20:16 +0100
Subject: [PATCH v2 3/3] arm64: dts: exynos850: Add ap2apm mailbox
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-exynos850-ap2apm-mailbox-v2-3-ca5ffdff99d4@linaro.org>
References: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
In-Reply-To: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3

Add mailbox node that describes AP-to-APM mailbox, that can be
used for communicating with APM co-processor on Exynos850 SoCs.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index cb55015c8dce..fcb665ccc7ae 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -298,6 +298,15 @@ cmu_apm: clock-controller@11800000 {
 			clock-names = "oscclk", "dout_clkcmu_apm_bus";
 		};
 
+		ap2apm_mailbox: mailbox@11900000 {
+			compatible = "samsung,exynos850-mbox";
+			reg = <0x11900000 0x1000>;
+			clocks = <&cmu_apm CLK_GOUT_MAILBOX_APM_AP_PCLK>;
+			clock-names = "pclk";
+			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <0>;
+		};
+
 		cmu_cmgp: clock-controller@11c00000 {
 			compatible = "samsung,exynos850-cmu-cmgp";
 			reg = <0x11c00000 0x8000>;

-- 
2.51.0

