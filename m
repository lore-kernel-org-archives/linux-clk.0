Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F880136E21
	for <linux-clk@vger.kernel.org>; Thu, 24 Oct 2024 03:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729741157; cv=none; b=rioAC2A0UIbHfJPQhmZSpjvIvP4R4V9WIu/oi8Jj1u4TcEjOrC4jwjcrxPPWiodnRVjbRlASbUPtBLwx8kXqmyDGWyf+PcDSCcLWalqXEkSycfmO7XgaIsOBuLhvufSQNLWKDYKWoDZLxzkBiZgTkz0xzvtPNZdDBdmgdbK9mjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729741157; c=relaxed/simple;
	bh=iawy8aghmpBk0Y4P7Ip/nT8FoXgARIE66AkUCePgtbQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KQPLT32HyTcrzwg+mFo9EPoPFT6c7FjgVT9wJEVGnq1F8l4Z7qTf7ZPhR+3jKTu/cfZZhBrRopgb1lsCtOXMbbTM/LxiTGA67/W5oThK6jCFvTbREEYC44Eo2ClZ+G8Aa06xaaH2BCToPcQ3vA0JQe8Rcf6DGtbFJhZMcwML8Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4XYs780N0ZzyTkN;
	Thu, 24 Oct 2024 11:37:40 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 5068E1401E9;
	Thu, 24 Oct 2024 11:39:12 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 24 Oct
 2024 11:39:11 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <abelvesa@kernel.org>, <peng.fan@nxp.com>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
	<kernel@pengutronix.de>, <festevam@gmail.com>, <dinguyen@kernel.org>,
	<s.trumtrar@pengutronix.de>, <linux-clk@vger.kernel.org>
CC: <chenjun102@huawei.com>, <zhangzekun11@huawei.com>
Subject: [RESEND PATCH 0/4] clk: Fix the use of uninitialized variable
Date: Thu, 24 Oct 2024 11:34:20 +0800
Message-ID: <20241024033424.115417-1-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemf500003.china.huawei.com (7.202.181.241)

of_property_read_u32() could failed and remain the variable
uninitialized. Add check or initialize the variable to fix
these problems.

Zhang Zekun (4):
  clk: imx: scu: Fix the return of uninitialized variable
  clk: socfpga: Fix the use of uninitialized variable
  clk: socfpga: arria10: Fix the use of uninitialized variable
  clk: socfpga: clk-pll: Fix the use of uninitialized variable

 drivers/clk/imx/clk-scu.c         | 2 +-
 drivers/clk/socfpga/clk-periph.c  | 3 ++-
 drivers/clk/socfpga/clk-pll-a10.c | 3 ++-
 drivers/clk/socfpga/clk-pll.c     | 3 ++-
 4 files changed, 7 insertions(+), 4 deletions(-)

-- 
2.17.1

