Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AFD79DA;
	Tue, 12 May 2026 00:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778544490; cv=none; b=C70q0YVTbFfHZC2UDhT2fWkyzVOjmiaecAeuPILzcdcWwaaeGnfY7+NiIZ2LdSei72l4yjDHTIhGjAOnT0sLElw2g+Bp+PG9mhFzuhmEqxE+qMJm/kaK+Ki4MBaBWhro04e1YQhI9+9A/na4Kdbyrp6qy7AlEeQ/T9x53m6FF1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778544490; c=relaxed/simple;
	bh=4VPJyqr4MdPR5OA20MzTqTWqY7bgxORLhU/yDJvWKCY=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xx7RKL7gFMw9+SUwjvszkWfVhtY+vSt7H438DxUnO1dLNjTAHgxk9HpHu6/B9iaahMJ/Olg2Vje3JlOF0O5gW4yKKVf0Jdv+Uft8yRUny1DofmIGWhrk5u+xV8DMQZ8LCFxpu85ye/Pu8VeOk4bgSMwNm5NoEqZstjYZH0Q1z5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=IThg6+cD; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="IThg6+cD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=av
	z+NOZoxelkqUBopFSD9Q3Fs8G4Moa7r8elZtVjYK8=; b=IThg6+cDUVHGVZNTG4
	CYITy9yOjw1PmrH3Gufpd+9aIehIqkwyFTDawGCqGwr8R3rL6TP72+x9I2V1Vp5g
	Q48vzC3oLHsFO9Ac8GP3LX5MO8OCw+k/eIumGTYs7KMU9gyqsH/nDEs313WPr26B
	jihTFCZZEPI8qlsX2pE0ryJLU=
Received: from zero.localdomain (unknown [])
	by gzsmtp2 (Coremail) with UTF8SMTPSA id Ms8vCgD3X487bwJq5X7vAg--.23849S4;
	Tue, 12 May 2026 08:07:24 +0800 (CST)
From: Min zhang <zhangmin2026@yeah.net>
To: Wei Xu <xuwei5@hisilicon.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Min zhang <zhangmin2026@yeah.net>,
	Jiancheng Xue <xuejiancheng@hisilicon.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] clk: hisilicon: reset: Use devm_kzalloc to initialize hisi_reset_controller
Date: Tue, 12 May 2026 08:06:42 +0800
Message-Id: <20260512000646.15189-1-zhangmin2026@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260511170415.19848-1-zhangmin2026@yeah.net>
References: <20260511170415.19848-1-zhangmin2026@yeah.net>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Ms8vCgD3X487bwJq5X7vAg--.23849S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr4kXw43KF1kZr47ZF4DCFg_yoW8Gr48pr
	WfGanrJrWrXw4fZa17Xw4fZFy3Z3Z3tFWUGr9xZw4j9wnxK3yvgr13Ka48CFW5ZrsxuFWY
	vF4xKw4FvF12yaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UhAwsUUUUU=
X-CM-SenderInfo: x2kd0whplqjiysw65vtdko0vbw/1tbiNhwGqmoCbzxgGwAA3G

Using devm_kmalloc() does not zero-initialize the allocated structure.
Uninitialized members in struct hisi_reset_controller may contain garbage
data, which can cause reset_controller_register() to fail unexpectedly.

Replace devm_kmalloc() with devm_kzalloc() to ensure all structure fields
are properly zero-initialized.

Fixes: 97b7129cd2afb ("reset: hisilicon: change the definition of hisi_reset_init")
Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Min zhang <zhangmin2026@yeah.net>
---
Changes in v3:
- Remove the newline between Fixes and Reviewed-by tags.
Changes in v2:
- Drop the invalid fixes tag and use the standard format.
- Add Reviewed-by tag from Brian Masney
 drivers/clk/hisilicon/reset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/hisilicon/reset.c b/drivers/clk/hisilicon/reset.c
index 93cee17db8b1..c3b7daac9313 100644
--- a/drivers/clk/hisilicon/reset.c
+++ b/drivers/clk/hisilicon/reset.c
@@ -91,7 +91,7 @@ struct hisi_reset_controller *hisi_reset_init(struct platform_device *pdev)
 {
 	struct hisi_reset_controller *rstc;
 
-	rstc = devm_kmalloc(&pdev->dev, sizeof(*rstc), GFP_KERNEL);
+	rstc = devm_kzalloc(&pdev->dev, sizeof(*rstc), GFP_KERNEL);
 	if (!rstc)
 		return NULL;
 
-- 
2.34.1

