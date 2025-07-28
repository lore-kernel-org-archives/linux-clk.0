Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E2E257AF0
	for <linux-clk@vger.kernel.org>; Mon, 28 Jul 2025 12:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753706194; cv=none; b=i8MjeHRzNwq+cCEowNSRzU/x6eHt4BYvkpZrO4BcIv9kTxXO9uNsL3mPTcFe4kXCmXhfxc5F3mi4aj4wj0nfm2JwV9985s9/IMmZPXuj2ls4i6R8sLq2M7xidtPa6GV+WhPi2OxcCHZtEsEMZUntCnRChPcuiPD/rR7VEkxtEMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753706194; c=relaxed/simple;
	bh=VZB4TY2XDNSiEWoEhnr9I9NCUpRbewBq82IBfHPpAQM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FurT1xFgT6o9RUEplb9Q/JXZGC9kHohTGWhCv8zxm0pzAEC4Ord9wgF07H2M57KwG4y+u3ITNLw+bAE1W5GwRFYjqSIRHu1FxvhEivJad+3B38VgqZ3KOQNqwZo75oNKsSbgUuaxOpiL3jwYzf0IQFSAwe3G74HADUzCLjL27ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=g/G/d37q; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="g/G/d37q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=VU5EK1O4shzZ8WGIAcVRMsxGJyv6yO+NIH7YM+/dws8=; b=g/G/d37qRoSQYNoY4eyNEcay0E
	xUT06QBjmYiuYibLdQqFPj4tUxNPOX7A8CrXybeLdMoIH8YcJ2BaMUHstLhrAZ+GZ7mTdl8OUujWo
	JkKjx9CkmkLwyT38QlR4q2yop4SKRgWUFPi6BCG4cvclPyZdBvzK93a+loKCobwzWruY6OSpFlNPO
	IGGKsvfmLlw9WAaXhyBUOCHWc24zF3czNwzKtl48h9WLoUvfXTPmMDhqekJZAhGrgQEZuO71e4agh
	vOuKOb+i3lencN+PyWRi26tH2RrfnCE8GZqS19CbFUrb0fbMipBdV1cS9qDnexsuQRB4/lbLs190+
	7ZROmRSA==;
Received: from [189.7.87.79] (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1ugN5Y-004u0J-Cz; Mon, 28 Jul 2025 14:36:20 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Subject: [PATCH 0/3] Power Management for Raspberry Pi V3D GPU
Date: Mon, 28 Jul 2025 09:35:37 -0300
Message-Id: <20250728-v3d-power-management-v1-0-780f922b1048@igalia.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJpuh2gC/x2MTQ5AMBQGryJv7SXUv6uIRemHt1DSChJxd43lJ
 DPzkIcTeGqjhxxO8bLZAGkc0bhoO4PFBCaVqCKpVM1nZnjfLjhetdUzVtiDgWEIRm7GpqSQ7g6
 T3P+269/3A+c97xRmAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1940; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=VZB4TY2XDNSiEWoEhnr9I9NCUpRbewBq82IBfHPpAQM=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBoh26+klHq7mJ02coyITsL7uFituOV+joiNpDlJ
 Ac53ERSxhyJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaIduvgAKCRA/8w6Kdoj6
 qhriB/4k4oXHgtpfuTtVv1M43tkR3ikAAMqGVrZOhRjUU3YtAnc5czLrQoN50cuEH825AtRVr8g
 04E8V7ypYKUTVqfeZSTJuVBhMWgAymMtoGyKZIaEPkf40Hv3S+FzyB6XeYQ77zrYm6fTS/nio5k
 E3zTKxb9rNcoFFoY5pQIdXLN8L9dT6hsPC0JWUVAzabiBUp7IQjw4xOjgyDtHGPcG2DnH6+8fQy
 a40ufjlCI/CMN8iH+fHx5f+puGqjk80nOoVea7gt8/tS1VUI/lMgkI/NzHbIgD0IcvPBiJBxyw5
 dy2J5iCCkgE1U2kDjGEnq/84yvokfc1H8RAMTwmHT2S45o+l
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
nor lower the clock rate. Therefore, PATCH 1/3 addresses this issue in
clk/bcm/clk-raspberrypi.c.

The other two patches are related to PM enablement in the V3D driver.

To ease testing in Raspberry Pi 4 and 5, I prepared a downstream branch
backporting this series to rpi-6.12.y [1].

[1] https://github.com/mairacanal/linux-rpi/tree/v3d/downstream/power-management-v2

Best Regards,
- Maíra

---
Maíra Canal (3):
      clk: bcm: rpi: Turn firmware clock on/off when preparing/unpreparing
      drm/v3d: Allocate all resources before enabling the clock
      drm/v3d: Introduce Runtime Power Management

 drivers/clk/bcm/clk-raspberrypi.c |  41 ++++++++-
 drivers/gpu/drm/v3d/Makefile      |   3 +-
 drivers/gpu/drm/v3d/v3d_debugfs.c |  23 ++++-
 drivers/gpu/drm/v3d/v3d_drv.c     | 171 +++++++++++++++++++-------------------
 drivers/gpu/drm/v3d/v3d_drv.h     |  21 ++++-
 drivers/gpu/drm/v3d/v3d_gem.c     |  18 +++-
 drivers/gpu/drm/v3d/v3d_irq.c     |  15 ++--
 drivers/gpu/drm/v3d/v3d_mmu.c     |  12 ++-
 drivers/gpu/drm/v3d/v3d_power.c   |  79 ++++++++++++++++++
 drivers/gpu/drm/v3d/v3d_submit.c  |  19 ++++-
 10 files changed, 291 insertions(+), 111 deletions(-)
---
base-commit: a7352c849492a30b5d8491fcb9314ab376a3942f
change-id: 20250728-v3d-power-management-eebb2024dc96

