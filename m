Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6A01EFFA7
	for <linux-clk@vger.kernel.org>; Tue, 18 Feb 2025 19:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739907056; cv=none; b=HKs4VvDaftgLEal4gSIlonkNBYuzCmaP1dmu7mUuHnfpyHygNMm/z4SOEYtHdGx1TlVQcPulyqnCbsqC691077+tmpy77d1h32Y7NBQWTLYxD9k3t+Rm+1KZ23RcpDnkXkWqa3fAFswN1GX7p1NLR17mWToiFgh/YD9/L0Aynis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739907056; c=relaxed/simple;
	bh=ma6EXu0EtX44zpd7hqJ6kC+ikAUaUrZisGtu8UlCCLk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FgMzZuxPze2KN3fluAFukaf0kV9R/NTHl85HHJ9ckqgUl6wSC+nTiMWl/peHEJ+qqr23Vj5OWIrx4wz9ZBGSxEHgE7TnZnPlEj3sMINbh2HGsn78FHTyR+9mXWfEFUqrEzdqXt0J+DO3xobq8fi/0tfTLIFZwLbsltp42iEIaFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=G8YH15ZZ; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="G8YH15ZZ"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5dedae49c63so1164392a12.0
        for <linux-clk@vger.kernel.org>; Tue, 18 Feb 2025 11:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739907053; x=1740511853; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rf7170qq7Y3fQ7uVc37Bv/W29DRyxfOGfDaN3M72oXs=;
        b=G8YH15ZZBqaCVp4firJutU6x52xqffbjzYDWrvpB7HXF+3PDOz51BXM7sSlHmHBTmt
         USTJctCjI2t57aHPWma9ZDed2ZkJfRov8zqjZL2UcU/qpuVlPg/bPVwJbBRwAc9XLiq1
         zouj0M5iDyrKWNyqr2GzCA14Ktu8ayYFflXN/qOdwxMOc373XoX8FhyCTYVsAarpkYrs
         nah1gRH4C6wWSHXUmsqfyZKtCfs6YxKrwIM89iDDwSX9/V9/MAkrKa7y5X/Afp6x0BpR
         KJjc10fYX5LMf7Ba0f6F8R9poCjzGRM3iLOchOVnJ9FRn/xCcJzkkWyT2GA7FYDfMaz9
         zZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739907053; x=1740511853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rf7170qq7Y3fQ7uVc37Bv/W29DRyxfOGfDaN3M72oXs=;
        b=OFf8Mh1Ia45LzfgrBlAccHmVOO7L+fi10Mr+5Z1Eo097753kibyTMfp/AGlDN6XNJ5
         J53+VzeA6XAaEsrvk/wtjs+G55qjciQX98fSxkf60vXmxBWizdvYwzeHinntpaOgt2hD
         J5nvylyRViYEy2vXK8LpZpaNnFCOM3mVMMZTlOEa+JrPh33+/H/BFjXTHFW00hVppZdU
         CJ3sHhl4/zbu05nj3SOQT/MUut1cyWIEL5WnX6tytYBcd4eEZNPfXNjUpIAPqHZ+GbtF
         TdW9OAcDSRD7DwPX0pchsLw5L8OsPMkJxSITDu0h/DPx5ZaPkqmwsOmDgLh41qm2+KOq
         KaEw==
X-Forwarded-Encrypted: i=1; AJvYcCVJaxGqSkP3nqjztpdnltAHqyx2eU/J87cv3kIItEisOdd+Wbcyd660mz0m1rGKjlGF+DIhcO/AlyA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQMYBUZNxfVs1f9TiYTk4S4pVDQZg6yNXGJMfEmFlijPXhZBNV
	QFcPPeUs2vTSgwmoHZpmGzS8icitQRymxXu7N7HzksqhANHiHM0kvzmEQke33HI=
