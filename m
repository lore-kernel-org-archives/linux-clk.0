Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KQbERA6z"
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24C88AD
	for <linux-clk@vger.kernel.org>; Fri, 24 Nov 2023 00:41:30 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-507ad511315so2280584e87.0
        for <linux-clk@vger.kernel.org>; Fri, 24 Nov 2023 00:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700815288; x=1701420088; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m2ZTLCIzGtDzdo93FJ4l2pfkops6GMcXVN1dXIsoDYI=;
        b=KQbERA6zxEIyWLb7XzeJ4Oe2a++OW9PwqQjeSWVTXgj4EN3+4ykzz0wfoskIWOnbUx
         4N64NoewPGv/SUK3lKEdOO5/PsT6nTgHBzOYwZR90qEA7qXAhYIu80O7oWdEpqmHWeZj
         IDTJBStMTpebNRYdagmSqB/pH7UsA0mfHtSl951vs5UjBG4uopyWfDGKBLQxRfIKihEG
         PrpFJbYFOrmbugxkstPN5kY4v2Flujpqih58TxRWCubU1ih9xpTV+MnIvt9fPT37iIVI
         RgNjqnc/OxiG1IDWpd5gYfzHcdMc4MrYtBHhWdWzKE5g01jiV1kv7Jcbn5C1RTOC1bY3
         RXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700815288; x=1701420088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m2ZTLCIzGtDzdo93FJ4l2pfkops6GMcXVN1dXIsoDYI=;
        b=VGvphaqRXUdza22i2cBHSg/eVZsmQH+nKE8f5pekpnvM3dSmZJ0C827NUY//FS4u8y
         VonPKihsaM7D0OEJR2XIBgC+Qx3BM2JsN0gypEl/2jJfOcbUW45hFPLqEyPgUNW/Cir9
         n2V0PMTUFlUZvjJo+Z/ONnmPKO7/Z4IitHBJLcTY0VhweM/2mWhwcPHPDyzlVN7p+DkG
         JWUYGLoBpJBQTFGEPrd38V9V78LeRKB/STjgkbEGsR7/sXRzKDI0de5/H3Ek7AL9qKWK
         ux98zk/8weDZ0tgzWeAprWfgO7k7C0A7hmqCB9qk9Git5EXqJ1V79gymMPyZLgFfHum+
         NfBQ==
X-Gm-Message-State: AOJu0Yw3AROvUxl7C9NeKBrFduj0atfz56YBhoNxLKdzbOKXJWd0Zesw
	0wQS9/U4sbXL8/s+pd7xucg8Ug==
X-Google-Smtp-Source: AGHT+IF7kjc01o/SSdybHjyNhj71mp3t5jB+vgaS6Zawv8K1Yz8ZO/SXKRCN8wCpxqC5dFcGrXnmPg==
X-Received: by 2002:ac2:48b0:0:b0:50a:71d8:c94f with SMTP id u16-20020ac248b0000000b0050a71d8c94fmr1135313lfg.60.1700815288264;
        Fri, 24 Nov 2023 00:41:28 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id c11-20020a5d4f0b000000b00332e67d6564sm2534562wru.67.2023.11.24.00.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 00:41:27 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 24 Nov 2023 09:41:14 +0100
Subject: [PATCH v9 03/12] dt-bindings: phy:
 amlogic,meson-axg-mipi-pcie-analog: drop text about parent syscon and drop
 example
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-3-95256ed139e6@linaro.org>
References: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
In-Reply-To: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Remi Pommarel <repk@triplefau.lt>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linux-phy@lists.infradead.org, Rob Herring <robh@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1573;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=8X7fhNCy/HvwIwzbk4yey3zcZzSI2bVpb2v4gVLXFlE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlYGGu31exqQpuNJfZ3NjzAF/oHsRU6ubp/jrWqLQT
 WaJLbsCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZWBhrgAKCRB33NvayMhJ0VZEEA
 CD9QWyKz5JqJKUffivHccIDuBx4b2ZX1upUOn4LYSEVYLaEcJbOEb6eAX5QsIvTezN2HvZAOD/TF9X
 9pmybusblHc3qqagjwruVann9xFjxmVQCB9SWYGaaQ0kQYjPaY5PMoVHthzTo9JWLHJSz24rKrbXDu
 xLpfwHLzURD2kOC43HpN66RtC1etfxfHeGOidg6loQOI04C9jg8vbuQKk7i0kIDBhl8PiFEJ+wgw6L
 D7M5mAuFYh9Tbd5Z5hbpNP6A+NahpX86HYi2TeKEMOMMCD92TqldpuV62F+Ry6VSJLYPVXi4i9FJ2y
 BG4Ix/aRkBZrVNcPjfiOppcPJ0kO+XcRl3EUpuMo/bjnARyq7bqZoHTiJ+VMyLwNo/K5LsaelA5kmv
 tA5YgY9gVsjAhiCEvOX8bGnkrRYLI6rINhOz1VqeVgbhFxOkYVfICfwTIaVpJmfniwQ4jOThbthyjO
 CAAKJ0dXfO51MW7CDFudjjcdwaRBdjl0nEOEWQgIe/adFoJX+l1iF43Lq8JJYTIF2ignclF4V7fEdO
 ihz9RrW4apafWFspszLmJDMa7hi6fS04cXDWU+4GidaAXBkpZmoJpvuwsx1qgdBLvOr6AlDgFvKXYk
 z9mvyPn/fy3OaYQofJppI6cR8w4scLqA3Bd7v8qyOdKyjBKiNATHR5rXnrrA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Since this bindings is referred from amlogic,meson-gx-hhi-sysctrl.yaml, drop the now
useless description about the parent node and also drop the unnecessary example.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../phy/amlogic,meson-axg-mipi-pcie-analog.yaml         | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml b/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml
index 009a39808318..70def36e5688 100644
--- a/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml
+++ b/Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml
@@ -9,16 +9,6 @@ title: Amlogic AXG shared MIPI/PCIE analog PHY
 maintainers:
   - Remi Pommarel <repk@triplefau.lt>
 
-description: |+
-  The Everything-Else Power Domains node should be the child of a syscon
-  node with the required property:
-
-  - compatible: Should be the following:
-                "amlogic,meson-gx-hhi-sysctrl", "simple-mfd", "syscon"
-
-  Refer to the bindings described in
-  Documentation/devicetree/bindings/mfd/syscon.yaml
-
 properties:
   compatible:
     const: amlogic,axg-mipi-pcie-analog-phy
@@ -31,10 +21,3 @@ required:
   - "#phy-cells"
 
 additionalProperties: false
-
-examples:
-  - |
-    mpphy: phy {
-          compatible = "amlogic,axg-mipi-pcie-analog-phy";
-          #phy-cells = <0>;
-    };

-- 
2.34.1

