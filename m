Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E6F43D4E0;
	Mon, 11 May 2026 16:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778515283; cv=none; b=ZWKIkzTJfq389AgKsnmY4DIMSNdmU314jmZd5jqN1Y1F+K+dF1MD2KEtEp84AyN9YPIEOIULWmtglw6aUX8MWFkbOtDYR+BGhGCxStj+amoz3h2LnWR90npc9gd05jdo8GKmEuY+/ix+LdKFqq50p8xlfvz2ZTzejv1Io9xRBsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778515283; c=relaxed/simple;
	bh=R9I/f75qY7Rz47zyfVcNUenIwxmv+W4uRzZz1ioK1WM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jgnNpcyRIYkwGfOASUtasdRfm4PCre4P3TlQ8N1pALYypx/xdul54wfLuLpHFbHqMaCWWwxyG/cFW0BJgzQdgUceh+CGsCDrZJOwLrA2tDJSJ4+uq7M+cAmewRpI7nuTL6WJA/dhLeeAKibj+b1cXO7QwjVZDrFGQMuNGQ9cMqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GfWsNqXZ; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GfWsNqXZ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 58A4DC5E154;
	Mon, 11 May 2026 16:02:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C0C1E60646;
	Mon, 11 May 2026 16:01:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 135E411AF9F28;
	Mon, 11 May 2026 18:01:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778515280; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=6oiAfU8MEqd8yhhPfwMPKZd93U5KjSCmMlrrYUL7Xn8=;
	b=GfWsNqXZruqSVKMtOrd5h42JmzCR9YPjA0HFLSg51xFjkEVh9hKU75eTnJNq/JwQDHcH9M
	7kJ2vfp207K1zAFvJ1OFrP1dBjeWDVI9estQcPXaoPXrBZd3sQeUGsHGfbocyfuBzZaeXt
	3VmCydfrC7B5hbslEIeMWdns4b/nVUGbauSmzz/sED9mZJNRkH9e3Z0paaCscn4fzsk//W
	lMZbYQCGtCqSW1LEaItWrtd+TiesxRr9RSBXAYpU5uKX2lTrtJ31awtgnJGetNtkYQTViT
	liJ6Wrlk1kSsQMHv76svSVHHXJeddzBnwbNKmHrBs96NQ/FWaSyBQfGUYseOYA==
From: Herve Codina <herve.codina@bootlin.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v7 1/1] clk: lan966x: Add MCHP_LAN966X_PCI dependency
Date: Mon, 11 May 2026 18:01:12 +0200
Message-ID: <20260511160113.34755-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511160113.34755-1-herve.codina@bootlin.com>
References: <20260511160113.34755-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The lan966x clock controller depends on the LAN969x architecture or the
LAN966x SoC.

This clock controller can be used by the LAN966x PCI device and so it
needs to be available when the LAN966x PCI device is enabled.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index b2efbe9f6acb..b52e2762b25c 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -278,7 +278,7 @@ config COMMON_CLK_LAN966X
 	tristate "Generic Clock Controller driver for LAN966X SoC"
 	depends on HAS_IOMEM
 	depends on OF
-	depends on SOC_LAN966 || ARCH_LAN969X || COMPILE_TEST
+	depends on SOC_LAN966 || ARCH_LAN969X || MCHP_LAN966X_PCI || COMPILE_TEST
 	help
 	  This driver provides support for Generic Clock Controller(GCK) on
 	  LAN966X SoC. GCK generates and supplies clock to various peripherals
-- 
2.54.0

