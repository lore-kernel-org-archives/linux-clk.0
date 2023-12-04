Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AMxQfRMu"
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E07E1B2;
	Mon,  4 Dec 2023 10:57:34 -0800 (PST)
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-58d08497aa1so3521659eaf.0;
        Mon, 04 Dec 2023 10:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701716253; x=1702321053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmJdBsEIoaHpkciH4cOKP2SWtpRhXc0Wn244MKf8EyU=;
        b=AMxQfRMue++JMLacmWJ80EcBY2rAN1JWYrtoMGRIOZ3uAGceOBxTLMgrPFBcpiZNce
         7dVOlck093ISXmdgQkDWey+7J6vpBRTyRJa5la6lkuD+/IAfbBxtMTO6rrHvrGTNO4EH
         bEZOiA5zJn2CrG/milgPqaDmwu+qo+pgHxMilAZVE2c7ClSc7NQmHblj2TRVzPr3aYCd
         YhCN/jR5sJWxM+iv1l/dDLEnz2wXSz/EQUQw/M2PYoxI4N6WjlLMnWxtj2MZc7sksTjX
         DBDyFKTJ3a5djEOCOLaVYPiKFqs1xGNf4VTAZw4nlM9p0Ye7NmG5wNsUNOL7FQoqgNJI
         1pIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701716253; x=1702321053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gmJdBsEIoaHpkciH4cOKP2SWtpRhXc0Wn244MKf8EyU=;
        b=tUqCsrsMc/nH4qlY96NC/0+btNtBEOytRNEzzinTvqOEHjFexSgqWQAs7awQF+7ZGg
         oL9m3jpPXF8HxXmjkhGUCVaCNTsGYYuFYtfIi5Drchx+HC/arQoXYUlg26/N4XXVEAoQ
         QznJ0V5THLTh2DPiArEPdjF/jadTL5aUnroGNpl2hz9VcWKB/WojZKgPXJj8v/k2Nyyx
         heTF//douc/Rr8tg1eXW6jBPvGBHk7bIl9jjcRCmV/1Vqv3nGJXDW79RF4v1ruiMElpa
         8qSTYZNuLMTV5G2O6j0aDK3QdBIrn7LpuT/pyk2axwk/DQnZ885gQ0gY6WygrAOv9Tl4
         BVSg==
X-Gm-Message-State: AOJu0YzFFvJmCtqvwVizlyKjVZKN1Zubg4tV0P4JO5qXKuaq5NsGUTx5
	H93K0B0oIIKPdF6un8RVSH4=
X-Google-Smtp-Source: AGHT+IFQGyE/M8sayDjI/7D2oxRg41bIw/oTyLd8Z0sAIq2ffMyqLkUXBu0XuWHn+CEm/Ver7+3Bkw==
X-Received: by 2002:a05:6820:2291:b0:58e:2845:d43b with SMTP id ck17-20020a056820229100b0058e2845d43bmr4008004oob.4.1701716253433;
        Mon, 04 Dec 2023 10:57:33 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id y25-20020a4a2d19000000b00581fc1af0a7sm2073303ooy.28.2023.12.04.10.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 10:57:33 -0800 (PST)
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
	Chris Morgan <macromorgan@hotmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V2 09/10] dt-bindings: arm: rockchip: Add Powkiddy X55
Date: Mon,  4 Dec 2023 12:57:18 -0600
Message-Id: <20231204185719.569021-10-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204185719.569021-1-macroalpha82@gmail.com>
References: <20231204185719.569021-1-macroalpha82@gmail.com>
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

