Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BCD1C7013
	for <linux-clk@vger.kernel.org>; Thu, 31 Jul 2025 21:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753996017; cv=none; b=BuL2OwQzUNzkJtg56oBg66vTOxJjqlhAZQayQr1EtXaiWBvLuiOqNkFCcXA83sz/kfsi2jEFFPPurWsKvGI1WWGUL6Ey2ExXD5PHnjyOWm5nuguNi4t3ioVsMB1Kc8gaAoS8Hh3YnQz/QnVaVXapKl/DLE7gd9gC3nJsuCN/vcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753996017; c=relaxed/simple;
	bh=O00PsKXK2jlCG/cJaXu43518VkWglgzTQU7i2A9SDdU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X9FfXP3yMe53ofsRBXVd+u/ATdVhtmqNQ1zhihnXDIcAhtodXTJ0VqhyT+FKukMxqNEZO44Pj/xEGQmj/g25qzrbBDVITdkYeUjFqoDQWx87yKaVU6i5jA/jZgfZKUzbZia3a12mRGPNjc40rI7y/jIksMpEo2RK1GcT5OdtmHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Qy4EAQJt; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Qy4EAQJt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ULjQfnhtaCOc6nuTlfsZN9Ndb34y8oJUL4ctPVdS50E=; b=Qy4EAQJt9mBpWKn/kZw/jo6bIS
	Z/R914OrXmb86ghVBgyB61aCQgKDytoT6Qtyi469yD1DMdQKYm0yl54ktrFDTsB+KecW8Yf7+VR60
	Gk3uTBf0ztyVIGvRKtO7Ld+eLWWmeCvwA2YN4aaVeEgwtZHm7awGLLWOksC1LpGrRz12iNtwFXKYL
	bPM51s9F+WVI9i3ateL8z9OktzkxEk+vr6yJs2cVvcChj3IGRxt3ChuNA1F2LpLyc4a52OMSbY4Ml
	8M8qPKHyKyecRWUo8e7Yt02A292P+a5HPMw1pmMRzIKHBTPr9OJYEBgE6V4E1Wl0wIYOK8CgoEHrE
	OohDqoIQ==;
Received: from [189.7.87.79] (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uhaUG-006udv-GF; Thu, 31 Jul 2025 23:06:52 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Thu, 31 Jul 2025 18:06:19 -0300
Subject: [PATCH v2 3/5] clk: bcm: rpi: Maximize V3D clock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250731-v3d-power-management-v2-3-032d56b01964@igalia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1402; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=O00PsKXK2jlCG/cJaXu43518VkWglgzTQU7i2A9SDdU=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBoi9rUePKvZrB61zbL7vB3NsW4V2vMh/P3tKA0Q
 ycZPC7UAxCJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaIva1AAKCRA/8w6Kdoj6
 quAlB/4xILc7+1+O5iez+G384qNdJ5teQLSRbPz7RYpBzvieoCh7ahwySTdkQ8lwO6sU4YQMwQC
 hF98fnBitUz+PeZzdOBxvzXWD3WdOkMGKF/088TQdT0lu9yLq6t5N8xs5vSLhmCDKA47Bh6OtUD
 DK891EUysB9WFRuRc/MspiMQNTD0OVqbp756QvhScyAXPCWGdkNHUfTt7LvHxkuBh4JAcz/1x4L
 xosPgmye5e77w+w0njlMjL7K/ISnxISq0C7C99KUOilQTkpYXfQsuMTau3loUynqQFsMZOG9WKs
 HqWvQlJ5jx+MPtlcM9wES3AdemCdjSDN3VMwYFTKINOBGCHY
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA

Although minimizing the clock rate is the best for most scenarios, as
stated in commit 4d85abb0fb8e ("clk: bcm: rpi: Enable minimize for all
firmware clocks"), when it comes to the GPU, it's ideal to have the
maximum rate allowed.

Add an option to maximize a firmware clock's rate when the clock is
enabled and set this option for V3D.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 70acfa68827d84670c645bedd17bf0e181aadfbb..1a9162f0ae31e330c46f6eafdd00350599b0eede 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -68,6 +68,7 @@ struct raspberrypi_clk_variant {
 	char		*clkdev;
 	unsigned long	min_rate;
 	bool		minimize;
+	bool		maximize;
 	u32		flags;
 };
 
@@ -135,7 +136,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	},
 	[RPI_FIRMWARE_V3D_CLK_ID] = {
 		.export = true,
-		.minimize = true,
+		.maximize = true,
 	},
 	[RPI_FIRMWARE_PIXEL_CLK_ID] = {
 		.export = true,
@@ -386,6 +387,9 @@ static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
 		}
 	}
 
+	if (variant->maximize)
+		variant->min_rate = max_rate;
+
 	if (variant->min_rate) {
 		unsigned long rate;
 

-- 
2.50.0

