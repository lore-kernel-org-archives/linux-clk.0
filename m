Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3918918F2EC
	for <linux-clk@vger.kernel.org>; Wed,  5 Jun 2024 08:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717575007; cv=none; b=uMb608aZwd+ke2vOcTlJGpTo6SuUuvDmioQJSzB0bnq5niBjum/O1utusuAkQPUiJ76rRS621lzwkjaxqRCDZjz6v3xj85NB1kqJ4RYSOXz8eyBkm14DjKO7snvgc+we0pJRPhiKdE0iE+OxjRRjuQmHNBIFhlcUGHwkk7KuiJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717575007; c=relaxed/simple;
	bh=c1TaYIRcImy9D65VF7efdytn+eSy9A81NBwGV9GzQx8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ecmVTHeB5YW2vdu0OTFGAqgVH7RVc+QKThnWIuJGsJCvulBzmju57RxHP2wQLCgwgvX/N4fZDsKRMPP1Tt1Zg7OvAcXsT/UPSCnbgULSbk1/yGdkWKaspHhBkBqvsZk05B6X/jZC26c8x1MgNsXFK+0uft9LL3k9T/tDe65UBAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CQ0b5rIp; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CQ0b5rIp"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2e95a1eff78so85145391fa.0
        for <linux-clk@vger.kernel.org>; Wed, 05 Jun 2024 01:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717575003; x=1718179803; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c50Ysf7W2hUa3KS0llM6DFu4Yhj2QnpUjzXLI/6AknA=;
        b=CQ0b5rIp2Qn/FJylooD4Z2yK6QQAXc2InWyBvNoBCda9dELxuR84b5QA90U9JMbpDX
         W9+d0mWdiuHf+zMjU1MpPG4TXruIrgomlAVyXXBgoH2dt3vD7HA00lCwMif597W1kL81
         rZQcmaTdcH+na8gzLKw9AsiNCbF6KZFgcC4+h/vPSlcdHWXDDW+tpstCm5R54LhIUKzm
         AS2f+c9r3JJufeWW0Flr018SDrFb4UO2CDBpzh24vjvKLQ7aABNhKpHGEkq1Bqwpq+Kf
         hgDy7x+6due8ZT+YLIhrh/ml5BlCArij1oKfsg8daNPtmKFK8pY3S/w37VwIsQ45XcOv
         oaGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717575003; x=1718179803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c50Ysf7W2hUa3KS0llM6DFu4Yhj2QnpUjzXLI/6AknA=;
        b=KnMSRO555HVAGuLiui9BbQv/1RhtkR6NRy3ieIbzhoCsER20jWRx6mknFVHlke7zYh
         IheLpsNpu7eTw4QckGMF2Wof9w44sFcm6DEKb51kTHvtoaCz8VCwq3VC2lsv047Rc967
         gDyewnoeb3tVYnmSYgAIdSGAOe8/I14+nH99CX3OoaQ6khuXfqH2oj0WAOY+juPMuri6
         DkV3PFM0B8ewu0dKuZq85UdAT6iV8lChqSBgviBgtv6zQbUOTsDnkDzLkKNfMbOeG1ui
         +4UgPfRAfLFQcHjc5y9Wd8zcjWNXX2eSf8HYCOfDvBeIlajTzGLW4SmU6finj0GOBJ33
         aM8w==
X-Forwarded-Encrypted: i=1; AJvYcCXKBfCbyUiBNwLiZi1IejsXr5NmalbdDGsjYlw0uqoPzUTgrdV1IOVi0tiC87zrORzlTLCS6nml4h0sG6EzFbW4TPapcdW3PH/L
X-Gm-Message-State: AOJu0YzqJC+NymfZR6FTnR9qzSg/Oe6ePN+D6KrAhEfl7FEz7GbtqbAJ
	u7+7O3JBY4yBMWcDzsbNnOwLPcB1WnyUUK/+kIPU8r3UxQ6ZdSE2fR7Po3+6qkQ=
