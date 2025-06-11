Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5341D2836A0
	for <linux-clk@vger.kernel.org>; Wed, 11 Jun 2025 12:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749646462; cv=none; b=KTnXNlsyEDcTrTehCpAg6ifMs3L4QJVKNyHDOxEw3L8Q//OBDUsEw9iOnu5orSdR8B7pR8c/WHSLAf7X0reCJJkFiuckQ59iTjFxDPWvqzGKegXXV81CxFMI3A8eT4rT8N1ndG0rH3eLsy2z13+SAVjcjriIEnzmtX1flLJ8WSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749646462; c=relaxed/simple;
	bh=ojLJe2tP2Vz209foMJ0Lu2S+h70I7DXs1+HhM6dEcXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QfcZ0Cih/NU8RtXf+XkjGNS6M4LnTruLnA+3Ffcoel0J7OaPUgPztqh/KKOBcgh1wEGPXqmR4yf61Qf7PKOEXqiCw2bt/octFpYoNpD3in7eFPXmJQOZu2zQKXzM2S5ftUti/R/i2D1d3CS/R5dBCw0tSy8zbrioiVGWU5JOdNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=yaSyfnk7; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="yaSyfnk7"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso3056806f8f.2
        for <linux-clk@vger.kernel.org>; Wed, 11 Jun 2025 05:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749646458; x=1750251258; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HFpwfaBk9Zi/05ZHLg2kQwpAQr276eZe2gpjdnyEXsw=;
        b=yaSyfnk7IcLtQf6x/rBb729BUr+rJVcN0iujnb4SaNdwMdoTUnC7uuH8keqXn5b1wS
         affppTOMaHLH/yzIYDjkF3cz9oeBLAPy5bOKyW/siNR/wB8V1SU1pKuYHXMhYuK+EBGj
         8SwP8lCE27gs40RmLPKucDbURwbqVzgQCNHB5toc56CS7NK+iq2tt9XWeqsAxuNyFY+v
         YIapGvWlO7cmcR7X5/BsIb9PWyeLNPqc/bOGLWLDZwM/tvMg7Pw+tEXENDPr0XFjRkUH
         6m4hDFAtWY3dYYXbJoMbMxTOdEbVWwqj0imf+1M3hY5b5NgLRhVtIuDiJjDchNj62KVG
         JuEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646458; x=1750251258;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HFpwfaBk9Zi/05ZHLg2kQwpAQr276eZe2gpjdnyEXsw=;
        b=tC6zPmG7Zm2RfPLFXxvXEZQVHm7OXIftnR7LIDlGA0487Xk9OJxZpDNE1V6HaCadTm
         Rp6Nt6ckB/hCVMxGxrjdte9BDom1lK0p29RD5AlNDXXeqR3w1F53+9+iEkcSxBs3B+Ad
         GCkFoudvDk+de2sRYeEIWcdCOhX7nayESNSC4kaG/CypSrZ4VyXpUs7mzqaYSynH7QRu
         H776ZXIbOp+LTZkOGD9KUsBJ/MuhdLyOzIfsDeYQR0JmPrPXFfSlZHDu/0hXtLNqNLGh
         xB1Zyu759agNEsKnP0+q5K2AJptEEsxK2rzmbKTgTz9+KbFa681Xtroh5uRGrCqwegWi
         k94A==
X-Forwarded-Encrypted: i=1; AJvYcCVG0RGPmAQDKbcISK0Ok2y5IeHPl6X88NGFEpkhC6FgaN+3O08U4KlFXIihgXQqhvSRiBFQ74jlCVk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywen0dqVmDYI9SBo2pkrbO+X5WxLcievTBCPgqWGsbHIkLA2E3X
	MNxTjkFPaqMIfoxkTs4HyZMZECpGXuSnBNDALSGQXNwFkDRUmFLoqVhvn+WFhKWOmpw=
X-Gm-Gg: ASbGncs/FMfgF0FqHdp0zZj44pBGs4QuV5vfU4gJ6Q0Z3jfWBsTVwG4Li4OaR0/pR1e
	ae1QY7jy8JC2mmpgjA0jZ607iApOfqNuQoBDnmDrcNmK8+C4qu8OtMdkZFMYUEus0/yCN+3dYvo
	jz6GeOfDHKr0wWfbGucYfz0q2+jHJ2rCTal+qTaE1gwszBp3/13aKvh93PC/uwLmi9Y1RIw+UuL
	4D7jXG+QhN3zR9trowLS/oS4UbEzDihtyyDWei/XX9lZaxsNxGxI/eGNnOpjFls4hwXFQqn8R1L
	6YrMbfbWwHj5lPTvGv+owbviu+ua6dshO4uj6ymC/PAsYsOjCVaWXN0HN5DkJvKAeWWh7ROWlEm
	AzkhCZolIADQ=
X-Google-Smtp-Source: AGHT+IGIlwjD38JS//yUBEcvXlmN2huAOqXtp/YJa3YDrL38fHSYMCV1TEIKntX391ju7QlDra2xEA==
X-Received: by 2002:a05:6000:2586:b0:3a4:d939:62f8 with SMTP id ffacd0b85a97d-3a5586cb2a6mr2093860f8f.32.1749646457670;
        Wed, 11 Jun 2025 05:54:17 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:8ef3:a82f:ccaa:91b5])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a53245275esm15225486f8f.76.2025.06.11.05.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 05:54:17 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 11 Jun 2025 14:53:58 +0200
