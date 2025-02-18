Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8D31EB5CA
	for <linux-clk@vger.kernel.org>; Tue, 18 Feb 2025 19:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739907045; cv=none; b=ju7RhQOy2A/Ga57hqfrEOfxSS6bY6iT/OoMz0bzKXE0o4lbP/uM44lSCb4TcPL66UTcN0Ic1QdJ4m0jaEF8J6XFsYOojO+bjz2sa1oH4/4aWnYx1hnq7/k8+F0/7rkNX2eWKFlngmDqcCM70rjcv8pxYHFdoae5p76EPmZuN8Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739907045; c=relaxed/simple;
	bh=KuxNBMyQg1p3DhiqEXTbWghcfYRAG9Z13aki2rWrd7s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lpIIKFx+wokgFcvAzHoUtD+fCBFzWUVmX7BRXtgTTaTlHu152nT92NI7rDRN/bFPR8dNJFlmfE0fizm51eCWe0mn5AlFR2fvM9UQsqj9AhT0f6n4DdSjn3HgZI8A2Pq3EiIgvTzL3VoikCv48/0sz6ahrOxuvD9iZ24n34Dwh1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=O5mVlsoo; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="O5mVlsoo"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5dee07e51aaso9062713a12.3
        for <linux-clk@vger.kernel.org>; Tue, 18 Feb 2025 11:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739907042; x=1740511842; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jIVOEcwBRHvFCUubXKAVFbf42uXe9rpQsZU+xYDLrc4=;
        b=O5mVlsooyXOLoB8yEC738C6QeFamgJV2d7ph9W2DYX3D6TSYpWEEL49MfxZf1KECZW
         OaT0DwUoaq6yOLsELevORbkSOdjfX3dJGA2T3U3vSGUvUckZEKXJhv4lPORe2KtTlot2
         B8uAbbOdw6wbUoQFHtN9jU2PzGbznWRihmAfYIz95dtyAVPBy1cfJZVuHiFD5+xGtL4m
         toDW1MwI3QbGuDOnxFD8vM4APMmMzMaqqo/ZMypRYpDLFmc1/St0JsiKuk1eVAtxpRQb
         xbiHHIaOuI/7ITmTf48UHElj1vjTTjvbjRijbq7cdWQzCmxIrWitw94UAztq1owH8Zf5
         Ejlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739907042; x=1740511842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jIVOEcwBRHvFCUubXKAVFbf42uXe9rpQsZU+xYDLrc4=;
        b=TL1GOMu7a/+IWLb3Qh7hTHanesdW4xJ7oBNd35/3OC6WNQxhiZwMs3HLyK5wp8SzMV
         SlNnzftQ5id+2Bbz1czwoxySo8tNk0Aa+eYDV/fegPCgDaSJk1kDJj0UQH7FfVX3xjag
         NLFWue609J7J9iwuSPOswe0K9TRKY2IEeKdR8Sjg9ThKfv3tvD6x1KKBF1XiGuFrslLw
         hEqsi5eORTN+PZrWdFzv1YObBMNhTQN3LWFbOEh8HO7fWJ7Zij5cj9nYlLpsupdLuNvG
         mP2glDKASJIshwBbrRqcHwLcABlF5FhGk6GvS4feB9HGI+R2f+Mc4xkcLRsb/klthZvH
         QH5A==
X-Forwarded-Encrypted: i=1; AJvYcCWspaGQUf99bOW8xqMgRDT7ziSbYe9PQY8s23OufiIPb1lX3iccz2Js4ou5wU/ScCCv0A/yN8dQVBk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTAqOV9rKowJUaYPCWMoUb5IKG00eBxwi9YInO7UEI8jSGNgbn
	Wqi3qNQ01wGsZ6bwnCKQa63FyhaFfthadWKLrZCxdEU+eMCZCbs2XIjpkYwbEDw=
X-Gm-Gg: ASbGncvByY7Th1TPNqH9EpGEQn1qCdECMSs3JltxQw8xenFNTr5v2iUYs2Sx0J/B+4J
	n2nNcrULreqqX5jYPjprG45Hz8GYIq0tNprQAPCBtO2aYfQYG56f6um0S/IKgznAhC6LgPtJZCf
	yUYFQsXbv3kQ8+Jgq/MKCwVplXtm6D6gXqmrXCp5PuaFcifPK6lKPa8Lm6HWpW5zWbMl3Ry6eFd
	ui6JTaRGPkYIRWibitlSgDNBTuRr66aR6xjgiTIrJAmE+Wqn+becwPE02YNfItVT5LPwJW6XIb0
	3qj1UW3tczGjg1tpNI/36W0mBdxa
X-Google-Smtp-Source: AGHT+IEaDlkCpMhhf2+mkMM5/OKTB8EFYwX98r88Q56bEpDWJea+Vb3RIYNYnlJJ1n7KeB3rfmfZsA==
X-Received: by 2002:a05:6402:13ce:b0:5e0:4a92:6b45 with SMTP id 4fb4d7f45d1cf-5e04a926cd7mr12713802a12.24.1739907042130;
        Tue, 18 Feb 2025 11:30:42 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:cbaf:af0:839d:fb4a])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1c3ce5sm9338985a12.17.2025.02.18.11.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 11:30:41 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 18 Feb 2025 20:29:48 +0100
