Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A829D2DA75B;
	Mon, 11 May 2026 17:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778519114; cv=none; b=MG6PRlk3z7EHe9dkZdJIMOMzdEaSCZXtU5l5hYks+IA4WhooZJbd6EeIf/gnewpnU1BdtGqTQCAhZZ5GR4kIayRwVa5nhsPJt+Vwp7iOcIzbLE81lu04c5pPP82BOgoFSM7MworrouOmEGQuikAHbxZvNofJfiLCuwajhT2ztzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778519114; c=relaxed/simple;
	bh=3VkqRoe9DlwWrSXJye3FpI68lQw9/a6yLSQKRhLiKxc=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O1x5AYU+r+VZfEBCRdERu8K/h7o+mJRAd9jvSYm/yFSrLowtpp/ebWDxea4xLSe6hQ5jo7pcdHQ12+eRyzLLhG/rA6auMP6Sq6ssh7S5S9AHxYuMZYLS28/nKjn0dHyiXSnR8EDvKydgdnz4Npl56lyaCcCLtNQ3gldv9Tu9d4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=hG6m4lDd; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="hG6m4lDd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=GP
	KVB1HfoFbxvaCCgh5YQXT2u/lyZQD+O1mTvLKZWR0=; b=hG6m4lDdbBcUFOevKN
	TwuKObCa66es7ZXAQg/biIYxwmOfOolvCH2Rvju0PQNWPtYrj7OGINeVFP6Zx0Jr
	kirjktkw12pAngGFsogAckUL1q/8oYm7Z6qs/yxLkbg+TZhCHrsYjQDsMbhQ04x2
	Npdo5x18YDRH6ZlJCWaNjhNR4=
Received: from zero.localdomain (unknown [])
	by gzsmtp1 (Coremail) with UTF8SMTPSA id Mc8vCgDnH2ETDAJqfLvgAg--.16010S4;
	Tue, 12 May 2026 01:04:20 +0800 (CST)
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
Subject: [PATCH v2] clk: hisilicon: reset: Use devm_kzalloc to initialize hisi_reset_controller
Date: Tue, 12 May 2026 01:04:14 +0800
Message-Id: <20260511170415.19848-1-zhangmin2026@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260511053216.538035-1-zhangmin2026@yeah.net>
References: <20260511053216.538035-1-zhangmin2026@yeah.net>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Mc8vCgDnH2ETDAJqfLvgAg--.16010S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7XFy7Zw4rtFWkWrWfZryDGFg_yoW8JF45pF
	WfGanrtFWrXw4fZa17Xw4fZFy3Z3Z3tFWUGry3Zw429wn8KrWvgr15Ka48CFW5ZrZ3uFW5
	uF4xKw40vF12yaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UTyIbUUUUU=
X-CM-SenderInfo: x2kd0whplqjiysw65vtdko0vbw/1tbiIRQjx2oCDBQlVwAA3T

Using devm_kmalloc() does not zero-initialize the allocated structure.
Uninitialized members in struct hisi_reset_controller may contain garbage
data, which can cause reset_controller_register() to fail unexpectedly.

Replace devm_kmalloc() with devm_kzalloc() to ensure all structure fields
are properly zero-initialized.

Fixes: 97b7129cd2afb ("reset: hisilicon: change the definition of hisi_reset_init")

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Min zhang <zhangmin2026@yeah.net>
---
Changes in v2:
- Drop the invalid fixes tag and use the standard format.
- Add Reviewed-by tag from Brian Masney.
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

