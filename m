Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE3B38654F
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 09:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777021691; cv=none; b=Hf9SgnKx9lzlKx8895g/Yv8Bag+wJ6kUgRcZybMonpI8r1k5ndsBpkWbh8esla7OyfAU5BS3aZsn/I7Cx8kFRQfbnUZmMTgvzjbRxd7wepy/YWVEpP2/bzOtPytwOcamXctcsj/NXYCK7LgCipGYYUzUIWpn9ZfBugJiRs8Aaf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777021691; c=relaxed/simple;
	bh=8UCqKS51w5RlR7Z5z2QLTaDqXfPwDG1/feXb0enazX8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d15evTPWUqa8Nur6hYcCxTNriv21FIz5T/Oxl8rmIa6H7qG89Vf4RjEjU+Q2408Oa0wPAB4jVfs9Ho5MsJAFrZjJQyMvgZnIrmKaOPtlb6GDRmQ32GtZpuoX8mAwd6Ng9olvIKqg95YxlvrWCplyQs5Zb2o/UaPAi9bngXKJIFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WPKWvahR; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WPKWvahR"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso47682455e9.0
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 02:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777021686; x=1777626486; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQrbXesEIOG1EUuEQC/o8Fu4R0n53iSwERhl/LZDWYU=;
        b=WPKWvahRzfWoC7R6dC7k92M9/d/I8f4edHU75oc0LpV07Un6Z7YVmo9cpvFfZQOgcR
         VJ/EDVEvNcE1es/UfLLXnfnnWwrx+a2WAkqMTwImAU8BSQMghrU3Ua9Qk8O21J1/O1R2
         u00tQL18OYxGW92ujLaO786GDh6viT7n4yfj+ZidR67PwYSRvLHXd7mHOhDW9/yPpEnN
         eAcp3FAJ5/dEBUO5+INpAULhfRqkSnEl/GFnSL04Uj2ZLeBPV2RuDKB0cVTHF2hWRMtz
         CL4zzL5vYhJZQ+ST468iTqyhBh48iIaj4srlnYtf6reKKfETX4gpiIS6vK46L6gWoK/d
         Cswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777021686; x=1777626486;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DQrbXesEIOG1EUuEQC/o8Fu4R0n53iSwERhl/LZDWYU=;
        b=JpJmdmskL06VUrLbl25Ftnp06SsqU1FHQfuivmiQPwrQO8OkmT3oAeqK3hOZC8Nwwm
         KWjzVkKGCt8BD61Su6fTkwSOXwEPdH4DIlA8r1KnnOV+GVg6ZX5ZPuOL2dXCR81j2FjT
         qc4q9dP0TBO9uyFLzqPWY2CdnXgDosaq4hZzGpbf7APXKCLZbWkiXnIhYBPQ80Qj3rjm
         XTupk8eIX2Rn0mVOXlQ2qqSMcUwneL6zlyaHlQQpkLE/4ED62CZBvvr9RL2ZZuHkbDVY
         4HQRHsU8/i2BJObDYrnzfQxc9NElel0iRulKmZUDtw2WGbBIRwsRKpHQIcna+k821WFJ
         dkpQ==
X-Forwarded-Encrypted: i=1; AFNElJ//YTc+iAvgyn6xNSX9vpLGBqr8OWKF5fASVVDDv/NSncr87S/K+vNucz27Nh9cD230KJRuj+F1fCo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPuDI4tJ+EMm1wKwVIjGwPeIrq4fFqbLvefoR/qf9car6tBuET
	yu1F7OYkEp2bdaqEOpJvrXvIPfk+hQdDP+CCOTyWHmRWPT0EIuEKPurny3ZtFtnqhc/rvAywmaQ
	/G/Mmgbc=
