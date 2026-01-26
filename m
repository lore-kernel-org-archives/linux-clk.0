Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DC12E0902
	for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 17:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769448450; cv=none; b=FjGZ1vUJkBdN/cicJowmpyxP+zNw3oE8GS6gRPd/QY/uWACSwymXl1BgXBKxlkEOJQgwrLDs8H8Ohwp+dN60RaO7jcleDU36APitT5mOa8G5EGXhbcDxsQDRgslDlbvs0VQKhdU2GY7C0pmm0sP/rbYLFDnCgi2qnf2uVrwvDUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769448450; c=relaxed/simple;
	bh=HBxi3kNHRo5O0aV4BChTV5TSpsgJgBHlM1/y8UtvZUU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GwnUn0KUyvSTlE6k7fyidl9/wXysYAdJWqpFdIKZ93NCa5/QUUljFm7L3dge1KbM32wyP5LLHNYiviy+i5QdA3T4FBI4J+hWKiOq8K/cB4DZ8Y1XfF5JkP+K0yyrm5zpgf1hDgLAXuLmzOa6P8H0H2PM4GrO95EduBg9CNsndP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=qvJJ4MVc; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="qvJJ4MVc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=B7kyYc7RhFlSmWPDvngvLP1/s4eswS0lTVZC8IrSTyE=; b=qvJJ4MVcEyhY4Hz5bWLduca16T
	FHExZwQYJDSuh366xM9FBqNQZx+Er1GeBWpFNXDlW0AkO8nE3M8T1E8iULvP9JAqCTWoRfOmLkqjF
	QmZWS+cgJyuCB92ZR5PWmdP2Zs1GjNaRgFhELGHikIGsBzE2gbRjRUGgdTmxBxSls8qdntDKnS1Jr
	wQOC3Upsc1HxQDS7Hn0a4qLFNzXPsc8e6KtLPp6lJhcJ6b4yiPA9Vojgp/xIMjFxItla7FkKQ8cxK
	exYyW2Jmn/zT8MaWLPGZt7pkaz6k2nGaulTFmw5uOcEMQ6ojrxGPcEw2qEOwrJudOZB5L1Bw3ILsn
	BF0L0Idg==;
Received: from [187.36.210.68] (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1vkQMw-00A8mi-Uq; Mon, 26 Jan 2026 18:27:19 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Mon, 26 Jan 2026 14:26:39 -0300
Subject: [PATCH v4 3/6] clk: bcm: rpi: Mark PIXEL_CLK and HEVC_CLK as
 CLK_IGNORE_UNUSED
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260126-v3d-power-management-v4-3-caf2df16d4e2@igalia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1280; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=HBxi3kNHRo5O0aV4BChTV5TSpsgJgBHlM1/y8UtvZUU=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBpd6Petkfs2R/SjKZbtviysA/KE4naLldxth79M
 /ns9oJIilOJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaXej3gAKCRA/8w6Kdoj6
 qnT5B/4iTveg3MOxV/mK6PzIE/f/V7lpidYicTlaFqDyX3AHMPSIg47NwmFSLKZApyXWvGGE0Xk
 vBGPfxKF21KOz6C6wS2KHSdjekGH2Xp8x9taXcxoTC6SGr9nrNvJHqfjh1QtM+2pNs4LVZmILi5
 scl1BxYhRDkF70CalFAggAOvAAyC6aSdAuHN+pI4q+zseHpdzvsqMvCF5hjAtxWCSKwXclKUvP8
 JcK4+/HUbvvp6iXTnS2SG/W0lyt47USHR2gD4K/GVuOP8BFk/fYBT8NHJhDHuRqC3TtEBCBJrBt
 tUUwDAkOLOqnt9QNp8d39aRAglz5sr+bwZXnjmJHaD1ZTWGw
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA

If PIXEL_CLK or HEVC_CLK is disabled during boot, the firmware will skip
HSM initialization, which would result in a bus lockup. However, those
clocks are consumed by drivers (vc4 and HEVC decoder drivers,
respectively), which means that they can be enabled/disabled by the
drivers.

Mark those clocks as CLK_IGNORE_UNUSED to allow them to be disabled by
drivers when appropriate.

Acked-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 2e63121af0900ac9b4874b666cf6d02baa8be11c..b9f2a4dc1510ff162c84d67aa0ddd7f435156398 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -139,12 +139,12 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	[RPI_FIRMWARE_PIXEL_CLK_ID] = {
 		.export = true,
 		.minimize = true,
-		.flags = CLK_IS_CRITICAL,
+		.flags = CLK_IGNORE_UNUSED,
 	},
 	[RPI_FIRMWARE_HEVC_CLK_ID] = {
 		.export = true,
 		.minimize = true,
-		.flags = CLK_IS_CRITICAL,
+		.flags = CLK_IGNORE_UNUSED,
 	},
 	[RPI_FIRMWARE_ISP_CLK_ID] = {
 		.export = true,

-- 
2.52.0

