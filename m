Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4034F8B0
	for <linux-clk@vger.kernel.org>; Mon, 18 Dec 2023 12:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sHwZmpec"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5c68da9d639so1088167a12.3
        for <linux-clk@vger.kernel.org>; Mon, 18 Dec 2023 04:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702901311; x=1703506111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+NpBpw87ancReoayxiYNLEpdh+qbLyvkQJUBfcAOaoQ=;
        b=sHwZmpeco/gTdT87jm1yr3TGjh2hS48sfxvc++zpJ7ghQlVNZIGELUijwlisT42vCd
         zLmeUQWbzVWiy92b9XS7CAGG7tyNceeWGEO0C6LYA6GjPKCsZik4nTzEVCZaPOtB1XjN
         Dgh2Ngxzhl7A/Yc+w9qegYozV7nuSSzULKaSTDS3x8aRxhnOyK2ZMbhA/k1zvDUS18vh
         98Kza6Gr0mrn7gkESuRaV0Xbvm/EN7kxr6aYB+xoSk9UpCI55Nw9LeSoAWOzJNGQm29F
         ZFQNyOnOZLUwFBmAZ7w+BzbSAPmHpEkgMxagJsduwC+k57f33jRCOpMnfXbalYEgqj5W
         5svg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702901311; x=1703506111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+NpBpw87ancReoayxiYNLEpdh+qbLyvkQJUBfcAOaoQ=;
        b=brJFesS2y3FBK1N4aJEyOmhlHnpVoYCHjJT7raWA8+wQ5kifB0ITq3D5cFNavU8Gyl
         LG2yR+yyNvxJo1q2PnS8ZA/zaQSRhOH37tfRTnsaB7JRug8fGxNKFyj6GTZIwM+vMPLI
         L96yD6ZfEQoOjBPV63Izw0kTzfe2kKW7ithac2KQfcR9tom2LnaQ4S7WpzdGUG2Ur7Xs
         aiF4gEqtaP02G2Cdwgu/DAiICuNR0SXh/9W3pjF3l2MDY6oIFQKue1BxFt8a8Vp9rQNC
         hCIZsts2r5Tyl8VnOKMmTZb7Dr3JD9ReUFmT3BCLft9Ms9/pXceHvEPlAlJeIX+dNX+B
         UDhA==
X-Gm-Message-State: AOJu0Yx0AqtNE4I3E7j0jcsWe4I7ybSHuurqdLbVAw+JRd4kFUT0kSC6
	mWML4/8XVJ6oqjXHfPghLpq7
X-Google-Smtp-Source: AGHT+IHWUgQYCUGlqwV406h6zHwdKzU4NG59nQYN4sJQ2Em0W4gzvKZvabKGPJlQn2udUzFH5dAm9g==
X-Received: by 2002:a17:903:1106:b0:1d3:aab1:6273 with SMTP id n6-20020a170903110600b001d3aab16273mr870341plh.118.1702901310948;
        Mon, 18 Dec 2023 04:08:30 -0800 (PST)
Received: from localhost.localdomain ([117.207.27.21])
        by smtp.gmail.com with ESMTPSA id j18-20020a170902c3d200b001d368c778dasm1285709plj.235.2023.12.18.04.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 04:08:30 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: andersson@kernel.org,
	konrad.dybcio@linaro.org,
	vkoul@kernel.org,
	sboyd@kernel.org,
	mturquette@baylibre.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	quic_cang@quicinc.com,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 11/16] arm64: dts: qcom: sm8150: Fix UFS PHY clocks
Date: Mon, 18 Dec 2023 17:37:07 +0530
Message-Id: <20231218120712.16438-12-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231218120712.16438-1-manivannan.sadhasivam@linaro.org>
References: <20231218120712.16438-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

QMP PHY used in SM8150 requires 3 clocks:

* ref - 19.2MHz reference clock from RPMh
* ref_aux - Auxiliary reference clock from GCC
* qref - QREF clock from GCC

While at it, let's move 'clocks' property before 'clock-names' to match
the style used commonly.

Fixes: 3834a2e92229 ("arm64: dts: qcom: sm8150: Add ufs nodes")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 43d56968a382..18af94852974 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -2065,10 +2065,12 @@ ufs_mem_phy: phy@1d87000 {
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
+				 <&gcc GCC_UFS_MEM_CLKREF_CLK>;
 			clock-names = "ref",
-				      "ref_aux";
-			clocks = <&gcc GCC_UFS_MEM_CLKREF_CLK>,
-				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
+				      "ref_aux",
+				      "qref";
 
 			power-domains = <&gcc UFS_PHY_GDSC>;
 
-- 
2.25.1

