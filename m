Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952062D7BF
	for <linux-clk@vger.kernel.org>; Fri, 13 Feb 2026 18:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771008833; cv=none; b=CxapWcFETGot4RrpAqNHnTc/lzcEmM4B4o0cTeZZ9CtZzrsFQxqEKbVYo6yUo6/fm44jONiBo2hmvtIim1ROYlvLD7frD4fvClGJzja2xLMBnbztP8XjYRZjEmTjNov+w6Imtov9ME6mQXkBHgbZjcCQAYaOdu5cRTlxABC2mK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771008833; c=relaxed/simple;
	bh=VVOb/XUviLeT12jZtnMIPJt73eqnYgRxcBkulCeWd3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BDXkaoOd+DcmjMmljcJBu9Q9XSma9NHMO201S/fGSHQllYwUeXv342VKV+ZdoSH7EIluYvN6UF17DkfYwRCG2+HHMq2owBuSQW2vnEvNQEjN4S8qKjyKCnUi3ZfPE+UAt6BRvP15sbrG0by7S4/tHTKID+QKuZEhQHvQJYssJJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=mSRflkiX; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="mSRflkiX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CQFK7fNypXqHYahd2jW/2UtLh5zyB5BpeUAqJ0QJCwo=; b=mSRflkiXG5Bliu6L6tMjJGNI2G
	qeasDKBrm/3OFZUHVB4GXagzSPKKYnCKngfdOEk6bKK4Chduxvz422MRzCqD29XuBbXrlei21wINf
	etoxrWuGIMImQOtW7VHiq7JVECstahXNEK9dtPygepwnB3S5YIoR4d+SGfgggNUZg3yPaehB+TC2I
	42EAfLE2q06g2tstTpbNC+xtiuPqT2QvbPq1OjZ8APKiFzb940+yBx+gOKtdDynukieBGDpWovHad
	KEH0Rp/u3GlqVpBwCoYCza186bUYb/QZxPbEH3E1hibZ0aSjjoAX5nO94R8Sbm7JbZvlt0zoZETjC
	61PyafZA==;
Received: from [187.36.210.68] (helo=janis.local)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1vqyIL-000Sqv-KD; Fri, 13 Feb 2026 19:53:37 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Fri, 13 Feb 2026 15:52:54 -0300
Subject: [PATCH v5 1/7] clk: bcm: rpi: Let V3D consumers manage clock rate
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260213-v3d-power-management-v5-1-7a8b381eb379@igalia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1709; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=VVOb/XUviLeT12jZtnMIPJt73eqnYgRxcBkulCeWd3s=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBpj3MmrFXrabZfr6bZk8LDXdl0LlEUejJ4I0bHl
 mzpe0ZEVviJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaY9zJgAKCRA/8w6Kdoj6
 qt+lB/0XaoS+KO47FfTJn5zrTtiWF/AgdfDn9ovVNuGlLNOmPLL56UUnpUXprSFbpmMG919vw9Z
 cgouYx4C2sUxeiMjrxDm/uFtlxBtelmXKlk6F84zvTDHb+7593XVyt6zic7VQFZjh68aLPGFhDH
 NANKLMQ3VJhNQcwCVgni7lMnQajs+ZqnK5mR1hFSWa4scgzcUMT23ZVdNEy+Mso4Ff9C5xert0+
 STtasmhKVSru+oAwVoyKscGz4jbTdQmFCGbsqeiRuLpEWdqSSIQX4gcp1LarxFpdEGrwRnTtpD0
 MIM7Kah9o9dZ3PGTmv3Mn6gvrJ8JloK/tf3OPI7+Z6OH9juE
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA

Remove the `maximize` infrastructure and don't set `minimize` for the
V3D clock, giving consumers full control over its rate.

On some firmware versions, RPI_FIRMWARE_SET_CLOCK_STATE doesn't
actually power off the clock. To achieve meaningful power consumption
reduction, consumers need to set the clock rate to minimum before
disabling it. Forcing the clock to maximum rate in the clock framework
prevents this, as consumers don't have any flexibility over the clock
rate.

This change enables the v3d driver to control the clock rate directly
in its suspend/resume callbacks.

Fixes: 6526402b9bac ("clk: bcm: rpi: Maximize V3D clock")
Acked-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 1a9162f0ae31e330c46f6eafdd00350599b0eede..9783385d5859836898683209e320fcc928dfdc71 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -68,7 +68,6 @@ struct raspberrypi_clk_variant {
 	char		*clkdev;
 	unsigned long	min_rate;
 	bool		minimize;
-	bool		maximize;
 	u32		flags;
 };
 
@@ -136,7 +135,6 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	},
 	[RPI_FIRMWARE_V3D_CLK_ID] = {
 		.export = true,
-		.maximize = true,
 	},
 	[RPI_FIRMWARE_PIXEL_CLK_ID] = {
 		.export = true,
@@ -387,9 +385,6 @@ static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
 		}
 	}
 
-	if (variant->maximize)
-		variant->min_rate = max_rate;
-
 	if (variant->min_rate) {
 		unsigned long rate;
 

-- 
2.52.0

