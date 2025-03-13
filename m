Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F111F55EB
	for <linux-clk@vger.kernel.org>; Thu, 13 Mar 2025 21:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741902202; cv=none; b=RDM9bRhHaxsiX93Stjsjxw91e3/rR5VHEVt+ySxcpUHDE5Aw45pJxY77tPSgKCGVpRvbhX24BMP2yIEtrNcXnXwEQNUe3CEQsynmb+vKm0C3nwIPRTqUzUqEn/QVMw3seQv4rl2LRVGFoiOfWrhRy/lsJh5IXB+OcfL3KodV4Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741902202; c=relaxed/simple;
	bh=c+Qj4DKg1eJLbF7tyQrBCEXmEKREnLZPMNtUuVGeFP8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bB/7SHIzU/E1RMdb9aWyVEAaNsAx0VHt+SB8T09AGX1/txv593PdRdadiZrO+dziKDUKcBGKq6pufd2l35j+2BWJJ7ulKVOT2Xkxi0OOjsdcNScDzaFIOBtrKqbhwQe4/N34OD862OrKb3PfyNecDmlwovEBnz9FdHr/3pl1E6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W4g2Via5; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W4g2Via5"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e6ff035e9aso2937566a12.0
        for <linux-clk@vger.kernel.org>; Thu, 13 Mar 2025 14:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741902198; x=1742506998; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r4FtVmYZgckl7YtfkY/SWerCLj70ANs6HxOobmm+Pok=;
        b=W4g2Via5pOOLqhY9IMsy0/A3EPmMiuSkyZo1xeB1XOlJjzKpNlCEdpV2AkA33Q5jel
         2AXHpvi+/+Q/B+A6l9weX+tjxCRossSIoKtnFfEHRe3jvRUWtR6aWSCdlBh3c4gQYTrH
         v9NJBMjZQlmPYSF0ToANF4vTDrNJj/74/EhVA+3PE3IEfEtlBhrfirWXg56H/xwb+rxK
         LwVdHU7fDeboibW+K6ofB603fzOf0a0hWSVh85Vx4Roy0ffZBn2ODYZuLOwwfhoW3ADY
         49mOdRwmWeUzQde7ACexd+GSmXQ/UDZDo4sT/5Y1Cq6cGwHssOQrbha2FcdwyRW0REHE
         s/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741902198; x=1742506998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r4FtVmYZgckl7YtfkY/SWerCLj70ANs6HxOobmm+Pok=;
        b=VIcZ6O4t+WLcA7DwsXA2oHnmrg6OAuPan7dLLj14gXieYNzPTrrwvdn8HNNo4RI9zE
         oiF54xrkfJT/MWuOSCKIg8rN/ot3kaQlUVM4/JL8ZRfc91TZm6q4hNNV2oLfSElS2nOe
         b6GNMtBA5HsmO6jhMPSb7xWDBM8eiDeV+nCPpcxkOhl6koZhjeaE45WCdG4crOAcISRI
         w/BldmJnReRTEK0FhiRwgRkqe7Ldw0mNrlID5vUtnWyShr4TGz/hc7RWnGP+E9hzAEZk
         XHIw8Amv1qjwbmMmXoFg7sWsmnsk6n0rJaL2DcnY0JVTupJNHurLSL5gGc9UcRMFkX5o
         BacA==
X-Forwarded-Encrypted: i=1; AJvYcCWdKTMNtxOaxJLYC0EIBFkiPTmw0DMF5q3B3YvJh9NjINsanJHTUDsk3o92ysKSD19pRZpOCWodD8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3oif3shTmRBYoVHXxGS3xsZzE+j9B39PmMKmRqvlydUZgYjGF
	LB7RsradEmtyHCafU1fTiJVnlJmYxwSLa1J3ruO6qR0DHZdngtznOTPbqAccQJM=
X-Gm-Gg: ASbGncuAiyJAsfhhIIjrcyqExmFyiVGMgYPwuVdeLzueBmZ1ICIa8vo/A6xcY9eP+BJ
	GOHaYLe/UbWT1s2bkA42XkbKqzxD5+XI7DEGtQmIBiwOTU/ru96owN+awAGhYrMWX8e4UmkQTRZ
	pWpLL/7198ME9M0Qd9m6OcvSPBbMNS8nymkyR5nrqwiexA1bscIgYn3yzG5oKN6dp9cA02ZFrHv
	zqiiYNln9tCaVahTpA1OfHRHaMJDYDNiViMu1BTBXRpUPhTIVuy2wJzNl3NXgqyaRnpjHtJLthF
	15/I9ZV9jjNKL+FX+RJy0ej7VVhzZNhOtQLWYsF83HzlUgUhcRS15MULUGMiWsn56m4AyhMNPVi
	uaaL6tBgpPL4ZLsbehfRilc0X21ePhLby0Zb/mXzqCXVC+iKGcP3faXepbPxddo0YwCu2
