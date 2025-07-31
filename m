Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C321C7013
	for <linux-clk@vger.kernel.org>; Thu, 31 Jul 2025 21:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753996009; cv=none; b=qSUC1JoDJ1N88gg0sTj2irl4rWR4kbWpdFDO45yj/DS6wpjeziC4t69iCax+68sdZVcAeyCE2y7Lssc3KZrNu+kvYq4ZbXyi6ibBXN3cg/koSuhJN3u0nGKl575tsHuviqTXLFMpU2jBaViUYSalDf2KwKbMqU1l4qE7A/bhIK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753996009; c=relaxed/simple;
	bh=zfNF8BREbX+frn7t6Ly89v2rx2iN7VGDZHrQgLajIGs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BqB57FedD+QD/gHG67bZ2OnmJ3Fa29U/ccH7Sa3r/ldZanPAa2V8610uL4TgVGiDTDwkhe24qNZcYciqUUyNm1WogN4GFsDk7M5/mdTwXjQErJQTO32ld4XrR8zCvppYCnTF0kvvOYZU3Lz3fxNGWH9u4J6/q4Bmfbfus1qw63U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=lTHFUl+h; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="lTHFUl+h"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=F5iWwHdVzycSodGeYjtVx3ONVGogeiDl/VkmmTNcPWA=; b=lTHFUl+hyv7Fn1pLcmn6K0fFdt
	JFTumCVEM3M0KNszzQQD7a1BEp7DPlg4pn7sPgy+jdXDy35RndWHM42aIKx3SMop/sP+jiw6zOHQe
	X9Un/n76g6WUz83WEP0jnP1dKbB5ZOOlaF6ZJmZwATSBnrqmKh5zqqPlrR1m9gDbZ/BHaCdVKUMak
	w0ZQyN7Xk56c1bCeOm7hue3wN1Z+5XFYFsq2MMrhcZ6G/WwchG/qOSwZRwDCHB02Uj5TSbNdXu45x
	z6xgG8deVRRPeV92QP0TwZf0atlUHJewCoL9G+f4sIBcIu8eY9st75v7cDHKbpMvJDE/e8yux5/TT
	CJKbUGSQ==;
