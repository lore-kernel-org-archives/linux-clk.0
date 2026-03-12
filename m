Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5296E31A053
	for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 21:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773351313; cv=none; b=Gkd1Jj75WJXdLvFsTxGyOsgVHiMtEWDbCtx5vAmCiGGcHl/5j6kxGOxnKSiDMbmNfcWHqBAdb4A5WZkXWw22rcn0BfTKdEHFBBKzoumgb44s/LrQ6vLR6M8yr6KKDV6iDZokQ3TbX0bMaQ/yV1qsutdGW8CwfndAlrTQIdMQSy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773351313; c=relaxed/simple;
	bh=QYf1172liej2XL7isBXvEMxF0U/ApewKMBtjMqI+t5c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bk1bez6owX8VH+o8CknDfA5OiWB2l275WxynMyewk49X6tQN0qoN+V8C4Co7OrxXEzLfr7CqU2AGgvh9Tm4dTN7atxSZfZ6EEAHsMuCf2RRY94MzVlJ5i3xDcAkwf6sacQq6b9R9oxt6baPq7Plki05nIM1488jEegWvyR0CHqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=gLmawbAp; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="gLmawbAp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Oqd8HZi+HxaOGflrTeM1m3G5zTaoxIj1mUEYV1MWONo=; b=gLmawbApk198YsomGmtRS2eegN
	1yvUTsBhRFUFXwmXuFJ84kleptxFbHTGZPE65jLpCO73tkvlsYoVa9OyiERFga8LhHR6Rs6A7wAxN
	9D5ZSx/arcpcEccIseFS1OEVeM59nkLpBKaf8PKD6qoMK/GjavtmeyLjfjLhA7h0a76wueTyNvke9
	zuzSvhDyIYSAR3i8FrL3AsqM19aw20mQ74yKF3bp3VAAkz1mwPrT4sYcCkzWjVTFEE6FvzTARy4/X
	sti0BCCkew+T+jo8+FW+E+TUQhrPv97iV4t4+z/yvNDUMLqnFAXF1QEgU6wo0ojKidl/819NFUk2l
	3+3vFCUA==;
Received: from [189.7.87.203] (helo=[10.0.0.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1w0ngN-00ElyQ-J8; Thu, 12 Mar 2026 22:35:03 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Thu, 12 Mar 2026 18:34:25 -0300
Subject: [PATCH v7 3/5] drm/v3d: Use
 devm_reset_control_get_optional_exclusive()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260312-v3d-power-management-v7-3-9f006a1d4c55@igalia.com>
References: <20260312-v3d-power-management-v7-0-9f006a1d4c55@igalia.com>
In-Reply-To: <20260312-v3d-power-management-v7-0-9f006a1d4c55@igalia.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>, 
 Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Chema Casanova <jmcasanova@igalia.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 kernel-dev@igalia.com, =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1388; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=QYf1172liej2XL7isBXvEMxF0U/ApewKMBtjMqI+t5c=;
 b=owEBbQGS/pANAwAKAT/zDop2iPqqAcsmYgBpszFrXxuz/KAdsgCKDjMmNPTiUXkkcIwBb1sPz
 /40yrDKDbqJATMEAAEKAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCabMxawAKCRA/8w6Kdoj6
 qu8lB/wJD/H82jpm00SZA2LZnwkPJ0N3aci08jeC7+nJy9BKCICdLlOJ3XnPQrfb2b9R+j6TlC2
 3ii+cFuL9ea19at2Or2WivC48m16XySXqoZ1+XdcWqzX/8mwd41s9i1fjpJjOPutDgebcBHtpVr
 8MnN3t8juosXXJE/J60YM3oAfBV3Xb5u1TXRP226nMp2D/4J9D1JVs/D70COiws2ADaQXqEzbnT
 CqqaSUOcTh6ZLXym9kKemhGpQ0cX5PqNXml6Bhg+9WaW/XBpwlhLPwsE+lAOzvt39y6JGUbTnYa
 37xBmqs3U2b3BmKOv/YXRf5clmbGUFdIXccIpfDgC1Io1y0V
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA

Simplify optional reset handling by using the function
devm_reset_control_get_optional_exclusive().

Reviewed-by: Melissa Wen <mwen@igalia.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index dd60acdf52c2b2e44c6150f11678b291ab1f6df4..153eb1c6f535de8bda83b58fad8acb2dc612f677 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -398,18 +398,17 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 
 	v3d_perfmon_init(v3d);
 
-	v3d->reset = devm_reset_control_get_exclusive(dev, NULL);
+	v3d->reset = devm_reset_control_get_optional_exclusive(dev, NULL);
 	if (IS_ERR(v3d->reset)) {
-		ret = PTR_ERR(v3d->reset);
+		ret = dev_err_probe(dev, PTR_ERR(v3d->reset),
+				    "Failed to get reset control\n");
+		goto clk_disable;
+	}
 
-		if (ret == -EPROBE_DEFER)
-			goto clk_disable;
-
-		v3d->reset = NULL;
+	if (!v3d->reset) {
 		ret = map_regs(v3d, &v3d->bridge_regs, "bridge");
 		if (ret) {
-			dev_err(dev,
-				"Failed to get reset control or bridge regs\n");
+			dev_err(dev, "Failed to get bridge registers\n");
 			goto clk_disable;
 		}
 	}

-- 
2.53.0

