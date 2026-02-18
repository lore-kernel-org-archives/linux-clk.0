Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE2B2620DE
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 20:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771447581; cv=none; b=qJKUjl5n0JiifoBx/7MF5yqnwhC1x0ltSf2qi7Ydj/YTIFaijC1LS6EJfwI2tfzot3hZtkxU5Pr6UBYxYOGQV4tmy8SF6XZn174ko3MwUfeJVSL6oV+T3QWdbyxKFpKa1A26GGZ/IsH5BXGtKggWjBJ2SgcpNwhlm47ff2hYfmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771447581; c=relaxed/simple;
	bh=kVPYyJOSjqrHPsXntL3UrxCC1YymPVyxfC+PxCVmc0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BsP9tejEfLnlEr2pHV41mwdDFfFpV7312/zF3ceyqV08SKEpzxLoSTFm0gPweYAa1n+3mq9tRVhRB8m6tg+n2cPwDFFcrHq/tnjthPYJNueGNPqr1xNvIqtCMB1v963K6oNqp0lnJ27d0dNLgJA1cmgP7zqaowN8zjlv+7bZ70U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=LwZI3KoG; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="LwZI3KoG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wc20MlQbqkAccfy6VOlre7N+okiQofqCBOYxOYTMgDc=; b=LwZI3KoG7qO0vBDL4ZlUZiQ0fj
	j3DIaFlgw0s97pKeCM0Oxb6mr24/zvMX0qgLSc0WB2cfNzT6f4my+u7h8UKbPvl0/H+9gTZZIa5Z0
	T9V2Iv3WFpab5ZJJz/g5bIUrGfN/RWGr4YzgDaOKK+cbXCLc1b7r/zm0+HSdeDJsjSm1f/pR52fBa
	iUk3AS2W1R1UKcMkxWVoSZLRVE8YM+TxHi9iPErtUsWBWMWpLKrLhG5Gsq7PdUyB5SAQEKpPDWDcV
	0E4/qXIOg1I78zJ/4fdgAQ5Dx+oYukfeMyxNGwBtI0+VAeW1rvwFUXlND+XD3VLVMFMAMUz+0BF6v
	m2S+DRkA==;
Received: from [187.36.210.68] (helo=1.0.0.127.in-addr.arpa)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1vsoQu-002Czn-W8; Wed, 18 Feb 2026 21:46:05 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Wed, 18 Feb 2026 17:45:00 -0300
Subject: [PATCH v6 2/6] clk: bcm: rpi: Mark PIXEL_CLK and HEVC_CLK as
 CLK_IGNORE_UNUSED
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260218-v3d-power-management-v6-2-40683fd39865@igalia.com>
References: <20260218-v3d-power-management-v6-0-40683fd39865@igalia.com>
In-Reply-To: <20260218-v3d-power-management-v6-0-40683fd39865@igalia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1280; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=kVPYyJOSjqrHPsXntL3UrxCC1YymPVyxfC+PxCVmc0w=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBpliT45uVs8NNRW9d/+HQBINjfmVTyDtcwaiUfR
 cUBxLrHun2JATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaZYk+AAKCRA/8w6Kdoj6
 qkCKB/4ynquetMwRfYlFKsJ/AElYaZdud/iyRyj9IvInTXgvxWiKyFvjNY+Xx5SJ/kEtk3aAsg8
 F2g0Cp1Ru0dsSTlPSRngNMvntwxp7230cM6ChPpm3JJ9SM2He5jN2Rd/hXWZVKfpodieE265OFc
 Q3C5pJsKegOahjSQeqroBfhls2UDjp9dzpry01RdWQr89d2+iejJklSq5k8QTFe4r0iWPIYH1Hb
 zek6RkgoXhWQMszIYoUBPg1AmKEduvcHpZpwtkta2PpsnXNgBnJr/3aDNle/v5e9aLoqlshFqps
 aEwiL755dvcZsWgKjhtbEGLIfnyZgqIuGGa/Vmyl8c7tfz32
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
index 0d6e4f43c3bac0e7b38934c5c6e4db51211233de..83cdb2a34c84f34ba834608259d22e2b48b90c9d 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -142,12 +142,12 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
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

