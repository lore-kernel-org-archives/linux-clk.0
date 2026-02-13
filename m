Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6317427B340
	for <linux-clk@vger.kernel.org>; Fri, 13 Feb 2026 18:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771008843; cv=none; b=HqNjTh0qI357UWxL+oEBgQ+5FD4d+LIQVs4bGXlNBTqbDXLjW7so56I2/PSenA7QL0Tn2xBUsbV1nkTi5WB5Xf9T5RMXhs+cdpxa904ynFjpvP/l/hNZbj9MDBqIDA1+AdUS7n4iMAUf90j0aeDOg28C54O4VkNZR5kz+WGIDvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771008843; c=relaxed/simple;
	bh=zKvkw8v9FF0PR1wEseEBbs4PTvLJNPiF9dMfrp3ZWEM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J3brIemQB72qNdCmMYh3ldFpd7fxvyzEQ1/nf5OPWEgpqLM8Kbn5oI+P0wM2iAECWwbE+I7P9KoXAUaZ+STj9VaTFucdoLV48FFfOFQ8MrVzsdsNMe4NZWXnDqdjRLSA41a71FIpn0aRWV+mwn2c9ge5xAFpyTE07R6Smazs8tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=JmFeUejY; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="JmFeUejY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GplsYPFeQZhA8hmi85G1RnmgDSDJoeTllgjYVKEvqno=; b=JmFeUejYEq9e/6svlqtvJe4RWK
	T+fcKUc8vF6kGHKeOw962uBL4YZYWa/1U7MTeQmhMwE3whr0YCg6PrrMwRM6fUsEWd7soW0d+pN2A
	/DyL1e9iVNv6lti0tEDqw/NyIIHb3RkqfaX8GQba/NsRstDNobgqJT/Rxg77Fg6vwHCFgGNG+HKeG
	XmKzZNO7sW5dGAnlLwvwJjdF2Z4KrguJYqreRfRwHV6h3Amo2PnnGGBKoukrpphGCPbGOG3Hqqmig
	GNoVYdSLZEevoqYkh5mA0eE9/2iStHZL1XO1GDkQSSxj//3sD0719rJWRJS1e7GgbqlpddvSjTL56
	xtr6ybtA==;
Received: from [187.36.210.68] (helo=janis.local)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1vqyIe-000Sqv-0L; Fri, 13 Feb 2026 19:53:56 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Fri, 13 Feb 2026 15:52:58 -0300
Subject: [PATCH v5 5/7] drm/v3d: Use
 devm_reset_control_get_optional_exclusive()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260213-v3d-power-management-v5-5-7a8b381eb379@igalia.com>
References: <20260213-v3d-power-management-v5-0-7a8b381eb379@igalia.com>
In-Reply-To: <20260213-v3d-power-management-v5-0-7a8b381eb379@igalia.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>, 
 Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Chema Casanova <jmcasanova@igalia.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 kernel-dev@igalia.com, =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1335; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=zKvkw8v9FF0PR1wEseEBbs4PTvLJNPiF9dMfrp3ZWEM=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBpj3Mn+qB06zp9DGb6x5J4Kds9vT+cDphWf8Bew
 0z22C7HzuGJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaY9zJwAKCRA/8w6Kdoj6
 qhy2B/kBRtbORqvBcX5iwJZQvvghWPWimS5zTuZz99y2/ZMkwjIZBcSRH6r07OrIw2NMelKpQiP
 1iFhXTOZ2j2mgGvDlTh/HuV7DFVjaSu1nHzjJsow3kvt16P6ddbAl+pICIR/bQ4hzpCIbpBbqOq
 viXYViQW3hLMt1lx8GGKtFRnO2ZE1GhQ/ikhii5zWVh6vZvC4n1rLK2FkZkGVpngYnvY7H/dGHb
 i3ty+ax/A8TdMnvSbSoVVvG0YvYtJRS4XMRnkU56sUxA1nI7OsyU9paQnzO8md4q1eyGXw2v5Wa
 pLir2X9An1/1blbEkUAHrff+B2XXfhPJoR0yLFwOH82mY7iM
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA

Simplify optional reset handling by using the function
devm_reset_control_get_optional_exclusive().

Reviewed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 8de4f151a5c02cbf970e72933d1a275968088357..257f2fefbdb6f8736411de8965919f1728844a6a 100644
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
2.52.0

