Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B9F156F3C
	for <linux-clk@vger.kernel.org>; Wed,  9 Oct 2024 06:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728455815; cv=none; b=bz1/QZx9oK2omlzqaw5yV+U8MbKboymFmIyGKdIKEQTV7lSE48WDj/mahJzvHyCinQpksZILu2GSk55obLR0f16bS5WI7jNHnAOgAzitCW00wf4VIQiKAv3Td5h8qHgULy6s7AoHqWBuyrnql5C/KdfxGj2FVkdGJEvGtg5Fnrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728455815; c=relaxed/simple;
	bh=VjxpDaumRpd8CAExjzfnofKYyd+2AfzO4nbE49OvDXs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sNcYwxLq2it9L08LD9mGarGHeNKMDZYWgM4DbzkeZMg9CjCBpQuW3p6ldn+44oJydl2jfjIk0ORR9cMg0GVcNy/7AXWxEDFD2+3HO3aimBOuNBfh+FaOIZLYyZp+yMi5DEoUbhYxKwgFFJmKqqjjhL1HjOuwnREBo7lUOpvj0NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XNjnV5xk2z2Dd2Z;
	Wed,  9 Oct 2024 14:35:42 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id D6AEC1A016C;
	Wed,  9 Oct 2024 14:36:47 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 9 Oct
 2024 14:36:46 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <abelvesa@kernel.org>, <peng.fan@nxp.com>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
	<dinguyen@kernel.org>, <linux-clk@vger.kernel.org>
CC: <chenjun102@huawei.com>, <zhangzekun11@huawei.com>
Subject: [PATCH 0/4] clk: Fix the use of uninitialized variable
Date: Wed, 9 Oct 2024 14:32:25 +0800
Message-ID: <20241009063229.121258-1-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemf500003.china.huawei.com (7.202.181.241)

of_property_read_u32() could failed and remain the variable uninitialized.
Add check or initialize the variable to fix these problems.

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

