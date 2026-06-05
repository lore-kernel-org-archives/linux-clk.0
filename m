Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B935B3FE667;
	Fri,  5 Jun 2026 05:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780639101; cv=none; b=cqMNkyCl0bYCa1Q93pc75p9Pxk5KU255xVAM5Y44RoxSPqowrKtLdLFB9wKl6foSt37kUGIRXPQvyaPiMWuFlBW/RDiBsMKcW5Hz57vIhSUfe32/1p4NlY6Xe0dlNwLn0lEK3leng5UzZildJYk03yH+B8r9TFmDyl3RPbZyyMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780639101; c=relaxed/simple;
	bh=BAcxVz7Dy+1NQW4ajsjRQaUxXlrsy4JR4V4XNqrr+OA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c1kE6Iu9ctHvmprrx4q6g27vDircpejkw7EZ9XkC/VKy2tmeBY4/yydAw9bnVN77mLSvUQi7mW+NW2jlnBpbTBKJjsDjFjXaZCxl3PZc4N1ti3DjavwiAoLhd+JleQK4/ersfZMR0yJilN9O2YuXzhDpYjoV09bbkjELjjgTvPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=DbmCziOv; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="DbmCziOv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=GD
	2Kr06zQNFkIwrVrOalWnuCkNJUXETOOuvMASHG1wc=; b=DbmCziOv5IknDVlK99
	daj1ffrq+HwEfO5hUp3zaUPHJ4mWsF+C0X1NdDeCRGSFmnlioqmZ+X+YV/rurLl9
	mBh+mTkxRqhtKkkPog+n9w1wGobIRA0raergS38laMxKw/+RLEz+nlQ58ctS4w4i
	6LLVuZ74B58zsqIPOawbfVo34=
Received: from haiyue-pc.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgAXkGE7ZSJqxsLwAQ--.65168S4;
	Fri, 05 Jun 2026 13:57:18 +0800 (CST)
From: Haiyue Wang <haiyuewa@163.com>
To: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org
Cc: Haiyue Wang <haiyuewa@163.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jammy Huang <jammy_huang@aspeedtech.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ASPEED MACHINE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 2/2] ARM: dts: aspeed: add 'resets' to video node
Date: Fri,  5 Jun 2026 13:52:43 +0800
Message-ID: <20260605055712.118501-3-haiyuewa@163.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260605055712.118501-1-haiyuewa@163.com>
References: <20260605055712.118501-1-haiyuewa@163.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgAXkGE7ZSJqxsLwAQ--.65168S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zr48Kr18WFy5Kw1UtF43Wrg_yoW8ury5pa
	y7Cr4kX3ySgF45t34UGFyDKr1DAay5JF4rKrsIk34UXry3X3sYqr1ftrsag34UXrs5uw1S
	gF1xXr9Fqw1DXaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zE3xhJUUUUU=
X-CM-SenderInfo: 5kdl53xhzdqiywtou0bp/xtbCzh+L9moiZT+z1QAA3Y

The aspeed video (be compatible for ast2400, ast2500, ast2600) now needs
the reset DTS handle specified, otherwise it will fail to load:

[    4.809494] aspeed-video 1e700000.video: irq 57
[    4.809977] aspeed-video 1e700000.video: Unable to get reset
[    4.810341] aspeed-video 1e700000.video: probe with driver aspeed-video failed with error -2

Fixes: e83f8dd668ea ("media: aspeed: Fix dram hang at res-change")
Signed-off-by: Haiyue Wang <haiyuewa@163.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g4.dtsi | 1 +
 arch/arm/boot/dts/aspeed/aspeed-g5.dtsi | 1 +
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 1 +
 3 files changed, 3 insertions(+)

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
 
-- 
2.54.0

