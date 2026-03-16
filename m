Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C41C23C516
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 01:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773622926; cv=none; b=GURTBxnieDr8p3za88D2iTxEqNjZnjPklA16y9kxhydVRC76ef0j80oGabDLfhU6giCqQWO2uI2opHddNzLeyjy3TibPugTmpDQmyPtyILhK2tTQapZDcUax1GenbtUjL5XEndU+bXrXzz/JSZWEjUXQIdJL06b//HLK54KFH2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773622926; c=relaxed/simple;
	bh=CLD7plAx4kx256EGAsOH23fn2fiqSPTmqTRUmqF6KEE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hwj3fEkoK2NhpGIsHQEZXARvaDvz0xhyO6T9jkpt0e4dg+3aPIFch8nWhr1SnsLKYvZdORlphmHRQJrt3Hv91VARewiBb4X2Dqbqt2t71KYzHuicgXvEWP67s+8Re5Q6bbz4NIYadNDpoW05YxpagC8+jP7nzBBaQq7ZdcqzMxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yq3BW+y7; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yq3BW+y7"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4853aec185aso32816895e9.1
        for <linux-clk@vger.kernel.org>; Sun, 15 Mar 2026 18:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773622923; x=1774227723; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1te5YEH0gYMSw917nzr6gDgeGTg4NzsX9xHG1EXOTkk=;
        b=Yq3BW+y7ncbL1f0zlIiR5ednwCtRYmlhxltexIKijnoWjcBg93+n7zy6fi+j4Oe57W
         TSTlfUNIcHflO21oye+i13+Hnl7VnzfvxFzDRzyAEvfbQQ9kl/hc1MeMW3iY/AdpnbKh
         tXfK+bkzMngXf6Xv9JjNJ8SCj9CWL1Y76HS3JlVZ72Um35PpzVLn1JKYbWnmEU0caCr5
         ibJo0ttLtNvIuv8gR6t5di1WjQk2xncDeZ5rYiLxJc1vxokZY0sat66zhM0G5HKpHdcw
         gY4jSsBlMBLOgnT+ebjkt2ePzPXNFdm2dGg8IdDPxwrSjeJ76U+O/K0uSwpVm9XU0KEB
         I+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773622923; x=1774227723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1te5YEH0gYMSw917nzr6gDgeGTg4NzsX9xHG1EXOTkk=;
        b=bFiPuBBkY8KHTP75ek0c90xtf9W+1V9M2Iwn55RoTrojaIj8OnQ2beI/SCFGOm13op
         p1ZhTtT5Ya1BGvgVO6deepFOZpW2pGtO7XMCNjiOuR3y0WdKNn2G4X2fCXlpX4W2xvQc
         u6sCylIw4McXZ3tTdrDfqXxV7++xRSJdUx4Ff8YHVKuyHbBiXebrana/DFzL67+QE1un
         FsOGNCfU8ATxChM+SYLGdxfdNvGniQRbsAV0NC1r89NXHYv2v1+i1Ltiwbux/9DnU5CP
         txpdRPnzXQ/c1CYjyU3kknDv74u/jAkFznZ/iAZG8MdwaVlN7FqvQ+9AmB1C3EM84lPN
         /hdg==
X-Forwarded-Encrypted: i=1; AJvYcCXJ4socg/yvJS+bzTvXOagJXLAZUrK4eQcSlXOO/EpzfnoQwGNfg6eb4JWLEFFQzUmwmxbPTk7fVxs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrB7SQXOCfRONYSy4GTpFm2iieu+DN0y9YfuFSWbTyk2bXkPCv
	SErEu2wpWG6WUCRZipmvdfu6qh+ZSjbbSvSJHaJpNUZzMW5B+F6nBCUwCbkn8Br3Bg8=
X-Gm-Gg: ATEYQzxp1NcL9tvFWO82lvZdhYj7JCUoUWP1iV5ig6xm82zyXwXAfUZAUXdlYFIS0YH
	eE1qePvtr2ux6K09G5TEt54R2HBDQXy6w3fBdi/8Gl8pjWUBWJ/YmfAovVppcRTHt6CUoMnWgNN
	QsZca6xaACWsVwUoaWLy3S/9opOdvk+snSLCYZUqyLZNDPT12k70eEDKRfUvOQCHJ01J+1Q8fU5
	IixTe1dDbIBmsa3K3YQv+gU+AuB0bhQAAWFqJeytx2tmwYWY9GPBwrZAvqYe0LOwj4azdkOTuzc
	spv9TEOngD4mPFT4PdcX4MQ9M8BZgNpOZY/yAat9xenYc3lpvJmrDvUiWRnJaToqhpk1R+HrlIf
	YU7akQyNzpskF7LqKtEt/xJd72lOsD1ccNo7p1Gi4Av2DxkjPiuBcdMt4aUVdG0Rqa1czlt7ESy
	Dg4kI9hF9M9RjQhO4+Md2obhm84QBWTc6k+Y8=
