Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDEB16C6A1
	for <linux-clk@vger.kernel.org>; Thu, 18 Apr 2024 14:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713449839; cv=none; b=ZTBeYLl6F16fQP8kTIRk7XDkwXo3++1Ibxac6/F3opdx/tWD0dsgP/W8Iy6WOP/LjyEvCkTYdYpluz//9U1b7YMqT9u8RicMXFs+86gwq1Yz0q8AecXLCUcDvtxnZmx6HhunKZ4qegaAHKTPCcrEONIG1W2ey8Ji4Bf/EoaxANU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713449839; c=relaxed/simple;
	bh=YXHTuzshsIEn0rNsq24IlHvsgB1HSvJsHYliNaoUyEM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O4ZbvNhPTSv5mqULWb7EekAKGFRHY1Nft0zD5ymzfdsbT9d62mqNnAHTzZDEUfEL9A52z2nF7vdQy0hk63A3W97h9UijABqXLfiCcbYzB4O4X5fhcWdJtc2oIgn8FykbPZ42Bi2DdmYbizq9EdQh5IKs0MoIszE0nJVmmr2F9vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=vCmiDwVm; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vCmiDwVm"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-418e4cd1ffaso5420355e9.1
        for <linux-clk@vger.kernel.org>; Thu, 18 Apr 2024 07:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713449834; x=1714054634; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dyegayfB1y9965dzTGr/j6svW4ieRpTfgrhf50HfpFk=;
        b=vCmiDwVmG4/KlNXOwH3d49vfrVhkT2dlu+I8NTSxrIaz3v3cB+77MBDpGbUgz8Xa0X
         jKrpmLIByW0CuHyMuwXXMzex9ZmpH+RNtLpwOEsDv4drVQz1FQDVHmpFAEEMtc4Nog4s
         Al8JaRbEzhSzjGpB/x6W+unhLrmhzU4ysGkD7rLK9E/6+L6e3C5LkUwwIb7a/cJ1pRqb
         /gDgD6QKpUjv70Z9ftxIKbyRgwWrvuEPPOvRc2WW6WMtZumQuhWRvTOqddzr+ONFTVC4
         j0e8gvBJjmy4RlbWpkDTUGyGS2se7H84Vn3EdIbT+TbXA2V/ocZBKdqwXQeEZiNfca8j
         ccZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713449834; x=1714054634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dyegayfB1y9965dzTGr/j6svW4ieRpTfgrhf50HfpFk=;
        b=VfXOQn0609Yl6ez8ls1AgPBJoxHcmPaaRKrW4ydXk+GPb3n7PHoRhFmybIaDpdicgH
         QZ6moEefo/rPheblRZSkioN4zxOxtmk0AJfeC1afD5aH5BYgClR1/4WgEyZRxVTiH6kr
         3r2g/AvHdvisIqvfQbN5+L/wYTPH8xFax0UdDx53khz/7EpTGpGQQvMSgf1o3eA0DxiW
         jfydlwYe9S+C9TaLNsOijAxO1zEJeO8g8qF8aqXvCjeQ2+vomX9MLDVI9xNnaAojWAIY
         CH3b+3JfFpqFu/6e3OLQMgir7CV1JCy3O//Wco1XTiQGqh4+qkqfmMfOuZ6eareyaagI
         JUng==
X-Forwarded-Encrypted: i=1; AJvYcCVYZZm8WnlaCQBGzkMh9eq48UeXQbt85pbFbafH5F9sPeCFMQub6Dr5IX/abThb5+RObSexPEn9Rgg3EztgkNh/zjethkaepyb5
X-Gm-Message-State: AOJu0Yw4g/GmpUXZcstjx7My0EyJp0Uu0M0ZwUWzmlDSXCMf4W3u2XY3
	QuTeQt+D6DrP0sWpSFetAfxphf01qTEKtUF0AliwMR0NKxd1tdcgecZyL+8eeKA=
X-Google-Smtp-Source: AGHT+IEsM9iGSZG6iMHAcf9KGu692TY/H0uIe2sVr5xtzSaWVovohbIcJe5VQO0JAYzGjB4DDgOfag==
X-Received: by 2002:a05:600c:a12:b0:415:46be:622f with SMTP id z18-20020a05600c0a1200b0041546be622fmr2167234wmp.14.1713449833987;
        Thu, 18 Apr 2024 07:17:13 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id i9-20020a05600c354900b004180c6a26b4sm6267510wmq.1.2024.04.18.07.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 07:17:13 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 18 Apr 2024 16:16:51 +0200
Subject: [PATCH v3 03/17] dt-bindings: display: mediatek: color: add
 compatible for MT8365 SoC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v3-3-53388f3ed34b@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1050; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=YXHTuzshsIEn0rNsq24IlHvsgB1HSvJsHYliNaoUyEM=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmIStiBs53eAY3DeO13tdL6QI+Znbz5FwIwD/YoB8q
 OCNZARyJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZiErYgAKCRArRkmdfjHURTRxD/
 4gQQKtDeVST7qS57VlXtgagtFc35imlFj4VzD0seKTLL22adDD+Ip+d+eb0gMs01I7sN8dXFEh5bvg
 YHauScLtPi02KVPxokKXYmQlf2Hnia3Ac4U2CIqQn9qx7ESmnekahSlsMSi/ZDGNJe2E3jC0Nouumr
 2GoLrM+cEvvITmIQGxQ0qBYTBFfozVIOnREKwm6q5u1hFe4qm93B8LmboqwV7vnhREXHIpV6jbrNM7
 fBILeMgLC9B2iVowiB85EkDYAFkSVRDwLIlPrxWyV4vzmBJiMqKrUxxiZBucBBnDwuEMCCEk45jicD
 gpt8ZNl2Su+SQ0eZ0II7t2SQAwq/QU3gqqk9bQ0QgIGTZhXXHPd77oOQN79mBqp+Bv1g9kmE0njfQ2
 PnxBPb54W6L3g8wPEKq2rpY5FXHfmX8jG6aegE+zbORBnFCapLwB//4rRsRwgT2mOsuIQHZPmYjdfT
 9PIwunu5UQr3olFVkGjxPcUpa39bUs5PQzRDsAK3Q0eqixnGSaPsfYJUPUiCx2JjN+TLjVdhT7nIHh
 6z83C+zeIX6GFmoqhiGvaA9OtHzgux+kntZFd+kage5z3q2BASkPXoQlxIJpeuNJoMVsgU4k6FmBRY
 j9+0Orj4mpUdqNvzLk5YXv6L+BccO9fYqL9Hc979dnUF2953s1vxf74BTmKw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

Document the display Color on MT8365, which is compatible
with that of the MT8173.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
index b886ca0d89ea..7df786bbad20 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
@@ -40,6 +40,7 @@ properties:
               - mediatek,mt8188-disp-color
               - mediatek,mt8192-disp-color
               - mediatek,mt8195-disp-color
+              - mediatek,mt8365-disp-color
           - const: mediatek,mt8173-disp-color
   reg:
     maxItems: 1

-- 
2.25.1

