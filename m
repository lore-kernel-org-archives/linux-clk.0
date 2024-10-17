Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B6E1E9089
	for <linux-clk@vger.kernel.org>; Thu, 17 Oct 2024 16:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729184242; cv=none; b=aIHh9htqASAM7j7SV5ha+iixbD5b7xVmeCchQ0oRkwRdwxwYZfK8fmUt87PCs5kjsY4f9odXrvOvXXd0eZXNIXz72Zsx1ESTfsgFGL+hxn9pXu3xoVlheP1hxgx+FPJnItuI4eowP1omeIUFEDuSl25nwBHUdoI4BPZ/qDojdlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729184242; c=relaxed/simple;
	bh=IrkjMQ7RH+oR98f5gh1F2pyya/YzwCwypAUZHAFGYso=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RFk4WkkDwkiHg3e9OeRTIVfJp08poIOwbFjGLy3VYKDnRxazmNC482yA7+DaYUkNyKhbXQb+l5xwpG+htdXPo5/0y50Z2a1ppcbAiN2wJ6zWx1kAckYT64oBAweno7FaP4A0brW6ydihicBjpQI/bQDCr7zq0xprmHr2LBjLF48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yO1az8kD; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yO1az8kD"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53a007743e7so1519606e87.1
        for <linux-clk@vger.kernel.org>; Thu, 17 Oct 2024 09:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729184236; x=1729789036; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WU7Pijydi+sHx/XtPKLXbQVt3AZtfZFORsZqT/64C/k=;
        b=yO1az8kDCf3XAlKkDMael9xui9NW93SMcACzSIRyYSEcViGQiKxmsBHebeKBVdGoyr
         tLJEKA422RnjGsUsi7egYSWJz7mrHAGvKydLjZ0srItIrwWtYovzCWCjkojLjgxZfiML
         0jepVjTdQJlSar2aXDc/1dKUpL+iGsGteJ7zccNo2Rwp45AGrY0pNxM7PMwFGadrjAc0
         oAoAqYvegV3oPD4wJ/+A+EfNPO75F9jFAVObRIvjlMvmT+kn8UlFVHV97VyaH1VbsxGI
         ihTKAbvNbmBcl6FkzMbDAAFNpZmvUocZEzQJ1kdw/gdwsZ0pIR2vj63kdQDQSoZWr2v2
         pZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729184236; x=1729789036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WU7Pijydi+sHx/XtPKLXbQVt3AZtfZFORsZqT/64C/k=;
        b=SS53YTmyGSRUfIXSkGvMwVT40S0PBwff//nYPyee64Zf9gMPxaPuhsiyCGrOh76k+q
         0sjcEdP5WjNEXot9q6ubGiUj22sAwIdVHX/ehf5PUmvXUmqlYrmQoa5/gLDEYyLSTug9
         Gl5lLkXFX4vyyAK878f9JsUA1ZBK9yL0oWBG5ham7Stc2gtre0EVpwZwqM6EUCNrecsz
         kCqUgK1PhNJI9afyLLbaxcPBWY+fOAyObVWCpOJtnQnV6Omoa+3JP389HP73OiV5MRdW
         kO+Frnhvevnrq7McfkUllT55f68q1uZux4m8ns29DVgNIhQdVpdihw5zBhoiCTyyzNGy
         bDFg==
X-Forwarded-Encrypted: i=1; AJvYcCUc+xKEwAe3vWB8QhzxKIbXI2wE3S3AgLFYiVZYTRRg6A+5FZ5MbnMQQfTurgz5KhunOf17+fvetYg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYQlZWyD9eaVMbTzaHTMLU8AETsS7JFepSz558o6CTEXh1d93D
	eH6diDjTlcNE8StV5iN0fi3uaEtRX/qvlkfCXROxPkb1Jl2CjEqNYOpydIJo+ms=
X-Google-Smtp-Source: AGHT+IEzEdvDk1bKinShhCEGaRDwEUs5ILPk8w4msKlOlBROEaXL9PDpvshNYbQeVzx/cceNge1P2w==
X-Received: by 2002:a05:6512:684:b0:539:f699:bb2a with SMTP id 2adb3069b0e04-539f699bc9amr8740519e87.20.1729184235961;
        Thu, 17 Oct 2024 09:57:15 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a00007078sm821563e87.212.2024.10.17.09.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 09:57:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 17 Oct 2024 19:56:56 +0300
