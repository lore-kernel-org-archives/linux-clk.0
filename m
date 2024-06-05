Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EA018FDAB
	for <linux-clk@vger.kernel.org>; Wed,  5 Jun 2024 08:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717575017; cv=none; b=FQqCXnzaawBrxei5DPrxp62QnFsbbqYkMPlL4GQPsc+kDLKUe/14vad8mC7fnOKrZbHu0IaOdmRWkRnn4hhNKjS1x4qGhd+FalvIjniTmF3iQAMo2iz/Y2ZV02Srx5wiP8NX5fZNkgFjWoLT5FVtkuPV7Qe3o7OdmwmFx+opr0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717575017; c=relaxed/simple;
	bh=edu94mG9ZTwIfy/ElCU/Ik5BpQk47GwSH6baklS+jbM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jCkNXV88tWMFNZ+bUWvUzfQUgvVuQ/SJ1zyU0lFXQJ0yP07/vWqA5fyfQ2/tH1SV/QBc21xsEcHAdRxSkKlSotaItu3MaM2CASGpmS2Pq2oZekH+7ED2kiYdFmPKzmgjUPtruWoLmxdVG4u+5TAWfFfyA2hgEwUN0cpRJcVlr6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qMGWia6/; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qMGWia6/"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2e95a1eff78so85148131fa.0
        for <linux-clk@vger.kernel.org>; Wed, 05 Jun 2024 01:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717575014; x=1718179814; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EDJSxjwLUzRiEF2OsqqFA5h4wIP+6VR/vkwoQurMq+M=;
        b=qMGWia6/wDtnyFkLGP+XaChX9L+ncBz9j57FrV+lOcxPGV+LK5htwQEOznuCsF3jYM
         F7iQFHE3pKWdXPsohqBv6oKRG/LjzHZn/2+YVVBez5EgWtd+UsgjQ/LblgBjfFJfGA13
         ygh/3eGM4q4Pn1o+TPJ77JFpjvyTYSIhHfVbz0S56nMwkxD6MHl52eF0YsrXcE2UsLfH
         VkQvZv/nHrStmOSepfzRDgX0jXtq1ULbF/S+veKrGDRyTkT2To4HPSUKrL2Uf/FsU1gQ
         IIGANhROH1ZMfnYbnbjo2e/HvKGheTF5Hzf7oQsEuOrB5L+1JqpLxN6g405BTypFAjKh
         +9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717575014; x=1718179814;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EDJSxjwLUzRiEF2OsqqFA5h4wIP+6VR/vkwoQurMq+M=;
        b=u6SD/3jZFWAnAxtup7dG979QhncSJMqJP6iMN9cBZYRdMopbgXiTcPi1mYmEAWztUu
         qnHPmsyuV3E4F0X3Jio3EH5fgrFgeGaVdv3Y87p4xYlJ0NDtFKbtJlY3fCa6Cpkfk7dH
         iZDHPoILEvvvquCk5NxpnHypvW7q0IJ4ht3/nfilnr4ObMU3UMc5fiGlX2yo+mdaTaDN
         MB14tgE4qCyVo3DrSI33Bc4R/P4Lvi+gXE96RM1dPCORL1mhD7kAB6Rzasv1CFNTTZS2
         IXZClf8A0CKJG3N1WaStQ4f7xM13c6G1BiPnUf3M3122Fr/1QzbSJVDGf/LW4bTWlolL
         XaMw==
X-Forwarded-Encrypted: i=1; AJvYcCXdWHKlDefRIgVGqZXyVsL3HFf9Kj2jhbG0OvP7h6H73oLkyNo2isOmi9Nhx/HrTfbjbmGBUq4iU0LFZwGgjII4OwGCyiglMWrg
X-Gm-Message-State: AOJu0YwYRMzoF1fOt8h6n0cjShq/lR0OWaCSV1p447k/+dg3709ORwPT
	e+CLXaMNm/ntsCxAaX5IeqSwxPjDzKqpSGetaMh3Lt9TjjZ/uXINVV+IRdtF4U4=
X-Google-Smtp-Source: AGHT+IGwdn2moorEYjAeVQNVdzUUU3lcrNP/RD5pRcV31rdmR/LSKKQQ9AqaJHDiOGq3A1XU1hNEvg==
X-Received: by 2002:a2e:988a:0:b0:2e5:67a8:10f2 with SMTP id 38308e7fff4ca-2eac7a918e1mr9466011fa.44.1717575014253;
        Wed, 05 Jun 2024 01:10:14 -0700 (PDT)
Received: from [127.0.1.1] ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421581490e5sm11025585e9.34.2024.06.05.01.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 01:10:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 05 Jun 2024 10:09:36 +0200
Subject: [PATCH v2 09/16] dt-bindings: clock: qcom,qcm2290-dispcc:
 reference qcom,gcc.yaml
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240605-dt-bindings-qcom-gcc-v2-9-f947b24f1283@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1338;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=edu94mG9ZTwIfy/ElCU/Ik5BpQk47GwSH6baklS+jbM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmYB1P2vfhM9DlSzUmFlNazcYSNvy1npKp/RY9M
 ojprSQ28riJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmAdTwAKCRDBN2bmhouD
 1/T9D/9CEGv0gg8c7Mq2D8AACMAWv3Bln6+XANABjMvrHMcP/uLqs3JTKBc1MLsiVCEeaOR7ghB
 /hO/FRCnNRDaIEjj7B+zW7xTBWd/cpjs8x8nCWsYW/2SyA6Lgan34iqkxXtGLo9mIvKQPexds9N
 v1A3jP8wsdm+LO5BlZtV67AMYZJP0w3+qZCoF1ZldDqVCj65xDZdVJcVj3t2D18ls1o4/0L3aEW
 kEI7WodJrFSkEHrOazVeqXCfH1Rug9yhw7izKm7GQ1lAciiNdzpxBUUGRUEviqL8HgtGpkfRWs4
 ffRJXXFQ5McFgdpp5mJVqxZ5sUriBNh5sEdsqrZkP5N8RilgI48UcTa2kF5+Icd3Naa5Qg6vUZ4
 N8Be3/CPfQWHmq/pLq6mHs5tNqThys96Ne/7I8vFLZL3Z/aw44AVmsE8Kfkck4ZNp/1Ws07W+vS
 uGk+5lF6tsJPU2paP1OBynRr0bHWDiFQdLidqHr9YsNA9dvm+6iG6SYw7WsWLfAAsnBOSnSDVz/
 rGMxzL/nNMq/i7k4NSpvPZmpN3RsK+z5i/9PlsuOPdYRHhUs29p9XjQUwRc5RBvgMOl/Ui/UmEZ
 pE3iipN4Pr269I9qpPAzdgMdD1kU0KreMe9wKG10Lr0Y7Glw7dV4tIKPSq7IWoxQCudDsZcTz06
 N4RpLUynvd3Sg7A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Just like most of Qualcomm clock controllers, we can reference common
qcom,gcc.yaml schema to unify the common parts of the binding.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/clock/qcom,qcm2290-dispcc.yaml          | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
index 4a00f2d41684..243be4f76db3 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-dispcc.yaml
@@ -37,28 +37,16 @@ properties:
       - const: dsi0_phy_pll_out_byteclk
       - const: dsi0_phy_pll_out_dsiclk
 
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
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0