X-Google-Smtp-Source: AGHT+IE2TbBMxkGim/inafUCkQB+YS/LxGYsuLw64bf5oymXf4mqxBp97y3LK31mEvzkKxA00RWqfA==
X-Received: by 2002:a2e:9c89:0:b0:2e9:5824:6a30 with SMTP id 38308e7fff4ca-2eac7a71d88mr11054911fa.35.1717575003343;
        Wed, 05 Jun 2024 01:10:03 -0700 (PDT)
Received: from [127.0.1.1] ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421581490e5sm11025585e9.34.2024.06.05.01.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 01:10:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 05 Jun 2024 10:09:29 +0200
Subject: [PATCH v2 02/16] dt-bindings: clock: qcom,videocc: reference
 qcom,gcc.yaml
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240605-dt-bindings-qcom-gcc-v2-2-f947b24f1283@linaro.org>
References: <20240605-dt-bindings-qcom-gcc-v2-0-f947b24f1283@linaro.org>
In-Reply-To: <20240605-dt-bindings-qcom-gcc-v2-0-f947b24f1283@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Jonathan Marek <jonathan@marek.ca>, 
 Del Regno <angelogioacchino.delregno@somainline.org>, 
 Loic Poulain <loic.poulain@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1553;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=c1TaYIRcImy9D65VF7efdytn+eSy9A81NBwGV9GzQx8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmYB1JJ7GGVDFV+v/6aqAimBiFbiXx6wSBzv0kf
 pH4XnpK9rCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmAdSQAKCRDBN2bmhouD
 159ZD/oCZRJxj9vAUMcf7cwjEuXa5DI36RvNtSBIpkoV5HUtft7X2gfsjHz0ruR4WowYDTQp8TG
 xhp9IpFN+sXQZwzKtlW38YCYGIF7Lo2VgWdeYITqVgSsI6gonIPKTGjrzwPYbe6SeorA+SUbAD3
 oA1XYSOdP4E/GStz7VSpKv1R/Aw7TYf5C7dfWaODxX5s/asTglupQCpMRlJmu2DJwAVB7xlNLL4
 c9ybfsz58f1ojpyX/xrIYnliOi3bSQhxkjOPMm1drbMMla7ZR8vvJzZjqS3qWJzJzSiKsc6up/J
 4OZR7JnXIfXDM676hdQQBWuvycIwooI5fl8QcFw97f8rZAKSk4zwL5epLt1zG8o6iDCUO/IqpA8
 e4ZwHdgKihYgTW00nuwqgJ5qO5Wsr068MTe7z8BIIOnDdXkZbEkwcUx4jf3jgZyJCJLx3P+uOYr
 uTrBpLLCQyiTiQGpPStxPC0NKskS4dOmoFxfQWqCKuZmCkY/U7/K//dOeJeejr28tCLLhFCDyMP
 Lb1lPuYAaaAopCSzrV0v4Qfiato3/l2uo2Z8cKFdaZ0yc343SD8Jaj7jeO6OUkAIWQr2IaA9weU
 fLSo6tYLChn71DMSn8iQF8kysofwHVOo+rQC8iP962ma8MLe2pMBJVkNjdvVW7vWG0Y8bwwk970
 mnbYf14p13iwXuA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Just like most of Qualcomm clock controllers, we can reference common
qcom,gcc.yaml schema to unify the common parts of the binding.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/clock/qcom,videocc.yaml       | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
index 6999e36ace1b..81c68039ac9e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
@@ -37,18 +37,6 @@ properties:
     minItems: 1
     maxItems: 3
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
   power-domains:
     description:
       A phandle and PM domain specifier for the MMCX power domain.
@@ -61,14 +49,13 @@ properties:
 
 required:
   - compatible
-  - reg
   - clocks
   - clock-names
-  - '#clock-cells'
-  - '#reset-cells'
   - '#power-domain-cells'
 
 allOf:
+  - $ref: qcom,gcc.yaml#
+
   - if:
       properties:
         compatible:
@@ -119,7 +106,7 @@ allOf:
             - const: bi_tcxo
             - const: bi_tcxo_ao
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0

