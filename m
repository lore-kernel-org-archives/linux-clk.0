Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738D5EEB8
	for <linux-clk@vger.kernel.org>; Wed, 20 Dec 2023 00:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oonyqZCl"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2cc4029dc6eso62191821fa.1
        for <linux-clk@vger.kernel.org>; Tue, 19 Dec 2023 16:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703032264; x=1703637064; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/EYvH2o2FDAOc1jBHzE94w2pt5/T4uUYkpgbUck9NPc=;
        b=oonyqZClFsw5fJPDpSiOLyOu5fqaq1YsqhkAdZ3+Alrbr3httlBzhafsb3rVKH6K1w
         4sgyd2VQyWaLeGNyi0s68EGL2YR2eKg/lN0ZX+RHeEWkMfr4oi/gtKHrgDiuUQjkzivT
         lasryqx7VBBvbgZL85PhuA3SAPjfohBxISQrgOi5rBL/vqfspD9dnh2iVmjm8I2vTl3/
         uQe6fupeEK04mIKgSEVCjiIjoU9lNkuXz634z6wfl1ketcPBHW0yg7TVUWj/78u5p55V
         OvNleNzCN0DHLQOZKdTz5ZXuG9pfrpYk+n2eyQwhZh15wNO4NTWtuFm2TA7d+NZVz/h5
         iN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703032264; x=1703637064;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/EYvH2o2FDAOc1jBHzE94w2pt5/T4uUYkpgbUck9NPc=;
        b=SprknW7mLlc0o6S1p05J6Q0e8BGEqdfPxtugg63PquLn21M4O0DzzcNAaSZZ1zR6sQ
         u9BAeIbr60+x3RGcfwPrcR8ngEmbPUMCxEjwkp9bhI2mc2fwQNmW3bXHt58HJ+MaL+lf
         PsVyIX7kMSEGNtT8rIYpDPxi4FnxG75+DE629EEHaTnpMtBLjnnzf//LaqO49zX3iV9L
         FaXqpgwKlKlJjDOIn7NhEWtIIP0Gb5KR9R9Iy7xx1bx+bTzkrjCuibE/taSYFiX3xod1
         G63jEu7JRk6+5uZlYbrX+8+/mMLDi4FtZKKA/DONfP3xOhacEKJtjiledHJcYjIyfugp
         RKHg==
X-Gm-Message-State: AOJu0Ywez+JWLtEy2lK+1ZZahRue9qXKwD1cDJj+f+Jv0J697Vke99hS
	AxI5xKVl2LnOuwmMnUG8La31Tg==
X-Google-Smtp-Source: AGHT+IFk4WSTvZzwTaFkSLACsv87xFfPVIYSFFw4YGFTTDaUV7BRzgGRpqSdBHHqobYDyvsuncyosg==
X-Received: by 2002:a2e:be11:0:b0:2cc:7703:e3d9 with SMTP id z17-20020a2ebe11000000b002cc7703e3d9mr2121864ljq.65.1703032264598;
        Tue, 19 Dec 2023 16:31:04 -0800 (PST)
Received: from [10.167.154.1] (178235179206.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.206])
        by smtp.gmail.com with ESMTPSA id k16-20020a056402049000b00552d03a17acsm4824397edv.61.2023.12.19.16.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 16:31:04 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 20 Dec 2023 01:30:48 +0100
Subject: [PATCH v3 07/15] clk: qcom: gpucc-sm6115: Add runtime PM
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230717-topic-branch_aon_cleanup-v3-7-3e31bce9c626@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703032250; l=2049;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=wo6RqwrpI+TvZGgUHlprTgAEXXwaEB8xXAWdfaiQ80I=;
 b=+GHnWyX1q0y09xk4YvnrfK9G829CiNmLGzLSLcS2W4lC4JlsUUv+0/aV3oEQO8a49yvcAdhIx
 1DuoxWx1HnlCN1McDBF7ux42+CX7BY6Z/8SBUyeThWJN7Ox8/mmO5RN
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

The GPU_CC block on SM6115 is powered by the VDD_CX rail. We need to
ensure that CX is enabled to prevent unwanted power collapse and that
the reference is dropped when unused so that the system can enter a
firmware-managed lower power state.

Enable runtime PM to keep the power flowing only when necessary.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gpucc-sm6115.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sm6115.c b/drivers/clk/qcom/gpucc-sm6115.c
index 93a50431aef8..b50979ce1cbe 100644
--- a/drivers/clk/qcom/gpucc-sm6115.c
+++ b/drivers/clk/qcom/gpucc-sm6115.c
@@ -8,6 +8,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,sm6115-gpucc.h>
@@ -443,10 +444,21 @@ MODULE_DEVICE_TABLE(of, gpu_cc_sm6115_match_table);
 static int gpu_cc_sm6115_probe(struct platform_device *pdev)
 {
 	struct regmap *regmap;
+	int ret;
+
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret)
+		return ret;
 
 	regmap = qcom_cc_map(pdev, &gpu_cc_sm6115_desc);
-	if (IS_ERR(regmap))
+	if (IS_ERR(regmap)) {
+		pm_runtime_put(&pdev->dev);
 		return PTR_ERR(regmap);
+	}
 
 	clk_alpha_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
 	clk_alpha_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
@@ -461,7 +473,10 @@ static int gpu_cc_sm6115_probe(struct platform_device *pdev)
 	qcom_branch_set_clk_en(regmap, 0x1078); /* GPU_CC_AHB_CLK */
 	qcom_branch_set_clk_en(regmap, 0x1060); /* GPU_CC_GX_CXO_CLK */
 
-	return qcom_cc_really_probe(pdev, &gpu_cc_sm6115_desc, regmap);
+	ret = qcom_cc_really_probe(pdev, &gpu_cc_sm6115_desc, regmap);
+	pm_runtime_put(&pdev->dev);
+
+	return ret;
 }
 
 static struct platform_driver gpu_cc_sm6115_driver = {

-- 
2.43.0

