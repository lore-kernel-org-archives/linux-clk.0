Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iwUrUvVT"
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A1F8D68
	for <linux-clk@vger.kernel.org>; Fri, 24 Nov 2023 00:41:27 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3316bb1303bso959034f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 24 Nov 2023 00:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700815286; x=1701420086; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rfvt+EmrHZv1zbeX+XtXPk6Fy/0gOVGXRVeJ603Il6c=;
        b=iwUrUvVTHJBc8Uk5RhjZQLZC18A4z7Lvi+Jzk8DqTAT5fqyL2+uMprXn7LA+v7KKr9
         uq0WVxsuGHi8TDgy/vd82P7/ypvuLYsJ6KkbQfJ98hoN2CMOn6BQGTPqH+E8cUy01FvM
         xs71Z2mngstOQ0p5t+97aaka2QTr7kFZom0KCAhafu4bNu3fUL7vKDdJt++rF0fSzs7F
         PcKfUKgmPzVhn2A8RqRabUoQ0mniKT4lw/y+i34aKLGyWJxfJ+2hRN171oVL6uTkvx25
         cEppkjW5gSTF9l9tuKdok1VVH/FMGJxZVbWXDkIfaQBIZbHsjWWQ/ixKM53y1e9yXrUm
         lcyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700815286; x=1701420086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rfvt+EmrHZv1zbeX+XtXPk6Fy/0gOVGXRVeJ603Il6c=;
        b=es1G2OIKxpI8d0s6lbhe0l2u2VoiDmbDvb64yjIaGmhxVVCCgKPKyFjXSNF5WvZvyf
         MY7koTTnam/au66jVWoAl+LkgeKD5ibOd/2NVG1/PFDhFv+Tv+FKp5DOfHsj6TZPZG4c
         YjIRCslGPIv30hsq761VC+LqvnQHXuDyyxKppskY4EMtQRGP3mqbeN957l5l07ndbtUx
         d0oA6VIf8d8jVesYBnOkOimEVTjvHXnJAKwYe1i1enVk9b0r/MuqA1k+bYNyncjfXSei
         ysQTFPZgK5At26BDiTw6XkajXBlA6ISPgy1rw8E2FPA+LMrfUKcdKIPua72Up/jB0YpU
         jgmQ==
X-Gm-Message-State: AOJu0Yw3xCzbphhxuwk37B6Iwl7dJinRRkvN0ezro1xBkSs5PlnaycwG
	L7hVVT6QlfAyDHuOtWRiLE6VGg==
X-Google-Smtp-Source: AGHT+IFnuchw8Ikyiy3m+j3gALkvJfoErNWWwqz7BB2ufK/58r0Gt+p5OXv1H8cdurIdKXJg/ONALw==
X-Received: by 2002:adf:f48d:0:b0:332:e6d8:9345 with SMTP id l13-20020adff48d000000b00332e6d89345mr1676453wro.8.1700815285668;
        Fri, 24 Nov 2023 00:41:25 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id c11-20020a5d4f0b000000b00332e67d6564sm2534562wru.67.2023.11.24.00.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 00:41:25 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 24 Nov 2023 09:41:12 +0100
Subject: [PATCH v9 01/12] dt-bindings: clk: g12a-clkc: add CTS_ENCL clock
 ids
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-1-95256ed139e6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=761;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=OBDzXE6zqX89kc7pvzy4CIEH7gf5glqDzs5WzIgtsF0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlYGGupCZ+JBm/j62lgDoGr7xNwQCD1mUMzIViQ3Q+
 5BTtcTmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZWBhrgAKCRB33NvayMhJ0e0rEA
 C7eQ9byvp8DK/smW2cQqD8180I42XiMLdt3wZ7xVsHlZzRItzA+GMiMo8KBxOsciSTcMe2vQ3qkNz8
 /viQaJnuONTjKXGF1XzU0w2a1mU/w+GMAqpq5t5GYrsJYhBKucDz9O4ybGOoKdKFn12f8S8vjiTPdC
 +zThFD679SlacJRPuk0vKbwaPI4yFbHSvKWYKMtm1yYUOTWdf3asCcSbA1r7ZdSxR9n5ptrY/j0S+/
 7MyDnuRCfp8bhrWJqlXGhdXqWuabpaTaiWo7WgKW1sfpHHJgnES0z1FOzy3t+/lECu07cuhyLkdHK6
 hBFrNDz28dCn70wp0d3lmAAKuMaGh0riTCG6cjJHW9y2nNUNfLScNubW48XowuSlqaadd5YUu67laO
 bsXX8vh7L1Nu5uT2wmRY2BZpkUek6F6XRKcvDP9fG/P7LNiGCNkG/gK2pGYR0D8pI8SfeZN3558EO5
 m43V1xVJ/3fhvgYUcrY9QiimI6m7WxdQhcxoePjjVBNYsQwezxq4FGFV6yYRLjjGzzPY1REEU0hYSx
 oHJQit3xEHjUuNXc2fQH7wAQLOFnTcqe1LFiHzo8u0TVEv0EaxKFo1fFXSlIPwb+jNK9flSKdZq9aV
 jjtxeGFXZGXslCW1Bd7c+mso633D4cWnl5ZWduv7cUenT9VDAgcrqQz9kh6w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add new CLK ids for the CTS_ENCL and CTS_ENCL_SEL clocks
on G12A compatible SoCs.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 include/dt-bindings/clock/g12a-clkc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
index 387767f4e298..636d713f95ff 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -279,5 +279,7 @@
 #define CLKID_MIPI_DSI_PXCLK_DIV		268
 #define CLKID_MIPI_DSI_PXCLK_SEL		269
 #define CLKID_MIPI_DSI_PXCLK			270
+#define CLKID_CTS_ENCL				271
+#define CLKID_CTS_ENCL_SEL			272
 
 #endif /* __G12A_CLKC_H */

-- 
2.34.1

