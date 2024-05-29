Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2A91802B6
	for <linux-clk@vger.kernel.org>; Wed, 29 May 2024 14:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716994032; cv=none; b=jGDCqsSGF0nAbqxFgzlLtZ9VLIsOMc1CDNhZBy5gsAFEt7y6CbKGHOGqhazDPj3Y9K5O7j0aCtGXFF5UHb8B6vHyJ44J2DqSuPkvU9q6HMity8daT6sn45veZ/KHAkagTHgByc2F+WhPsv7oZiIup1tYgf1MJPH+pgAWXyxF1D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716994032; c=relaxed/simple;
	bh=uKNrIp4viLGzK6BkL6K9w5oOIHrhcRnBTuSiYbEFQRc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t39vOncJ7WTImL9+7dkayOATQobNkYhXNr6cy5yEI6whzpk4eSAK+J/1RSRZVqedowHQ5gOubh6WvEIAz9eh/xw1wEXK2Uo3lV0DDepczBjKclGxbS3QpZIsGnTZgRbslSLDwG5zAGUgiMQvi3Rzom1Fo9toqmYMwgeAv9iqNM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=avUE+xIU; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="avUE+xIU"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2e724bc46c4so21062491fa.2
        for <linux-clk@vger.kernel.org>; Wed, 29 May 2024 07:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716994028; x=1717598828; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=khgPt+BmFpi1I3oCVHG3Ty2yeVPqhHvdpCjaMeXRd0g=;
        b=avUE+xIUwUJ9oB+26G/bCV/qMXHJ/rNe9wJ5KlQ3S6cWmY1fJt96qu6ri5QEPNplM6
         VGGt5Sod3DGdMZEyJtS5nAAGUtV19dBPyLmCwh+0nnivBGFm2TsUYp4Wwp4YVLh1vWaT
         M/gVAadH2B0qtyzO05pSPFbOsPrOvdZ+rCu1s8lBsC6aQ/9brQOCWBHQDsrx8HqnOnqQ
         wZvK4XSx1jNvuR2P1zawcguPgNyVVkrytS7NfR0LrkfknkSHgZr4Omhq2Af2vHuTb6IY
         mW42uUIPjOtSho30/BbpmZcP89+VWbthYgFf+rbroq/maxP1/Uu13f+2rDeK2PPOyeeF
         OKFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716994028; x=1717598828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=khgPt+BmFpi1I3oCVHG3Ty2yeVPqhHvdpCjaMeXRd0g=;
        b=Plzsqt2TXz6vYgpl5mk3qdYjxFiLptUBH4QsX3uBue8jsDydcbMvv/m24cypJ2akli
         1ez8O87e4qJLS1j7ncpN1txlN5dAyaSOFHqMKxZCrfFxGbYAAtY8YT45WkMbEKVag5bI
         MAyyFufGrTPh+W5aq8gxS14U/aIR4dCrh7SQcziw45AavNTCXIXEyDzhEC96KAB0rt0G
         slqcuVMShjhwEMvjcliZipil1l70sDed/iz+9Q8bsyOlDPBoLRc89qq/uCry0QEl1o1I
         SElzNz0khGJbDQVSb4FUhZTnPcWjMYzVChe58WClWj13RNNXjy8c01qiTi9gE5QagSxP
         x73Q==
X-Forwarded-Encrypted: i=1; AJvYcCWd4yV77e9nAs8E79+5BMtcROyU5q2Zaq6fbC6h+gLeYwzitSTUpA1ZVRRRUhgE963jw0nfA5wEfttaTh48wvswKeoaXNFIt8Dx
X-Gm-Message-State: AOJu0YzGjZDaHqTH2hPrF0D0l5tGdhIBKeoJ6EfwW5WXJT9J42o3HbXJ
	njcaw6oWyYNxYP3SIquEqqVFLSzR2B5288fUKHYrx5IwIdZRHPnGKqSUsTi+7Bw=
X-Google-Smtp-Source: AGHT+IF9cMxPbvCtxM3jqZMV8WH2CGbopeYVJcAeJYXk1F03jFsPFSdJIyXYUYaKGDBVl+vJj+fPEw==
X-Received: by 2002:a2e:9b0e:0:b0:2e0:c81c:25da with SMTP id 38308e7fff4ca-2e95b229936mr94499081fa.30.1716994028551;
        Wed, 29 May 2024 07:47:08 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e98c45df0csm3791951fa.68.2024.05.29.07.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 07:47:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 29 May 2024 17:47:05 +0300
Subject: [PATCH v2 07/14] ARM: dts: qcom: ipq4019: drop #power-domain-cells
 property of GCC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240529-qcom-gdscs-v2-7-69c63d0ae1e7@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=834;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=uKNrIp4viLGzK6BkL6K9w5oOIHrhcRnBTuSiYbEFQRc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmVz/lGa0oUyHGlTplYCLm8gyadkAUiHdWEMPk1
 UoB9ApWpc2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlc/5QAKCRCLPIo+Aiko
 1X66B/4lbabGfq1tYTyadR39KhgQ0Sla22IOZcqOtwy+h1zftMjW7qJSJbAmuhTZIPlmDM2AMZX
 /BBthChJXZMQUNZ5ZvYRBlRcgVN1q6UjWW9iwfNDus9L3IdDIlXWBFl1SN4Uv04C78Bozwb0rUH
 f/548fFhxLwK7KhpLZK6Kmn3SK3WhndkvWhlf4Qf1zMIdqg9MA+TOdYimb4Tesk/4p2vzkj7bPY
 Nbm4oeEbaDBn9L8rKxJurFjSxPdZ4hJVb2FU8liSmoAoXBrT4mTXhNwIn5bsZsMU9bp+mT3C79N
 OVn72Uk5DdYmoEqYJr6inDaU0O82kKl1I3C5EDj4M/uCNjhi
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On IPQ4019 the Global Clock Controller (GCC) doesn't provide power
domains. Drop the #power-domain-cells property from the controller
device node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
index 0fb65f2bbcdf..56415ab34083 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
@@ -187,7 +187,6 @@ intc: interrupt-controller@b000000 {
 		gcc: clock-controller@1800000 {
 			compatible = "qcom,gcc-ipq4019";
 			#clock-cells = <1>;
-			#power-domain-cells = <1>;
 			#reset-cells = <1>;
 			reg = <0x1800000 0x60000>;
 			clocks = <&xo>, <&sleep_clk>;

-- 
2.39.2

