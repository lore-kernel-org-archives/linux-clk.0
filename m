Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D92915D5BB
	for <linux-clk@vger.kernel.org>; Fri, 31 May 2024 13:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717163569; cv=none; b=lP1sIeLMoriRb1PBiIzTxJRe7KA3p8Y1Ofhrzy5y9Ymvw33lwL1DkbKVqVx//lLTpf0UsEy9DwkOxTNSVG+N9Xo4dovGIHKm9kvSkz+UdbC75fypWbNDnAFyIU/HWcBMBhDcPleKIR3u0M7nBxk81H4joa1CPe2evTLUqk4AiEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717163569; c=relaxed/simple;
	bh=3zs1lGmZcJF0b6VAOMoxNDKqQmv5s7t7K3pfFZBn4jk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bi0Trni2VpnNHJ41/HwN2HVeotgExyP1QGSNiebq1F9UyJfBHw/r4UzH3CD9EoP7L8lCdNMj+YAO98yW/uWQN273UVrVY6rrH/2k661TlCG57x0vV4lGlM+qdnBAwHAREDkbjcGI+/6rkGL4vDYY6sw764Vxf4whOpYu/DjlcU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ga3WzpqK; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ga3WzpqK"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4202cea9a2fso19740485e9.3
        for <linux-clk@vger.kernel.org>; Fri, 31 May 2024 06:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717163566; x=1717768366; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ijiGVlDr80nRC6rrzLyIt/r2pvDOASHvmAApJ81k834=;
        b=ga3WzpqKeA/5NboXipM8ioENfpf40UNmTLAbcqOo47WNnDKblD0E5gNu3PR3wvJ5Y5
         /sScb44wF5f7HeWtZDd+c+ajYuQyIPqfySPAiGBpEC78gsYnSvK1SCopNGqMLjWfbgc5
         VE3jQ3PQ3CE0RGwHrzqNdxTMGghcqWm/Qkuea244u1J3GG0ZLQU+QK/22ckmugwA/aOv
         SsjgwyViTQu/VaOTnOGYX8o7yYNIyxPP0X4nIKKaZSypCbKfGhu9A1k7N9ulfQaJsvvE
         RQ3tSRZbnzIOkSRa+m9N7AEToBE2Fj8oFNjQV0wYKbLeqd20P/zcNc5/6Qsv7mgXUa1L
         SgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717163566; x=1717768366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ijiGVlDr80nRC6rrzLyIt/r2pvDOASHvmAApJ81k834=;
        b=JAM97RxbQXFwUnT+cEJ4nRBjId8GghoiBUfoUlBtG03lgRyB+gyaOps5EGeYHsrXlO
         KKoqZcn8zVZm4VWTWOvdsBxtZPv+haYc4hW+Z1asKWuoqv6gjZcHWxpmP6kwrZfIQbmz
         JDkbl0YpsXhh3EzFMu9aU+Yazu7ExOv2SLJARajrRewgA1SMzdg8YuVQNkI+HtrlUYIj
         pOZJWyV3QJ8PG+vTMw+o+1hwu3zU8cjRIMEri2+dIk6TgHvI1zoP3/e+C2hOv2mUgzvW
         hS4SejBobZOwrkXa6oGUFTiAgxiCi7HCJNg8um3bpfZY1jtYgEv9wocoWpO08SjYRUoU
         ZEDw==
X-Forwarded-Encrypted: i=1; AJvYcCVGLplyXzWsI4q8RbL2F2IjjA85QC+ImSndePi+9jmdVUxTi2mRwcN34zzyHBdPdenQ741Wa3n+oNzvyA2BVpH7pSqng1AUKSyr
X-Gm-Message-State: AOJu0Yz7Hno735KEJ9uIAZuhbfK7aLUvN+2jN0CThf1YVf1XFomgtJ7j
	EBsyZtw+B3CilObwkjxcpcHnzKMA4gjl9dMewaviOi0otbVVA14dpYuLfGgEmsA=
X-Google-Smtp-Source: AGHT+IGHuPZcQox45SO6YW0nU0OgBU6JtzgVZ1Z/N0HWBTFEzUB3jb0cTJk2YrhvgT/ro/tkuMyRDw==
X-Received: by 2002:a05:600c:1e27:b0:41b:de8d:dcd7 with SMTP id 5b1f17b1804b1-4212e05f21dmr15160815e9.20.1717163566030;
        Fri, 31 May 2024 06:52:46 -0700 (PDT)
Received: from [127.0.1.1] ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212b85ec87sm26762735e9.27.2024.05.31.06.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 06:52:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 31 May 2024 15:52:20 +0200
Subject: [PATCH 02/16] dt-bindings: clock: qcom,videocc: reference
 qcom,gcc.yaml
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240531-dt-bindings-qcom-gcc-v1-2-b37d49fe1421@linaro.org>
References: <20240531-dt-bindings-qcom-gcc-v1-0-b37d49fe1421@linaro.org>
In-Reply-To: <20240531-dt-bindings-qcom-gcc-v1-0-b37d49fe1421@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1557;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=3zs1lGmZcJF0b6VAOMoxNDKqQmv5s7t7K3pfFZBn4jk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmWdYYmpKZgiX6UXrmB5BdrHvNqt03eTJ7gvwRX
 130kNKWfsyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZlnWGAAKCRDBN2bmhouD
 1y2ZEACGaxYiMgKMHMxpBBsSc1+tDs3+lg5aJpjri8bt+MTszaXfezULwQE2uoFYa6IvtKRkAsl
 i3OGpr+BCE5WR1zjNOq0GrI0TW6/ZmXxkwLtI73kBXJ6aHYmX9fKHvcrMIZncmRQGwUnpr4z3FP
 KdYNXrJSTGCIG7PbFTg+w+5ZFDCdqGBsEC4+5p+S2gp8vTDnNuw5B9nEmtG2MQekATBUL44eR1Q
 4z33vUw5T90ZHfePfTjjBJaWXGAAlCeJuT9cnqicLOUuKyJd2/+g+fAFxTPSU5Vslzt3DcikDge
 UuDUlyLCs9F8ghPTscxaH/zjzId1gt6qI2CKrqpWnsJH1CUJXMoWsJyh6xkrTU58/SNl9WqT4MF
 mvQ4jIM9h//TBNDnwk2bAHA0fKX20/znBmrCeLFGicl8HucJhQ39kC/L1skuDcvkBGa06WQB/E8
 cCCKXAfbxFQDHNPHpM2ElTOgD0ub7pSZCx/YFd9473CxbkkcVUBvCQwanDmr33SP9AJYq2U8Qne
 3b7igYQzL45Zqxt2LIKw9VfBsMNME3Gbwwok/dhejlSS3oAXlCeq5IpOf7OOgvh58r5q/cahlDS
 MEQ9PJ8sZbi/stQa4/RJ1n6wBOm6DMlCA6Yw5P7deUQ9bJgGPZL8Epw90Sac04/khqNNdAy3vvT
 mpezgpGeJpJTbHQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Just like most of clock controllers, the SC7180, SC7280, SDM845, SM8150
and SM8250 Video clock controllers are also some variant of standard
Qualcomm GCC, so reference common qcom,gcc.yaml schema to simplify the
binding and unify it with others.

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