Received: from [189.7.87.79] (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uhaTy-006udv-C5; Thu, 31 Jul 2025 23:06:34 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Subject: [PATCH v2 0/5] Power Management for Raspberry Pi V3D GPU
Date: Thu, 31 Jul 2025 18:06:16 -0300
Message-Id: <20250731-v3d-power-management-v2-0-032d56b01964@igalia.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMnai2gC/4WNTQ6CMBCFr0Jm7ZhSUX5W3sOwKHQok0hLWlI1p
 He3cgGX38t739shkGcK0BU7eIoc2NkM8lTAOCtrCFlnBinkVdSywXjRuLoXeVyUVYYWshsSDUN
 uVHpsb5Cnq6eJ34f20WeeOWzOf46XWP7SP8JYosC6EVMr5VCKqrmzUU9W59Et0KeUvliii3+5A
 AAA
X-Change-ID: 20250728-v3d-power-management-eebb2024dc96
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2896; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=zfNF8BREbX+frn7t6Ly89v2rx2iN7VGDZHrQgLajIGs=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBoi9rTGpilUWQxEIkHHQPAMUyO2Fnt81JiecBiJ
 PBjQ4vEpYSJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaIva0wAKCRA/8w6Kdoj6
 qselB/9lKTVcs/kFE62ABu237fk31llS+tJb10N+6J/c/Yn3nc1FIypMOSc0y8Ithew3ONFcE4/
 rQEkIg23CcESh4TkIUsFkXlvW0X7LJYq7d7rlYiUkWTFzY696B9DZ8Ydc+oUZxLpoya67AzWjhQ
 SJxDnmHjZHviMHkaHSj/TG64hF51mgjdd4DR39wUzddD3gAo2MUnshO7BULleDb/ocJiMHiotT/
 0Hc2t8DZXN76q+St4Wruxg7dZDHtOou+C0tUhVrA3hqv+qexfYKRB2whKi+e7o7+2vlZlaDXSPM
 gjXHi5W0PMuFlOcM+ab+FQx74omY5kQny6JMGH9/TGsOkcu9
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA

This series introduces Runtime PM for Raspberry Pi's GPU, V3D.
Currently, the GPU clock stays up during the whole operation, even if
the GPU is idle. By introducing Runtime PM, we can now turn off the
clock completely during idle. For example, with this series, when
checking `vcgencmd measure_clock v3d` in the Raspberry Pi 5, we get:

(idle)

$ vcgencmd measure_clock v3d
frequency(0)=0

(running glmark2)

$ vcgencmd measure_clock v3d
frequency(0)=960016128

To implement PM for V3D, it was needed to add a prepare and unprepare
hook to RPi's firmware clocks. Currently, they don't turn on and off,
nor lower the clock rate. Therefore, PATCH 2/5 addresses this issue in
clk/bcm/clk-raspberrypi.c.

Apart from the first patch, the last three patches are related to PM
enablement in the V3D driver.

To ease testing in Raspberry Pi 4 and 5, I prepared a downstream branch
backporting this series to rpi-6.12.y [1].

[1] https://github.com/mairacanal/linux-rpi/tree/v3d/downstream/power-management-v2

Best Regards,
- Maíra

---
v1 -> v2: https://lore.kernel.org/r/20250728-v3d-power-management-v1-0-780f922b1048@igalia.com

- [1/5] NEW PATCH: "clk: bcm: rpi: Add missing logs if firmware fails" (Stefan Wahren)
- [2/5] Remove the "Fixes:" tag (Stefan Wahren)
- [2/5] dev_err_ratelimited() instead of dev_err() (Stefan Wahren)
- [2/5] Instead of logging the clock ID, use clk_hw_get_name(hw) to log the name (Stefan Wahren)
- [2/5] Add a newline character at the end of the log message (Stefan Wahren)
- [2/5] Use CLK_IS_CRITICAL for all clocks that can't be disabled (Maxime Ripard)
- [3/5] NEW PATCH: "clk: bcm: rpi: Maximize V3D clock"
- [4/5] Use devm_reset_control_get_optional_exclusive() (Philipp Zabel)
- [4/5] Make sure that resource are cleaned in the inverse order of allocation (Philipp Zabel)

---
Maíra Canal (4):
      clk: bcm: rpi: Turn firmware clock on/off when preparing/unpreparing
      clk: bcm: rpi: Maximize V3D clock
      drm/v3d: Allocate all resources before enabling the clock
      drm/v3d: Introduce Runtime Power Management

Stefan Wahren (1):
      clk: bcm: rpi: Add missing logs if firmware fails

 drivers/clk/bcm/clk-raspberrypi.c |  72 ++++++++++++++++-
 drivers/gpu/drm/v3d/Makefile      |   3 +-
 drivers/gpu/drm/v3d/v3d_debugfs.c |  23 +++++-
 drivers/gpu/drm/v3d/v3d_drv.c     | 160 ++++++++++++++++++--------------------
 drivers/gpu/drm/v3d/v3d_drv.h     |  21 ++++-
 drivers/gpu/drm/v3d/v3d_gem.c     |  18 ++++-
 drivers/gpu/drm/v3d/v3d_irq.c     |  15 ++--
 drivers/gpu/drm/v3d/v3d_mmu.c     |  12 ++-
 drivers/gpu/drm/v3d/v3d_power.c   |  79 +++++++++++++++++++
 drivers/gpu/drm/v3d/v3d_submit.c  |  19 ++++-
 10 files changed, 311 insertions(+), 111 deletions(-)
---
base-commit: 518867b09394217d13f6e05f704450bd9d2c8eeb
change-id: 20250728-v3d-power-management-eebb2024dc96

