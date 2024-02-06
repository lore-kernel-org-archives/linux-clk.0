Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0255D1350D5
	for <linux-clk@vger.kernel.org>; Tue,  6 Feb 2024 15:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707233125; cv=none; b=jn/ywZL4AyC0QwV2fxyiG7HPeLauPWPj9UwlQH3TGU+XkPamcUgOC880F4apluNQvIc/Ydb4CjC6j4JH3kERiI5bpgFZTs+QnlqXvFfrFlym4wzptP68Ij2/SDqmTANKkka+RUHYetfM5WZjzOb5ujAhpT9tQRmoBtUIymKhZx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707233125; c=relaxed/simple;
	bh=yifx91rkcMfnToWBeQD2KRv1o1OC8UukHlGx6Y78nYI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QW3TuS29FpNlexm8gIJx4jNS7HyFD1G46SvwI1D6YQBORCPe19ZUgqk/u2YeUSSjDjXsbBzngsAJVT8FyfPMxmU06q6WO3hEITKh0Dr6jSVV6XejD28xvBNFSfFejVouKD0pfWu4jxJTvATZN3U9RQ8WUa/l7BKdhbtlHtJVS8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jhkxFZpM; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jhkxFZpM"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-51160b0ecd9so714226e87.2
        for <linux-clk@vger.kernel.org>; Tue, 06 Feb 2024 07:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707233119; x=1707837919; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D52RHIyTr6s3DO4pboz87MFbLjK48kRtSyUB2vpHi30=;
        b=jhkxFZpMBXNZA5YSbF2AuVcJ2kQ329r799I+LJKEsZRaEoQZ5RX32al8Xl2q0rCgti
         LYuy6Jtbl9TA38AAotGRPlkbz3Lo94pmuMgy6hIQvMyh8rBp/zcDn/H0hxyW5W5Bsq3L
         6NfiA02sV2pVuCkvLHvJ/tA29lj47I+fYF5yFx9+WCn2fBkycMgoDudvjr3Jbdl6QrCf
         39q30dPUjS2Jpu1iFOg+VzRtxvGy+NpjYgLJelpOX6YXO0b/LWeuUitxnNywUEjM/j3a
         rJVkwdBWGzjDH+bA7mW7fzCl5Qj2BLBm5Ei6Jgd13CsKPq6WmEVPBX6nm3Wv0uYW6g2u
         zLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707233119; x=1707837919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D52RHIyTr6s3DO4pboz87MFbLjK48kRtSyUB2vpHi30=;
        b=faYooQZw0YDLQ2kdbKcV0zApxuqVbYsQcjs0yr3ssd62aq9EgwmKcHUuVshk101hwU
         U4N9arztaDtJWmQW/t3+/f1aO+m76L2Tr23if5DG/72GL3n8zmpslD6Wf9ROybiwLcuR
         d2IPpstWa/qQ0ao3s5xTvjoj/ALWhOmG7RsEpA/e/+/FMEeRfnY6dEyf64uPSjxRBJbz
         fiIjEnCIa3cHDTrykQqnA26V5UiDYGJvV9UKREeWidBk5JztkIK4MN5BlCi4cJLkiYku
         C6Xsm45c7dqsVbr0xO5u9QAX8R+C8aFKKA2GrbthZYk9VQb7J/svFlAXfYRz7TMOpjeU
         Jbqw==
X-Gm-Message-State: AOJu0YySyH4CO0b1k4OFpYBtNMO9oU+cTC7bQ9/EkRPrROU8GiI5ea2d
	8KkN6+X+NTCEEQePIDncy0xJOJIPPk/BGUP4L7b6ll2p9uCFNWitZrgPlhfRcI8=
X-Google-Smtp-Source: AGHT+IEDvWm4ZLVhZe2DRNQXBdgAKXdN8ZforTZp7ftEcjPd9l4kNLBDfkojQ8F8hO4abqVoi3XNlA==
X-Received: by 2002:ac2:5147:0:b0:511:429e:43d4 with SMTP id q7-20020ac25147000000b00511429e43d4mr2364505lfd.11.1707233118261;
        Tue, 06 Feb 2024 07:25:18 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVqGjOnQAR7j9WA64WG7lE827hNuLJb6pIAsz+JzIMKrhptjgW5RLQ8nJxStOO+m9fJs3Hv2YH+13N6Bzz+uZ8e41jaxSUgfQEtIdNej5VEEbQftzBnB6jKLfSZF3ZV3qOPdQjFSQ1m+UmtWHrNjqmlqXRmTaxaKXKJwshSdcFi2AzkMgfZBgF/IoRhjCZ4O15WxUZ730BfIoBcu8+wrC+OypdyrEgegnr/Sy4mN2lLARTQ5sWcgBvNG4/trS+tq+ffAg==
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u4-20020a056512128400b005114a6cbc57sm264624lfs.46.2024.02.06.07.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 07:25:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 06 Feb 2024 17:25:12 +0200
Subject: [PATCH 1/4] clk: qcom: camcc-*: switch to module_platform_driver
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240206-clk-module-platform-driver-v1-1-db799bd2feeb@linaro.org>
References: <20240206-clk-module-platform-driver-v1-0-db799bd2feeb@linaro.org>
In-Reply-To: <20240206-clk-module-platform-driver-v1-0-db799bd2feeb@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3327;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=yifx91rkcMfnToWBeQD2KRv1o1OC8UukHlGx6Y78nYI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlwk9c1OD89vsKmbyj+9+ZrdgwD3Ew/t4DPwHk6
 JGQuTokBYOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZcJPXAAKCRCLPIo+Aiko
 1bgSB/0T0k77HpSxj+XzNsktYFuMalkvX18RaIptZVZscbAIq0eE1Okn4aHChwsGFTn+1fC97AI
 gVqBKbYuj50D2bqgfkG/r99nk5sWGfkzRLban/efMZGfP0KpSy+fVVfFCqHL1TZ9tWNBt+R75ev
 XxCtWYM27ECwnlev1faLu1HhagErRqzk/PCwTyYDfKWbRXeZusuMilrPQzE7XXbw7S0W83I8RkR
 0NU2GU+CifZmK5F1bzSfMk7iuyLoiT8dahh7XLrD6Vxf2GQM64bo5doYev4/feiErK//e9fcwwq
 IiTed6Z8+H1AG1Tq9UZRDy+7pZZyFP9UYTzrQsdCPGIKevUg
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

