Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DC5180A8B
	for <linux-clk@vger.kernel.org>; Wed, 29 May 2024 14:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716994033; cv=none; b=Tr+Oi3v7VD+T8cFB1SdPFQDKZPVzJano1FH1bVxE8ZQsNZv1TPry/dnWRzFbo9mwPeOGFUdCVeFSM5vmI9q4qpG5QcIZTNZyvGJ8DtJFpHfabaGe3rXGXTIgCCFrATG7lWbcCkSoq3a/EIln3v/iZ0ktO2hzSChqVUBrfRoOvIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716994033; c=relaxed/simple;
	bh=G5RXv53c1hLv4LM7F4zn3z3FVONduXaRM3LwSBI/B10=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K3V/eaAVTfYMG8qXOgSuRVLec7ZK4x1bq7FMOT5EgUiXSefY3b8Tr1tcp2pekFp54h4k6Ur1Zsi9PfYSkNXG3PP3bpYYsSwEbTLEsjR7YDKPZcXO/v5EnZ9//OBe3wz+j+n6LsdJnlksrI8K5VxlgznZ83xVxT1pQ8+7/2ck8pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QqPE6Vw1; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QqPE6Vw1"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2e6f33150bcso21877091fa.2
        for <linux-clk@vger.kernel.org>; Wed, 29 May 2024 07:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716994029; x=1717598829; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Up7voLI6IpTr60tew+zNNPmNNe/ChsxQ/yaVPYl4Apo=;
        b=QqPE6Vw1AsjtO2j5UpeQ0pMNY1SU8DRnaSQSUKsEpDWvD9lAyaroHxy6kZKNY1cyQw
         Gl927igCigdRtl2++OnjZHbIFHBjXbqr2WPkJRm7e7zpkbQFMrQnmj34jQjZKqeVumKg
         5D7Cp7i/9T8m2j6lBg/iJTj5pZKP9fW914Dyz6cOu7I23TbnU5hGFmqYHrxN5pZaQzr1
         BUKmcvtj4B7uPTPeCY7Jy8IhYZVbvyE/lBg16gor29tAdlJEZawFACFnUHvy6BTyUtmF
         /X+zQyyKS2TS2RWL/8HB0FDZ1MHIEFytszJrODMlABz178bojgdwZbnhvJ/ZcRITkD3W
         DuVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716994029; x=1717598829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Up7voLI6IpTr60tew+zNNPmNNe/ChsxQ/yaVPYl4Apo=;
        b=vaRnUumDo0UbiDe4fcyJDYEzJ2QMeCwkBrIn36NxkL54qQ4cnmajwLCMeD+xQyd65C
         ohDdr0PRQJS9Hwv40GuSXgVDn8k8zaWSTsqt0O61pZu9PsdkZXz1sYJBPFMj7ljZP/ZS
         NalqshPQ83pUk7OcP39T6yN70XGowd/qxOUZjCZiAtU2lOg9HlVSNHjyp5csiYj7oFyz
         +qKa6/M4yLDsN8jSEQ5mUbPdfTeVOJk7kRGm4oqji9KL3KjPKs/pBcklSCgP6jZ8ei9g
         oYF+/20Mf1DfwkYbMCMJASoAdVK5X6rZJSrsDy3KASVsBMKj3a2E7oeVzThaxRt+8ElE
         7Taw==
X-Forwarded-Encrypted: i=1; AJvYcCUUXzAdmV2tTkzAGlxnX5yPhesdkQuXX8+mW5Z/+xvQF0SdcRK3Y3WvcJPYZFnNiLmjbESMckLf4hQs+KwoRwA6C4kddPRVILVM
X-Gm-Message-State: AOJu0Yy5Q6a2iFG9sTFzN8zTMIRsIUeLzcBUx4slMnaXUhedlsKVx9vd
	aAXW/of9Bb5Xzx8JiMUXqtbdrZsT06jKf2wrh3id4FcPB3RwXgZ+ExdIKqOq6bk=
X-Google-Smtp-Source: AGHT+IFdxPSqIzYY5/OBKUguzAhdWTxukIPVKeTWkfd2Z5W4PhNDxwmdr25oHVctqfP0KIBbIkg29w==
X-Received: by 2002:a05:651c:1992:b0:2df:b7cf:9607 with SMTP id 38308e7fff4ca-2e95b0c6fb1mr127182211fa.22.1716994029215;
        Wed, 29 May 2024 07:47:09 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e98c45df0csm3791951fa.68.2024.05.29.07.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 07:47:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 29 May 2024 17:47:06 +0300
Subject: [PATCH v2 08/14] ARM: dts: qcom: ipq8064: drop #power-domain-cells
 property of GCC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240529-qcom-gdscs-v2-8-69c63d0ae1e7@linaro.org>
References: <20240529-qcom-gdscs-v2-0-69c63d0ae1e7@linaro.org>
In-Reply-To: <20240529-qcom-gdscs-v2-0-69c63d0ae1e7@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Robert Marko <robimarko@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=792;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=G5RXv53c1hLv4LM7F4zn3z3FVONduXaRM3LwSBI/B10=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmVz/lhpTmu53rAd76n5+GKFaDXiZ6DP9X7oga6
 QEGJknzQ4+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlc/5QAKCRCLPIo+Aiko
 1YzQB/9g0vhYfrr9DdBzFj2kNiPPOInEcPHzBBpJbcdTEghOUwzS2CxBmFQTirxRXCe5rp+/QdP
 eiciSjwSsL0rv9C+X5z6UPZtUJSz6actn2wPt0Y2s9jAAGJtDEC4PYBzqREibcZ1qSd/0w7HCwV
 hzcVeIKmdL0/FAsbl6GZj84Yg19e0NLqW8cpNfyd/6tEcSWI0yfXLLG1OAzZfnK6SjbxjrvRx6e
 TE9GYY6gv5Wmk6VsJOtYemZIlRk210HM1kdO+lA55lwQwAiPL2RKJXMATmNKXjuFwkouogcboIC
 T5mXm9Wf8bLhCwUsM5g1iFF/OxO9+sfCMG4OXm4TQb/yth3V
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On IPQ8064 the Global Clock Controller (GCC) doesn't provide power
domains. Drop the #power-domain-cells property from the controller
device node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
index f128510d8445..12cf85441a0b 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
@@ -519,7 +519,6 @@ gcc: clock-controller@900000 {
 			reg = <0x00900000 0x4000>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
-			#power-domain-cells = <1>;
 
 			tsens: thermal-sensor {
 				compatible = "qcom,ipq8064-tsens";

-- 
2.39.2

