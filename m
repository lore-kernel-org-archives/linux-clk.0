Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3B93B8D65;
	Fri, 27 Feb 2026 12:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772196009; cv=none; b=QSmInw9Yro1ieVPmbSO0I2Bx0JKGh14Zm+5tNGsLIM7YAb07/ZFO9TK+zkwqYoomw4SkXxE30gSf70Zw/ZofN0z8jdAoLXIVmOtO5CJU/qtmujwteV1PWK63/HfgID3f9d8Kg4cYoH3kLLpo1Z3DqbKPeQWZy9inpOgLuEEMtcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772196009; c=relaxed/simple;
	bh=K0uFcYc8z7l2MbnmQedUh73UanP92K4JeS+y2IHBi9c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MQFOcLBvZiC1X9dmw2lPunzKZdyrfxrHq+u/XkUIXqzTl8vhYWBUDUa+ledtDAwAChKGCfLUY/5RQ/P1GTqbNPHkpxoBLCznAWyunAnuKxVkWY58IINxFl8kFkZta76/ZYv4PKljyLiuaaejg8bUPZWbrDBqEBWJp6fESU1gzGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=KZvqmy3m; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="KZvqmy3m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=NX
	TTrP09ok8P1ADALF0SM5UyW54TzFEn7w+8c0zTzDU=; b=KZvqmy3mWTikNkQyaz
	q9CZknh6ZVkKzVdWMH0Z/djgs5syMgzsZUtcH1SfhRohy0uAMYPdTD+S+Lr88GBV
	ArCknp5cNn4fskWfepxhVLgZCmpyGpyWRQri1T9Z3e5EM8EN+rZ41gG1bGK2EO1m
	ihtJCUtCvkUe6D4krGETxHvhc=
Received: from haiyue-pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wCHdgpQkKFphei7Mw--.10871S2;
	Fri, 27 Feb 2026 20:38:42 +0800 (CST)
From: Haiyue Wang <haiyuewa@163.com>
To: linux-aspeed@lists.ozlabs.org
Cc: Haiyue Wang <haiyuewa@163.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jammy Huang <jammy_huang@aspeedtech.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ASPEED MACHINE SUPPORT),
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK)
Subject: [PATCH v1] media: aspeed: Fix driver probe failure
Date: Fri, 27 Feb 2026 20:38:24 +0800
Message-ID: <20260227123837.70079-1-haiyuewa@163.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCHdgpQkKFphei7Mw--.10871S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGw1fKF45tF17Gw4DZw47Arb_yoW5Ww48pa
	yUCFWvq3ySgF45t34UGF9rKr1kAa15JF4F9rsIk34UXrW3X3sYqr1ftrZaq34UXr4kCw1a
	gFn7Xr9Fqw1kXaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0z_sjjJUUUUU=
X-CM-SenderInfo: 5kdl53xhzdqiywtou0bp/xtbC7xL6ZmmhkFLb7wAA3f

The aspeed video (be compatible for ast2400, ast2500, ast2600) now needs
the reset DTS handle specified, otherwise it will fail to load:

[    0.000000] OF: reserved mem: initialized node video, compatible id shared-dma-pool
[    0.000000] OF: reserved mem: 0xbb000000..0xbeffffff (65536 KiB) map reusable video
[    0.377039] videodev: Linux video capture interface: v2.00
[    4.809494] aspeed-video 1e700000.video: irq 57
[    4.809977] aspeed-video 1e700000.video: Unable to get reset
[    4.810341] aspeed-video 1e700000.video: probe with driver aspeed-video failed with error -2

Fixes: e83f8dd668ea ("media: aspeed: Fix dram hang at res-change")
Signed-off-by: Haiyue Wang <haiyuewa@163.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g4.dtsi   | 1 +
 arch/arm/boot/dts/aspeed/aspeed-g5.dtsi   | 1 +
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi   | 1 +
 include/dt-bindings/clock/ast2600-clock.h | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi
index c3d4d916c69b..1547e28d77e2 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g4.dtsi
@@ -242,6 +242,7 @@ video: video@1e700000 {
 					 <&syscon ASPEED_CLK_GATE_ECLK>;
 				clock-names = "vclk", "eclk";
 				interrupts = <7>;
+				resets = <&syscon ASPEED_RESET_VIDEO>;
 				status = "disabled";
 			};
 
diff --git a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
index 39500bdb4747..793570ca2518 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
@@ -296,6 +296,7 @@ video: video@1e700000 {
 					 <&syscon ASPEED_CLK_GATE_ECLK>;
 				clock-names = "vclk", "eclk";
 				interrupts = <7>;
+				resets = <&syscon ASPEED_RESET_VIDEO>;
 				status = "disabled";
 			};
 
diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 189bc3bbb47c..3adf48987a17 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -428,6 +428,7 @@ video: video@1e700000 {
 					 <&syscon ASPEED_CLK_GATE_ECLK>;
 				clock-names = "vclk", "eclk";
 				interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+				resets = <&syscon ASPEED_RESET_VIDEO>;
 				status = "disabled";
 			};
 
diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
index f60fff261130..7b9b80c38a8b 100644
--- a/include/dt-bindings/clock/ast2600-clock.h
+++ b/include/dt-bindings/clock/ast2600-clock.h
@@ -124,6 +124,7 @@
 #define ASPEED_RESET_PCIE_RC_OEN	18
 #define ASPEED_RESET_MAC2		12
 #define ASPEED_RESET_MAC1		11
+#define ASPEED_RESET_VIDEO		6
 #define ASPEED_RESET_PCI_DP		5
 #define ASPEED_RESET_HACE		4
 #define ASPEED_RESET_AHB		1
-- 
2.53.0

