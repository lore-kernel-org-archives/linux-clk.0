Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l2peCLx3"
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35DBD10D0;
	Thu, 30 Nov 2023 07:56:42 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-6d81580d696so631227a34.2;
        Thu, 30 Nov 2023 07:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701359801; x=1701964601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0sWTB9BvFGB6WA60MMINgbzw8nAjuQT9CcbxWGyQD3o=;
        b=l2peCLx3vQTMtDUX8j4KcgcxFOD6yeh4FiuI/cLBWh61uItWufo9Fp62FXhz7mWByN
         VDKdBeylLFTZ7vxm0L56zIzfF8DXnPHh6m1mHDES1XHmZyO6PE+YgZlYOJdO71+2AmCK
         x3agWjZlyp+QxIPcz+RF4jngWunOMfaod9o32WVleZj4S3dWpdqZhjm230K71N93RTfL
         xpVuH09vpEARKn0ZM9URRdLtvDNzfyZxG/x1aMCCbFokux5byX+/IqVeRY8xPzcR3gDm
         LoPFGk2b4kF+wp0A4793/un55Zl/Oq3DtIWjp/6we39bG7k04Qqv1CtP50cN+kR3Im+z
         1qHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701359801; x=1701964601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0sWTB9BvFGB6WA60MMINgbzw8nAjuQT9CcbxWGyQD3o=;
        b=TZSk89X7dbrF5M6qvFmYtrc2r/O7bFUVIVozSOuNRNxcYJxE9QrOHMyIqoC5mWwy6l
         goCx9BwG/sdT68lw977YKzQGPA/LmbmcwJuEaQA8Y+5Jqr3148ByH/+UMKwKfxfIgQ1y
         CYcDnfDDYvPPXN6QAQoyGnx6TjVCfDPEA5SSgcbkfVR7uNF9w/M80hsm4SZiXJE+1MjP
         4CFE9ZyC93uiWYpyINDDbRzFj5k7e9lFUmHO+pweti0riQf4cFzMuCpMLq8mPCL5qe/p
         nzwhYn8Po2wixLV0ABlDQ3l7JgnhHQzb0g+gqhtXTOtff+FWbKGfw4mZqcjZLNesd6Wz
         Jy0Q==
X-Gm-Message-State: AOJu0Yw2c56rydZkM7LPesefTcyr8nBFaj8BNh19MVGu4Uu4aujzpV1J
	dI2vYvlt2p0cLLL96IV3NYU=
X-Google-Smtp-Source: AGHT+IGhpeCC7WDuUm5wiohpgqJLZBDERA+sjaUEm5YoAWSiC2xyMiO8MrsIn2UVXz1odmuZv6XxQg==
X-Received: by 2002:a05:6830:16d9:b0:6d8:57d9:23cd with SMTP id l25-20020a05683016d900b006d857d923cdmr4029693otr.22.1701359801533;
        Thu, 30 Nov 2023 07:56:41 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id n25-20020a9d6f19000000b006d7ff27a47esm187852otq.77.2023.11.30.07.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 07:56:41 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sboyd@kernel.org,
	mturquette@baylibre.com,
	tzimmermann@suse.de,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	daniel@ffwll.ch,
	airlied@gmail.com,
	sam@ravnborg.org,
	quic_jesszhan@quicinc.com,
	neil.armstrong@linaro.org,
	javierm@redhat.com,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 8/9] dt-bindings: arm: rockchip: Add Powkiddy X55
Date: Thu, 30 Nov 2023 09:56:23 -0600
Message-Id: <20231130155624.405575-9-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130155624.405575-1-macroalpha82@gmail.com>
References: <20231130155624.405575-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

The Powkiddy RK2023 is a handheld gaming device made by Powkiddy and
powered by the Rockchip RK3566 SoC. This device is somewhat similar
to the existing Powkiddy RK3566 devices, which have been grouped
together with a previous commit[1].

[1] https://lore.kernel.org/linux-rockchip/20231117202536.1387815-1-macroalpha82@gmail.com/T/#m4764997cfafaca22fe677200de96caa5fb8f0005

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 021a0e95ba62..5e22f247ee6e 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -681,6 +681,7 @@ properties:
           - enum:
               - powkiddy,rgb30
               - powkiddy,rk2023
+              - powkiddy,x55
           - const: rockchip,rk3566
 
       - description: Radxa Compute Module 3(CM3)
-- 
2.34.1

