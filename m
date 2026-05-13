Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5005D3B6BE3
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 21:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778707557; cv=none; b=rAOlK96K+67jCdw3q0Nb5FmchpVEyiF25XzGYIgBYbXBMM1H3+SyQdJZhNt+axvKg1QgACMWf6IVNCjfbfNgXdEnFtFQGjNE5W4Y3yYwneYXybsamTE5tj1axSG7q/j+41cCE/Th8zlpDao+SMgJnv0nG7bgQuKNOCMYx3aKzG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778707557; c=relaxed/simple;
	bh=Wt9SYaYbBekuvxG0W9GzirhObD5B5YMMzByQDBZ74uU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FFRVSmqbiwp1fxnH11lg2eVK465mRx+I4iAq55Xqqc1hxqakrj73YZmMbyA/Xd/e7FnJYOmSc9dpD7vSCdFoc9QgB773ek/aGpbnoKLLxD8DLdHIYNFZhvEoOb3HbRttSaIbv3fSRXDish0ggvpiJygujIGZjfIfirDjcaGD0jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N+ci/loL; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+ci/loL"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-65c5361142fso8358405d50.0
        for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 14:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778707555; x=1779312355; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w02Fw3u4OZYjqyD8CNbogogC0D65Ho3wtBiCcEgc55Y=;
        b=N+ci/loLd6dNmYosBRse99wVjwpX5l5f8DBdbKdw4tz/AoB547AfAIFte2hd4enN0i
         8XjhNH7l80MwC9OM8KLhYhBnnjt5kbzE5kGmDoxonFnIDxbt5Xjd5WxkPTKEUkQ8QeYt
         9m7k77JKoqExdJXDBbaxBZDTsWj3/V9ATj6omJ/Uw8nOXcWfy4A+s4WTK9wlPS+xj7yY
         HyrC1Qu7aZLiK7nKIAKAXzrnAAz+7/ICTMNMCOZC0pr1L0/N31Nv4Y43/eHQBhKehyWZ
         JWDaNnszOq7s3m2bBSKwqUleYX3rmwlDLlZ8Vhjd5pU1RiYfc4Pr1pCxt2s6f4Yd7kov
         xUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778707555; x=1779312355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w02Fw3u4OZYjqyD8CNbogogC0D65Ho3wtBiCcEgc55Y=;
        b=cZsi99FOQIcNtEyk6WKcBc0XiFEKICqoeodjEQEVqnN02zfjf93bkSXJmWLpfL2dTA
         p4NyZcl5HR+tZgwD6Uk/JoR3n9jQBxOxJBTFZ8H3/R/ro9CZi2hVmUd+Oq8oaS0Nzz4Y
         Sfwm6xM7l3EOeo16EEKZowDGKT7B06p4QUpZhjnnjz4izYWgQZQQRtXrdL0xVWYbzpQz
         ga3JkpofCg4ZOuwiMI/q19ooLubJJBVzOlfLQAYQ1QE5xjFmw0vtIViu5DhhLoKrwrma
         1pIS8qZOigVMN2Khr+73c0P4/blmzY+GBu0OsOTy3nmJmabeGuQaOc48hC6xBewG1vxl
         g23w==
X-Forwarded-Encrypted: i=1; AFNElJ9phwrazgRnpvnTOvUbDP+arVvgzdOQJj0RmwhcThYzuAg/RudJ60b5sBllVbxBqXomQosjiMgq238=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcS+UiIhHGhadHAMz2BX32z3HECBqml52fr89enk1gG5ijY3+E
	pqwvmnjNLvqV5F1EWZFPPvu+DD3mFd6/zRku3KdVuG/iera0+8SNz/Wj
X-Gm-Gg: Acq92OGX+dQTv84UlaxCu78kVJ8Xe6woqEE1PgwJ3J3gkMhbVZ+CXAvWkqhU34duGP7
	9TiUq0EAuDTvxbEvNMs9lLvjEMi8YuPJuNnSFTEQLC6hNFQ3hv0HeFIqTeSchR146wwfF1R1YnA
	mhX0mT4Sm34w2VW+ydgUbndximkEcLq6KFhz2r1gCs64xPOrfRkKxDeGqlcyrsm1JOcV26pshV8
	cEheSLBB2g2Hs48Xepg+cPSv/eE8MoOgsktN/bPANTFAX9J5MWkj1UEo0pZ8SQN5/PHD20nX/wv
	PQUaj0Gvw6wNHeflF3n9jugmMU8QWjxGhEtF1ZxWxp8xIBv4kz0x34/CLVYPuOqhi66jGJTAeL3
	ngBGNprgNKKXjnYUH0RnNUTTuSYKd87UDG9y5zKTXYI4NICoC+bkASs1m2aPsdNCjPL7GejfwGm
	KySonE9rWpvLlIDmWLikETA3msCQ==
X-Received: by 2002:a05:690c:e295:20b0:7bd:5c7d:4b15 with SMTP id 00721157ae682-7c6ab5e9aefmr42888857b3.5.1778707555385;
        Wed, 13 May 2026 14:25:55 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f28b810csm3715107b3.14.2026.05.13.14.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:25:53 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 14 May 2026 00:24:31 +0300
Subject: [PATCH v7 2/8] arm64: dts: qcom: msm8939: Add venus node
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260514-msm8939-venus-rfc-v7-2-33c6c6fb9285@gmail.com>
References: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
In-Reply-To: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

From: André Apitzsch <git@apitzsch.eu>

Add DT entries for the msm8939 venus encoder/decoder.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index d4d7b0c9206c..71e22584a46b 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -1627,6 +1627,29 @@ opp-19200000 {
 			};
 		};
 
+		venus: video-codec@1d00000 {
+			compatible = "qcom,msm8939-venus";
+			reg = <0x01d00000 0xff000>;
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
+				 <&gcc GCC_VENUS0_AHB_CLK>,
+				 <&gcc GCC_VENUS0_AXI_CLK>,
+				 <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
+				 <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
+			clock-names = "core",
+				      "iface",
+				      "bus",
+				      "vcodec0_core",
+				      "vcodec1_core";
+			power-domains = <&gcc VENUS_GDSC>,
+					<&gcc VENUS_CORE0_GDSC>,
+					<&gcc VENUS_CORE1_GDSC>;
+			power-domain-names = "venus", "vcodec0", "vcodec1";
+			iommus = <&apps_iommu 5>;
+			memory-region = <&venus_mem>;
+			status = "disabled";
+		};
+
 		apps_iommu: iommu@1ef0000 {
 			compatible = "qcom,msm8916-iommu", "qcom,msm-iommu-v1";
 			reg = <0x01ef0000 0x3000>;

-- 
2.54.0

