Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92EB2E0902
	for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 17:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769448455; cv=none; b=jSHRYYslpJPCCkIxTwl5FJydwDFLaFYspp3l1ShzbVzk2wUXVT4YR59UOBCdDwN3ivKXZ1kxxyrb9wkxuteHrNCy3IA8h31kofJwgBXpOOC1z2ybme/88TjbMQ0uTHx8OCwlwUXLknFn5QHEdmnombFZ33DaLIV5/ENH8YmtPrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769448455; c=relaxed/simple;
	bh=wdK6PGLiRnlpa9+cq1grUo29qiGFO0rt0+G3UR3/sk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jE3wPYMKP28dsCIC+jt9tUecuoE4/z2xV3mC2PYvu9csDAA7ALKvX9ZrV38BPkBjURfo0w1HtpZQP+jKoTyK1JnvAhCY+PmccU8w5tBMuOr6EpDf/nE7np0IXfZ8z8XOBldzEcvX4X4+j+lRTpaGt47IsTLgeGYw+/nfhrQ4h3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Aa+srdh1; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Aa+srdh1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Z3TQkix31nSO3DE+TASdwKeJFfjpLtAJyrBSqcWBFOg=; b=Aa+srdh1hxQq5hUuV3Z70tR4O5
	uyPG6itTrpsTZyeQjkd8OwA9YtXmXclt4+kgcH/I/oPZLwiMNgzk3lruk+dTuNWDrGX2L5bmd2oD0
	aGXA9IwyOnOjqODiWsCGfAxpSnuN/0TV1jP0hxfKtxiXgs9W4/TXyRE9/rZnOf4ZzAPVhgAU0vfv9
	pKUCat7+igu99bQllzX9H1cP47m0q9jB1KE3e1Q55J3s/S+56RRIXNk+jISNvKFzJijgKdzpbNU2K
	Xri4lmre3qcu80BiSpXV+euB6S9gIkzbcD/KpVEFf9NIDobQePj1fQn9Uqe9aKrCfTK4ACANrbbjc
	mFzeH3kg==;
Received: from [187.36.210.68] (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1vkQN2-00A8mi-Sz; Mon, 26 Jan 2026 18:27:25 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Mon, 26 Jan 2026 14:26:40 -0300
Subject: [PATCH v4 4/6] drm/v3d: Use
 devm_reset_control_get_optional_exclusive()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260126-v3d-power-management-v4-4-caf2df16d4e2@igalia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1291; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=wdK6PGLiRnlpa9+cq1grUo29qiGFO0rt0+G3UR3/sk4=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBpd6PezTPMnqdJN2J08Aj4g5y1GTm7DwuJHX4G4
 7YuZWZ6vHaJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaXej3gAKCRA/8w6Kdoj6
 qtR3B/9DPxAiVF5m7sS05+ODHmpXzitYZMdondUUjtluNCaVIXKkf4/q+IH/L13y2iQKe008u//
 l/2zAUGK2tWAdx3ZaZ1pEuAzwwUl8zD2u7MX/hMYxWI5dWnGMVFecm21/qJy0Wcy3uk/xyhBABU
 iALOf0do9iDzAPiPfaVIBRPrsVh3H+tKr2k3pIbip89Ff9GwtUoq3Fsdhn0gH/2NRtTilBGQQMu
 VCATK/GEXJe4+tUrdDEeJaj18cmIewwF0N4oKpROD1xv093GBLhfW5UolaDUfGhAAj2kpx1el5U
 4g4Co1ltElcyBhzaPX3wuf+LE93RkBaOs1eima4vVMk7OY79
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA

Simplify optional reset handling by using the function
devm_reset_control_get_optional_exclusive().

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

