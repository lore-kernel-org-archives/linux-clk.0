Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7292127C178;
	Sat, 11 Oct 2025 17:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760202236; cv=none; b=FQm5aHu53aOiLK/T67TxdNaNvPQ12EP+QQUapE40I59/jFQiEKtNtUBTvJ7yYCB9X2noKsqrjcyoy5bUmtJA4s5va213LEUOuXF32rQPOxQKRAcfSh3dF/5TvzAVMpmrBpyf104/G7eLjf64SWQ1pNritMtcMx4JPUPv3IZQKQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760202236; c=relaxed/simple;
	bh=33zhcsq1oF5lLxOP9LecR3SIaHx5fVvsP8OPsFmw6W8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ckDlhgrpx7BFlv85LQVHGZXL1+umIvl3pnY4FQ/IHDvI9ELldvu8pPUETro5Y2vbTx7aJzmHMAT6Xc3kcavn7wTEitD85v04YuZgM1TRBQcb34RnT+ytH8qelEWIVT9cahqhVHXQ52Hc87tdKUxz3RkfjEH5KOuE7VcY1UXtSRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=yC3vECz/; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=vhTGkFy8; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="yC3vECz/";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="vhTGkFy8"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ckVLw5YRdz9swL;
	Sat, 11 Oct 2025 19:03:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P2wriwwCuGG03tcdpA2vNLIkCQ2Q6zugdIwMiQUBbFs=;
	b=yC3vECz/W8QUTOGG9iIXnH/8ccYmTYzhSUOABtp+EOwRyNvtW//1gqC2kCE1wzkyVL7hzC
	5AYeFASONG690eMolQOVTXkn7hhYi4T6zE9qIy7sY4opaZsbeRieuQ4Q0ab/LEeiT3Vp1z
	AswdkrF51WUo3d9lc028wzbcqxo3BeBnNEwYSlN0Pb5iiTG/otmQhV4R4TWfClfne7uNK9
	gItSf07SjopNanA8RFo674RV7A09zxt/JDfrUh9i592XIV72N7/zNvKxNUQyZ4vtkUXwiM
	0rbTbYybzolDCUmakm01yLGyxuiikXdpMc/rUWWTrI1usP+pm0CmoUnlXVFP0A==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=vhTGkFy8;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P2wriwwCuGG03tcdpA2vNLIkCQ2Q6zugdIwMiQUBbFs=;
	b=vhTGkFy8dlQURfQ4XqFzPeDWi5l3EsnTevi0EGeogKj8BppU0nNs6bU00n/UTLPr58X78W
	4O2y9zBeSFBC9aI5YPcNXpZD5EDm6DlyfbtX6rhLVPN6EtnzI3hfOC/K+PQkpKverMcaP0
	6MX/SzmfqrjvAgKKL3Yvc8k9oxDYLMksdmEIi9ifQpwsaV0eUZ4wRT0xGfkLbl4QDn65nH
	yZ2wzgMAcTTP530CS6mmrc8066HROZbytmerxyTCPXGvIp1LWmNOlK+ADIRP5+kNEbF0FS
	tfbE7/S2rlI8oG/fTNnca1N748l+9zjUxNAJZCmaj2vUy47WSHcJY7U17+YaJw==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Liu Ying <victor.liu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 21/39] drm/imx: dc: crtc: Do not check disabled CRTCs
Date: Sat, 11 Oct 2025 18:51:36 +0200
Message-ID: <20251011170213.128907-22-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: f051028d3c2b282923a
X-MBO-RS-META: ztdi9s6gzfo1aq94hdnq1xhnz89pchbm
X-Rspamd-Queue-Id: 4ckVLw5YRdz9swL

If the CRTC is disabled, do not check it, as the check will fail.
Skip over the disabled CRTC.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
 drivers/gpu/drm/imx/dc/dc-crtc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/imx/dc/dc-crtc.c b/drivers/gpu/drm/imx/dc/dc-crtc.c
index 56991cb033945..4955f519db917 100644
--- a/drivers/gpu/drm/imx/dc/dc-crtc.c
+++ b/drivers/gpu/drm/imx/dc/dc-crtc.c
@@ -156,6 +156,10 @@ dc_crtc_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
 	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
 	enum drm_mode_status status;
 
+	/* If we are not active we don't care */
+	if (!new_crtc_state->active)
+		return 0;
+
 	status = dc_crtc_check_clock(dc_crtc, adj->clock);
 	if (status != MODE_OK)
 		return -EINVAL;
-- 
2.51.0

