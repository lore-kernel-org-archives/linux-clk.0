Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419C21836CA
	for <linux-clk@vger.kernel.org>; Wed, 29 May 2024 14:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716994036; cv=none; b=u3LgNNQUemhcKh4duXrWA9kO3jgRiW3Ld4FMC96m/Z7y3KRWOFjcOQTgHnITdjgIjfwPxg3W2RMo5kBCwWB24HeX43/B2ojjJLypCkQDAQng+IAO3xUdYFPEKeKtEV0C1AuKZBK7Mt2I8C7eRpYd3EkJx+yqcu2GTmTf9XwctBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716994036; c=relaxed/simple;
	bh=l9/pjpwSgGhOfTvCCVgGXrF5ytqftHSPNCBAeSrsRJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uCEU9CrwddqIM4pHA92KS8fvsXSFgRn0ICFMqdQOHwjYQ57iADGjkFUWwiaLBhR7jMZfi28DizUhg+wrucdX49pADOtYR+d7g/Fk/7SRdEl3W57Jgxe2xUYLNlBpCuAFF5p+OleVY8mknLJ0N5j+uou+lynHbbr67CDDFMKecCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M4I3SoFL; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M4I3SoFL"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2e724bc46c4so21063581fa.2
        for <linux-clk@vger.kernel.org>; Wed, 29 May 2024 07:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716994032; x=1717598832; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SXcvY1jOYhnCeevZe7OhPJYUBPKIydMSkpTjBw5jQgY=;
        b=M4I3SoFLerneh1T1DflsIYxB9dgqvmAOb2FykecUV8UitvvMY263ChbRZF3PVBCht2
         HQOElqHrZxSUhNib3ZWbgZr0WUDy0hPXMbR2q2N4Jb3RhFFu7zV7S/94dsAHjyviIVxO
         95cQ6wSFIuNe2QqZCrnlQAvvhcncTsj1vbql41tvuomfebJu89ACYcHD8+7OiDXvccaR
         ALysLKpo7za4Slrmy9PtLlES7KTtFDVMGKPM7dTILcIAqhpCQydy0KfgYlNPH/b0IKNx
         4o9MXE8K9JwCDXpxMNMc2UBKnu5PQ2JEh/SQM9UiwiaGVEjgWLHeDZLORjwcsuV8zRBK
         ZqNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716994032; x=1717598832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SXcvY1jOYhnCeevZe7OhPJYUBPKIydMSkpTjBw5jQgY=;
        b=cjVG1wZnNBIaa2wU4Yp6RVpvLRFcV19/kbnP7dLda0SyRXFf7gxwTgYhDubQxyGG4Z
         /Eyji2ySBky/jWY2rqJeIi18dTNZrvuXc5khQODhZKa8sBnR/iHXG4+y2czlsNsktTtG
         0huEBlsaO0rbvwGNZg27VL0NYiaOkyibIjQd1fFQmqrYysBIqFAEIWZ0Ej+phhcXiSVj
         4IbFXXb6sQdQwZXLAJ+c4yD6bGSRTUSzv7VAWaRUHH2XAuJ4k+/aVlXLYSDT8kRwnxyv
         9HLLTjgiVmbh6QXzJ9bBObqvgwLcp/6ysIkuxZ9G5WvgiB6rLDYryUbLFj+25Dbwq2aA
         uoqw==
X-Forwarded-Encrypted: i=1; AJvYcCUANbhd3WLsdtAKJcjF+qvZ/C93X9+uALCw61ZteC2ZevCmteG8pmzbRlHE2j8y9o457PDYcpcWKywsGFabyGzeSD3nDNLJNmw5
X-Gm-Message-State: AOJu0Yz2QHfwAd4OcFYaey0svt+vtNMtNrBFlRuz05+5O0P7bUqB+6PM
	eSqI2L0R/Xk/bo8iDxAbrYLl0aRGt4sptTn+BbMb0pxKCmkbyT2VaJ1hjCi8vFg=
X-Google-Smtp-Source: AGHT+IFkVWagX2TNC4OD24kgper9KH6wdfsVLhaow8/gIpBF2+i6D/J8eTq/gbWNz5BNwq/b+cxWYQ==
X-Received: by 2002:a2e:9c8f:0:b0:2e6:f59e:226f with SMTP id 38308e7fff4ca-2e95b0bce90mr101796171fa.5.1716994032550;
        Wed, 29 May 2024 07:47:12 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e98c45df0csm3791951fa.68.2024.05.29.07.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 07:47:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 29 May 2024 17:47:10 +0300
Subject: [PATCH v2 12/14] arm64: dts: qcom: ipq9574: drop
 #power-domain-cells property of GCC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240529-qcom-gdscs-v2-12-69c63d0ae1e7@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=728;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=l9/pjpwSgGhOfTvCCVgGXrF5ytqftHSPNCBAeSrsRJw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmVz/m9fbxT42WuFyPW7QGWT4BDkthauaUC8Z3R
 X5pimtbeN+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlc/5gAKCRCLPIo+Aiko
 1WfzB/wPvAM008paf09rL8lePXHSYRgKJvSjQqQvncraTGjSQsxci13/FCxjyllgAykgRnMV4Th
 9vKco4HLAfKtMq6uREBPmLUsBXzFauxGLjVaJgYFjAsD6RmJACkJBOqlRmXqd4Tz/eEPJYzbtj4
 xDk+ybYUPlRyNRh03lETGWOiD/uLTwfR5oYVu9NZ496Kt/NxnlBkWkznwbaB662sexiP6fXv5wK
 mnDKZaI3DGJmoTiQ8sz4EwVVPBjkMqWkI/UyOyz+ASy2r4tta8qn7tUqAc+00gdusac667mDwii
 z0SBeTy9dzN+9YoMkSlI00cxJKrdRmFupNgaCB5Vg/WnhP/1
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On IPQ9574 the Global Clock Controller (GCC) doesn't provide power
domains. Drop the #power-domain-cells property from the controller
device node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index ded02bc39275..d21937b09b4b 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -315,7 +315,6 @@ gcc: clock-controller@1800000 {
 				 <0>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
-			#power-domain-cells = <1>;
 		};
 
 		tcsr_mutex: hwlock@1905000 {

-- 
2.39.2

