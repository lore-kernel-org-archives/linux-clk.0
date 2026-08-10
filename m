Received: from mail.zlab.su (mail.zlab.su [109.73.193.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBA63E3D95;
	Mon, 10 Aug 2026 12:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.73.193.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786364173; cv=none; b=QGNh88lACe3axATVdc+pWHvwE+/8la7wRhVzybHMCheKpvQJ+kJp+ebU6kCgUUx/Oj04wwrNa0vJm6UgrYmE6oM8bHu0HhV9ztA14xpe7AkcnuqTOX4nQBoTh/LWamn/MMQcKDe9OPE8opHy0w2KGZ1KCxaza8EaDzQwUunAr30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786364173; c=relaxed/simple;
	bh=EwKoWzxvDb5lS4G45Dto+QJmOfcdYoSvXcSRxB560Iw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iDiFsl/PUK7OantKy9uHLQGkSzgw08pFS1vJ8xky+LhfkyY9aV193Lruv56Qs0knMSlmCOnwQEHc0n86PNfrmkqNsjus1zVcIoe3pHHuxmJYPVCr+qZUI+z+CnDiWcs7DWOtGABYO/BockayS+WlY48p/3y0HxN5P1HTNHqJMcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zlab.su; spf=pass smtp.mailfrom=zlab.su; dkim=pass (2048-bit key) header.d=zlab.su header.i=@zlab.su header.b=Gx68abnp; arc=none smtp.client-ip=109.73.193.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zlab.su
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zlab.su
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zlab.su header.i=@zlab.su header.b="Gx68abnp"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BB488C051B;
	Mon, 10 Aug 2026 15:16:07 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zlab.su; s=dkim;
	t=1786364169; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=35Y1Mvqm3PQ758mkGyOjdGnkGXdHZYwPhqgHLSP43Hg=;
	b=Gx68abnpQU5Lp0EKxuXN1cc0xMlytXhI2rmEwQfBATpwZs6Rfk2GOdbep2obCGjzjeouRt
	k9s+rCU4ZzOvKn6ckL23ULBJrOH25KUTKzt1nrBqnauejqvTDUdwmc5kGloiXkhLaYiRLc
	Gy/v9urBQ7DFNZBIS2+yQZDkVsePckZzxbSKb/2VIqcCBDYEgPatZmolJRcIEC644pZVnq
	WUUFb+M/bIY2Mx+CWUgDv9S/lpyEHzeVPPZvgTdAlpO4iAZfScUYDtFszzBtmJyXEcOZRD
	59aft1pDiFvpoBuU0pKpoBzBkQyOxJNEP243mgOj/0JP2s1CL2ETJ66CCXbIjw==
From: Vladislav Leonov <vlad@zlab.su>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladislav Leonov <vlad@zlab.su>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 13/25] ARM: dts: rockchip: Add DMAC node for RV1106
Date: Mon, 10 Aug 2026 15:11:04 +0300
Message-ID: <20260810121121.210040-14-vlad@zlab.su>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260810121121.210040-1-vlad@zlab.su>
References: <20260810121121.210040-1-vlad@zlab.su>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Rockchip RV1106 has a single ARM PL330 DMA controller with 8 channels,
shared by the peripherals. Add the dmac node with its 8 event
interrupts plus the abort interrupt.

The controller needs arm,pl330-periph-burst to use burst transfers for
peripheral requests, as on the other Rockchip PL330 platforms.

Signed-off-by: Vladislav Leonov <vlad@zlab.su>
---

 arch/arm/boot/dts/rockchip/rv1106.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rv1106.dtsi b/arch/arm/boot/dts/rockchip/rv1106.dtsi
index 43d992e3e2d6..4abc333ab370 100644
--- a/arch/arm/boot/dts/rockchip/rv1106.dtsi
+++ b/arch/arm/boot/dts/rockchip/rv1106.dtsi
@@ -235,6 +235,24 @@ u2phy_otg: otg-port {
 			};
 		};
 
+		dmac: dma-controller@ff420000 {
+			compatible = "arm,pl330", "arm,primecell";
+			reg = <0xff420000 0x4000>;
+			interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			clocks = <&cru ACLK_DMAC>;
+			clock-names = "apb_pclk";
+			arm,pl330-periph-burst;
+		};
+
 		i2c2: i2c@ff450000 {
 			compatible = "rockchip,rv1106-i2c", "rockchip,rk3399-i2c";
 			reg = <0xff450000 0x1000>;
-- 
2.47.3

