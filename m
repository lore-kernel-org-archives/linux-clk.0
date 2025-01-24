Received: from mail-m49239.qiye.163.com (mail-m49239.qiye.163.com [45.254.49.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6032313D518;
	Fri, 24 Jan 2025 06:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737701200; cv=none; b=s3PimHZ3TUWFbyNQaDDMJwn+MMO7WTdatTCb6SlVzG2g0C4B4jtVKrkTmLSJk7J3GMkn3DyucOYUma6zaM/qSBO3F1LEHRtE/wMt9cNmsWIr6SoZopD5dO5DfKWGG9CVXYsaCml1bQ3fgfWefNuM+ol2G6EEw64/NLiJqs79bao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737701200; c=relaxed/simple;
	bh=2DKo97qqqMwzEWcoOvWySahqa9iRU27sDbl2sCrfRP0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=IJGUvfG+r30G6EedEQnA1X37nuDdCEB4nH9Hu97HlhN4DBzVZvz+pkdbiThpVtvPNFnX7HlnIFjoxZi1WYZaQFdVEtvnG7zYLqXvERR1rsxq3oWDpvg01AuwGicsxa0H5j3vitfWssaVVIFz0y3tArmEumVxexcZvK3rXZLT9io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=M/D6kNNG; arc=none smtp.client-ip=45.254.49.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="M/D6kNNG"
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 994456f1;
	Fri, 24 Jan 2025 14:46:25 +0800 (GMT+08:00)
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
Subject: [PATCH v1 2/3] Revert "arm64: dts: rockchip: Increase VOP clk rate on RK3328"
Date: Fri, 24 Jan 2025 14:46:18 +0800
Message-Id: <20250124064619.13893-3-zhangqing@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250124064619.13893-1-zhangqing@rock-chips.com>
References: <20250124064619.13893-1-zhangqing@rock-chips.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGklJQlZNS0wfSksZGE8ZHxlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a94970fd93d03a3kunm994456f1
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PiI6LDo4DjIVPCENERIiDB8B
	LUsKCj1VSlVKTEhMTEtKSkNMSkpDVTMWGhIXVQETGhUcChIVHDsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUJDSzcG
DKIM-Signature:a=rsa-sha256;
	b=M/D6kNNGvDab4mQZLgZ+1qvY209zaiG70aPm2+DyB9v13jgL7GYT1giZyxNgxkSYMCIYnZTZciSf/ITmhRURDVPp3SJotGsa8gJFkqCEJUmadhyPCtaZiuq7vKSDxTWaudMQlc7kK3L7sQ9u7hSDXLvnVVuznN5FTX6xYGYhyjg=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=4ioNYi1LZ2VVOSFcqdaBC9gwtOsuOjZpbh3YO049b9E=;
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

