Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A502A241690;
	Tue, 13 Jan 2026 22:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768342327; cv=none; b=LDjy/j0HNPZ0vywLFQCllrsw5icLb34gHsgF4SAaO5/Uw7gFo2qAXCzD0lv79ER4oYC1burtnUJEEJv4anXm6gOQh+CicOTR7lpbbP4okkzcRSyXV7Gqe/0Bo/Dh61eaNbE5aTnlFw79dEesrxGT7lRgMi2y3ChxY/5awSyJH8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768342327; c=relaxed/simple;
	bh=z9Z05zc/VWYsbYT8EM5TL2vypSw4nX+Y7bZcGHAZZrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aRNrlsxWENSDzorcG311LF+pIZkJHttfytPxaIn9w9ncwaz7xAkjTnvXuDUTcxtXXtJt7mkU40kvh/9T2XafC8j5JycIp7+fPfc//u5iZCGP7z7ngsUvBnTeH6ayizODQWMKcZZWDv9Zht0bjBN2jOrTZv8Ia7eawb0xmD74hdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iLa9WMRa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iLa9WMRa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8D60C16AAE;
	Tue, 13 Jan 2026 22:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768342325;
	bh=z9Z05zc/VWYsbYT8EM5TL2vypSw4nX+Y7bZcGHAZZrM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iLa9WMRa0BI5mFgcBhKgbGqCqCyqiwiJ/6PFb+vhdT0ADLaybSrsgmuXzXWpPEIHO
	 heA+m6ymnnOLn9ve0MBQk+F4gzAhZmf4w1jOmPl6lJ2xl61L2WXVT42ytZemRdHAm1
	 MODsE1aLcKOESSF62wbUyMFPRLvGTQ99RvGXc8cHtrSk+jfRLiSzY3buGGGmfFjVcq
	 C6bsQ86ydXweYz0f1JNZtc97D/ZBHO2QF5aI6FVxfnNYhRUpDNUa0HIYoWSAbDyKzP
	 4llQnjdLBP4xEABt+SUP8gtsbotKPFjCXGgLBlWcPLm+qSPfo1qUrJfC1c/fO6nHBW
	 kdyMR7SN+84xg==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/3] clk: microchip: drop POLARFIRE from ARCH_MICROCHIP_POLARFIRE
Date: Tue, 13 Jan 2026 22:11:45 +0000
Message-ID: <20260113-doing-surplus-dc45866f71d4@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113-snagged-blemish-52af3d00d88e@spud>
References: <20260113-snagged-blemish-52af3d00d88e@spud>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=853; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=FjTWJC1wwS572Ik3G363c372pfHUYilsmPiBl9AksjM=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlph9UKVaf39veueVPBdfJ7xK4LS37bOJ3V2efFVGIeH LDNq/J0RwkLgxgXg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACYStZHhx1PL3/oqT4KWP9g/ 6/0RH4m5oVHX9nwUOxttmzj1MbOmOiPD/KrzVZG+q5W7HnJ9/Jt5QVpKKH/ZxEvrcrXLZR7p+Mz mBQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

This driver is used by non-polarfire devices now, and the ARCH_MICROCHIP
symbol has been defined for some time on RISCV so drop it without any
functional change.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/microchip/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/microchip/Kconfig b/drivers/clk/microchip/Kconfig
index 1b9e43eb5497..0c03b14699bf 100644
--- a/drivers/clk/microchip/Kconfig
+++ b/drivers/clk/microchip/Kconfig
@@ -5,8 +5,8 @@ config COMMON_CLK_PIC32
 
 config MCHP_CLK_MPFS
 	bool "Clk driver for PolarFire SoC"
-	depends on ARCH_MICROCHIP_POLARFIRE || COMPILE_TEST
-	default ARCH_MICROCHIP_POLARFIRE
+	depends on ARCH_MICROCHIP || COMPILE_TEST
+	default y
 	depends on MFD_SYSCON
 	select AUXILIARY_BUS
 	select REGMAP_MMIO
-- 
2.51.0

