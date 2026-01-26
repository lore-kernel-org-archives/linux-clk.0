Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF31F3164A5
	for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 17:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769448440; cv=none; b=heomfFxbzju6WM7IaIH87R2z1GkwWtz+UupjcM8ZcnPZEByIWs4iZfAYbt2xiZuJ0vzX+lMn54AljLV7wdb4wGtuMAuLBLKQ8hK7SpDvkiFA6zoZg2tD5UiDaRpwkj06OTxAEjeSHHrOzr3QPs7JJwn1iX6Wn5OTKCgRO0cV7bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769448440; c=relaxed/simple;
	bh=VVOb/XUviLeT12jZtnMIPJt73eqnYgRxcBkulCeWd3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r5UM153fYxXlkbM/JjzVJgNbMopR0LCS9gzTkUSpTLNhTG1DlLLC/n4TaIEQxb3dhUDV3MF2mkpjCAwYRgvei6lWItcXv/jgWsDYIVjI6q89uj3NlX46d8Pro+unxXiqfnRcd3gGiT035oF86Gn7DL/zLVvMQYnCz4VvvReXPgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=l2RBPZJ/; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="l2RBPZJ/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CQFK7fNypXqHYahd2jW/2UtLh5zyB5BpeUAqJ0QJCwo=; b=l2RBPZJ/EpQtAZgPYwsJ3Pyp8d
	Hn5UpGY8YZmK/U32R9hmiiXnjPfXDrgF00l3kEq4zOQm1e5glL0ZcID6AazaLzaO8lFeS48xAMKNt
	hBKu+i04EWuq1lwgQPGw8TMWyb1epfDXhbwHUI85DbTdTeyC0Pqx0NEo5FV8G6CLCLGV3tOZ8WydI
	PkuWkJxq8mKQvPhnOvc33di0FkR4MZdAXCP7WscwSeN6jSELvYkG2htVAvd6y+wouqUJw6b0nK6Ap
	0Qcz3edDRwrMjfwQ5mvXA6dhy0dGrAYZVgR4BF8bZWSQL5ofznkSxn+YdvmkHXZY++Y/cusXHUZKk
	GKozkR8g==;
Received: from [187.36.210.68] (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1vkQMl-00A8mi-Bo; Mon, 26 Jan 2026 18:27:07 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Mon, 26 Jan 2026 14:26:37 -0300
Subject: [PATCH v4 1/6] clk: bcm: rpi: Let V3D consumers manage clock rate
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260126-v3d-power-management-v4-1-caf2df16d4e2@igalia.com>
References: <20260126-v3d-power-management-v4-0-caf2df16d4e2@igalia.com>
In-Reply-To: <20260126-v3d-power-management-v4-0-caf2df16d4e2@igalia.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>, 
 Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Chema Casanova <jmcasanova@igalia.com>, Dom Cobley <popcornmix@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 kernel-dev@igalia.com, =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1709; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=VVOb/XUviLeT12jZtnMIPJt73eqnYgRxcBkulCeWd3s=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBpd6PdQM6ie3ORxqLCsGrw2lcE9HC0hd22hoT2D
 swCR+YbagyJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaXej3QAKCRA/8w6Kdoj6
 qsfzB/0QVvbEjtD0ABXOU2wghUnkO3usz0RNDp4AjYPON8AZ0uNB5cLXdw1rK8rnVyo1ivc6iFw
 VaKRX/ayVU720wfVu4R9Cz4YsWLEs0qcAX+1FeuvzjRJCCkbgEn32+qaBMLz5Po1v8q8ZvG+cpO
 M3VdWwfKwbcXGndvLWNR9LAZcOFrbNBGMz4YOWxvlrMDYR6YXQmffBnknvBjrIpXAoLJuybP+KN
 94T9odB/lDZbvKXnCo3UxV4WOf33BBEXTIbRvZEmgy7YmQWa9TEwOsRX3Q1xS8j1w3aA2ybCUTJ
 RRLwTQEUKk+Oi0D7rTc4Bnd0NR9fsNKsGUNegecupW3AYZ8W
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA

Remove the `maximize` infrastructure and don't set `minimize` for the
V3D clock, giving consumers full control over its rate.

On some firmware versions, RPI_FIRMWARE_SET_CLOCK_STATE doesn't
actually power off the clock. To achieve meaningful power consumption
reduction, consumers need to set the clock rate to minimum before
disabling it. Forcing the clock to maximum rate in the clock framework
prevents this, as consumers don't have any flexibility over the clock
rate.

This change enables the v3d driver to control the clock rate directly
in its suspend/resume callbacks.

Fixes: 6526402b9bac ("clk: bcm: rpi: Maximize V3D clock")
Acked-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 1a9162f0ae31e330c46f6eafdd00350599b0eede..9783385d5859836898683209e320fcc928dfdc71 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -68,7 +68,6 @@ struct raspberrypi_clk_variant {
 	char		*clkdev;
 	unsigned long	min_rate;
 	bool		minimize;
-	bool		maximize;
 	u32		flags;
 };
 
@@ -136,7 +135,6 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	},
 	[RPI_FIRMWARE_V3D_CLK_ID] = {
 		.export = true,
-		.maximize = true,
 	},
 	[RPI_FIRMWARE_PIXEL_CLK_ID] = {
 		.export = true,
@@ -387,9 +385,6 @@ static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
 		}
 	}
 
-	if (variant->maximize)
-		variant->min_rate = max_rate;
-
 	if (variant->min_rate) {
 		unsigned long rate;
 

-- 
2.52.0

