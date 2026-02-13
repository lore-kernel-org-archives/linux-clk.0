Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4FB28850D
	for <linux-clk@vger.kernel.org>; Fri, 13 Feb 2026 18:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771008836; cv=none; b=bv01RpJXty5uFdWarKlDv6QvHy/d8cnuTawKYnowZ9pCi7yzUAFl6pJ+r5a2lpk3VblH87QmhYkVzCgSjI8vZj7k24ncbJ77OQ6SyCNUxblqa1XZ+WHuYH+a3MLmJ/cxezMekxOmqqtFgdEjUXDwRgxlncpKN+k2fU3qgx2yH2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771008836; c=relaxed/simple;
	bh=SXWOiF7riXcp5Tqr9aEaZy6vMsWyYl4q2EW7PvyU9gw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OVZmX1mbeLMKp2TaHvsJ/f9N7xzIJy+fXuBA5xDQLXJbIM6wjt5e0stUtXYvohTyZEaRIfhKEUKEAvpAMlzuJe+pYb3V7O1VB7q99ZDt3OMDyTQI300/l6TlnEeYAnk1nK/gIMLxTv4Q76FayPBu2YTWIP8593bbklm6OfRXYec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=S+w/EO25; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="S+w/EO25"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VooHUkILlEX22HM+1BGptL6pUZJWCXhW2aLCAvE9vk8=; b=S+w/EO25Iw0KjjlzEY15Yq5eng
	wc6jSMH1Abhtv/ZSCdCAQRvaQSCzltFU62TF07r9ibhIRC0JcmOzKEfieh8oWimEfbffT3/pZRXJa
	fR0/3BibLW8KHzB6CqsCHJIWrdTYAeH3y0dXkC++I6STZeZo97H9ciVwxgkrE7O5t7atlZSIXPquf
	FaB6zHHjds0b0q4qXi1DunPFeRH8HtOQw9b4PAaytyD7Jnhtev3nthh2k+VLFIO1dbQUxnsQm5daG
	P0s5WRJXDNSLcL7NMysLbXlgQOdhkdQfuF6v7C4ono182lWiw7H7Ma1/AxUMhWo75om69g5t4wv60
	LQ18U4CA==;
Received: from [187.36.210.68] (helo=janis.local)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1vqyIQ-000Sqv-JG; Fri, 13 Feb 2026 19:53:42 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Fri, 13 Feb 2026 15:52:55 -0300
Subject: [PATCH v5 2/7] clk: bcm: rpi: Add a comment about
 RPI_FIRMWARE_SET_CLOCK_STATE behavior
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260213-v3d-power-management-v5-2-7a8b381eb379@igalia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1275; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=SXWOiF7riXcp5Tqr9aEaZy6vMsWyYl4q2EW7PvyU9gw=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBpj3Mnif2SqX0u6MgSpyCyhGxMZzZL4MbZXRgRu
 t4pFmMz/JiJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaY9zJwAKCRA/8w6Kdoj6
 qkGUB/4pxbwzh3KhFyKOzblO+HwdyoUDKseNz6oOQ9Z7CjdWxHn1B0350PaFJnbkWFMRPguYnan
 65Nnlg21IN8P9z3w6XmQginz0nNeWZ6dagnfii2/75z3MIQBpoT2ZaWvGfm+juoQnbB+/R/VbFc
 OJIONbrnxyMIDAlhmZPti8oHxGK9U9kLtacsF9afN/nkC2KrIos2+0ydifCRKWFVQfAAAF4qXuV
 0s+SE0o8QjOwE7lkLgliXr5eQuXtdY+Cx6pqzfB19h/xEPz1w117EG7LJS+r2iLQuUuaCkszrjJ
 qYXc+jh+OY2S5EMUW/eHujJ2wOnwel1Goka3Omu0ME1fsJ8+
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA

On some firmware versions, RPI_FIRMWARE_SET_CLOCK_STATE doesn't
actually power off the clock. Document this behavior so that clock
consumers understand they may need to set the rate to minimum before
disabling for meaningful power savings.

Suggested-by: Stefan Wahren <wahrenst@gmx.net>
Acked-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 9783385d5859836898683209e320fcc928dfdc71..2e63121af0900ac9b4874b666cf6d02baa8be11c 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -308,6 +308,12 @@ static void raspberrypi_fw_unprepare(struct clk_hw *hw)
 	u32 state = 0;
 	int ret;
 
+	/*
+	 * On some firmware versions, RPI_FIRMWARE_SET_CLOCK_STATE doesn't
+	 * actually power off the clock. To achieve meaningful power consumption
+	 * reduction, consumers need to set the clock rate to minimum before
+	 * disabling it.
+	 */
 	ret = raspberrypi_clock_property(rpi->firmware, data,
 					 RPI_FIRMWARE_SET_CLOCK_STATE, &state);
 	if (ret)

-- 
2.52.0

