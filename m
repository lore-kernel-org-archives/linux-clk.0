Received: from mail-m49220.qiye.163.com (mail-m49220.qiye.163.com [45.254.49.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2D11D63DF;
	Fri, 24 Jan 2025 06:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737701504; cv=none; b=duHeMqwEEX/vd5jdbI0+x3eZcXyoAhZtbue0VsguqVlHZlMpggTSZN6HUJ670YKbesGNKNxMSQHLqTzM3uMWnPIb6EXzFz1MbwkdFZHIi+7LJNPjOM7iuIBinnO0uWefAdgJVf0cCFYv99PTzmw62OnwpojjVd8mq5l2TOcMSUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737701504; c=relaxed/simple;
	bh=FjmqzohXw1BCFVFHHigcG0Qz+t/CQtTShQFq2UXXtuA=;
	h=From:To:Cc:Subject:Date:Message-Id; b=Z8c6MdAvMPqMEB+ZAgv3HidMvE/XnKWQK+BitYwPxuAkLKhLohVYwCZ5lQA/BBgcvp4nXmTKggYZ3NOkV/1W6hKCy72yH0GMNVepbQaRSO0R1eci6Vm+iCvLabm2hhLZt6/e6az1KGFgkt/8WKEf8tDtGXZyFe0CWw5WpAqgHCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=Bm2kb4XJ; arc=none smtp.client-ip=45.254.49.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="Bm2kb4XJ"
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 994456e1;
	Fri, 24 Jan 2025 14:46:22 +0800 (GMT+08:00)
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
Subject: [PATCH v1 0/3] clk: rockchip: Fixed some incorrect commits
Date: Fri, 24 Jan 2025 14:46:16 +0800
Message-Id: <20250124064619.13893-1-zhangqing@rock-chips.com>
X-Mailer: git-send-email 2.17.1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGk0ZGlZKGklKTkpIGkhPSB1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a94970fcd5e03a3kunm994456e1
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NDY6URw4IzIPDiEWARMZDB80
	EEsaCjBVSlVKTEhMTEtKSkNPSkJDVTMWGhIXVQETGhUcChIVHDsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUhCTzcG
DKIM-Signature:a=rsa-sha256;
	b=Bm2kb4XJ8h9ZAx8pB34IrXe66neBGLNV0dJTem0EA4zI/qtoWWtbeXI3wgkmx7bkekvL7BBCNJf+GA1GL2KwRlT8pp7C8h/3VwmMYvJCN4FpyRcwpK1Xa1yUte4e8wgTY22Cht5HSKvhg2OhSfvxUCg2voduaUeC37DKFotG0LA=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=hakErszKHTtOs4Wy81rK0wCSNo3C7i1Eglw64nX85ko=;
	h=date:mime-version:subject:message-id:from;
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Elaine Zhang (3):
  Revert "clk: rockchip: Set parent rate for DCLK_VOP clock on RK3228"
  Revert "arm64: dts: rockchip: Increase VOP clk rate on RK3328"
  arm64: dts: rockchip: Increase VOP clk rate on RK3328

 arch/arm64/boot/dts/rockchip/rk3328.dtsi | 10 ++++++----
 drivers/clk/rockchip/clk-rk3228.c        |  2 +-
 2 files changed, 7 insertions(+), 5 deletions(-)

-- 
2.17.1