There is no need to register camera clock controllers during subsys init
calls. Use module_platform_driver() instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/camcc-sc7180.c | 12 +-----------
 drivers/clk/qcom/camcc-sc7280.c | 12 +-----------
 drivers/clk/qcom/camcc-sdm845.c | 12 +-----------
 drivers/clk/qcom/camcc-sm6350.c | 12 +-----------
 4 files changed, 4 insertions(+), 44 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sc7180.c b/drivers/clk/qcom/camcc-sc7180.c
index 0a9a6df3ddac..a78808b22b03 100644
--- a/drivers/clk/qcom/camcc-sc7180.c
+++ b/drivers/clk/qcom/camcc-sc7180.c
@@ -1703,17 +1703,7 @@ static struct platform_driver cam_cc_sc7180_driver = {
 	},
 };
 
-static int __init cam_cc_sc7180_init(void)
-{
-	return platform_driver_register(&cam_cc_sc7180_driver);
-}
-subsys_initcall(cam_cc_sc7180_init);
-
-static void __exit cam_cc_sc7180_exit(void)
-{
-	platform_driver_unregister(&cam_cc_sc7180_driver);
-}
-module_exit(cam_cc_sc7180_exit);
+module_platform_driver(cam_cc_sc7180_driver);
 
 MODULE_DESCRIPTION("QTI CAM_CC SC7180 Driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/qcom/camcc-sc7280.c b/drivers/clk/qcom/camcc-sc7280.c
index 49f046ea857c..d89ddb2298e3 100644
--- a/drivers/clk/qcom/camcc-sc7280.c
+++ b/drivers/clk/qcom/camcc-sc7280.c
@@ -2468,17 +2468,7 @@ static struct platform_driver cam_cc_sc7280_driver = {
 	},
 };
 
-static int __init cam_cc_sc7280_init(void)
-{
-	return platform_driver_register(&cam_cc_sc7280_driver);
-}
-subsys_initcall(cam_cc_sc7280_init);
-
-static void __exit cam_cc_sc7280_exit(void)
-{
-	platform_driver_unregister(&cam_cc_sc7280_driver);
-}
-module_exit(cam_cc_sc7280_exit);
+module_platform_driver(cam_cc_sc7280_driver);
 
 MODULE_DESCRIPTION("QTI CAM_CC SC7280 Driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/qcom/camcc-sdm845.c b/drivers/clk/qcom/camcc-sdm845.c
index 27d44188a7ab..8466d03e0d05 100644
--- a/drivers/clk/qcom/camcc-sdm845.c
+++ b/drivers/clk/qcom/camcc-sdm845.c
@@ -1746,17 +1746,7 @@ static struct platform_driver cam_cc_sdm845_driver = {
 	},
 };
 
-static int __init cam_cc_sdm845_init(void)
-{
-	return platform_driver_register(&cam_cc_sdm845_driver);
-}
-subsys_initcall(cam_cc_sdm845_init);
-
-static void __exit cam_cc_sdm845_exit(void)
-{
-	platform_driver_unregister(&cam_cc_sdm845_driver);
-}
-module_exit(cam_cc_sdm845_exit);
+module_platform_driver(cam_cc_sdm845_driver);
 
 MODULE_DESCRIPTION("QTI CAM_CC SDM845 Driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/qcom/camcc-sm6350.c b/drivers/clk/qcom/camcc-sm6350.c
index acba9f99d960..e4e7b308ecf1 100644
--- a/drivers/clk/qcom/camcc-sm6350.c
+++ b/drivers/clk/qcom/camcc-sm6350.c
@@ -1890,17 +1890,7 @@ static struct platform_driver camcc_sm6350_driver = {
 	},
 };
 
-static int __init camcc_sm6350_init(void)
-{
-	return platform_driver_register(&camcc_sm6350_driver);
-}
-subsys_initcall(camcc_sm6350_init);
-
-static void __exit camcc_sm6350_exit(void)
-{
-	platform_driver_unregister(&camcc_sm6350_driver);
-}
-module_exit(camcc_sm6350_exit);
+module_platform_driver(camcc_sm6350_driver);
 
 MODULE_DESCRIPTION("QTI CAMCC SM6350 Driver");
 MODULE_LICENSE("GPL");

-- 
2.39.2

