Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BA03FD969
	for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 10:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782815463; cv=none; b=R9QLwS5cNNxnAMy+QiXoVLt6SAlz4nnCSQ4sEHaC6neje/QHLS8rfK2J/lJjsa4mSuvOZtstt1t0GZG3xt7fFOI4+EqPzIZrLV0EC9QNE+bBb0cJfSLlfn+gr/LjqZKEj11j4NXsagJiZMC9qVdntlYQy8zaFQ2+OMc97C8N8eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782815463; c=relaxed/simple;
	bh=KhZ29hUfHbTotTVPIL5qx+EpsKhLuA3F3UXpEGa1Wa4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sFaocHf0jVnYRd83DFAk2uTOKt2YHEVj2iR0EEW4FDrPkoyJUbHlHEO8Lz/XOEOhAUSkj03C1HPytFeYSV842EyhHRmzKnC3BPF9Po7/tz2RaFReRGA3kDLlF04aGiAgYNcsuQmhBzP4d8usmbNm/Bzj66otidQrEowjNiUhTWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=flwC9c1n; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="flwC9c1n"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 23AE74E40BA0;
	Tue, 30 Jun 2026 10:31:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EC9646025A;
	Tue, 30 Jun 2026 10:31:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1BE9A106F1D9E;
	Tue, 30 Jun 2026 12:30:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782815460; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=6aAV6J+flG80DqQyTBOfx0qRB04d2SkokZNF7zHVlMc=;
	b=flwC9c1ngD6gq6TcbwQw/QbA7b/pJdKfs//INiLlJlmJHZxOCwwoDk+ebZLPk3UvwalB6f
	svJ27rKuF8WhJHUbnZk/WkGu96spkX4ixDGMJBdIHdizcd76r5n0X21cREmc5MXiRCiRUN
	xeMrHgMcluXKaNlMg5IVI914+VjLQdjOsTVUVf9pKec9/y/3DJ00PiLlImtCYWcbTFwP6M
	be07J7KgynJBkCtfvu/6ZFWEJv+ABG+XIFnAwwLlWXO615V6u2mbUehmcisr4keTsKWObV
	R2LaeM7PczJZmnEey+w2QBGl0dvQWmbWUqnOmXuSWfW6VA/aftj1/ELsg2fhvQ==
From: Herve Codina <herve.codina@bootlin.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v8 1/1] clk: lan966x: Add MCHP_LAN966X_PCI dependency
Date: Tue, 30 Jun 2026 12:30:50 +0200
Message-ID: <20260630103052.413750-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630103052.413750-1-herve.codina@bootlin.com>
References: <20260630103052.413750-1-herve.codina@bootlin.com>
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
index 1717ce75a907..682840e67798 100644
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

