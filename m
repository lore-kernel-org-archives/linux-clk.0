Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDBE16E891
	for <linux-clk@vger.kernel.org>; Thu, 18 Apr 2024 14:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713449847; cv=none; b=crX8mulhrbOfLrfK9uCXy9OhINzz9yTK2mBdao8n9Dt4yUbP/9tu3NNlRpd7t/WuQkKLbMhowFGI7YF1uFiOQOCh0j44pSlrjZP/DP4sJOyx2E77v2l7eTTCia81Ypr9SqH7X6IT/5KK0vawCt5sEA3i0RhqW/IY3KhPlb68bOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713449847; c=relaxed/simple;
	bh=muTuIXTt3JZ+adeVzSiBV0lvPUUpPPEXnWM8MyjFIfI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gjbVuR02dmOyMP4kPr83WR3HvDkl6jSguLympyAHPci9HS6RGE0UOHhU5thckw0l9vqSZ8fYQMJmsmOymtAMLG373zx3P6Pho7vMZ7N/ROkWjjgav49rucutQLsRX+L1kXmTQCecB9uG6gEA77qqvtcTEE5fzWOQxesf9BDDGUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=kkZbCyjJ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="kkZbCyjJ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-418dc00a31dso7535075e9.0
        for <linux-clk@vger.kernel.org>; Thu, 18 Apr 2024 07:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713449844; x=1714054644; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GDKYuiqKi2lKHFjV6hEj5ZeFkUw2j/++ERAAAvYfJ+0=;
        b=kkZbCyjJqzy7bZLKyiI3PX1y4WGDSaWZSAppwKpfyNjA5qIYSTk42FzlgL29ptBgZv
         ng1bLky9zTjKA5gpTinEEnqWaPXh8XgglA2rDp85K6UuyAZulkDOgNzLbAvRyoCQdKQD
         0JS/jBkn1HItEjbN4zTpsi3wfYgyl/MoCzpxSp+KQl9NcSGApd5PKgpcRvStLqf5x4w7
         ceKqoY7KvO6TwKstxT7moSF903IaBkFTJBQS1eLgEVrNVtJ9t8AdG6rm6KzWku7xII8n
         0D+sjjC1hfdN9+nGHZVIJmuqlioSzmFe0c2i3o8YLKTSFcANYX6xZKuy/PpjlVyCtIeP
         HFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713449844; x=1714054644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GDKYuiqKi2lKHFjV6hEj5ZeFkUw2j/++ERAAAvYfJ+0=;
        b=VUQZU5Oqfbs96Q8lPIsCHohAZLrwnNVMnEgrI7d9tKrYi0NVsfCGKAwIFU0SL/nzdi
         RuO5lKq2z0bHwJnzRIVZrQiqpGd6tVVOB9wNEoniANl+ERnxdhOaWEtD8/JkwRd1gcKM
         sr97WY6+oaECl5VoytLkdvs0QUKX+b3s/LoviUVcNBXd4615op90BXBP+oP7nSJFxj9H
         GtRWx/nEfuBQyNfLW5+DlaiDibBh4SCo+nKLeCs7G0zXBhtpwGz2Zu5rlVGRadJGk49m
         TvcMl43SfL4qkj5g/QClPOab8xx7TDM4e+p/q4DGl3IXfLCxCzV2cwAhIzYYaNaXvbLn
         jv1w==
X-Forwarded-Encrypted: i=1; AJvYcCUSWRdsWRxWl4SHz2qu4mCzYZAXU1JwDx3adcX99D2P2LyRVu6f1fTsm37OTNWJXhZgq/cCizTI0EQjQw3MHU8Ve9cU9l21NsCD
X-Gm-Message-State: AOJu0Yzea6k7dW2H/Ekdp0J1ZxI22lQj+PmcZH0yZWegNK3HcE8x2TDB
	09eExoVuF+vLXJ8RKfr4RDx/hdnPbL8MtnDabXTNcHhKDR/oF8OPSHHC+yXsDLI=
X-Google-Smtp-Source: AGHT+IFZpHUd3KKJqTG8Fspa5WV+CGK6XUr6/zHywZgyWssPB2EZ3Ze0JTvaDZBJmIElV5Y3Uwlkxw==
X-Received: by 2002:a05:600c:3555:b0:418:f400:4af1 with SMTP id i21-20020a05600c355500b00418f4004af1mr763350wmq.38.1713449844499;
        Thu, 18 Apr 2024 07:17:24 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id i9-20020a05600c354900b004180c6a26b4sm6267510wmq.1.2024.04.18.07.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 07:17:24 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 18 Apr 2024 16:16:57 +0200
Subject: [PATCH v3 09/17] dt-bindings: display: mediatek: ovl: add
 compatible for MT8365 SoC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v3-9-53388f3ed34b@baylibre.com>
References: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
In-Reply-To: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Fabien Parent <fparent@baylibre.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=968; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=muTuIXTt3JZ+adeVzSiBV0lvPUUpPPEXnWM8MyjFIfI=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmIStje16i3Wmletd3SAhUG1Wug6cEanDayKjSNnvt
 7/PVI9SJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZiErYwAKCRArRkmdfjHURfoOD/
 9gj3zgWQpv4BHx8KjNy8JDlZ0g1G2rz8wn3r/LiH75+rS9z1En5UetLdAjaERRHZRZFnApgNefHFvm
 MDqQyGfUNJk8+/K61L1TliZKKv4e7NyIbin/nzyCU2ZvScW9eQxofpZTZO0SUHHLr6cJB9HmxfXjvq
 7EZukXjZ9rKSr7fyJEqe3yx+illLUJF/RSIQoYIU5LhqZYFAPY4JfzmCJIgePfDpRJseUCthCgPsvX
 7mFUINNRHx/ngBxT+lcn1n6DlCXSPEeDu+9iRU1p6tvedD1g4zkXuUIIX93hAyG3bNF+OkBZRXdcLa
 W8FtyrgbSrU3nJ8MwP9OvtHimV9XIJxNY98EmkrY/TvIBasg8Hn/8qDhYKBkjvlZl8PtcgbIIhSoL1
 oby07eKpk1xgzf8eYmyXTdOEZumXcxUvmo8Jnq0Zl44wARwmuXFwGwq0sB3BRaCFkAckSiMAlG2lfL
 cjqdMhKJyn8pTYNVlo+Cvls51wlCIvir1CdnwzQxlv+19DIxt49XPXFUqzto64HtBCleLlVYJElILG
 pXA/MBvVLLFjgWV2X1yGSMU5yKcfqCOxKSgyn5RsRHQkTYFAZTuvQ4AEocDh7tppX/ZrjKKjWCqaeA
 IIzKhwiqMfM6d9/X+qZpbWPzvVA5mUeGTrZihTQmAFz1xemNVViMYtiXHzlA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

Document the display Overlay on MT8365, which is compatible
with that of the MT8192.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index c471a181d125..d55611c7ce5e 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -44,6 +44,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8186-disp-ovl
+              - mediatek,mt8365-disp-ovl
           - const: mediatek,mt8192-disp-ovl
 
   reg:

-- 
2.25.1

