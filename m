Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DA617BA2
	for <linux-clk@vger.kernel.org>; Fri, 13 Feb 2026 18:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771008835; cv=none; b=i1/VkTbuWpRxuNiizJQhkOsdKrFYlf32g9q65IWxi4NJ8PZ2wwY0f6xNfHxBxtuppGOHAMOCvw/88rdsr8aQPIk7NEo3+q6kUxbFOe7mwb1antjbw0pLXFBP1TWJ7ArSMOjuUCPOaXb4ybLFwCFU7af6vdotaxauxU2Jz+froBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771008835; c=relaxed/simple;
	bh=HBxi3kNHRo5O0aV4BChTV5TSpsgJgBHlM1/y8UtvZUU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I6+yt7+OQqoIdPI+1zPgCkKs+FEP0Dvmwl3Xj2Ba4mzeRXrOXAQKiRy9xTJ35cALUn2SF9PTrP/3RlbO2X9uMmCjtTwad/70s9gpZ9c9bjTQ6no02fIGTs5sPgUqzYRSvjQ9GUGJ1No4j0zIjRXoa3l74IEwntiO14kQTAcX61w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=CpZGI8qy; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="CpZGI8qy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=B7kyYc7RhFlSmWPDvngvLP1/s4eswS0lTVZC8IrSTyE=; b=CpZGI8qyCIMo+OMelR1i3BTasv
	9kSUjpIrWCOUC1cJ7H9gvErFUVJU/BAm0mqKgsIcVfqghIm2jflO4/JcPGoANX/hQvXgFzPV4JD/4
	YokmJGyDIh4fPlyvJcqZohPI2KhWG1FZqkhrPe0AnWdnkCpzSUsQhUDtdpZMCwNwYGShBYnYs5H3B
	oKJ1Sd+48azHSHem6uhL35JdU+BVTS0MWhIosRNlw5b5/JIcZ+fvHpwWv713i9lO6BXuvLVksuseo
	MvcktL1nHe0CFOhOTs5oeVxCzyHgtPtbAb6uZS8xVaX4dkiz9Pn/Y4MygmlyrhuObxADKckcQ/IRc
	OqVkJ2aw==;
Received: from [187.36.210.68] (helo=janis.local)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1vqyIV-000Sqv-6O; Fri, 13 Feb 2026 19:53:47 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Fri, 13 Feb 2026 15:52:56 -0300
Subject: [PATCH v5 3/7] clk: bcm: rpi: Mark PIXEL_CLK and HEVC_CLK as
 CLK_IGNORE_UNUSED
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260213-v3d-power-management-v5-3-7a8b381eb379@igalia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1280; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=HBxi3kNHRo5O0aV4BChTV5TSpsgJgBHlM1/y8UtvZUU=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBpj3MnYo/iZkBtNmHy7DgL98cfawDSUxrZ3C6W/
 Hyq5Mrs2S+JATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaY9zJwAKCRA/8w6Kdoj6
 qqKPB/9uUrk2XxuRREhqIK1Gp1czPekJovQytk2jlxJZM7KwbmEGAXkEO41Oyx+/jktiigflnnF
 EIvL+mvfjBVVYwynfouOiGH4ayQaVjj18eOJh+UQbpng3VakKYihZ4mf9n4wsAHoGw+mzQd2sRV
 WEBZ+xfrrsdmgrZwT70DEJi11MtejwhAZNk6MXkWSST6IrjQnbgyeyLP0cuMv81e/m1G37NwCrX
 on/oPfyf9gfLOLhh1mV0n6A/xaHEfrSve8odzP3NvYOH42ltilbvd7qiWGQ2OKnu+yn+TTuK3zI
 nDZiSkhB+vc+upEUKC7lkJljyCKvboHNeZiV7JypK33FiWFn
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA

If PIXEL_CLK or HEVC_CLK is disabled during boot, the firmware will skip
HSM initialization, which would result in a bus lockup. However, those
clocks are consumed by drivers (vc4 and HEVC decoder drivers,
respectively), which means that they can be enabled/disabled by the
drivers.

Mark those clocks as CLK_IGNORE_UNUSED to allow them to be disabled by
drivers when appropriate.

Acked-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 2e63121af0900ac9b4874b666cf6d02baa8be11c..b9f2a4dc1510ff162c84d67aa0ddd7f435156398 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -139,12 +139,12 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	[RPI_FIRMWARE_PIXEL_CLK_ID] = {
 		.export = true,
 		.minimize = true,
-		.flags = CLK_IS_CRITICAL,
+		.flags = CLK_IGNORE_UNUSED,
 	},
 	[RPI_FIRMWARE_HEVC_CLK_ID] = {
 		.export = true,
 		.minimize = true,
-		.flags = CLK_IS_CRITICAL,
+		.flags = CLK_IGNORE_UNUSED,
 	},
 	[RPI_FIRMWARE_ISP_CLK_ID] = {
 		.export = true,

-- 
2.52.0

