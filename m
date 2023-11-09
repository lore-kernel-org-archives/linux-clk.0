Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17D810966
	for <linux-clk@vger.kernel.org>; Thu,  9 Nov 2023 09:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hTW2S1dR"
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECA6E18C
	for <linux-clk@vger.kernel.org>; Thu,  9 Nov 2023 01:00:16 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-507bd644a96so843386e87.3
        for <linux-clk@vger.kernel.org>; Thu, 09 Nov 2023 01:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699520415; x=1700125215; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6K7DUEVq4k96cRCmEKG1sJThC51M4OI0/7xFjD2DU6M=;
        b=hTW2S1dRzMvZNK3MN0aqWZ/VOROA6Wtq9qtso6GQIMqPPmMRTeMWcPzEO5L3P0fCDo
         gZRtLQCh1EFr2IpF8kFgMgpN03S5T9dNpeMvMjrlAXzuTRmiaophMCiunHgaakDIPGc8
         bC5RbIJMDXMcLdPCS6R4IF0/HpRJ7tUH/zweG5ateGEIP0JdVloblR7us1VTJOjMMfv1
         PZh9pGRBymOp/JZH8fCKEYY/6ZO34tBZrkz3Hf7/SeIK3hKhLbDCnCK1DVcCVVFSoFlb
         oB8fu7yTQDi8XPf4hGrjbiCkOMU80Zq2qNXyJzEyhbT6SbVYjxETcsgs1nyIqbX5jvXO
         be8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699520415; x=1700125215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6K7DUEVq4k96cRCmEKG1sJThC51M4OI0/7xFjD2DU6M=;
        b=cHq2TqIdHnPOK/4zeX/xfu0LxtMTxiv8FA5YbfuePGSL7NVDjwpOI63QdntnfNiAr7
         UuvrhF3NIpnTJzRZkDwhFgU+zCLKWN0hEdLp+chYzioZ7ccR7hk5WQS8oZuqvoJF98b4
         tFsiFZYpm3hcLKkKytzXNhHkHW4OgM31EvoMeO3vBJBxTWhGC6oAA8WTwIuolnjz23FG
         hA3njCyg/rfi29sceMV4XYHhZ/Xbbqe+pp0uLWsOJfH7ie2TuDjfmlt8tp3nfRSOS0Co
         V/iyUIiKV8SdkRJW0LC7YUTETkQJ3Td9hfF2PggZMKm9+ETI6AfGVzAmKMaaggCQ7wzM
         fQ1g==
X-Gm-Message-State: AOJu0Yxo0URjbk8ANti8jNIq0qJ//XBqRr69vXuiygZM6pglkdJ9ubmn
	yaK46VYDcra6/gNds5joW72G+eLvTiHtFaiN+F2sMUG8
X-Google-Smtp-Source: AGHT+IEz2Rbo1iFlt5T34StiguUybmx8i+EgvioY2Ns+O/ShW48jCuLMnwyrfAfGKMqbX7riaX7U4w==
X-Received: by 2002:ac2:57c6:0:b0:507:a58d:24ba with SMTP id k6-20020ac257c6000000b00507a58d24bamr679052lfo.63.1699520415302;
        Thu, 09 Nov 2023 01:00:15 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ay36-20020a05600c1e2400b0040472ad9a3dsm1428484wmb.14.2023.11.09.01.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 01:00:14 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 09 Nov 2023 10:00:03 +0100
Subject: [PATCH v8 02/12] dt-bindings: soc: amlogic,meson-gx-hhi-sysctrl:
 add example covering meson-axg-hhi-sysctrl
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-2-81e4aeeda193@linaro.org>
References: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
In-Reply-To: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2143;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=rmmUAof1Km7bxj9UDL4YQbyGrQ3/OWsBkE3eSPayK1M=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlTJ+WfUUarmFrtbxzFNQtmTgHaC2dbjJQ1PfGYXCS
 oFk5R6CJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZUyflgAKCRB33NvayMhJ0WlFD/
 4hKPd2SlGH71MFNfm+ZCIgny4FD5hPppa//r4ijo8NA7FSXhj6/jUB5R0c9FSYxNGsGGqq04nqYk8C
 cf5cyktTaJKo8bx/Vnasl4/31menxzc6pXE+Bmt6LiPLnp1d4rBQ3nVMbTXfmDeFk/MuwC3mhmcU8Y
 F8LNr7TlDkehXBTf4uSBmn0oxUnCzAa3bfadgWBl150CGUiVYsCVPLOW39hDMPZ9HB+lMHrHP+Za8Y
 p6WyIsI94u0a/XLMeizJo2o3X4wpDz10TPZqG4K/osfG7npTrF6NN80D+rrQGiamMXqA1VRgZUrTmi
 Vbbk1IWLBoabQSuzByXTozIB+s1ZQToDD4NjhfWCikUCH8XB6ifCIx4AfBsZX+MA7HUbVZzS3jGhzu
 KYbnoJo4CkOfEGwco2WirWaCHqm7u5iScQ9JCr9lxEZeQBWq3PJblVO9g46F3Yv0iK8SRimwrKn0a+
 EmrfI3FexR/WJX1TauCQqDRNw0gEIVJUamq0HCmqGH5moqPOaTo+4z60vAIoIV3vGlQKdXdSJPdVAq
 CkrmWROc5NBP/xWL1ElTlGJYrh/iZ33+/hyC3OBv28ErZEv/e0UVbkql8oHnX1pUi7lEISjm8AAHJ/
 822HEqgMVQkcpeW0z95z0HJ+9JYPtasDwP5UHzgjHeFSDg1tW2qdx++dLQSQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add a thirst example covering the meson-axg-hhi-sysctrl variant and more
importantly the phy subnode.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml  | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
index 16977e4e4357..2edf4ccea845 100644
--- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
+++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
@@ -158,3 +158,44 @@ examples:
             };
         };
     };
+
+    bus@ff63c000 {
+        compatible = "simple-bus";
+        reg = <0xff63c000 0x1c00>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x0 0xff63c000 0x1c00>;
+
+        system-controller@0 {
+            compatible = "amlogic,meson-axg-hhi-sysctrl", "simple-mfd", "syscon";
+            reg = <0 0x400>;
+
+            clock-controller {
+                compatible = "amlogic,axg-clkc";
+                #clock-cells = <1>;
+                clocks = <&xtal>;
+                clock-names = "xtal";
+            };
+
+            power-controller {
+                compatible = "amlogic,meson-axg-pwrc";
+                #power-domain-cells = <1>;
+                amlogic,ao-sysctrl = <&sysctrl_AO>;
+
+                resets = <&reset_viu>,
+                         <&reset_venc>,
+                         <&reset_vcbus>,
+                         <&reset_vencl>,
+                         <&reset_vid_lock>;
+                reset-names = "viu", "venc", "vcbus", "vencl", "vid_lock";
+                clocks = <&clk_vpu>, <&clk_vapb>;
+                clock-names = "vpu", "vapb";
+            };
+
+            phy {
+                compatible = "amlogic,axg-mipi-pcie-analog-phy";
+                #phy-cells = <0>;
+                status = "disabled";
+            };
+        };
+    };

-- 
2.34.1

