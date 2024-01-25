Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27E073189
	for <linux-clk@vger.kernel.org>; Thu, 25 Jan 2024 15:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706196903; cv=none; b=Bkp/2pEzUSjW0M9xPktRoAKd/6a66I4XfBl4byviTETSWDzof8UMfPvZqx67dJjWxu7mguiPgrNbRFDKoOYP+zRINIzJ++qwazVNEGzri7zU654ppOmk9klONwCtalzDzXi5CPZRp5dF66PVnbe1sAvzI3R1cVjkKt41rSF4NL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706196903; c=relaxed/simple;
	bh=0TGfRaUL8XLmTNfh33ISJohnS5YYx5gYmV4XHl9DlqA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dWGd99BISyQoGrVThAvxXSVeJpTnMOoGlQHuoLiPRDcyBAxOkoDtltsJauKTpgS60C0z4CNV0SmnKq8YirUZnm2KBa7UECB5l7qlTWgi7fj9mRjiIX8dzhEUYkDkp0w6g/75LmGGecYgX1cmwfI1kmX1CmyQNmaRABUiPI6rUPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:bc9e:fcb8:8aa3:5dc0])
	by baptiste.telenet-ops.be with bizsmtp
	id f3am2B00458agq2013amrm; Thu, 25 Jan 2024 16:34:57 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rT1jo-00GUw6-6m;
	Thu, 25 Jan 2024 16:34:46 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rT1kc-00Fs31-6D;
	Thu, 25 Jan 2024 16:34:46 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Cong Dang <cong.dang.xn@renesas.com>,
	Duy Nguyen <duy.nguyen.rh@renesas.com>,
	Hai Pham <hai.pham.ud@renesas.com>,
	Linh Phung <linh.phung.jy@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 10/15] soc: renesas: Introduce ARCH_RCAR_GEN4
Date: Thu, 25 Jan 2024 16:34:38 +0100
Message-Id: <a283913ba7a39ec2dae0ebf9fc2b06096f009511.1706194617.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706194617.git.geert+renesas@glider.be>
References: <cover.1706194617.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, all Kconfig symbols for R-Car Gen4 SoCs select the
ARCH_RCAR_GEN3 SoC family symbol, which might confuse the casual reader.

Fix this by introducing a new SoC family symbol for R-Car Gen4 SoCs.
For now this just selects ARCH_RCAR_GEN3, to avoid duplication, and to
relax dependencies.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Once "[PATCH] i2c: rcar: Prepare for the advent of ARCH_RCAR_GEN4"[1]
has been applied, ARCH_RCAR_GEN4 can stop selecting ARCH_RCAR_GEN3.

v2:
  - Add Reviewed-by.

[1] https://lore.kernel.org/r/bf7b105f7d9728ae5cd9fa99d1cdd278d71e7df2.1704723713.git.geert+renesas@glider.be
---
 drivers/soc/renesas/Kconfig | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 1c14be3e46e58ef1..2367385d84b5a17d 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -38,6 +38,10 @@ config ARCH_RCAR_GEN3
 	select SYS_SUPPORTS_SH_CMT
 	select SYS_SUPPORTS_SH_TMU
 
+config ARCH_RCAR_GEN4
+	bool
+	select ARCH_RCAR_GEN3
+
 config ARCH_RMOBILE
 	bool
 	select PM
@@ -245,7 +249,7 @@ config ARCH_R8A77961
 
 config ARCH_R8A779F0
 	bool "ARM64 Platform support for R-Car S4-8"
-	select ARCH_RCAR_GEN3
+	select ARCH_RCAR_GEN4
 	select SYSC_R8A779F0
 	help
 	  This enables support for the Renesas R-Car S4-8 SoC.
@@ -266,14 +270,14 @@ config ARCH_R8A77970
 
 config ARCH_R8A779A0
 	bool "ARM64 Platform support for R-Car V3U"
-	select ARCH_RCAR_GEN3
+	select ARCH_RCAR_GEN4
 	select SYSC_R8A779A0
 	help
 	  This enables support for the Renesas R-Car V3U SoC.
 
 config ARCH_R8A779G0
 	bool "ARM64 Platform support for R-Car V4H"
-	select ARCH_RCAR_GEN3
+	select ARCH_RCAR_GEN4
 	select SYSC_R8A779G0
 	help
 	  This enables support for the Renesas R-Car V4H SoC.
-- 
2.34.1