X-Google-Smtp-Source: AGHT+IG31Bns9+INvTorzGO/VBSn1BB5KJ1NQlQKRGr39RPhBs28xbw07ArB+XgHyNt78iLUfWBJWg==
X-Received: by 2002:a17:907:7296:b0:abb:9d27:290b with SMTP id a640c23a62f3a-ac330108a28mr11919166b.9.1741902197774;
        Thu, 13 Mar 2025 14:43:17 -0700 (PDT)
Received: from [192.168.178.107] (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a489e0sm126938866b.151.2025.03.13.14.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 14:43:17 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 13 Mar 2025 21:43:14 +0000
Subject: [PATCH v5 2/5] dt-bindings: media: Add qcom,x1e80100-camss
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v5-2-846c9a6493a8@linaro.org>
References: <20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v5-0-846c9a6493a8@linaro.org>
In-Reply-To: <20250313-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v5-0-846c9a6493a8@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.14.2

Add bindings for qcom,x1e80100-camss in order to support the camera
subsystem for x1e80100 as found in various Co-Pilot laptops.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,x1e80100-camss.yaml        | 367 +++++++++++++++++++++
 1 file changed, 367 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..113565cf2a991a8dcbc20889090e177e8bcadaac
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -0,0 +1,367 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,x1e80100-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm X1E80100 Camera Subsystem (CAMSS)
+
+maintainers:
+  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    const: qcom,x1e80100-camss
+
+  reg:
+    maxItems: 17
+
+  reg-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: csid_wrapper
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy4
+      - const: csitpg0
+      - const: csitpg1
+      - const: csitpg2
+      - const: vfe0
+      - const: vfe1
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  clocks:
+    maxItems: 29
+
+  clock-names:
+    items:
+      - const: camnoc_nrt_axi
+      - const: camnoc_rt_axi
+      - const: core_ahb
+      - const: cpas_ahb
+      - const: cpas_fast_ahb
+      - const: cpas_vfe0
+      - const: cpas_vfe1
+      - const: cpas_vfe_lite
+      - const: cphy_rx_clk_src
+      - const: csid
+      - const: csid_csiphy_rx
+      - const: csiphy0
+      - const: csiphy0_timer
+      - const: csiphy1
+      - const: csiphy1_timer
+      - const: csiphy2
+      - const: csiphy2_timer
+      - const: csiphy4
+      - const: csiphy4_timer
+      - const: gcc_axi_hf
+      - const: gcc_axi_sf
+      - const: vfe0
+      - const: vfe0_fast_ahb
+      - const: vfe1
+      - const: vfe1_fast_ahb
+      - const: vfe_lite
+      - const: vfe_lite_ahb
+      - const: vfe_lite_cphy_rx
+      - const: vfe_lite_csid
+
+  interrupts:
+    maxItems: 13
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy4
+      - const: vfe0
+      - const: vfe1
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  interconnects:
+    maxItems: 4
+
+  interconnect-names:
+    items:
+      - const: ahb
+      - const: hf_mnoc
+      - const: sf_mnoc
+      - const: sf_icp_mnoc
+
+  iommus:
+    maxItems: 8
+
+  power-domains:
+    items:
+      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: IFE1 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
+
+  power-domain-names:
+    items:
+      - const: ife0
+      - const: ife1
+      - const: top
+
+  vdd-csiphy-0p8-supply:
+    description:
+      Phandle to a 0.8V regulator supply to a PHY.
+
+  vdd-csiphy-1p2-supply:
+    description:
+      Phandle to 1.8V regulator supply to a PHY.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports.
+
+    patternProperties:
+      "^port@[0-3]+$":
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+
+        description:
+          Input port for receiving CSI data from a CSIPHY.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - clock-lanes
+              - data-lanes
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+  - power-domain-names
+  - vdd-csiphy-0p8-supply
+  - vdd-csiphy-1p2-supply
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
+    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        camss: isp@acb6000 {
+            compatible = "qcom,x1e80100-camss";
+
+            reg = <0 0x0acb7000 0 0x2000>,
+                  <0 0x0acb9000 0 0x2000>,
+                  <0 0x0acbb000 0 0x2000>,
+                  <0 0x0acc6000 0 0x1000>,
+                  <0 0x0acca000 0 0x1000>,
+                  <0 0x0acb6000 0 0x1000>,
+                  <0 0x0ace4000 0 0x1000>,
+                  <0 0x0ace6000 0 0x1000>,
+                  <0 0x0ace8000 0 0x1000>,
+                  <0 0x0acec000 0 0x4000>,
+                  <0 0x0acf6000 0 0x1000>,
+                  <0 0x0acf7000 0 0x1000>,
+                  <0 0x0acf8000 0 0x1000>,
+                  <0 0x0ac62000 0 0x4000>,
+                  <0 0x0ac71000 0 0x4000>,
+                  <0 0x0acc7000 0 0x2000>,
+                  <0 0x0accb000 0 0x2000>;
+
+            reg-names = "csid0",
+                        "csid1",
+                        "csid2",
+                        "csid_lite0",
+                        "csid_lite1",
+                        "csid_wrapper",
+                        "csiphy0",
+                        "csiphy1",
+                        "csiphy2",
+                        "csiphy4",
+                        "csitpg0",
+                        "csitpg1",
+                        "csitpg2",
+                        "vfe0",
+                        "vfe1",
+                        "vfe_lite0",
+                        "vfe_lite1";
+
+            clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
+                     <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+                     <&camcc CAM_CC_CORE_AHB_CLK>,
+                     <&camcc CAM_CC_CPAS_AHB_CLK>,
+                     <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_CPAS_IFE_0_CLK>,
+                     <&camcc CAM_CC_CPAS_IFE_1_CLK>,
+                     <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_CPHY_RX_CLK_SRC>,
+                     <&camcc CAM_CC_CSID_CLK>,
+                     <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+                     <&camcc CAM_CC_CSIPHY0_CLK>,
+                     <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+                     <&camcc CAM_CC_CSIPHY1_CLK>,
+                     <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+                     <&camcc CAM_CC_CSIPHY2_CLK>,
+                     <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+                     <&camcc CAM_CC_CSIPHY4_CLK>,
+                     <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                     <&gcc GCC_CAMERA_SF_AXI_CLK>,
+                     <&camcc CAM_CC_IFE_0_CLK>,
+                     <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_1_CLK>,
+                     <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+
+            clock-names = "camnoc_nrt_axi",
+                          "camnoc_rt_axi",
+                          "core_ahb",
+                          "cpas_ahb",
+                          "cpas_fast_ahb",
+                          "cpas_vfe0",
+                          "cpas_vfe1",
+                          "cpas_vfe_lite",
+                          "cphy_rx_clk_src",
+                          "csid",
+                          "csid_csiphy_rx",
+                          "csiphy0",
+                          "csiphy0_timer",
+                          "csiphy1",
+                          "csiphy1_timer",
+                          "csiphy2",
+                          "csiphy2_timer",
+                          "csiphy4",
+                          "csiphy4_timer",
+                          "gcc_axi_hf",
+                          "gcc_axi_sf",
+                          "vfe0",
+                          "vfe0_fast_ahb",
+                          "vfe1",
+                          "vfe1_fast_ahb",
+                          "vfe_lite",
+                          "vfe_lite_ahb",
+                          "vfe_lite_cphy_rx",
+                          "vfe_lite_csid";
+
+           interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+                        <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+                        <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+                        <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+                        <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+                        <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+                        <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+                        <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+                        <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
+                        <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+                        <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+                        <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+                        <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
+
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csid2",
+                              "csid_lite0",
+                              "csid_lite1",
+                              "csiphy0",
+                              "csiphy1",
+                              "csiphy2",
+                              "csiphy4",
+                              "vfe0",
+                              "vfe1",
+                              "vfe_lite0",
+                              "vfe_lite1";
+
+            interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+                            <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+                            <&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+
+            interconnect-names = "ahb",
+                                 "hf_mnoc",
+                                 "sf_mnoc",
+                                 "sf_icp_mnoc";
+
+            iommus = <&apps_smmu 0x800 0x60>,
+                     <&apps_smmu 0x860 0x60>,
+                     <&apps_smmu 0x1800 0x60>,
+                     <&apps_smmu 0x1860 0x60>,
+                     <&apps_smmu 0x18e0 0x00>,
+                     <&apps_smmu 0x1980 0x20>,
+                     <&apps_smmu 0x1900 0x00>,
+                     <&apps_smmu 0x19a0 0x20>;
+
+            power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
+                            <&camcc CAM_CC_IFE_1_GDSC>,
+                            <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+            power-domain-names = "ife0",
+                                 "ife1",
+                                 "top";
+
+            vdd-csiphy-0p8-supply = <&csiphy_0p8_supply>;
+            vdd-csiphy-1p2-supply = <&csiphy_1p2_supply>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    csiphy_ep0: endpoint {
+                        clock-lanes = <7>;
+                        data-lanes = <0 1>;
+                        remote-endpoint = <&sensor_ep>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.48.1

