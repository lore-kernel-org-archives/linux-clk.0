Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BD630ACF6
	for <linux-clk@vger.kernel.org>; Wed, 18 Feb 2026 20:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771447587; cv=none; b=Gio/piEO5eu98/zRCArUOCe/bwReNKl/whTvqY7r/hsXjGEUwsw3gNd/+3xF9rJq+jDRjLfrT0GPBe37PUXa4+Iu2sOWmzv1Zi2XGIvSzwsukKSDTFIIG325ODogEdehQh00iPrBkb87nD1PQZkh57DnhTSBTaKYlm0YCoKtmEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771447587; c=relaxed/simple;
	bh=zKvkw8v9FF0PR1wEseEBbs4PTvLJNPiF9dMfrp3ZWEM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jNkc3NExP7Hq4gsTCngnyqmLDymi1S7LHiWGLot3u8fGZI6xGcTdia2dkIXlbjhP6ERhs884zuyhxH2e+4WRy73Lq5FwDOddHXNHAZLaA2G4m7XxIClnj4rzoKA+kKIr9WlUEYN1NoqsbVmHdJWVw4UQH/RwluPpjG+sxmufUkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=BGf6hzfp; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="BGf6hzfp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GplsYPFeQZhA8hmi85G1RnmgDSDJoeTllgjYVKEvqno=; b=BGf6hzfpDysJGAUWiZ8A6IdSnj
	acCd5GSh0ktXU0OUy9MRDKRGX435P9xPCI0XSG3cSLPuNqTW53pZPEbuYjVpDpbWtnrctYfGKcSvO
	dCKRauWeyudTZSFg5cKvhjGJn6LqJkhF6Eat/BaOnHmzRM49gllAwwVLSs6Ye8NOcjmxKl/4CmqmW
	MC4W10683kTK3TC9DX6jOWeu58Km1NWs1DJadz8gDkP5uJb6w2Ckn6x7/w6xOI1Vnru3JqN/ABUpZ
	IKGzAwFsm2YTObiszt+lqxJAY6NlSYl/tArszVHlGcwSn2cRdAFNaBZo/IdiTqveGl5kkGqnRDiQY
	XJyhRt3Q==;
Received: from [187.36.210.68] (helo=1.0.0.127.in-addr.arpa)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1vsoR7-002Czn-7h; Wed, 18 Feb 2026 21:46:17 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Wed, 18 Feb 2026 17:45:02 -0300
Subject: [PATCH v6 4/6] drm/v3d: Use
 devm_reset_control_get_optional_exclusive()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260218-v3d-power-management-v6-4-40683fd39865@igalia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1335; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=zKvkw8v9FF0PR1wEseEBbs4PTvLJNPiF9dMfrp3ZWEM=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBpliT5sB3ZFCy2Lj4e/GrDRBgthB3BEgWndbO0n
 jdPHvYUChiJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaZYk+QAKCRA/8w6Kdoj6
 qlQ7CADGHZJHeQuSZ78/7NCV7q9u0Tc2ub+HmD0DtIz9YgfmgXw8KGT43tP2HAFEqIrmlugucyB
 zP73c74UPQK1Umo5VB+K6phUIGEgQZeEh5SdE8Bk558nptcMbtpd60OLq4vN2WU4EKhdhHjicvK
 7OU4lwpxFkUAtd3Z7IcXicAVa076/D1o3ccd42eS5529LKtteQIKFnQGdcnkjlcEOoArNpYmNB1
 3xkjfs2OlHAhuSI8tqttO5TkpdNhOYofMtt/hZnEQgdMtIm0OFB+stLsW1HRsONipc/4uZpyzxI
 q4J3q8PvY82l9zcZpTkj8d3kBwir1/H8MSqVcJcHYr+U/ET4
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA

Simplify optional reset handling by using the function
devm_reset_control_get_optional_exclusive().

Reviewed-by: Melissa Wen <mwen@igalia.com>
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

