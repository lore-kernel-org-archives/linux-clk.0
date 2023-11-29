Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jqvu11zI"
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 216A310FC
	for <linux-clk@vger.kernel.org>; Wed, 29 Nov 2023 10:59:48 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-543456dbd7bso2384976a12.1
        for <linux-clk@vger.kernel.org>; Wed, 29 Nov 2023 10:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701284386; x=1701889186; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iL7/cJ6kElWHnhbek3aTb1dfvRVji6nGvSY/NIw03Sk=;
        b=Jqvu11zI9a2HHGkMmL+VneB9mPTxGB1eingSeb0yv+Q6Hb/XsOLff3fVktfasCTYRn
         qyoHB/0B1INYb721opUBdkhvRK8uVA3Mnih1b6gi7zTLc4vQWvZsme/QTqQGXat5BePg
         pPAw2iTHHlLS+9ziIs0z9mE16QYcW1G0Q0gWJyxZPz6xVhj89vAzMkse+MsM9Rq1mpfd
         2q32fsfL8j8q3TFxDyTG5SgEqrx9lDBj00VgBvRDjsb0nZqgwhiXf0DeqMfUK/jKa24L
         snhPq1IW2+7w2nRJmCxlDIMcg4lXlp7m01Ofdqf9UGJO1yC8I5jPzacyI9UAWnJo4oXb
         zvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701284386; x=1701889186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iL7/cJ6kElWHnhbek3aTb1dfvRVji6nGvSY/NIw03Sk=;
        b=SgVIK3rLuPjwoydK0giotcolds7Uq2olx8wE1bx/pf3QOPnrdSgL0cFEkAb8Tu/B4Y
         C1J6YWgZ7pwpPghemyXwur3RbjdL1Ti3ElW5GPOXZ8nhwh4yyx6UWz9V3cNMeTHaYv4A
         MCeBChenAjZZj9sxF7mun/zkzonrCjsE9hFjXOsdFrG1nvqKUdAPvchBCQRleeRqLos1
         mCX6lVEllXv3QpGwdY4U9FEliSd3cWN4qZGR3R/M4FiADIkLeENKhHqWt4uUBLtfS7nQ
         W4AtiGfd8rgQtu+NpIgZf4GJNfnr+kgSqftRkS4HsgAq7raUYVlIH50YGW41lAK8FGQk
         HCHg==
X-Gm-Message-State: AOJu0YwQOu9aj3xMhNLsMfaw7yTjg0XjpN5OY0kPm1uh9ieE0H59GKfg
	idqhsVg2LsqesciXjerqcJZ0nA==
X-Google-Smtp-Source: AGHT+IHVOtJCLUiWOsLVkB969Ub4bxbQchy+ZLE+hhKue6hPBgHq5il2m0qKE0dJ0YZyTyk76nSiAg==
X-Received: by 2002:a17:906:b810:b0:a04:eac3:2812 with SMTP id dv16-20020a170906b81000b00a04eac32812mr20157767ejb.26.1701284386495;
        Wed, 29 Nov 2023 10:59:46 -0800 (PST)
Received: from [10.167.154.1] (178235187166.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.166])
        by smtp.gmail.com with ESMTPSA id o11-20020a1709061d4b00b009faca59cf38sm8160232ejh.182.2023.11.29.10.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 10:59:46 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 29 Nov 2023 19:59:30 +0100
Subject: [PATCH v2 11/15] clk: qcom: gcc-qcm2290: Add runtime PM
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230717-topic-branch_aon_cleanup-v2-11-2a583460ef26@linaro.org>
References: <20230717-topic-branch_aon_cleanup-v2-0-2a583460ef26@linaro.org>
In-Reply-To: <20230717-topic-branch_aon_cleanup-v2-0-2a583460ef26@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701284367; l=2146;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Am9uKVZmtmU4RslmGcqWt7Und9xViAlu8ssTW3WECb8=;
 b=O29ybcJzfrb+vpaiJMKbq7QqlhComf2/fvA7yn1ijQxiMW4dCptiipmC4tsULTJemT7FMUUwY
 LF+p2mov69rBbBmlKmT4Hujl9pj65gpTci3iJmxgMr5SLFKuhWg8lSI
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

The GCC block on QCM2290 is powered by the VDD_CX rail. We need to
ensure that CX is enabled to prevent unwanted power collapse and that
the reference is dropped when unused so that the system can enter a
firmware-managed lower power state.

Enable runtime PM to keep the power flowing only when necessary.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gcc-qcm2290.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-qcm2290.c b/drivers/clk/qcom/gcc-qcm2290.c
index cc1dd5fc6d32..0992da84a741 100644
--- a/drivers/clk/qcom/gcc-qcm2290.c
+++ b/drivers/clk/qcom/gcc-qcm2290.c
@@ -8,6 +8,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
@@ -2882,14 +2883,26 @@ static int gcc_qcm2290_probe(struct platform_device *pdev)
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
 	regmap = qcom_cc_map(pdev, &gcc_qcm2290_desc);
-	if (IS_ERR(regmap))
+	if (IS_ERR(regmap)) {
+		pm_runtime_put(&pdev->dev);
 		return PTR_ERR(regmap);
+	}
 
 	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
 				       ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
+	if (ret) {
+		pm_runtime_put(&pdev->dev);
 		return ret;
+	}
 
 	clk_alpha_pll_configure(&gpll10, regmap, &gpll10_config);
 	clk_alpha_pll_configure(&gpll11, regmap, &gpll11_config);
@@ -2903,7 +2916,10 @@ static int gcc_qcm2290_probe(struct platform_device *pdev)
 	qcom_branch_set_clk_en(regmap, 0x36004); /* GCC_GPU_CFG_AHB_CLK */
 	qcom_branch_set_clk_en(regmap, 0x2b06c); /* GCC_SYS_NOC_CPUSS_AHB_CLK */
 
-	return qcom_cc_really_probe(pdev, &gcc_qcm2290_desc, regmap);
+	ret = qcom_cc_really_probe(pdev, &gcc_qcm2290_desc, regmap);
+	pm_runtime_put(&pdev->dev);
+
+	return ret;
 }
 
 static struct platform_driver gcc_qcm2290_driver = {

-- 
2.43.0

