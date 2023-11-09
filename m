Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF7810966
	for <linux-clk@vger.kernel.org>; Thu,  9 Nov 2023 09:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l+hCgeJ3"
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A0CF182
	for <linux-clk@vger.kernel.org>; Thu,  9 Nov 2023 01:00:21 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-507adc3381cso754432e87.3
        for <linux-clk@vger.kernel.org>; Thu, 09 Nov 2023 01:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699520419; x=1700125219; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=szbyE8B5HmerWTS9QCGM8GNA9TtBAZ10zn0t2kxJOBs=;
        b=l+hCgeJ3Hep33tzXsQu9ahEgX2G90qVKheK2+NPfmlKrKM7dVLCXDUuEsGYbRoTs4P
         sZmEDzmebQ/aV0e6nnlJzEtfyQYvFHKr4Ity+9hEMmcNNjGlplorUa3NXUqf9hQio1Fo
         xsARQLOqw3Q/D1l/bQ17Q0v3UbJTlBPZ1wqpRw1sNmLWOUu1ThhuIQsbObDV+lrbdtFa
         uKIus+8Ac1MxemLpQqx6B1bXhS53BR5TNC4N7aYXicVA+0sie5fFm/+tTDQPYVevH/lU
         8olMiW6nm4ZA7d9NeChirI/iZQBCE6zX0RVDvE3Gt4I2bTSmrEv91UgjQ5HS5jF1v5oA
         0dbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699520419; x=1700125219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=szbyE8B5HmerWTS9QCGM8GNA9TtBAZ10zn0t2kxJOBs=;
        b=WLH60/UCBfR3IXE9ZgFr5a8zPZiJaUsHyDSaaw/DJmDTB6W2bJuwm3PC51oYfQQITW
         QeGetesOqcx3q8RH5MGKBFUZEQOQFnVVr4wblESppPN/HuB2MSzBb/9LtmohkBA+8uiI
         nE/eacG0v943WLfHo+ndRJmz8JQaaFJ1t++fhpXjHH8SmV/gtTUjjuWEF1kaOxbUVmgX
         FIlVjoatTvd6kbmnflzCzRWPvlWc1/tAirEQGfuRXaWNaIVsPTOsmD4xpSEzyi7RcUaA
         KRErOo0yEianNMzl5vUnOtBZeDefJ1GOp2L43NPMPHzNuGR42sHxe7WWe+hIqXkoYE7Q
         JfYQ==
X-Gm-Message-State: AOJu0YxLTFppL+QkSHMWmh23B0VO1iNe/gANIdbtOeWKtuxDrxFISljj
	/v2N7t9kA+ctnWxaWXguC/lTyR0E5zHjwRbArcvG6GYC
X-Google-Smtp-Source: AGHT+IHS6tUZm8jOoxmt7gLhfCx4bKpuATMzr2y/aX20jzVc0HP5QxgoQ9hMcisEW+40E1hCOQ92oA==
X-Received: by 2002:ac2:46e9:0:b0:503:3890:ca3a with SMTP id q9-20020ac246e9000000b005033890ca3amr700600lfo.66.1699520419352;
        Thu, 09 Nov 2023 01:00:19 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ay36-20020a05600c1e2400b0040472ad9a3dsm1428484wmb.14.2023.11.09.01.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 01:00:18 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 09 Nov 2023 10:00:06 +0100
Subject: [PATCH v8 05/12] dt-bindings: arm: amlogic: Document the MNT
 Reform 2 CM4 adapter with a BPI-CM4 Module
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-5-81e4aeeda193@linaro.org>
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
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=886;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=dsHeljQP++qeke1zASpQ3YPnuH6eGTAu4r6z8mvmrbM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlTJ+XRZWlbUe5Rri8/LQk6vQMDR/N4E1+/QArPJOQ
 hDPKMSqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZUyflwAKCRB33NvayMhJ0fZ6EA
 DKGXANe+GiL0Hty6vwML+EcHg/3t3bvOMWaCVnFG9FBVAF5J/3hzgAZUrtexB3iTxBxv1Wi/MMuZCd
 D0EIB7HroUpPGzid5eOt7jARPicDb6OkZO1vTf54GNfi4tzMGkGWWX9Nox2SzRokE+qZ6JQfcjcw3n
 xPIZMCZaczLGIhSpD0J4IDfGJ2B7txsxkeomBs26wTTz1NLegZ2YuDmQ4Zds9gF+5Ar7nhPEcGZqbI
 Ouub7B4/p/D3K5HYHXPNCFhFLddpfXPAqXp9NW6nzeDBBa6nJSqv7i/CJ4s2FqP85+jTcOnzmDWb4L
 X/A+WhvP8g9+SwI358niGHButCjVqyipLvgPR+2hYipGZIcIeNWivGBu3GgeX5moi/X6ISMsq+h0yk
 QJD2QkrquMFAEGWvdfKK3kcR/ifPtXpes1OPYSEv7I2catEfNaTS89Xnlz65mLGSOdkQm7kHDZqS5D
 Q0tYEdEUeYJNcfe7XfKMhSErO0ChRdkDiRWpDIxuIabO/o4ogXHF/ltLdpvJurBs0LvcMSr5cwwKk+
 Pz8nffeKLBAW+eq0HOmCYE2o8B0kYQDiSZvOQRHAE1nyEiOXVTvS0OxF1i0EVs4x0PcZMAxmN/yva8
 ny3mxnhepxPQesscosm346kOJPir48KLdIfA1jU8pEb2Tk+xgcoVaAXBT0Tw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The MNT Reform 2 CM4 adapter can be populated with any Raspberry Pi CM4
compatible module such as a BPI-CM4 Module, document that.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index caab7ceeda45..2154a4614fda 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -164,6 +164,7 @@ properties:
         items:
           - enum:
               - bananapi,bpi-cm4io
+              - mntre,reform2-cm4
           - const: bananapi,bpi-cm4
           - const: amlogic,a311d
           - const: amlogic,g12b

-- 
2.34.1

