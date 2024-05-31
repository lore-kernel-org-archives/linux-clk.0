Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2605E17C7D9
	for <linux-clk@vger.kernel.org>; Fri, 31 May 2024 13:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717163577; cv=none; b=B3/L6dYI7GyqWIUArS2u9xJP6pMgr5YuyYi801vNKRyPNsDji/W0kkSlp4xxNgv/x5c83RZa2g5J8xTBQaUZrX2GI7KpCgFbxwGlYOTt9TSgGomREgPR639Yl2wM+z8Wp7o47P8XbLucef3/MUKTy6s74IEiTD/YgrESa6yumLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717163577; c=relaxed/simple;
	bh=Vfvm+u4fvg+iw8i2GnUcIDJyAUHsHEkvgi7QuRpdSjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dr7wArYh9zhxmp+KgKkbDxAXPuNL6YQYwV37wvkVGdeKk//7aJGqHq4ZDHzXnh5gU29+lDRF3SoiBaKz3C7yFBbzdHdtq76asXyW/xlxzzEzwKAQCjgLFffvtruTRb9Atffk/YKHuLfX0YbMq5o5sygkRtVAOcs0Ym5qqCuM3QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wVf3OcQU; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wVf3OcQU"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ea829329c7so11536281fa.2
        for <linux-clk@vger.kernel.org>; Fri, 31 May 2024 06:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717163574; x=1717768374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8n/jTL+LmHdAYlGgXlxxyFJOJwKdK3jauSwSYZvCZqE=;
        b=wVf3OcQUYRE+TRnQchCx7ETaRiUtSNU9TjxiS4YtiD9+OD5NCvP0c6UjIE9/6kuF2+
         4tgvOODoXhIKRit7LGjm1AFtdLWhUX/4NTTNkZG4IumkigTXGOrtnseQ9VHCy2/Ueyfh
         5agAU59mfOdNN11x5/06LlnNdWjiItTzMRWqAUb737gGEbjf1kIdYpL2VBmiDsG23uCE
         aZu0Zf++mJ5U9uTfvMJ+R0PTDFq2xLsn+1liwapX86fZHDRjydb++tFhnS1NvvGzMNF+
         I6G0G9uzZeB0nD0yX1aCe3mxDTU2gGsQobJeCiv8YWrvEx3NzR2U7WlX3jU5BMWSV/fP
         q5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717163574; x=1717768374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8n/jTL+LmHdAYlGgXlxxyFJOJwKdK3jauSwSYZvCZqE=;
        b=YwogU9H/VKlB3gMf1Tr1pXwKdldTxkAZD5cvfau55rar/ohZvLbjKzY9CgNaVFJJ55
         r/TqywkmAsF8f7JksbRU9NUNU26fCADJlHP9OqKOdXvl5YVuXLUb8WJ8OoNUw6XiC2Ob
         rOtgiZMMF9GQ2J1mobHqyqa6gHIQ8XhxJ/1iIPxH34srKqsnqAZjRRcYMHLrCu230Oq3
         oioCG8YfOtPTXKF5YC8nKlWPoHOuggf3DyiJuODunvqc6/O9YnO09R+5op0h1pT65PVU
         2yhZULb0pDdbGYdxRDsyhQxMsoKw4EEr7blsKSKMFpg/1X8Sp3ecqo/1xyZqACNmecg9
         Urkg==
X-Forwarded-Encrypted: i=1; AJvYcCVXnmsAvCGjh9C6jblc9XMJYQ/sm2qet/SGNbFIFPz6A10EtoiZ20lz+bJXw8C4riO60JrqYa1xMywozq1/oAsTYCBgo1JyRaLD
X-Gm-Message-State: AOJu0YzcreBk1WrZCCltvwGL/YuE1Eh/bAiOtaYQA/Ms4dxfA00iUuG1
	mxWIgT2QL7EVvEpctjPN3Ud69uP+TE5Ya0joyS4XF0WkuApfk2sye4iBT/37TtQ=
X-Google-Smtp-Source: AGHT+IFWLW3O/JdqTmbPA3g3aW6gRBJrnE7c5Iv8Xr9ShVYjF3EAZktdHQLo5Pq/+gYNIjfbHCwlog==
X-Received: by 2002:a05:651c:14c:b0:2ea:8125:604 with SMTP id 38308e7fff4ca-2ea950af013mr14357891fa.4.1717163574563;
        Fri, 31 May 2024 06:52:54 -0700 (PDT)
Received: from [127.0.1.1] ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212b85ec87sm26762735e9.27.2024.05.31.06.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 06:52:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 31 May 2024 15:52:25 +0200
Subject: [PATCH 07/16] dt-bindings: clock: qcom,gpucc: reference
 qcom,gcc.yaml
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240531-dt-bindings-qcom-gcc-v1-7-b37d49fe1421@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1425;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Vfvm+u4fvg+iw8i2GnUcIDJyAUHsHEkvgi7QuRpdSjI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmWdYcOIMbR1GOog8+d9B+GKxE1eUuatlyl6Nbm
 PJgaEL3R5+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZlnWHAAKCRDBN2bmhouD
 1x8OD/4ydcEWWBvDYBh5NQigqFRUX3wKeSwjmVij9WJm0TmBXNusA9xbLXZUJ/kcq92kj7smF3Q
 H7Sq4vujrzOicY2UwygNYs4RCjieZqWgkN5pRe6nXKRa3jKADVM/Epb5CGfe0IFlD7yS5VquBRY
 sVBTtxLdnifwOOeqd/Vgd5YpLdWv7+Z6CTIxLU+OwL5QpQNTAif2jmAefxKGJyNd8X0rA7kN72F
 3Tv/p7mn3J63LpInmoYaa7uKbT/yhnWJisP2frrnCmVt2yFLcav8YYZYPoU+DcPE6y8bqpwCuVY
 lm3crh+0JdrJYTvZhY5LK0C7o8SgIaLuGCKhV08wTlP8MStlp1y/quvFi6jCt2Lfxj6JeXnEXuK
 +PNwMzQecFokEA+GjhZ8pN+etDhdG9X+3/8jlaUXMx+U348aDHRBd6rSgMspW088jVYbcnOzr5K
 dhEYIvQIxXEe4vp9rRUAAnZ1AKVpA+srSP//BNGHKBkouFg5/in5nzXKx7nPX/5+khumdt8nRzW
 axBBeRFU5szkq8XmtLZ4y/N3xRIOUgrkk5mYugMuejlKPEXU/w/2khJl0+K6bWdnOVE1mfJ2/QB
 cX/8T0tn4vleW3LClxbsXJBeBfpDzT6a17Ixj4PUfg40uIZd/y2dwmVfW7PUpGGDzZ/1CwKPSNU
 N0kaosUF6py2Jsw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Just like most of clock controllers, the SDM845, SM8150 and other GPU
clock controllers are also some variant of standard Qualcomm GCC, so
reference common qcom,gcc.yaml schema to simplify the binding and unify
it with others.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/clock/qcom,gpucc.yaml        | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
index f57aceddac6b..0858fd635282 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
@@ -56,25 +56,10 @@ properties:
   vdd-gfx-supply:
     description: Regulator supply for the VDD_GFX pads
 
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
 required:
   - compatible
-  - reg
   - clocks
   - clock-names
-  - '#clock-cells'
-  - '#reset-cells'
   - '#power-domain-cells'
 
 # Require that power-domains and vdd-gfx-supply are not both present
@@ -83,7 +68,10 @@ not:
     - power-domains
     - vdd-gfx-supply
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0

