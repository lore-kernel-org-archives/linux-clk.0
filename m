Received: from mail-m3287.qiye.163.com (mail-m3287.qiye.163.com [220.197.32.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A636633998;
	Fri, 24 Jan 2025 07:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737702117; cv=none; b=stPL6aDoF/MO0YyVnGFBljN1oUZZaLZ9iTFnkkaAAtWaUD+rXwDi82snsgicd5h3mpeTEI2OgTe1ggSumMDi+2p+APsW/zA8d6VdnGeVtYcrjSKAoqj0nuvV5dgtZAlgP0uk8B8VDiNp1/QI/qQNraWEASw+8xo/Q4veP+z9y5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737702117; c=relaxed/simple;
	bh=a/V/wSEm7KdDoEYyugUj9n1jsunFSQQCOmDiOxdq7Qk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=eoSUXoaU6aqFkzlp4wvLBfUXgtsFnK1JAGEt+tzbhmz7vQ2VPJHi0NjSH6jl81DapjA/zdawMaCygJti8MI22VHeZbyuEwjOiIr9xyl01Dkjlfe56QQ5H+Zhr+vxw8Zoo0btWiy86xxFp0r4vDg6I/ViT/17SfPpuU67fDULS1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=JbnSTf5H; arc=none smtp.client-ip=220.197.32.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="JbnSTf5H"
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 994456f8;
	Fri, 24 Jan 2025 14:46:27 +0800 (GMT+08:00)
From: Elaine Zhang <zhangqing@rock-chips.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	kever.yang@rock-chips.com,
	zhangqing@rock-chips.com,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	huangtao@rock-chips.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 3/3] arm64: dts: rockchip: Increase VOP clk rate on RK3328
Date: Fri, 24 Jan 2025 14:46:19 +0800
Message-Id: <20250124064619.13893-4-zhangqing@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250124064619.13893-1-zhangqing@rock-chips.com>
References: <20250124064619.13893-1-zhangqing@rock-chips.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ09IS1YfS0JLGU8dTxpOSk9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a94970fde9c03a3kunm994456f8
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pyo6IRw5LTIPFiFOPxxWDCgV
	ETMKCzhVSlVKTEhMTEtKSkNDTU5MVTMWGhIXVQETGhUcChIVHDsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUpJSEo3Bg++
DKIM-Signature:a=rsa-sha256;
	b=JbnSTf5H++R3ygTmt8uxKJZpDxA73t5Yl3gKbPKTFIWzz1nFlGS09SHoasnzwdMJ9nu/cki5lj9HVDSCa3i15QUne8nf7pywl9cqbWyq1hbMuEOA9/LtG3ftIcLO65qQuvxdgmg0cfG4LcG1S2RZsZ2yGYMSvCuyHaqjXtSIMfM=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=hADYeSxIaFDxjGdz/t1RluyGz1DyiwM+3SkN2FMlmu8=;
	h=date:mime-version:subject:message-id:from;
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

The VOP on RK3328 needs to run at a higher rate in order to produce
a proper 3840x2160 signal.
Change to use 300MHz for VIO clk and 400MHz for VOP clk.

Fixes: 4b6764f200f2 ("Revert "arm64: dts: rockchip: Increase VOP clk
rate on RK3328"")

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
---
 arch/arm64/boot/dts/rockchip/rk3328.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
index f3ef8cbfbdae..0c905f411e92 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
@@ -842,7 +842,8 @@
 			<&cru ACLK_BUS_PRE>, <&cru HCLK_BUS_PRE>,
 			<&cru PCLK_BUS_PRE>, <&cru ACLK_PERI_PRE>,
 			<&cru HCLK_PERI>, <&cru PCLK_PERI>,
-			<&cru SCLK_RTC32K>;
+			<&cru SCLK_RTC32K>, <&cru ACLK_VIO_PRE>,
+			<&cru ACLK_VOP_PRE>;
 		assigned-clock-parents =
 			<&cru HDMIPHY>, <&cru PLL_APLL>,
 			<&cru PLL_GPLL>, <&xin24m>,
@@ -863,7 +864,8 @@
 			<150000000>, <75000000>,
 			<75000000>, <150000000>,
 			<75000000>, <75000000>,
-			<32768>;
+			<32768>, <300000000>,
+			<400000000>;
 	};
 
 	usb2phy_grf: syscon@ff450000 {
-- 
2.17.1

