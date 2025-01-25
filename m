Received: from mail-m21471.qiye.163.com (mail-m21471.qiye.163.com [117.135.214.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D2A1DE4EA;
	Sat, 25 Jan 2025 01:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.214.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737767758; cv=none; b=c+lz0B7MXgl5E8VPB7+5fSRCkwSAWWu6dZi+Erg4oiWh6ldIsgDRHSJB7v2xNuJlJaQjZkVqPhgtRsroDDrS4Q47OeYulaV/yaEYvz5/3THF7i/6CQVbkKqwHUljBCgh+RvZS4wHS98AkAZlR237Cc3MXCw6K3IylRpEV6AfdMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737767758; c=relaxed/simple;
	bh=K3V2jUL6UZIwQKnpIe4lJ6OSx3IZ7yNf7crvU4UIRNs=;
	h=From:To:Cc:Subject:Date:Message-Id; b=Mu+2qtD7Y3jHeLdDA4GNMhH5f7214tDnW6LbOUcv63uOpvMbKHPSMs5A8S2BU+t5Sh4H8jVhCoIK8rdvo0Uw52zCiCPotV1yOUG2ayVPNS6Ao2LUTvGQoR1ocf9CcZZ6MQoCW8ngu/yOKRFUstpuVVJW1468DaY6ibjXzCQFtD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=K4VBheC1; arc=none smtp.client-ip=117.135.214.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="K4VBheC1"
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 9a2d1325;
	Sat, 25 Jan 2025 09:15:49 +0800 (GMT+08:00)
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
Subject: [PATCH v2 0/3] clk: rockchip: Fixed some incorrect commits
Date: Sat, 25 Jan 2025 09:15:42 +0800
Message-Id: <20250125011545.15547-1-zhangqing@rock-chips.com>
X-Mailer: git-send-email 2.17.1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQktCS1YfS0gfSRlJGk9PTR5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a949b07876603a3kunm9a2d1325
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ODY6Kww*CTIKHhoRDS0pPRIO
	Ok9PCypVSlVKTEhMTE1MTE5LTEhDVTMWGhIXVQETGhUcChIVHDsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQU5KTTcG
DKIM-Signature:a=rsa-sha256;
	b=K4VBheC1hN2v/qacAVCQWtPYBSMWTpKPIcWw+9BuZiCPy2NcVs7oAhq+fFnJO5FcupKMQ4gbxdsuMrBJxpB/A3wv35AipuUjMK22AZWcvMxZiZ6hNbWhOshskMzfVtXpMSdZFNvec2ADNq2vglI9i5JKJZd+GOYMDM9WsNxMs20=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=elHxKod4Hi5MljImJZeO6gB3g83rShkQGqnU/7J2Q4Y=;
	h=date:mime-version:subject:message-id:from;
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Change in V2:
[PATCH v2 0/3]: NO change
[PATCH v2 1/3]: Update commit message
[PATCH v2 2/3]: Update commit message

Elaine Zhang (3):
  Revert "clk: rockchip: Set parent rate for DCLK_VOP clock on RK3228"
  Revert "arm64: dts: rockchip: Increase VOP clk rate on RK3328"
  arm64: dts: rockchip: Increase VOP clk rate on RK3328

 arch/arm64/boot/dts/rockchip/rk3328.dtsi | 10 ++++++----
 drivers/clk/rockchip/clk-rk3228.c        |  2 +-
 2 files changed, 7 insertions(+), 5 deletions(-)

-- 
2.17.1