X-Gm-Gg: ASbGncue/6LsI1hK5mL7JR+T6f8K5yoZT4lrdhgvco6CUG7CBQxkS756/Z/lLp0I+GA
	l4zcdKSNOebP9pE7h6rkZGHrrse4Gyo6+3Yb9rAH9kzuOmfw09IOiE3p+6i/kf+fLk/QDQ3sNIX
	sIhFoUDLdmR35LMFn/dQBAsRNGpuTpjqjQcSpAP05uC7ttCukx7AMzHXsMuofGug74uuZNA6afg
	dFRsewDvelX8FFnl7eiEtfyvy2nMmm0BVE4H7ViYeeeeAAFcD95NK59fihZIF2ALnr8RN3c6CJJ
	KKgmVTXZNOuwlAKK/yjzDU3MTbnY
X-Google-Smtp-Source: AGHT+IHpHIYxB4dVNZ3LyzCs91SySOLLXWjws+ryoYBHtygC8Wxu6MzjUCPyJSfIFH4a8C/yd6uRcA==
X-Received: by 2002:a05:6402:51cb:b0:5e0:82a0:50dd with SMTP id 4fb4d7f45d1cf-5e082a05797mr2098352a12.27.1739907052712;
        Tue, 18 Feb 2025 11:30:52 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:cbaf:af0:839d:fb4a])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1c3ce5sm9338985a12.17.2025.02.18.11.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 11:30:52 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 18 Feb 2025 20:29:52 +0100
Subject: [PATCH v4 7/8] clk: clk-imx8mp-audiomix: use the auxiliary device
 creation helper
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-aux-device-create-helper-v4-7-c3d7dfdea2e6@baylibre.com>
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
In-Reply-To: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Danilo Krummrich <dakr@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Douglas Anderson <dianders@chromium.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2798; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=ma6EXu0EtX44zpd7hqJ6kC+ikAUaUrZisGtu8UlCCLk=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBntN/VIh7m+Cn8Gx+R/npCxGvJH4NCUefaxFlhn
 gu0IqWnjBiJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ7Tf1QAKCRDm/A8cN/La
 hYVyD/90MBlzLttiipSPEDV3EdUFxIRifW8CB/ozE3YsCyj2v/DltrmPk563MQ5pa8itqfo5hkU
 4A8uKNAUHs14NclRLizOGn6E2OBZW/tn4ElVBMO65CtqbYyOtqBnsWDcaS758f/TBsB/KzwIRqe
 u/MdB86COXZ7E0Yx33885Shus9RahC6bGdvoBax0KzyWXB28Zfs56Dpy4haxed1jB0YzQnGrtWx
 pZ6HQxrdNKrS1V4FWGSzPl5f1oazL81zZnYpSBz200B7CNxKcAEEAMCMMIANqSAhDDxXaynOTSp
 WYqRQirSRpdrRSgogove/vJqlyJQEvkEoP08xVSBRUH0k8jPl8AyeIy1RrwvPiTPgoekvpMSb+8
 DMkOah/WLuym+3gJnOq9dtIg+X/ZPE7iPKreaC4TIHkCRQ4enqoO0BaYy2G/W5t+uDGBzxhsqFH
 CpQYATnH9X7aGhTIgcEatDE5NENzgl26jip0Dl2U6fTkcbRiYzRHwqdqqqlwsbZ6l9EooZL+6f4
 5kPCwJXOzUKfvTD8tNkD/GUpx8I1zc3pQ7R7KzzLxiiOG6oyQqm+HLCl/Bzr+afc+t51LbakoAm
 t6Qd2Q3tmZH1iA0sds5miFLH45OdqHtXeqrKPzPI+3W8oH37DOBtnvGssDoHjB8HiBJ1Bx4Xdg9
 OxcTaNJ3Vo552uA==
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
index c409fc7e061869988f83c7df3ef7860500426323..fa15a5ed59e304687317b5a23c845a0588890bee 100644
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

