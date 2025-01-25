Received: from mail-m3288.qiye.163.com (mail-m3288.qiye.163.com [220.197.32.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF011DE4EA;
	Sat, 25 Jan 2025 01:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737767766; cv=none; b=tm2uwNFOGaYCtXpz8c1+Io0fk3TkcNOLwXRx4wF7uenJJWMToelLjCiJ5ocwDO8nxQ8RuWarS2LDxpEgb8Q8NDWYCR94td+IhmEgEPaMq7vsgEftwghhI3J3j4mPvcg+aJMrNdRLqQVQqDDFulwkKByYrHqN0jVn+CFzKIsKBsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737767766; c=relaxed/simple;
	bh=o+cfxavDlECfwchTqvmJ413/PuSxyTPOgssOsk4/rjY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=sW9duROjv4JQ8MhFx/Kuu7bF9qYSSXl9KCTKfgnaihs45auEMiiFkGRYlCdqmNEcIrpAmFKztTtM84eqF3bSayDq2KB1mugm9c3T3FdvLtOvdd/dhN7xt0BCUr/LhvtFxMen+6zNo3ry603sAstllC68fT77gDGJUz7a6DRxwK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=b4WwNxdX; arc=none smtp.client-ip=220.197.32.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="b4WwNxdX"
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 9a2d1331;
	Sat, 25 Jan 2025 09:15:53 +0800 (GMT+08:00)
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
Subject: [PATCH v2 3/3] arm64: dts: rockchip: Increase VOP clk rate on RK3328
Date: Sat, 25 Jan 2025 09:15:45 +0800
Message-Id: <20250125011545.15547-4-zhangqing@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250125011545.15547-1-zhangqing@rock-chips.com>
References: <20250125011545.15547-1-zhangqing@rock-chips.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhpCS1YdQ0oaGE5NTk1KTB5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a949b07979903a3kunm9a2d1331
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OE06EAw6HTIWLBopQi0ePQpD
	EgoaCVFVSlVKTEhMTE1MTE5PQk9JVTMWGhIXVQETGhUcChIVHDsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUpJSUo3Bg++
DKIM-Signature:a=rsa-sha256;
	b=b4WwNxdX7lD64Xgn+Ba2i0xa3x5BwqzyI6b/EFkUtuSD1P4sUYqaHi99dIH3r6R/ErcTQlDGiEQg/HETtpN8Ul7Fc3zz1tIbUyB/lha82hOo+QvPF5JYMW5BVg2RHXbzVGvuUyIo4qxOMtiOyHboxbZCJkyu8rJxExHmjGUXP9g=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=5XL1oRgjrMvBC7HZIH3WlKDBfELy6YvngrqD5H+FELs=;
	h=date:mime-version:subject:message-id:from;
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

The VOP on RK3328 needs to run at a higher rate in order to produce
a proper 3840x2160 signal.
Change to use 300MHz for VIO clk and 400MHz for VOP clk.

Fixes: 0f2ddb128fa2 ("arm64: dts: rockchip: Increase VOP clk rate on RK3328")

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

