Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E281370D45
	for <linux-clk@vger.kernel.org>; Wed,  1 Apr 2026 11:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775042091; cv=none; b=r9jYtBynUU4FKLYYXKipO/ndcDGDB/Q0zCkOJ3onPB6ebmwauNeOmBl7AhK0TnpLJnXgyZt7VeI6AhpmQSPPqNm750ggnFrWaK+Y3+mZ8EM3KrHGlsCPXRx7aIRLF7GtysixJ7vnfdZI3PcQb7PsZAlh5mJQQPUfVycWqhav5lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775042091; c=relaxed/simple;
	bh=jxC20WgoY5DUWMuvDJXkea/IlM9bgQtNUZON5qfXFuI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GOV7EO3LoG53zh00ycBs7HslqIiET10V/7CHPfrCTckOyr59SP7J4bie75xc7uGk9m1iMAwf7qBx6UO5+mC8W+ng7VEAV0FWHSXu4kPfXiJ9e5bw5hlvtLCQ/gouXNiOuau6dkLnG4SHSSpjShFHHHF4avL4dnHfvwt+Qrn5Gx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=HmRiBARy; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="HmRiBARy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=93p9L3k+sUGmocfBSVzKGZHTWa/Pn999YBF5eBW86uY=; b=HmRiBARyPM06LMZajCZb+DGAxu
	DmgwtsEM7Ml5uZpe3FgM3HxWL8eC6Wf3ztDZJRgtpOKjVGGvsIv4lmWfk8De9VRh1OELS04igS5LM
	sYthgM8d7OJL1k2/BWyplj1Am2ZymtqSUJtoVFaQpLLcrHX85LMVPro57kVMyD/HMmarWJvPRy6/T
	h/ysIqdyI9ChBMuIVR5+3Y2jLflu/HtT1zmm8PaDlFkwZ5Gan/XkI44amn5GloHKh6yycc1zZ4zKV
	BK9TUHOq5b+IJ2VdzTeJrfEeoJusnpOsBTwReE24j/DuVHpEWaGhlVVBbjM45CGel/wQz1COBBXzL
	4sEy1xLA==;
Received: from [189.7.87.169] (helo=prince)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1w7tWv-009twc-LF; Wed, 01 Apr 2026 13:14:38 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Mark Brown <broonie@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dom Cobley <popcornmix@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: linux-clk@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel-dev@igalia.com,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH] clk: bcm: rpi: Mark VEC clock as CLK_IGNORE_UNUSED
Date: Wed,  1 Apr 2026 08:13:57 -0300
Message-ID: <20260401111416.562279-2-mcanal@igalia.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Raspberry Pi 3B, the VEC clock is used by the VideoCore firmware
display driver, which remains active until the vc4 driver loads and
sends NOTIFY_DISPLAY_DONE. If this clock is disabled during boot, a bus
lockup happens and the firmware becomes unresponsive, causing a complete
system lockup.

Mark the VEC clock with CLK_IGNORE_UNUSED so it survives the unused
clock disablement and remains available until the vc4 driver takes over
display management.

Fixes: 672299736af6 ("clk: bcm: rpi: Manage clock rate in prepare/unprepare callbacks")
Reported-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index df2d246eb6ef..f1a99de6de4f 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -160,6 +160,13 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	[RPI_FIRMWARE_VEC_CLK_ID] = {
 		.export = true,
 		.minimize = true,
+
+		/*
+		 * If this clock is disabled during boot, it causes a bus
+		 * lockup in RPi 3B. Therefore, make sure it's left enabled
+		 * during boot.
+		 */
+		.flags = CLK_IGNORE_UNUSED,
 	},
 	[RPI_FIRMWARE_DISP_CLK_ID] = {
 		.export = true,
-- 
2.53.0

