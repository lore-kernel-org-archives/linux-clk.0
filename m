Received: from mail-m1973194.qiye.163.com (mail-m1973194.qiye.163.com [220.197.31.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BAE46447
	for <linux-clk@vger.kernel.org>; Tue, 29 Jul 2025 12:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753793882; cv=none; b=gATBw7UdKtIvtjebUe/RRdSKRY85bEZza5PG4J2WBrBGsG5lXMbC/c063stgiRwtLXoDpnnn1uPj17u5Qpd1r88bpzlWW/2hYIPKNc3QUt4urpX8VvyoWFhjyC+q1Vd4GxfIUYZlZo4Qgua7AA7oOpt51tVLhfXa1kHzVIMF3qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753793882; c=relaxed/simple;
	bh=x75kL31JMkSDnAGruaNjwhVuRYEveiT/t9d+h5xtq4Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bM1yvyCVp9xp/i586T21Mpkl5nmIY4iKJslakcJFAfE4ifFGXqixwMeEJlSHYBeU9vfOfkWsIcRk/Itg+qWB4od/gXr8rwvkw2waPIOaCAafhUUI/kBQjNL2/up0OIK/4O3zVf2vfN1WCRhmiGAsKKJ8DcRcAJvm6AWWbHpf2zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn; spf=pass smtp.mailfrom=easystack.cn; arc=none smtp.client-ip=220.197.31.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=easystack.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=easystack.cn
Received: from localhost.localdomain (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id dd1c002b;
	Tue, 29 Jul 2025 20:57:40 +0800 (GMT+08:00)
From: Zhen Ni <zhen.ni@easystack.cn>
To: mturquette@baylibre.com,
	sboyd@kernel.org
Cc: linux-clk@vger.kernel.org,
	Zhen Ni <zhen.ni@easystack.cn>
Subject: [PATCH] clk: hisilicon: Fix of_iomap leak in hisi_clk_init
Date: Tue, 29 Jul 2025 20:57:29 +0800
Message-Id: <20250729125729.798897-1-zhen.ni@easystack.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a98564294670229kunm271bf76b35ba2b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVlDSU9PVkJPHkkeGRpJHx1ISlYVFAkWGhdVGRETFh
	oSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+

Smatch reports:

drivers/clk/hisilicon/clk.c:87 hisi_clk_init() warn: 'base'
from of_iomap() not released on lines: 87.

This is because in hisi_clk_init(), base is not released when
handle error, which may cause a leak.
To fix this, iounmap is added when handle error.

Signed-off-by: Zhen Ni <zhen.ni@easystack.cn>
---
 drivers/clk/hisilicon/clk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/hisilicon/clk.c b/drivers/clk/hisilicon/clk.c
index 09368fd32bef..c0d309060240 100644
--- a/drivers/clk/hisilicon/clk.c
+++ b/drivers/clk/hisilicon/clk.c
@@ -84,6 +84,8 @@ struct hisi_clock_data *hisi_clk_init(struct device_node *np,
 err_data:
 	kfree(clk_data);
 err:
+	if (base)
+		iounmap(base);
 	return NULL;
 }
 EXPORT_SYMBOL_GPL(hisi_clk_init);
-- 
2.20.1