Subject: [PATCH v4 3/8] drm/bridge: ti-sn65dsi86: use the auxiliary device
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-aux-device-create-helper-v4-3-c3d7dfdea2e6@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2486; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=KuxNBMyQg1p3DhiqEXTbWghcfYRAG9Z13aki2rWrd7s=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBntN/R9RdbIU/LlFZOD+5ye18+mV/JIVvHg59Fc
 N2QSzq7j3+JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ7Tf0QAKCRDm/A8cN/La
 hRT2D/9/+3m2izVFqHA9JNo66E9ppsPmq0HJSfSk8sVMTrgr6uyqpbKEpE6M6rPkiSX8366n+TD
 eCRkzB1L3/KYyK0Hb6qwNlKpqho+iKWAdXZV44t38LU4jLxy5upDUo9DvKN6ShNzojjGOTQLiUX
 0dP3xRvTlmnWLLr7cA75tOMTQzeMB4gX7ih7W7tsoc/5NyUZdYD1S6cQQMgskakyzZ4OSljy+1B
 urNGbxB+IGwSOEFGYqdRSUOC/bnk/G0Z8X05CINtg4TtcsyIBYA+vhcXrq8X7AXN+iukU8H7SLE
 XHUZl1EYgw1vcvyHPr0WaDPa6aP95wEZ8wLfGy/5xrWMdj9GFyWxILnDhvTipioT9+dSCjiwmRt
 w+sfi529OC67DfLep6PkVbY/1YyDl0NnfnGQjgIywgZ5lzCsOgmUtp3Yk5akbxJGwpC4qMyVH4Z
 VVqymYHalMIVWz01kgnbtplKww8u2ruISe4cz3VZDGxFEGf4oLHk+Ea9NwfdHyVGrOmjzKg2IPg
 ADyUwJ+eeALG/5zj8sK1Eo/GJ/P0kNStexXzQl5ui9MPUg8W4MvzbanzCj9sa8P7Hr/MZGIJ8iS
 ZKQjcj23BRTg2WVCsVgQlo7jSvCh8UYIz+56p2VIel0C3mW7uiq28FLbIqplEtAykScvdKcavs+
 l59DWERCtvYZUPg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The auxiliary device creation of this driver is simple enough to
use the available auxiliary device creation helper.

Use it and remove some boilerplate code.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 49 +++++------------------------------
 1 file changed, 7 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 205bd0fde4f8b3400caa8507092308e50eb172b7..38bd18b14887a27a716c8798f6284649c77a761b 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -457,23 +457,6 @@ static void ti_sn65dsi86_debugfs_init(struct ti_sn65dsi86 *pdata)
  * Auxiliary Devices (*not* AUX)
  */
 
-static void ti_sn65dsi86_uninit_aux(void *data)
-{
-	auxiliary_device_uninit(data);
-}
-
-static void ti_sn65dsi86_delete_aux(void *data)
-{
-	auxiliary_device_delete(data);
-}
-
-static void ti_sn65dsi86_aux_device_release(struct device *dev)
-{
-	struct auxiliary_device *aux = container_of(dev, struct auxiliary_device, dev);
-
-	kfree(aux);
-}
-
 static int ti_sn65dsi86_add_aux_device(struct ti_sn65dsi86 *pdata,
 				       struct auxiliary_device **aux_out,
 				       const char *name)
@@ -481,34 +464,16 @@ static int ti_sn65dsi86_add_aux_device(struct ti_sn65dsi86 *pdata,
 	struct device *dev = pdata->dev;
 	const struct i2c_client *client = to_i2c_client(dev);
 	struct auxiliary_device *aux;
-	int ret;
+	int id;
 
-	aux = kzalloc(sizeof(*aux), GFP_KERNEL);
+	id = (client->adapter->nr << 10) | client->addr;
+	aux = __devm_auxiliary_device_create(dev, KBUILD_MODNAME, name,
+					     NULL, id);
 	if (!aux)
-		return -ENOMEM;
-
-	aux->name = name;
-	aux->id = (client->adapter->nr << 10) | client->addr;
-	aux->dev.parent = dev;
-	aux->dev.release = ti_sn65dsi86_aux_device_release;
-	device_set_of_node_from_dev(&aux->dev, dev);
-	ret = auxiliary_device_init(aux);
-	if (ret) {
-		kfree(aux);
-		return ret;
-	}
-	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_uninit_aux, aux);
-	if (ret)
-		return ret;
-
-	ret = auxiliary_device_add(aux);
-	if (ret)
-		return ret;
-	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_delete_aux, aux);
-	if (!ret)
-		*aux_out = aux;
+		return -ENODEV;
 
-	return ret;
+	*aux_out = aux;
+	return 0;
 }
 
 /* -----------------------------------------------------------------------------

-- 
2.47.2

