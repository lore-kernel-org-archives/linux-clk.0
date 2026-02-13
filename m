Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442E027B340
	for <linux-clk@vger.kernel.org>; Fri, 13 Feb 2026 18:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771008839; cv=none; b=daIYYnbj5/mycClSKSo6n/Ou32tip2Z6Myvr3reHaWa61JdtLz013BpFstmGL+3TW08csn563eAH1qjDGFDowKmEFnmmABe0crPL6fpGY6rcJ8lwQh2jGoMIbIDXDFW0/sLNzP0Dx7xYJAc+K+N8voTSbrrhdsigwpdVY/Xgqak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771008839; c=relaxed/simple;
	bh=/i7oD+HdEV5+FKpKWf+g///6ddnKCJYwQMS7LWp2oV8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ukAv3MNKOQtUMy9e2SSHY6lP69q8kPYosVVFKlVl/1/rL28zfFNHX9pH5BvWD40t9/mjEQgZJgVId2oiPJU0DuA/AFO8CM5zGTretpGhb+w8YRkh0hqin9xAVj2pFOrOZuuiPxsJ32NWdyWrvBTQlmCfJUqH7emSOcqKkvdkotM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=ndOoyLup; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="ndOoyLup"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dJUICxDk015PLfzQs3JF41wFjRVpYrqT9S2gtAwBHi0=; b=ndOoyLup8B0TBeJn1N4tlqUn1F
	Gj6/P2r5A6YCfJ4Dnw9l1XKCBcL+KAsP3zBAf5+vjIDaennXp+VR24NWC9MD2hXu48+LzE04/qFWQ
	xMxin4Y6ZNb8A4L1ECwpRRgsK+0OrJ6gf+6Q27BXeZk50KaT10bpYl4IKMPlNuakw68ZNBnVKm/vr
	tcZTkw2cMM9Bnggsmxy3LDxikyBV/gjkjy3VBe3YrwUW/fGXE/lnIRgWfs1EnPwoLoc5M83z2QJRQ
	PB9VzfUjS6tA82Fa+iVRWN46k3f6YOgEouK/cd8A+P3weDzJr0vVdg+aQ8i/3CoDqcjsdgtu9RXW4
	glEvT2Yw==;
Received: from [187.36.210.68] (helo=janis.local)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1vqyIZ-000Sqv-Kk; Fri, 13 Feb 2026 19:53:51 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Fri, 13 Feb 2026 15:52:57 -0300
Subject: [PATCH v5 4/7] pmdomain: bcm: bcm2835-power: Increase ASB control
 timeout
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260213-v3d-power-management-v5-4-7a8b381eb379@igalia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1846; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=/i7oD+HdEV5+FKpKWf+g///6ddnKCJYwQMS7LWp2oV8=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBpj3MnfLFUgQohsJnsvP4RBi7Un823vMOh17qqK
 KW6ZvU/kLOJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaY9zJwAKCRA/8w6Kdoj6
 qstkCACSBZ3hrpms7suJiJH0W944uto0MNxl3J6FogrMYI47TUiu8OeW8DEhoUOEyeSQNJ+koYt
 zSQZY37oF/iEFp5ryB0Vv5657et/tPNLBlgYa2QquCqtll3SBdiz9yl9IyEOlX/UwMEaHccnYeF
 HHfln4qXzF/va4XvusI7HprGrtk2vOAgKfNW/UT0xkizyYDvIGgBACoBYPTyZFMG0ZUDD26ga2h
 mnFjTxRYoU/MmLLAhiidHGofm2S3rAo5rk16mDtgUoedHMbc02BuJR9miYaoJoOqfFPEIvXV1Ak
 6AIFWHQcdiTgICmhSK6Kp1k5+WsfSkVimAuGIgZdmg8ObpLf
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA

The bcm2835_asb_control() function uses a tight polling loop to wait
for the ASB bridge to acknowledge a request. During intensive workloads,
this handshake intermittently fails for V3D's master ASB on BCM2711,
resulting in "Failed to disable ASB master for v3d" errors during
runtime PM suspend. As a consequence, the failed power-off leaves V3D in
a broken state, leading to bus faults or system hangs on later accesses.

As the timeout is insufficient in some scenarios, increase the polling
timeout from 1us to 5us, which is still negligible in the context of a
power domain transition. Also, move the start timestamp to after the
MMIO write, as the write latency is counted against the timeout,
reducing the effective wait time for the hardware to respond.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/pmdomain/bcm/bcm2835-power.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/pmdomain/bcm/bcm2835-power.c b/drivers/pmdomain/bcm/bcm2835-power.c
index 1d29addfe036348e82293693b4059e504bb25575..7b9eea10a24e26835deeca84c60ccb616b99a508 100644
--- a/drivers/pmdomain/bcm/bcm2835-power.c
+++ b/drivers/pmdomain/bcm/bcm2835-power.c
@@ -166,8 +166,6 @@ static int bcm2835_asb_control(struct bcm2835_power *power, u32 reg, bool enable
 		break;
 	}
 
-	start = ktime_get_ns();
-
 	/* Enable the module's async AXI bridges. */
 	if (enable) {
 		val = readl(base + reg) & ~ASB_REQ_STOP;
@@ -176,9 +174,10 @@ static int bcm2835_asb_control(struct bcm2835_power *power, u32 reg, bool enable
 	}
 	writel(PM_PASSWORD | val, base + reg);
 
+	start = ktime_get_ns();
 	while (!!(readl(base + reg) & ASB_ACK) == enable) {
 		cpu_relax();
-		if (ktime_get_ns() - start >= 1000)
+		if (ktime_get_ns() - start >= 5000)
 			return -ETIMEDOUT;
 	}
 

-- 
2.52.0

