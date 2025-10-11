Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2903027FB31;
	Sat, 11 Oct 2025 17:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760202202; cv=none; b=kKZ4am/67ZaCtdvijVgrmyT3ilbKfyeIshzgS5xR/78TrELh8rnQEH2LBuZu9N/eU4RjDt/4n/kmTv04DS+PE6k2SFoarEGyvl7jwCj3xWco0kkc0WAtRjSQ45FWULT8FRLkS7+kLOAplKwYETSNf9dlVXgGtYB7Ns63VJ0Ysac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760202202; c=relaxed/simple;
	bh=9VfWhM+p0UVGaUPq3rxbFVJrHIR8WIUnq2xbWEA0F6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=peCT7ECzORWj9aBt8yKa4jSxRQ5i9hZxMirVu2MBfjxzSiUfU76YVFgb9jPQEJBjGOQnhyqYTYVeaRRrf0QLpd0qr/t+Khry/w6LjIzc6Qktc1VljbLM2FehDH1M+Fy6N2+DEv9+BlOwUKHiFHBlqnRniNy0rkaRv2FYlPQNN7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=l38K8peq; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=sVZQg3/g; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="l38K8peq";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="sVZQg3/g"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ckVLG1ltMz9ssD;
	Sat, 11 Oct 2025 19:03:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=reH1wt6C0O/eRTa34RKSjvLRXlGuNFKnEeZMMo9A7JQ=;
	b=l38K8peqJVVl48GhgbBkNHiN00LShtt9aZvPGpJWx961DxAKKMufIcGVYWN6amPy12hPYQ
	CcGoK5YPDaofvPlqgVAVWbWlu11IvaNZp+H01LTdqE1YYUUeQT10LCMRaSCrHSkaEqCiXp
	uOZy9LqbIzpeXkfB7gHy4MnPr9uRKRkLO1agc7wWrgL60TVS7TrT7ijgKXdad2G5CUxMhD
	dLrzT6X5iKkmDoUEszsYBjLFnRcj7N8SqP9n8aEl0wNTUVDlpw4YvOaNP5pMY2XRnf2b+A
	wt/R+p/mzzz5F1vrO/Xqg4WuGZ+csySBVUlMxtLfDUyJzXgP40gxOmiYhG/7Iw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="sVZQg3/g";
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=reH1wt6C0O/eRTa34RKSjvLRXlGuNFKnEeZMMo9A7JQ=;
	b=sVZQg3/gJfjqG7FKz0sykSngOsgq3sXSPN+vRD++OFN+6ujOD3+LmP1biCjj5HPAlSs7C1
	VQBU4aa35jLS+w57CAzDIRMn5VnyHfTZACUE16lhJX/GSfxwqMOjhwKgxsJeMDuwR2SKKw
	N0Qq6+r3RsPpbSmbY0Hq+psREhU1Q/UhAHnYcM449oX0byjCLj8A6TS1d95CA25gYLCWAr
	T0pXPkX+LwkBplwloAH8JgOMJpChkcryNrz6/514XyGpXiitFHXeNo1pBO6ptmn3BjyG2I
	AgyAL9yXz34rgw5PqfQrITaUoxj6Gst5M0/GHEUSDRzeDXGW230FAWpYip1Ojg==
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
Subject: [PATCH 09/39] drm/imx: dc: ed: Rework dc_ed_pec_src_sel() to drop ARRAY_SIZE() use
Date: Sat, 11 Oct 2025 18:51:24 +0200
Message-ID: <20251011170213.128907-10-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: x1irqcuzz473g53s3tkhqfxd57yd5cqy
X-MBO-RS-ID: fef8ea9e8ee343f193d
X-Rspamd-Queue-Id: 4ckVLG1ltMz9ssD

Rework dc_ed_pec_src_sel() to drop ARRAY_SIZE() use and use new sentinel
trailing entry LINK_ID_LAST to stop iterating over src_sels array instead.
This allows passing of this array around as OF match data, which will be
useful when using this pipeline on i.MX95, which has different src_sels
array.

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
 drivers/gpu/drm/imx/dc/dc-ed.c | 7 ++++---
 drivers/gpu/drm/imx/dc/dc-pe.h | 1 +
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-ed.c b/drivers/gpu/drm/imx/dc/dc-ed.c
index 9a141c6aa0812..2fdd22a903dec 100644
--- a/drivers/gpu/drm/imx/dc/dc-ed.c
+++ b/drivers/gpu/drm/imx/dc/dc-ed.c
@@ -116,6 +116,7 @@ static const enum dc_link_id src_sels[] = {
 	LINK_ID_LAYERBLEND2_MX8QXP,
 	LINK_ID_LAYERBLEND1_MX8QXP,
 	LINK_ID_LAYERBLEND0_MX8QXP,
+	LINK_ID_LAST	/* sentinel */
 };
 
 static inline void dc_ed_pec_enable_shden(struct dc_ed *ed)
@@ -141,10 +142,10 @@ static inline void dc_ed_pec_div_reset(struct dc_ed *ed)
 
 void dc_ed_pec_src_sel(struct dc_ed *ed, enum dc_link_id src)
 {
-	int i;
+	int i = 0;
 
-	for (i = 0; i < ARRAY_SIZE(src_sels); i++) {
-		if (src_sels[i] == src) {
+	while (src_sels[i] != LINK_ID_LAST) {
+		if (src_sels[i++] == src) {
 			regmap_write(ed->reg_pec, PIXENGCFG_DYNAMIC, src);
 			return;
 		}
diff --git a/drivers/gpu/drm/imx/dc/dc-pe.h b/drivers/gpu/drm/imx/dc/dc-pe.h
index 866859403a79d..1e1e04cc39d4b 100644
--- a/drivers/gpu/drm/imx/dc/dc-pe.h
+++ b/drivers/gpu/drm/imx/dc/dc-pe.h
@@ -33,6 +33,7 @@ enum dc_link_id {
 	LINK_ID_LAYERBLEND1_MX8QXP	= 0x22,
 	LINK_ID_LAYERBLEND2_MX8QXP	= 0x23,
 	LINK_ID_LAYERBLEND3_MX8QXP	= 0x24,
+	LINK_ID_LAST			= 0xffffffff, /* sentinel */
 };
 
 enum dc_lb_mode {
-- 
2.51.0

