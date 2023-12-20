Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B3D6133
	for <linux-clk@vger.kernel.org>; Wed, 20 Dec 2023 00:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B1wiASmD"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-552ff8d681aso414043a12.1
        for <linux-clk@vger.kernel.org>; Tue, 19 Dec 2023 16:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703032259; x=1703637059; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F/XYeH7WpVmrRfjifn0LxMiuPs0oZ+EZwghWZGkWLzI=;
        b=B1wiASmDbWdNpJW1qrAy0VLJyNG7zvBTwgCHbq6JnjBQPkXVCvFfEf2e/Kj+pZt/u9
         OOqK4ot1qeFRVb0NrWnZ+MQqvpQ4ZPJplaovtmaxtf2plKDa5dRs2y6a+mnHcx/eqilt
         hJBCek1SCcNdigUkq8pFjJWZJztV5tVaYH7DGWIFGyw6xyXMMTLSzalRAK5cqaU16j8G
         xbR7K8eJMYbPQsLB4rNx5jbc64XOh/K/5xNtffScxMfiwagXY6JPN+xHUlYfNZeKHgXF
         FwwKxb6ql8bV54CZU8FLBftUIEE1a1PwvFtPy2CCMR+B9efxdFuEc/HDP96YauSk/IJY
         fi2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703032259; x=1703637059;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F/XYeH7WpVmrRfjifn0LxMiuPs0oZ+EZwghWZGkWLzI=;
        b=dRO2Uq5NPBZQJOwLqStfLoPi3AqfKu/kgy1/iFf8p0NSi64K/bsa9GFtg4wGALmzlq
         WY5FeEg8241fW7Y34nVCY42UwM2cuxQ9llz95Y5TSu5cJBuksZg8D5XZ1nJRoxEaE4bd
         k7FqUT7+5MqkwFW4wL+UxnxmvFypbYF0La1FKuhAKEwXq5hbbradwoYp0wIyb0qF7/ET
         grRO+Rdna9CDB0NWRUc0gKTy2zGttYM4cADJ6am63R2Rw5UgeWnuMgQz3lXgLkpD+KjR
         7DdAWhJl/kCeFFIoP6Hhuc50LJCcGWuid5BXDUGiWTHURFCVD6vUCAgR6Nln5kJZcooa
         hzfg==
X-Gm-Message-State: AOJu0YwzI9pJFwMMOLf5H+1D+woUxNkf0j/dY+/fOykY/MKhdm+JdA/v
	QnwHwOpTTpm5rtO21T/n1A2ZKHz7hEI/Ow==
X-Google-Smtp-Source: AGHT+IFOo2mBEF3Nsj8/MM+wANjo89gx8h32sWbZlrkBRuEvOXPOF2O608FF7RfB2kL7kIU+ythNqw==
X-Received: by 2002:a05:6402:3d1:b0:54a:ff0f:78d6 with SMTP id t17-20020a05640203d100b0054aff0f78d6mr2069269edw.0.1703032259623;
        Tue, 19 Dec 2023 16:30:59 -0800 (PST)
Received: from [10.167.154.1] (178235179206.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.206])
        by smtp.gmail.com with ESMTPSA id k16-20020a056402049000b00552d03a17acsm4824397edv.61.2023.12.19.16.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 16:30:59 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 20 Dec 2023 01:30:45 +0100
Subject: [PATCH v3 04/15] clk: qcom: gcc-sm6375: Add runtime PM
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230717-topic-branch_aon_cleanup-v3-4-3e31bce9c626@linaro.org>
References: <20230717-topic-branch_aon_cleanup-v3-0-3e31bce9c626@linaro.org>
In-Reply-To: <20230717-topic-branch_aon_cleanup-v3-0-3e31bce9c626@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703032250; l=2103;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=4UqVyq+AxibHs92QeNlETxsytT0HCThfcpvGOwkFOrI=;
 b=iiSeyWs/O2OzHZmgBEJRedCWaba3810lLJ3uOd1HuHXPKwcNas15q3llZzKivf1j0k5R+CVyG
 64XDCxRuzftCQE18X1QayaGxOhMJjD7K/qKRoBUdjbrvpkjMZIkWJNv
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

The GCC block on SM6375 is powered by the VDD_CX rail. We need to ensure
that CX is enabled to prevent unwanted power collapse and that the
reference is dropped when unused so that the system can enter a
firmware-managed lower power state.

Enable runtime PM to keep the power flowing only when necessary.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gcc-sm6375.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm6375.c b/drivers/clk/qcom/gcc-sm6375.c
index 44c74e74885f..dff0b2f20759 100644
--- a/drivers/clk/qcom/gcc-sm6375.c
+++ b/drivers/clk/qcom/gcc-sm6375.c
@@ -8,6 +8,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,sm6375-gcc.h>
@@ -3785,13 +3786,25 @@ static int gcc_sm6375_probe(struct platform_device *pdev)
 	struct regmap *regmap;
 	int ret;
 
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret)
+		return ret;
+
 	regmap = qcom_cc_map(pdev, &gcc_sm6375_desc);
-	if (IS_ERR(regmap))
+	if (IS_ERR(regmap)) {
+		pm_runtime_put(&pdev->dev);
 		return PTR_ERR(regmap);
+	}
 
 	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks, ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
+	if (ret) {
+		pm_runtime_put(&pdev->dev);
 		return ret;
+	}
 
 	qcom_branch_set_clk_en(regmap, 0x17028); /* GCC_CAMERA_XO_CLK */
 	qcom_branch_set_clk_en(regmap, 0x2b004); /* GCC_CPUSS_GNOC_CLK */
@@ -3807,7 +3820,10 @@ static int gcc_sm6375_probe(struct platform_device *pdev)
 	clk_lucid_pll_configure(&gpll8, regmap, &gpll8_config);
 	clk_zonda_pll_configure(&gpll9, regmap, &gpll9_config);
 
-	return qcom_cc_really_probe(pdev, &gcc_sm6375_desc, regmap);
+	ret = qcom_cc_really_probe(pdev, &gcc_sm6375_desc, regmap);
+	pm_runtime_put(&pdev->dev);
+
+	return ret;
 }
 
 static struct platform_driver gcc_sm6375_driver = {

-- 
2.43.0

