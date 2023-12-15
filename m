Received: from SHSQR01.spreadtrum.com (mx1.unisoc.com [222.66.158.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D00A25566
	for <linux-clk@vger.kernel.org>; Fri, 15 Dec 2023 11:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unisoc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unisoc.com
Received: from dlp.unisoc.com ([10.29.3.86])
	by SHSQR01.spreadtrum.com with ESMTP id 3BFBxHuL034461;
	Fri, 15 Dec 2023 19:59:17 +0800 (+08)
	(envelope-from zhifeng.tang@unisoc.com)
Received: from SHDLP.spreadtrum.com (shmbx04.spreadtrum.com [10.0.1.214])
	by dlp.unisoc.com (SkyGuard) with ESMTPS id 4Ss6zq6fVXz2Q2knN;
	Fri, 15 Dec 2023 19:53:11 +0800 (CST)
Received: from xm9614pcu.spreadtrum.com (10.13.2.29) by shmbx04.spreadtrum.com
 (10.0.1.214) with Microsoft SMTP Server (TLS) id 15.0.1497.23; Fri, 15 Dec
 2023 19:59:16 +0800
From: Zhifeng Tang <zhifeng.tang@unisoc.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang
	<baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Zhifeng Tang <zhifeng.tang23@gmail.com>,
        Wenming Wu <wenming.wu@unisoc.com>
Subject: [PATCH V3 0/3] Add reset controller driver for ums512
Date: Fri, 15 Dec 2023 19:59:11 +0800
Message-ID: <20231215115914.11588-1-zhifeng.tang@unisoc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: SHCAS01.spreadtrum.com (10.0.1.201) To
 shmbx04.spreadtrum.com (10.0.1.214)
X-MAIL:SHSQR01.spreadtrum.com 3BFBxHuL034461

From: "zhifeng.tang" <zhifeng.tang@unisoc.com>

Add reset controller driver for ums512,The reset register has 
the same base address as the gate register.

Changes in v3:
  - Fix the driver patch is overwritten by cover letter
  
Changes in v2:
  - The binding file is combined into one patch

zhifeng.tang (3):
  dt-bindings: reset: Add reset controller bindings for Unisoc's ums512
  clk: sprd: Add reset controller driver for ums512
  arm64: dts: sprd: Add reset controller driver for UMS512

 .../bindings/clock/sprd,ums512-clk.yaml       |   3 +
 arch/arm64/boot/dts/sprd/ums512.dtsi          |   9 +
 drivers/clk/sprd/Makefile                     |   1 +
 drivers/clk/sprd/common.c                     |   1 +
 drivers/clk/sprd/common.h                     |   2 +
 drivers/clk/sprd/reset.c                      |  78 ++++++
 drivers/clk/sprd/reset.h                      |  30 +++
 drivers/clk/sprd/ums512-clk.c                 | 240 ++++++++++++++++++
 include/dt-bindings/reset/sprd,ums512-reset.h | 203 +++++++++++++++
 9 files changed, 567 insertions(+)
 create mode 100644 drivers/clk/sprd/reset.c
 create mode 100644 drivers/clk/sprd/reset.h
 create mode 100644 include/dt-bindings/reset/sprd,ums512-reset.h

-- 
2.17.1