Subject: [PATCH 06/14] clk: qcom: clk-branch: Add support for
 BRANCH_HALT_POLL flag
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241017-sar2130p-clocks-v1-6-f75e740f0a8d@linaro.org>
References: <20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org>
In-Reply-To: <20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kalpak Kawadkar <quic_kkawadka@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2255;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=WCKh9ozPzFq+qKXhVDmEYZoe2DfonGQ7wytIhUMoLDI=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnEUHbwAeRc3m0jgK+FNqlTNJv37Ha5x02AJRfd
 yRChuQTI9aJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxFB2wAKCRAU23LtvoBl
 uE/aD/0YY1+GNYyofwWH6W4DIAyTdRcl/BBdbXFYyiBNLDLaeTBLfeSjWS88k8tAJ3js18F7Of1
 aQzJjkGvnjXIs1UqLfoQphuNkQmoRMg3K2AJ8znHa0EI/Ytpre5UgBJee2Ps3RwQEptmUzZCQ5H
 4KzBAJbyXPyEeELztJvV+1F+o507pBQSEZHkRQJ0jG4+n3hbdxxgM+hvK+V1j4w6Xgw8KBER0qz
 5HPQq1+BYQHvS+S73MPYpZAdhiyEYsuyJnu+9zrM0JuB/PMa7ICYNIcvK9M46taXfFY17ZqPZKF
 ehE3zUuX8KFbaS2ciyxNjh9cyoZAkeMl2h4i6G21IyVyM6edchDqqa5DeGXl/d+6U6V8K74iXgT
 kJSmeXXc0si5Au8LCdQJbu1c0Xz/YdbbpuEmaLHDJAoXRkDT+Oj5xKMlIDZWBbeTxz2tDWXvMPJ
 2NDh9R1ysXbIks+qZPWJrSrQ/MRGISBOzn1m2Byl1+HDXWhzwfVIqaP3GBpBZlWU3mbYKm0qvrz
 5WL5GgBeraLNTgCq8WiymeDNUGf7ZZd6rhPkiBbjk5s858sBUNzjdcQ4T++xZ6rMCB9JFVo8WCL
 QlQTNaFJLyPvhxp83d3BAVQKHxNj7SCGw18EAXj+BQXn0fMxxPegw4yXJV1qlD6XS80x1fYhRWM
 oxxwwBM2dvD+WAw==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

From: Kalpak Kawadkar <quic_kkawadka@quicinc.com>

On some platforms branch clock will be enabled before Linux.
It is expectated from the clock provider is to poll on the clock
to ensure it is indeed enabled and not HW gated, thus add
the BRANCH_HALT_POLL flag.

Signed-off-by: Kalpak Kawadkar <quic_kkawadka@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-branch.c | 7 ++++++-
 drivers/clk/qcom/clk-branch.h | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-branch.c b/drivers/clk/qcom/clk-branch.c
index 229480c5b075a0e70dc05b1cb15b88d29fd475ce..c4c7bd565cc9a3926e24bb12ed6355ec6ddd19fb 100644
--- a/drivers/clk/qcom/clk-branch.c
+++ b/drivers/clk/qcom/clk-branch.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (c) 2013, The Linux Foundation. All rights reserved.
- * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022, 2023 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/kernel.h>
@@ -76,6 +76,7 @@ static int clk_branch_wait(const struct clk_branch *br, bool enabling,
 		udelay(10);
 	} else if (br->halt_check == BRANCH_HALT_ENABLE ||
 		   br->halt_check == BRANCH_HALT ||
+		   br->halt_check == BRANCH_HALT_POLL ||
 		   (enabling && voted)) {
 		int count = 200;
 
@@ -97,6 +98,10 @@ static int clk_branch_toggle(struct clk_hw *hw, bool en,
 	struct clk_branch *br = to_clk_branch(hw);
 	int ret;
 
+	if (br->halt_check == BRANCH_HALT_POLL) {
+		return  clk_branch_wait(br, en, check_halt);
+	}
+
 	if (en) {
 		ret = clk_enable_regmap(hw);
 		if (ret)
diff --git a/drivers/clk/qcom/clk-branch.h b/drivers/clk/qcom/clk-branch.h
index 292756435f53648640717734af198442a315272e..47bf59a671c3c8516a57c283fce548a6e5f16619 100644
--- a/drivers/clk/qcom/clk-branch.h
+++ b/drivers/clk/qcom/clk-branch.h
@@ -34,6 +34,7 @@ struct clk_branch {
 #define BRANCH_HALT_ENABLE_VOTED	(BRANCH_HALT_ENABLE | BRANCH_VOTED)
 #define BRANCH_HALT_DELAY		2 /* No bit to check; just delay */
 #define BRANCH_HALT_SKIP		3 /* Don't check halt bit */
+#define BRANCH_HALT_POLL		4 /* Don't enable the clock, poll for halt */
 
 	struct clk_regmap clkr;
 };

-- 
2.39.5

