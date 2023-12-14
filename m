Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GSmmSVQ6"
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D60BB11B
	for <linux-clk@vger.kernel.org>; Thu, 14 Dec 2023 01:12:46 -0800 (PST)
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-77f37772ab6so490944585a.0
        for <linux-clk@vger.kernel.org>; Thu, 14 Dec 2023 01:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702545166; x=1703149966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dnV4bcTFVg58y8kcgwcwL2c2t/omr5+/badatgzAJ70=;
        b=GSmmSVQ6n4phhTJUIx0pcX5tKIAnI1/2BGlcPTO4DAUywUsd5Gszhj4xF6XwIUH1Fj
         QAZJ9OXqBDY1EcdSu2PcuVdK1z3PhbZA4srn3+B7mloOUzxZbzofAVv9Kwq36Be7Y5Vg
         gQYeTSGK3Rm3efPLqgLwivOSSHKZFMu+9Hm9RK9GAPfqwPvbm9zjJPjXzVciI3PXZ/c4
         xTgA/e5Ea1HyrODKO5gm2tm9m1r7mQcBN3/wJmkhr3fmLogrUX4bPlWMVRym2Dx1tqZI
         IIcyLN7nDuu+T664TJj4igJBZIbzaUOKyG/o/ij5OBKnjaEfsdPfSIhMGgAG55oO7Aka
         Ckhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702545166; x=1703149966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dnV4bcTFVg58y8kcgwcwL2c2t/omr5+/badatgzAJ70=;
        b=YtsvcENHof5LQt3DnjnMvacr4l0deX3Rq2bGXELMyd7jihQBMIrlURopR4iPrsIB7Q
         dF9Wri+csXhzhUtjtZLMy8UdbcnTh/nFfGlqjiKSD14NtLjxogVzicHAUf8FdR0w+Aik
         V863yCOaoOxdzEBz0NqoX7hdOSZAHFewG9lfZQ70+GfORlmHJG4gMFk7yAVezngfXKGr
         XYUIYlrNBJ65OWpc5G+wtyPmnAy0HaPJhqfcgRFmJ0Dy5+zexz5jBJM+n48qRcxofSuW
         FV8deCc/HkcP7W+PZZKc9USHLwXRpWrIF8mVGbfRbeP6OUw0ABZgR8NuvjeCY5ZitZ9R
         RYOw==
X-Gm-Message-State: AOJu0Ywz+jgGOAXDN0uQlnAOIjDWAUY6TQ1/W9wcorkq3FWf8ftau7bd
	fTwkRcvVwGBOd8J5NI2dTopO
X-Google-Smtp-Source: AGHT+IHhZr6wQfQIpC5Du8Ua96GS+QkCSnpo7BicRmN+1IcfH8Ki2ucla4gKq+YP7Ucu3fIwuMU7Pw==
X-Received: by 2002:ae9:e00d:0:b0:77d:7446:d4df with SMTP id m13-20020ae9e00d000000b0077d7446d4dfmr11263131qkk.76.1702545166023;
        Thu, 14 Dec 2023 01:12:46 -0800 (PST)
Received: from localhost.localdomain ([117.213.102.12])
        by smtp.gmail.com with ESMTPSA id qt13-20020a05620a8a0d00b0077d75164ef9sm5144119qkn.124.2023.12.14.01.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 01:12:45 -0800 (PST)
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
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 15/16] arm64: dts: qcom: sm8350: Fix UFS PHY clocks
Date: Thu, 14 Dec 2023 14:41:00 +0530
Message-Id: <20231214091101.45713-16-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231214091101.45713-1-manivannan.sadhasivam@linaro.org>
References: <20231214091101.45713-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

QMP PHY used in SM8350 requires 3 clocks:

* ref - 19.2MHz reference clock from RPMh
* ref_aux - Auxiliary reference clock from GCC
* qref - QREF clock from GCC

While at it, let's move 'clocks' property before 'clock-names' to match
the style used commonly.

Fixes: 59c7cf814783 ("arm64: dts: qcom: sm8350: Add UFS nodes")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index f4b8439200f5..38a09d71b3e9 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1727,10 +1727,12 @@ ufs_mem_phy: phy@1d87000 {
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
-			clock-names = "ref",
-				      "ref_aux";
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
-				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
+				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
+				 <&gcc GCC_UFS_1_CLKREF_EN>;
+			clock-names = "ref",
+				      "ref_aux",
+				      "qref";
 
 			resets = <&ufs_mem_hc 0>;
 			reset-names = "ufsphy";
-- 
2.25.1

