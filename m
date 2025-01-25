Received: from mail-m3270.qiye.163.com (mail-m3270.qiye.163.com [220.197.32.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2061DB65C;
	Sat, 25 Jan 2025 01:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737768072; cv=none; b=HqqBYVIDDt7472Fdlj0DYyEIQRUsQVov1G6g1UIS+2osaJHJcSGlKA/1iykZdirI6fNFEh12nGmFM3nuw6dsMTA8i7ZqTtb+/+S5pEDSoFt4gBsoENdfhjA4OPHtA6mrZlEeh2I84WBlQfdO1+0dkR7AXJGeQ7z/zRA9F60co/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737768072; c=relaxed/simple;
	bh=N1uixOxGZRAZZqFVwdJShOU51m15WFrLEtUuSOiBRiU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=GlpGQD3+pAxNMuGcdiUuVUcUvBKT6s9wlDloul3Kdfhn568ddarkV0/w3OM5EddOIJxDg0P7sHxO/PkcD927w0gVpFMEkrbJp+UZ1XSp2lod7Msa+2IEJRh46J8/AlPERCKg2GkOiw648jcvD5Vhs9/EdFPaKcZ+0lADsnZRnt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=YGQQjOr7; arc=none smtp.client-ip=220.197.32.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="YGQQjOr7"
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 9a2d132f;
	Sat, 25 Jan 2025 09:15:52 +0800 (GMT+08:00)
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
Subject: [PATCH v2 2/3] Revert "arm64: dts: rockchip: Increase VOP clk rate on RK3328"
Date: Sat, 25 Jan 2025 09:15:44 +0800
Message-Id: <20250125011545.15547-3-zhangqing@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250125011545.15547-1-zhangqing@rock-chips.com>
References: <20250125011545.15547-1-zhangqing@rock-chips.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGR5OHVZJGR9IHk1OTR9NTEJWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a949b07922703a3kunm9a2d132f
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6N0k6Dxw*LjIXNBoLDSMKPRUw
	IksKCTJVSlVKTEhMTE1MTE5ITkpJVTMWGhIXVQETGhUcChIVHDsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUpLTUo3Bg++
DKIM-Signature:a=rsa-sha256;
	b=YGQQjOr7ey6VOa/L58cxEdtV8JlgR6SsYj9LwimXFQY6K2lC06Z4vFJTkyjmKJDzfjgDPACM0GU4TYtrVQ6wgM4ybTbd7nj71CVuMfjtA1FFpROwi78hZfvwjd5RSvBQuS5c0pG/J7T6Fi3kSSCf1dqjlhG3RZztMWGzTQ8d7ZA=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=GbYBNys9Cs3StkfVLRUbOG4+n5LSGeTknUJSAePxf0s=;
	h=date:mime-version:subject:message-id:from;
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

This reverts commit 0f2ddb128fa20f8441d903285632f2c69e90fae1.

Before changing the PLL frequency, in order to avoid overclocking the
child clock, set the child clock to a large div first, and then set the
CLK as required after the PLL is set.

Fixes: 0f2ddb128fa2 ("arm64: dts: rockchip: Increase VOP clk rate on RK3328")

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
---
 arch/arm64/boot/dts/rockchip/rk3328.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
index 7d992c3c01ce..f3ef8cbfbdae 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
@@ -852,8 +852,8 @@
 			<0>, <24000000>,
 			<24000000>, <24000000>,
 			<15000000>, <15000000>,
-			<300000000>, <100000000>,
-			<400000000>, <100000000>,
+			<100000000>, <100000000>,
+			<100000000>, <100000000>,
 			<50000000>, <100000000>,
 			<100000000>, <100000000>,
 			<50000000>, <50000000>,
-- 
2.17.1

