Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA9D1FDE33
	for <linux-clk@vger.kernel.org>; Thu, 31 Jul 2025 21:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753996011; cv=none; b=Az7N72yOE9Y7BdgtVl0aR+O4ltaASvWuu4tc8nOD4l+ZvdjFm8yyzZv1BvmUxKkN+zqCnT4Dv2LV8sSwlxXtnoqSLfg3L1Lsnl5oJirpwkFceQYBSd2LxRtFIP4Fcl56vdgvEjpiP1xOoEvjsh6qYNYfeSgCyCXFyFMnEh7DCHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753996011; c=relaxed/simple;
	bh=MZMxBFaR5tSldwV37LvL6QpQj+LGMlxnSBg6yt8hA2c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GIox2CWdPWQRNDUJP2RUArmU9Csg6CWQn2KO+EUcTgevVv4KTZ4SciN5WjbtPN+1+oFNgt8UY9FhHVyYGkjNYMfPZ9On291mxGc9Ft/4jbzIk0+hMkckq1LyjkkyktbZBGxGsAIlSMrO7r0C9wEoWYoGqw1phk/W6j/nJJ03Ki8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=YS1nL0oJ; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="YS1nL0oJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8GhUDeTLSwNjxecym9jvvl8qS8LaxkEHbs2c8gKKa24=; b=YS1nL0oJVh0cvWyxm8UyXWoXx1
	xnSo/6a57JxK1C8CHfndF1U3Zrtnd4nl8JGPTTUMZDW3FyeneV3bzD3EuudJq3kDY5MyVRapJJ3Tk
	kdj28lS4baHyX7rd0CL5SY6a4NqUs0cyGsW6HwRBqNSm/fVr8l/PgRiOxmfAv4BTAG37rWxXmb1zn
	x1a2aaehBIKECiTXQD7PMwOkWGpUDuQhk7IlrL/K1kubt2QhQ2a9PujnFNwhdlNZz1mb3FptwAQUO
	hbGmpIOv0vjuxQhwi12v09TL8gwSr6sfTou7xTQuGy2V9Dmk5KiEI9XZK4ulMMzVXA7Q/7OHxXOdt
	OdKdKNfQ==;
Received: from [189.7.87.79] (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uhaU4-006udv-5k; Thu, 31 Jul 2025 23:06:40 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Thu, 31 Jul 2025 18:06:17 -0300
Subject: [PATCH v2 1/5] clk: bcm: rpi: Add missing logs if firmware fails
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250731-v3d-power-management-v2-1-032d56b01964@igalia.com>
References: <20250731-v3d-power-management-v2-0-032d56b01964@igalia.com>
In-Reply-To: <20250731-v3d-power-management-v2-0-032d56b01964@igalia.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>, 
 Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Dom Cobley <popcornmix@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 kernel-dev@igalia.com, =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1470; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=erDCfOsYa2mIy6rXKmvOpHwNvVeseuMZhnPMp7sgL84=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBoi9rTbW3zXA3JCj73aonfd9bzr3nFhywVj/Wx2
 afRt8diZnuJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaIva0wAKCRA/8w6Kdoj6
 qhxMB/oDRSqLUnbJhzCRdkHJPMO7vN+qYdfAfph+4ZYGOE+H0MVIxLnI5q9CsE6aBJpub5R3MER
 JkGex4eMjo3dsUaIl+ojQXmlICTvFAjZ2TRqYKRWHiaxfYY1dcHbzsnF5kNISNQ7Y4LFkTMR2R+
 rqTJJaOH4IWu+0tkvv9scmuJWtfzsbycGSq5nLkvQ+4yOTT7Zby3rxOZVWewXmKH07BV/a5k8Dk
 hjXMwrmjK/tnyi3ydQvbbrbgWICTDa0epQFWcLLaFo/7wRmTVUVCNu5ET8jcmCw6ojGvVidGEvK
 D6uWnlCWhEKk7Xir8gBUQtPzTXAnHUEnV1b2azT6+KMlHdfe
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA

From: Stefan Wahren <wahrenst@gmx.net>

In contrary to raspberrypi_fw_set_rate(), the ops for is_prepared() and
recalc_rate() silently ignore firmware errors by just returning 0.
Since these operations should never fail, add at least error logs
to inform the user.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 8e4fde03ed232b464165f524d27744b4ced93a60..166d0bec380310e8b98f91568efa4aa88401af4f 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -194,8 +194,11 @@ static int raspberrypi_fw_is_prepared(struct clk_hw *hw)
 
 	ret = raspberrypi_clock_property(rpi->firmware, data,
 					 RPI_FIRMWARE_GET_CLOCK_STATE, &val);
-	if (ret)
+	if (ret) {
+		dev_err_ratelimited(rpi->dev, "Failed to get %s state: %d\n",
+				    clk_hw_get_name(hw), ret);
 		return 0;
+	}
 
 	return !!(val & RPI_FIRMWARE_STATE_ENABLE_BIT);
 }
@@ -211,8 +214,11 @@ static unsigned long raspberrypi_fw_get_rate(struct clk_hw *hw,
 
 	ret = raspberrypi_clock_property(rpi->firmware, data,
 					 RPI_FIRMWARE_GET_CLOCK_RATE, &val);
-	if (ret)
+	if (ret) {
+		dev_err_ratelimited(rpi->dev, "Failed to get %s frequency: %d\n",
+				    clk_hw_get_name(hw), ret);
 		return 0;
+	}
 
 	return val;
 }

-- 
2.50.0

