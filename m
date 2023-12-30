Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375226FDC
	for <linux-clk@vger.kernel.org>; Sat, 30 Dec 2023 00:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hDKqGkPq"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50e81761e43so4384978e87.2
        for <linux-clk@vger.kernel.org>; Fri, 29 Dec 2023 16:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703894717; x=1704499517; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/m9Jpc5xx23q3C8731BxOLK6crl8Nzmn5sx1QieTmkY=;
        b=hDKqGkPqMgoml1iHuEDcJ4ALjd1xBXHfgWaDByK9Sqzb3vJejIMuRxWRjwa47KT8k2
         R4bdT7X5Edi3JpqEOEyorIU49Nsk8w3sBHUeUSgxEyrEOpid7TfnkKQF06t3dy2Tzte3
         Lki0bB0Rx8pOWZXr+iqjUMYTmt9+wt2l36NttiPf85lJG9vb9x12/mVq56wHNVeewpNH
         Hu5IwTRLWo0qplNRGG1z1iq1WJQrHDiTiwliZ1dlJsXAw7uRGWsN0u1hI11qIkLcHRTJ
         sFBJuANyPONhWldMw7Beg1LzuVGOBuj6+wltJrrRwsNHP0bbDwiDObr4WuzxWJlU62Sm
         hBpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703894717; x=1704499517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/m9Jpc5xx23q3C8731BxOLK6crl8Nzmn5sx1QieTmkY=;
        b=F433k4nky2YiFRWP4lo+XBCTKMP2xMwSCpCmArceBo6eS9QipvQVQWePYaLyydDbJl
         49b/86bAtnVhdhLch4KRRCLEtpNGyfVSbMYYeXmGULHr5NAML3nGkSy6Q2GIlWOgYdGr
         2LhGdhC2uSSlc7qMKqJOy34IsECh8exEtcMc4vTekcL1oTuEzMwYnpM2qUn3j7ptWO2a
         famIpTkTGq2zgHCJPgQCnAixTowc5t6AMOyF4Kpk8p5OUtWw3huVES6T+DaoZk+SOGLz
         IhQT/yQO9UUt1t0+g3cj7uMygXRkVB5osm8pKhKzDhvFVH5KctDZ/0HYOlSNVPwHBaQK
         pK9Q==
X-Gm-Message-State: AOJu0Yw8YIBexb3e5T4AA9+mlXH0xwg29oSQdiKwjUqYYlhOVyOmq051
	X1Zk+QN0oxZ3nML/Kv29WHSxxJwtOKF+rw==
X-Google-Smtp-Source: AGHT+IHdz1/fvS6Un0vTNbho/hESlCsbygpZbb9y90/mjEXYAAxdOr2wwEREYquLEVeLWliYR5RdAA==
X-Received: by 2002:ac2:5b10:0:b0:50e:61c0:cfdf with SMTP id v16-20020ac25b10000000b0050e61c0cfdfmr4967583lfn.132.1703894717438;
        Fri, 29 Dec 2023 16:05:17 -0800 (PST)
Received: from [10.167.154.1] (178235179036.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.36])
        by smtp.gmail.com with ESMTPSA id wj6-20020a170907050600b00a26a0145c5esm8609623ejb.116.2023.12.29.16.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 16:05:16 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 30 Dec 2023 01:05:08 +0100
Subject: [PATCH 07/10] arm64: dts: qcom: sc8180x: Require LOW_SVS vote for
 MMCX if DISPCC is on
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231230-topic-8180_more_fixes-v1-7-93b5c107ed43@linaro.org>
References: <20231230-topic-8180_more_fixes-v1-0-93b5c107ed43@linaro.org>
In-Reply-To: <20231230-topic-8180_more_fixes-v1-0-93b5c107ed43@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703894704; l=873;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=FkcZAyjsBcuLAWyHWJ3lyBRb34DTbi9Yfrno3FHjRjI=;
 b=Wl/imgB5JjpgHjAWnCZdr78L6R/wet7w0VStVYhfAznYM2nJ8TDhXvPWvY/GzZ02bBjbex7Il
 Re7sbc8s0dVA8NKT5vXIPauXEVfGiS84bRHIZB5KoxyyahmNmi8hbhm
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

To ensure the PLLs are getting enough power, cast a vote with DISPCC so
that MMCX is at least at LOW_SVS.

Fixes: 494dec9b6f54 ("arm64: dts: qcom: sc8180x: Add display and gpu nodes")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 3bb9d25b1dec..97c139d0399d 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -3217,6 +3217,7 @@ dispcc: clock-controller@af00000 {
 				      "edp_phy_pll_link_clk",
 				      "edp_phy_pll_vco_div_clk";
 			power-domains = <&rpmhpd SC8180X_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.43.0