X-Gm-Gg: AeBDiescACZrFdWVCbu1KreWL04t9YwF4ZW/xKVj0U4XSzMVXz56xSSOk71Y3pDGDVb
	zHVCDUKQdsx9teFp6BrEIPYhFxlpFFXgFrZJh2W4D58DHOdDGKIIwbrQWoq8srlHexSwhJquSXo
	ueEuOwZkXbvn6/DRukeMdHtbTsGulMTEwEz1qyT81YBI+XX1PrXoaMNWPgoEB+ffl9e8ISuBJL0
	Fckg9JmMtttsO6iZvnFNHAuLSqXvIdTv0pTS9XHPZboGVJFRuP4SoMQ6rbSbupHOwrz8xJa12RN
	1adPIgh/tzE+/jNLnMM4D14dRh5NZrGuO383g4KbU+ax9VY9lHRUIRQw+4G/8E/qyTkWjEWibn8
	7chOZlFMgrah7dwimJQUleof7xy9DgTjz/icLPOvpAEZt49EWligHVaibMAejm/s8VjmLOLg9Al
	yqy3/8Gm6/qT9wj6siB7hJ7+Vj54M2XlxFo3oFXRDb7xf+SM2XNQWgDNk=
X-Received: by 2002:a05:600c:a106:b0:48a:58ae:9933 with SMTP id 5b1f17b1804b1-48a58ae9fbdmr130325715e9.18.1777021685898;
        Fri, 24 Apr 2026 02:08:05 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1c0354sm537222545e9.11.2026.04.24.02.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 02:08:05 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 24 Apr 2026 11:07:59 +0200
Subject: [PATCH 5/6] arm64: dts: qcom: sm8550: Add missing CX power domain
 to GCC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-5-4b6e09d532ce@linaro.org>
References: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
In-Reply-To: <20260424-topic-sm8x50-tie-gcc-to-cx-v1-0-4b6e09d532ce@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=973;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=8UCqKS51w5RlR7Z5z2QLTaDqXfPwDG1/feXb0enazX8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp6zLvyBrEYR+ArzyGkPCEiEmwtaEWLvFZBUT1TvPm
 yJlJ1y+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaesy7wAKCRB33NvayMhJ0WO0D/
 0YqTqQstSGrGRomLVAS62j65Ksgxddo0d7wwfv+D69PT2/hFkSpbOY0CjA/UYijLV4+LJwG9uTNlQE
 +WDMnFND3Zwh/0FeGpfg97DVHD/R1ot9DZn4+ssfUganOBrBQXgkQzAvBFX++Yxi6rORtsf6FsGkr/
 ykMX288/kj51VkHDB0bxweKQl8aNmfId5HJXc2EhKHaTgtDV1YA8gzaq18zvwQ6zrwql4TZMaPxLam
 JrT0a5qG95CMMV3lZZhPQyt6CdoNzCZJvAt0ZeBGeiNbGSaxceYkijALXXEmzXNvRfLJ+qW/UtRPJD
 RRXGbLmUm9W8782bGcaehV2GUWmZWNNcJ4+JctuMnpxUQrnvvMFIaaofe5SgvA1d/6mUrX87h3PE4c
 uXlCqNNk0nMWpmchm0o6o6H+KUV0vIj977slU834IhNT+TSWnmy/Y+EUpy5k/SJTip2nvkD4qSIEyj
 AZO8/IyuG+J9nJrOcHTknbyi/zI33BiFp4BUY9MAeunIYWX76wLlYBH5TqqzpPCGDfws/coLj0afjV
 9tWpfl8COuk1e4MP0IBV5/Wmc+M7D0HmXbWrnuhA2+cwqyY65SBg6zLREWWXGCuk8UftO3SqRtBRzs
 hgwrpMz2cQSJYXHsmmu9IuS0fBaokIk2TvelJSlsQoNwMdzdlYk66a/1Puvw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Unless CX is declared as the power-domain of GCC, votes (power and
performance) on the GDSCs it provides will not propagate to the CX,
which might result in under-voltage conditions.

Add the missing power-domains property to associate GCC with RPMHPD_CX.

Fixes: ffc50b2d3828 ("arm64: dts: qcom: Add base SM8550 dtsi")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 912525e9bca6..bc97259b378a 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -826,6 +826,7 @@ soc: soc@0 {
 		gcc: clock-controller@100000 {
 			compatible = "qcom,sm8550-gcc";
 			reg = <0 0x00100000 0 0x1f4200>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.34.1