Subject: [PATCH 3/4] clk: clk-imx8mp-audiomix: use the auxiliary device
 creation helper
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-clk-aux-v1-3-fb6575ed86a7@baylibre.com>
References: <20250611-clk-aux-v1-0-fb6575ed86a7@baylibre.com>
In-Reply-To: <20250611-clk-aux-v1-0-fb6575ed86a7@baylibre.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2798; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=ojLJe2tP2Vz209foMJ0Lu2S+h70I7DXs1+HhM6dEcXA=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoSXx0XZWnNZ1AgTV5+LghlbWYLZmdaCeetdFuI
 qp+F7j2WVaJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaEl8dAAKCRDm/A8cN/La
 hb16D/wP9KqqBEL7B0U8B0WK3yPhG6P25gSKeMgOS5rbf0shnJGcVbdMZrh5wm9fTchQpnEmZCz
 D2n4bKvAkLeTU4ydkqcJ269ydY7GRX313GINYYGI8Vg+zmRD8n52Kb7Stu2lxt/0RX81QLy/2vE
 UdgZmzXLrQ2p7vQFa+B/AAU02dJwd0jzeD6TTYstyr7Vt22QGmMBtRTl8MUiRbzFn0UTGfsNFxN
 wLGmBduWVn0u+WPHyEatcPAogHrnl78ggZsxkNmDNlLHJVlsjCYMKbOq4m2XV4NacsNVmG5G8dp
 GfaM8mfrSlogZpEL5Zbhz7PoJCcUjHf+NcnI35LMc53E30vHuphLQjdsUzJuDn3jsUO4FvCyUfA
 lom1Lz7f5BY4l3cojZXX+fHtCnp3Rjx736PDJxmvmXUNQM48ymIwr1jNh9XzYHP/6ZdnaTFXPT0
 iLNQEC7PVi55LOyqA3Qh0Q4OTu0SXEL0Up0aCmi9hwUbtnsn8Hcnl2Ici1abYub+Us8WzOQVJT1
 AeckT54HKRMGKNqpj/OQ4rMW8woe2BBCfkRgubAj13myhy1nI05lTUzV3LAtolCUdR3iSGT9htf
 iTexlX/QOC4yKNXuJoKwrB9N2TTIu2a9Jj0O/jNY3tem+RlQF7wWF88v6oSJ0sGAoHiCXLPtX8D
 rA4jtMmEVS0/N7w==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The auxiliary device creation of this driver is simple enough to
use the available auxiliary device creation helper.

Use it and remove some boilerplate code.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/imx/clk-imx8mp-audiomix.c | 49 ++++++-----------------------------
 1 file changed, 8 insertions(+), 41 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-imx8mp-audiomix.c
index 775f62dddb11d8cfd17a4ebf7a677ef399c5e617..765fb1f5bd4fa2b039d7414abd89471438ee41dd 100644
--- a/drivers/clk/imx/clk-imx8mp-audiomix.c
+++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
@@ -230,61 +230,28 @@ struct clk_imx8mp_audiomix_priv {
 
 #if IS_ENABLED(CONFIG_RESET_CONTROLLER)
 
-static void clk_imx8mp_audiomix_reset_unregister_adev(void *_adev)
+static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev)
 {
-	struct auxiliary_device *adev = _adev;
-
-	auxiliary_device_delete(adev);
-	auxiliary_device_uninit(adev);
-}
-
-static void clk_imx8mp_audiomix_reset_adev_release(struct device *dev)
-{
-	struct auxiliary_device *adev = to_auxiliary_dev(dev);
-
-	kfree(adev);
-}
-
-static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev,
-							 struct clk_imx8mp_audiomix_priv *priv)
-{
-	struct auxiliary_device *adev __free(kfree) = NULL;
-	int ret;
+	struct auxiliary_device *adev;
 
 	if (!of_property_present(dev->of_node, "#reset-cells"))
 		return 0;
 
-	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
+	adev = devm_auxiliary_device_create(dev, "reset", NULL);
 	if (!adev)
-		return -ENOMEM;
-
-	adev->name = "reset";
-	adev->dev.parent = dev;
-	adev->dev.release = clk_imx8mp_audiomix_reset_adev_release;
-
-	ret = auxiliary_device_init(adev);
-	if (ret)
-		return ret;
+		return -ENODEV;
 
-	ret = auxiliary_device_add(adev);
-	if (ret) {
-		auxiliary_device_uninit(adev);
-		return ret;
-	}
-
-	return devm_add_action_or_reset(dev, clk_imx8mp_audiomix_reset_unregister_adev,
-					no_free_ptr(adev));
+	return 0;
 }
 
 #else /* !CONFIG_RESET_CONTROLLER */
 
-static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev,
-							 struct clk_imx8mp_audiomix_priv *priv)
+static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev)
 {
 	return 0;
 }
 
-#endif /* !CONFIG_RESET_CONTROLLER */
+#endif
 
 static void clk_imx8mp_audiomix_save_restore(struct device *dev, bool save)
 {
@@ -408,7 +375,7 @@ static int clk_imx8mp_audiomix_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_clk_register;
 
-	ret = clk_imx8mp_audiomix_reset_controller_register(dev, priv);
+	ret = clk_imx8mp_audiomix_reset_controller_register(dev);
 	if (ret)
 		goto err_clk_register;
 

-- 
2.47.2