X-Received: by 2002:a05:6000:184a:b0:43b:3f2d:7d58 with SMTP id ffacd0b85a97d-43b3f2d7fc1mr6266218f8f.52.1773622922742;
        Sun, 15 Mar 2026 18:02:02 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.190.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe228986sm34729700f8f.35.2026.03.15.18.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 18:02:01 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 16 Mar 2026 01:02:02 +0000
Subject: [PATCH v10 2/7] dt-bindings: media: qcom,x1e80100-camss: Add
 optional PHY handle definitions
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-2-fdfe984fe941@linaro.org>
References: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
In-Reply-To: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2635;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=CLD7plAx4kx256EGAsOH23fn2fiqSPTmqTRUmqF6KEE=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpt1aMekIzpJ8q1fVJcbItgh6FdhwBrvDzsimwn
 VNES1pk2nuJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCabdWjAAKCRAicTuzoY3I
 OohFEACDsnuxYUUvG/2qxEmt3khiQhsVwCXSEZlHB/HbjiCeSPqmAeLRbvdrVLEmhrDS0ZIANtQ
 V4cvJfRFInp+VpfjsITexNkvBgcAY32GBr+5Vjwzzm/wE4JtzLtU/QL6FKLxoCW9iJ46PE+MGz/
 7a7NKkkxe9Dh1WUO9QTZvA7FxFDfqCRuOEKmQJgKzcgzOCOQuLhsUUtsJKdNW99jaVv3WGHrGtX
 UtIp9uhKu6w4QvpbW8C4qxxrzrBPzLeP2N/rB7uNw8thNbBaqei0jUIjSL/4kLj/Xjf35dY41L2
 T4XgqZvQTOKGroQzpWffBkoTyqHtT8xQqg5xbErCQRhrplIlgdF/CqRUsW7GDcnfBrzoPWmsUNH
 lnEnVKDesLd23v1UCnL/rQF1/ge05qEB1tvZL3TeKU5fPgAjc2m7CEjEzZoBlp6EEKbqG5+k+6X
 aW6o4oHp47eVYpoXqxhGOF4+9LYtARVlmIa+O4JyC8eyVDxYE3HYNtJutfu5iFdUk4mV9kXhS2m
 vWXVIUK+x3bnxc+eOOGPdgRoQuO71zCd63JrPMNlJiClPeimjSYVv+HME7pyHLwhO+PJtGWWg7E
 7Te3ZlwN2zKbOJ9G2e8EZ0gHLsCiEvrTcwFJLKwQBeBEGijrlk+tKvj3RC828ipDsxgqRUvDZfs
 e+dP72zYnarfbjg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add optional PHY handle definitions. This will allow for supporting both
legacy PHY definitions as well as supporting the optional new handle based
approach.

Drop the legacy high-level 0p8 and 1p2 supplies as required, each PHY has
its own individual rails. The old binding is still valid but with
individual nodes we define the rails in the CSIPHY sub-nodes.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,x1e80100-camss.yaml        | 33 ++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index b5654ef71bd89..5442f981baebc 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -43,6 +43,14 @@ properties:
       - const: vfe_lite0
       - const: vfe_lite1
 
+  '#address-cells':
+    const: 2
+
+  '#size-cells':
+    const: 2
+
+  ranges: true
+
   clocks:
     maxItems: 29
 
@@ -130,6 +138,16 @@ properties:
     description:
       1.2V supply to a PHY.
 
+  phys:
+    maxItems: 4
+
+  phy-names:
+    items:
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy4
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -162,6 +180,14 @@ properties:
             required:
               - data-lanes
 
+patternProperties:
+  "^phy@[0-9a-f]+$":
+    $ref: /schemas/phy/qcom,x1e80100-csi2-phy.yaml
+    unevaluatedProperties: false
+
+  "^opp-table(-.*)?$":
+    type: object
+
 required:
   - compatible
   - reg
@@ -175,8 +201,6 @@ required:
   - iommus
   - power-domains
   - power-domain-names
-  - vdd-csiphy-0p8-supply
-  - vdd-csiphy-1p2-supply
   - ports
 
 additionalProperties: false
@@ -188,6 +212,7 @@ examples:
     #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
     #include <dt-bindings/interconnect/qcom,icc.h>
     #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
+    #include <dt-bindings/phy/phy.h>
     #include <dt-bindings/power/qcom-rpmpd.h>
 
     soc {
@@ -233,6 +258,10 @@ examples:
                         "vfe_lite0",
                         "vfe_lite1";
 
+            #address-cells = <2>;
+            #size-cells = <2>;
+            ranges;
+
             clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
                      <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
                      <&camcc CAM_CC_CORE_AHB_CLK>,

-- 
2.52.0

