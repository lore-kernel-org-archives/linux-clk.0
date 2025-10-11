Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C870281341;
	Sat, 11 Oct 2025 17:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760202238; cv=none; b=hD7kUI1uVo2vxDY9CcpAFRvPplvBtA8e/t9E1xBGTIv2JjGQIeNqrR7cSu7ZCV2LMyhS8K9WmSy/4ABi+Wat4z2aY+A5qvzejt8X6U0gLMjAbZLOkGmKfNJJaBtlO+WAyrFa2gIJ1gvxLXFh2DItO/ITHGNtezctEa9a73NOgYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760202238; c=relaxed/simple;
	bh=vJzPkWQx0FJxoZOsz2zAVrUKTdgxhYal3Zf3vr/Juzk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CMg49vyoGRumfHnazuJ9kWXccgr6Nhl7UAxHze9PTBVkoDaSr5BVxe5v5LyrxR+EAq9/D2VmU9zMlq2ImnbDq4P9gGorYm6Le1FG79N+2cxpStxXre4z3PauYgxQMAPjLeEIGvBjzDBRFadbjvcIL4k+Z/DILb78I1gVfieiFdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=AWC4OY53; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=FPYwYHwG; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="AWC4OY53";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="FPYwYHwG"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ckVLz23MCz9shj;
	Sat, 11 Oct 2025 19:03:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5x7eGxSqdqahcsNsi4pIR40YqVTPrVGWyiJFId9Q6oI=;
	b=AWC4OY53P0Wshc74k1wNC20wUDmtqrSWR/i35Mu2ek4zG1/UNWgtxLJY8r0z0wuoYx7h0U
	KxKI3pzK2E/zEkSyDKnsDenuJemH1Ue9430hnvIgtKbA4+lpxEsDj9JJERgRVfx92ds7Jp
	2qwRDt/OlUsiUcsh4I10EL0OZgbsBkYfu7glx5Tl5YhNre7d3x4nZU/CdM5B5fCrMlEiWP
	SlN6za3Om5yhgI3SVOJ4tbaxzH9OMzE8hoVx9HRbhM6BN4ovHNM3COD19i3kF24uQFDfWC
	8r+l1SgeMPTEbvDJInT9VE6Ls56FYqh/IseEbi428VNWCLAUfL8tZcPEJH6/yg==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5x7eGxSqdqahcsNsi4pIR40YqVTPrVGWyiJFId9Q6oI=;
	b=FPYwYHwGsgaKMJykXlYdeb8hfDk4QM3YCISlTRLSDQguvFJlTrAHPtw4UaFdJWWpS+0L3A
	egGY0DAAlPpJKk/5EV80+P1MUTmbWHiFlat5bHA/y7aGOOEoOJfhQptjBXZYk6LKGpgjnU
	q3aB5je22fs7g6HamzgRQ9JQLd/vMOiUWb/JQYH5yS7lT5QE7jemccpTVs+KYRgYPvEDnp
	0pT848f7AewIFDuLf/RifYHfc78wV4YMDNYP5iAPYPgXB6Mwww6ifKqldhQHW0gwWEVsNt
	xo4Nko9pt9BD6V332wC1uVhxeVJ6FkDZJrljly/aWI9D/3HEUG2DJXStnyxBmA==
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
Subject: [PATCH 22/39] drm/imx: dc: Keep FU unit running on i.MX95
Date: Sat, 11 Oct 2025 18:51:37 +0200
Message-ID: <20251011170213.128907-23-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 644aa3f3483981f0fe2
X-MBO-RS-META: dqrwba8s4rtthbm5cb5qayt8xn11umrf

The i.MX95 does not have CF inputs into ED, it must pull inputs from FU
otherwise the controller crashes into green screen panic mode. Keep the
FU running on i.MX95.

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
 drivers/gpu/drm/imx/dc/dc-kms.h   |  2 ++
 drivers/gpu/drm/imx/dc/dc-plane.c | 10 +++++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-kms.h b/drivers/gpu/drm/imx/dc/dc-kms.h
index 3e61dbb87afe7..af37523ae0be3 100644
--- a/drivers/gpu/drm/imx/dc/dc-kms.h
+++ b/drivers/gpu/drm/imx/dc/dc-kms.h
@@ -130,6 +130,8 @@ struct dc_plane {
 	struct dc_lb *lb;
 	/** @ed: content stream extdst */
 	struct dc_ed *ed;
+	/** @keep_fu: keep FU running on iMX95 */
+	bool keep_fu;
 };
 
 #endif /* __DC_KMS_H__ */
diff --git a/drivers/gpu/drm/imx/dc/dc-plane.c b/drivers/gpu/drm/imx/dc/dc-plane.c
index d8b946fb90de6..18010c2b0bd78 100644
--- a/drivers/gpu/drm/imx/dc/dc-plane.c
+++ b/drivers/gpu/drm/imx/dc/dc-plane.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/container_of.h>
+#include <linux/of.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
@@ -185,9 +186,11 @@ static void dc_plane_atomic_disable(struct drm_plane *plane,
 	if (!drm_dev_enter(plane->dev, &idx))
 		return;
 
-	/* disable fetchunit in shadow */
-	fu_ops = dc_fu_get_ops(dplane->fu);
-	fu_ops->disable_src_buf(dplane->fu, DC_FETCHUNIT_FRAC0);
+	/* disable fetchunit in shadow on i.MX8QXP */
+	if (!dplane->keep_fu) {
+		fu_ops = dc_fu_get_ops(dplane->fu);
+		fu_ops->disable_src_buf(dplane->fu, DC_FETCHUNIT_FRAC0);
+	}
 
 	/* set ExtDst's source to ConstFrame */
 	dc_ed_pec_src_sel(dplane->ed, dc_cf_get_link_id(dplane->cf));
@@ -219,6 +222,7 @@ int dc_plane_init(struct dc_drm_device *dc_drm, struct dc_plane *dc_plane)
 	dc_plane->cf = dc_drm->pe->cf_cont[plane->index];
 	dc_plane->lb = dc_drm->pe->lb[plane->index];
 	dc_plane->ed = dc_drm->pe->ed_cont[plane->index];
+	dc_plane->keep_fu = of_device_is_compatible(dc_drm->base.dev->of_node, "fsl,imx95-dc");
 
 	return 0;
 }
-- 
2.51.0

