Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A1D13698F
	for <linux-clk@vger.kernel.org>; Fri, 27 Sep 2024 10:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727433140; cv=none; b=V+Batt8u+LzF73pIkmNZAOirNiaTXgYKvIhUDVuxQftDenXvoFbz5OWoDX89f2ShEdHd3G0mmC7Zf1XlpiTSiz0azigaYQqlI87sr6xVx5hyNAPa6+de/clM5oRcYl/b3O63D6SWn7vXFivWKKKw1AhLzEXRV5pw8i985hiFc3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727433140; c=relaxed/simple;
	bh=VpBNp249YzpZXC9Rky5huhq6sb6/jAcrlMwbud4eelw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dQcjNcmbcj1MtrNXql7xgch0Yv2eKor6AB0kGUvRGgKRJQxxTu+rtZyZM/pO0a4V2/eo13uU1d+ejwEQLGw9J3bEjSqXlb7AdSY0ChvWkYKRpLPg7Viomi+LLOwhErI/61/iM90btOTByVEtNzR3/oghXZOOrDG9dHsPJUTT5co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PGVNDkIL; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PGVNDkIL"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f8c439bc1dso1202611fa.2
        for <linux-clk@vger.kernel.org>; Fri, 27 Sep 2024 03:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727433136; x=1728037936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OrSvEBMT63eFKBOH/M9CK7Cc9dzPCKyHIsn8PR3V8co=;
        b=PGVNDkILwM8JGOC4US6aEYRU1JRSuX682QuDqca4HbFhaKfonBQgjkdqGnzp84B6lk
         Sv4vqXVNhZDF+QhXMC3iIRLmFYPHWmQbru2SoZ0IrETAGr4dsIIOtrQ8d5w6QzwPVpH0
         Jl6P+1c4horo/TWfMdsL1LxrIlzVkAOtc8JyHujCOaMFqnFw7AvMwHfpe0gerkUrKa+/
         olGHz4RFWweGzmaqkOf56KQhUe024yShNSXsjmSLmEnGzkM9g0EmwVxDIZqWmuG/drE5
         2cdUq1mkeXH7gLLyNW3A1Qc3Jhh+qqM7jeiVSQO3ogHtpIX38uolhpXTQloK288/wr4b
         rq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727433136; x=1728037936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OrSvEBMT63eFKBOH/M9CK7Cc9dzPCKyHIsn8PR3V8co=;
        b=CJ94mRH6STZozG98NzE3zTcTDHjlqpTqbuYQ+FzxYorvmdu7fLUVSiUgf+StttJ012
         ceXxhRj2hEaLNy+1oBtLIcKL0X1TJArr58X/YQtW6uKDWNeiT8siOKOWLDE3r7HqFjJk
         clUzeMVP2tiuJq9p2+h3HePtVaVIYHn771vOFR8ooKjafekdp/L9L3tdUBrqNixjwZfJ
         EilYA4ySrOK/v5IbXanobRwYTqxKspmWf8cARH4tLy+1NVeJO0W8I2q059Kt3J9a8JqC
         XopUNBYu06BKJAU7DA/8hjJw9VAmfS7y9TYOF5PsObYQgOIRueMZtJAqrNahNEyhDQiI
         gqWw==
X-Forwarded-Encrypted: i=1; AJvYcCUcT2y1MxDI8g4azKqUWgdNV+lInmao4pf4kh3IRJIO79dON4kQX+b85ZPg6fLbkAxpbpqfinTIBkk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUkffCdsEVh9TD+M0a3eslp513rEuVVMzgk2ckflF/Zh+Hx7AG
	58iE3Tx5YikcU+6Bqdi/Q11Epv1GdboRoj/KHeXsRLL6GjxbMD3DIFZzKehs2Yo=
X-Google-Smtp-Source: AGHT+IGcdmN2CX08WxP43TGUcVs80qumV8LOKvPfnAtO/+6Y5H5nrPaYJjWrIlkM9WODMBJ1MMd2rg==
X-Received: by 2002:a05:651c:54c:b0:2f7:5c23:98fd with SMTP id 38308e7fff4ca-2f9d41c1bc0mr5341211fa.12.1727433136151;
        Fri, 27 Sep 2024 03:32:16 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5389fd5e333sm259724e87.76.2024.09.27.03.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 03:32:14 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/3] arm: qcom: sm8550: Change camcc power domain from  MMCX to MXC
Date: Fri, 27 Sep 2024 13:32:09 +0300
Message-ID: <20240927103212.4154273-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The problem is trivial to reproduce and the fix is trivial to verify,
it's sufficient to enable SM8550 camera clock controller and a CCI
controller, for instance on SM8550-QRD CCI0 or CCI1 can be enabled:

    &cci0 {
	status = "okay";
    };

I made a special effort to check that the power domain in SM8550 camcc
is sufficient to be replaced, and Titan and other provided GDSCs can
be turned on/off, if the clock controller is disconneced from MMCX and
MMCX is off according to /sys/kernel/debug/pm_genpd/pm_genpd_summary.

Vladimir Zapolskiy (3):
  arm64: dts: qcom: sm8550: Change camcc power domain from MMCX to MXC
  dt-bindings: clock: qcom,sm8450-camcc: do not restrict power domain to MMCX
  dt-bindings: clock: qcom,sm8450-camcc: generalize title and description

 .../devicetree/bindings/clock/qcom,sm8450-camcc.yaml      | 8 ++++----
 arch/arm64/boot/dts/qcom/sm8550.dtsi                      | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)


base-commit: 11a299a7933e03c83818b431e6a1c53ad387423d
-- 
2.45.2

