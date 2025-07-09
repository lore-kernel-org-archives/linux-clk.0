Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3C228B4F9
	for <linux-clk@vger.kernel.org>; Wed,  9 Jul 2025 10:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752055795; cv=none; b=csl63Soa2KiiRhKsD371KQP5kFyZECK90pxFFPSWwohPygJ9clE47vUIJEt/K6dvmmYBgu7f/QMObJhPtq7Zygbr5TslzhcBlxsn1LYrzndsAwFcZiIaqwshOsC5egouvqvs3kFeunrAZSqwM8TsRwEPI0NTmk4ddlSohrWca60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752055795; c=relaxed/simple;
	bh=JYs69k4hNVS5lPqOM38UStT63udUZ2u+pAlopyA1oc4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P1EY74xz82Re67AajXboEFNe7pS9OVWq9kopd+ZFyrPQ6i0Z12Rbepk2JPuj0xfjyVwcRlVwB0PKW+DXnPJ96t/q29MpZhwDzsGxyBty/x/e5F7ne/tcfALm2neR7EgtrnHapKmb+DkGP5zgK5tMzVg9TX+AyYTRkZhfxaqYp/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UqSOyYZQ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UqSOyYZQ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so7321675e9.1
        for <linux-clk@vger.kernel.org>; Wed, 09 Jul 2025 03:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752055791; x=1752660591; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uJKs6pSGcR05CnjZyNb4F7ZsaFdoT5cYwaxabxCmccs=;
        b=UqSOyYZQh+98RK0/aH4OH79yKtZjNK9N+yDOP8gII1q8Gy2fg6CdBfmFP7kjOxN3xL
         +dxibtKcqZlYN+/YFt5MPaGMAZhajDiYHd45Bb/UkAG050mvfNaDga6sxddUUW1Xmujn
         /Dr0lHX6Fsran9mlaBMF486WRF87p0LScCOlknK7tEtCD5c71x3uc5YUUmawWqI7+GTr
         /jPdQN4qSstR9RvlpiiTn0AEUK5YFPwWmIars3uzddbhkqha/fb6fetxMxvzcispBkG9
         fpZ0OBX+wm5MwtCBGegv5mRoXBnXqZHbDZtM0f0m3di1ld+uLASLOWsMiwkDvIgjo/u2
         ibJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752055792; x=1752660592;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uJKs6pSGcR05CnjZyNb4F7ZsaFdoT5cYwaxabxCmccs=;
        b=ObmUr59Mxs3m3THhmt9EbTp86fybP4exdJDDYEb2/AEaJAtLXfYQG+dWcun7U8zjlP
         SL2psAshiYUvX1cVAwYwWHtgxVrqDsrY/6Zh6IZPgapbeETX6RTL8e99xHuOnJLZGHFw
         r7j0WQXC8+WGUSUl/8/Jt8PmnGe3iZJH42Os0uC2TtCw9FdaX4SZyxP4dozItWeFAb67
         msMhr3sv2QaAsrLUBwOmleRBvjIVTT9eP6oi6r+RGv/NCS3dzoK74oVlnBRmzka+g3wz
         wdFMX9pWupxoqvazOmwUq4xvyYqdboHz0+jBHx1tUxYNt5tlMuTJg1gn1JPptoVlWa0g
         mC1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXQOSm8IN29gyKIXFyL255aoXJYuMSiI3SqO+lWO4KhgLKc4E6cjAU1tyVn/pdUpL3/pLVU2VW2SJE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsiWa/hTEtzIyqfJZSx682UWAHAUtEwia2Tr2lPRP8HHDstgLW
	sgHf4KtCvZ13WY9ziwfvnRg3BoqBzvxSCC/qZpsakPQvp9wUNcttsTSqvdfPC6R+Qj4=
X-Gm-Gg: ASbGnctT1+dGYj4BGnUtYHUJ0fBIJXlN9ScHST7TQ8vILS7KPreDqZHDFzy9TwquSov
	Bnp2+8iun0lh2YW0aoPFVcPYbf61ERUcLzJHXLRoByvFKmtlsKiCpp9Ux9sBuzlHDv2czrsY8p9
	Z0XoBPa7Kv9I5ICSRbuj9pRhephbrB12rTjnN0tk0QYPCQphgwV54MPzAZ3TKOWdMvmOApj0UJf
	iDwRioEIxC0rbJynlD+zMtrvs+pMaGQVJpeQ9AakAyxAS14f4LOvzGFIiLzlZXg90KbOtd7/B++
	TjPO/GmHGIqTvFFQg34CSXGvbZ/6P0D8LhmmcdCr4MvShWU5FBXOC5xia19p0Dd2+udEzeRXzwG
	tUA==
X-Google-Smtp-Source: AGHT+IFzc5yFh2wY77gjYrxQjTpVR45vDYq6+m5WrPEq+P+xzIkohYmigMzwvUyhRV68cdwu0zEDuQ==
X-Received: by 2002:a05:600c:8b0d:b0:454:b97a:486e with SMTP id 5b1f17b1804b1-454d5602748mr17103525e9.10.1752055791519;
        Wed, 09 Jul 2025 03:09:51 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:d3be:a88a:dbb9:f905])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d5032997sm18342105e9.7.2025.07.09.03.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 03:09:51 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 09 Jul 2025 12:08:54 +0200
Subject: [PATCH v2 2/6] clk: qcom: videocc-sm8550: Allow building without
 SM8550/SM8560 GCC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-x1e-videocc-v2-2-ad1acf5674b4@linaro.org>
References: <20250709-x1e-videocc-v2-0-ad1acf5674b4@linaro.org>
In-Reply-To: <20250709-x1e-videocc-v2-0-ad1acf5674b4@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Stefan Schmidt <stefan.schmidt@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

From the build perspective, the videocc-sm8550 driver doesn't depend on
having one of the GCC drivers enabled. It builds just fine without the GCC
driver. In practice, it doesn't make much sense to have it enabled without
the GCC driver, but currently this extra dependency is inconsistent with
most of the other VIDEOCC entries in Kconfig. This can easily cause
confusion when you see the VIDEOCC options for some of the SoCs but not for
all of them.

Let's just drop the depends line to allow building the videocc driver
independent of the GCC selection. Compile testing with randconfig will also
benefit from keeping the dependencies minimal.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/clk/qcom/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 36d6e6e1e7f0162d53f02f39125f4593517e0dba..26752bd79f508612347ce79fd3693359d4dd656d 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1391,7 +1391,6 @@ config SM_VIDEOCC_8350
 config SM_VIDEOCC_8550
 	tristate "SM8550 Video Clock Controller"
 	depends on ARM64 || COMPILE_TEST
-	depends on SM_GCC_8550 || SM_GCC_8650
 	select QCOM_GDSC
 	help
 	  Support for the video clock controller on Qualcomm Technologies, Inc.

-- 
2.49.0

