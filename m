Received: from mta.al2klimov.de (mta.al2klimov.de [162.55.223.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086CE3AE190;
	Tue, 26 May 2026 20:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.55.223.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779828161; cv=none; b=n5X/uvX8k2Z7AcrzOrJchsFA0OKXRZqmgV8H2C/wcPD4FeCcYEPRC8iFwI0hE/lyV+RjoasXvWQ0Es4zb9f+FAez1JgYV3blIreLJU85qBQiOhlXBjpQQn1FesIs2anbpeJEibpYP16oXp6lnUeLo7zoBhdL6MujVlFPSJ5NVCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779828161; c=relaxed/simple;
	bh=xPJm8fGfxE42Pzfa4WxRQce3kxEQReqDCeHFRJtXUZE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oauM0wcQa/r7ctSAPOD2DpUzQUMPyo+/EldAkzsx3R9yzrLhBLSNtWky9/Hd9j0skyX0SZ/BjYxS3R+37/DeevAOhLVOpwpHX6h5IkrFXfQckcZwGvg222YbJ32oaioBgSTqnTKBB6/leyRC1P0cuXwjE2wIF/hXL6hcEWglr5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de; spf=pass smtp.mailfrom=al2klimov.de; dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b=aIsLNngt; arc=none smtp.client-ip=162.55.223.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b="aIsLNngt"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=default; bh=xPJm8fGfxE42
	Pzfa4WxRQce3kxEQReqDCeHFRJtXUZE=; h=date:subject:cc:to:from;
	d=al2klimov.de; b=aIsLNngtHgasmh4xTzaISRu5wq9PTcVvObR83qSDN0uSYvLU7jaj
	7oUe87jdBTXERthZHOzD0iVZ9XKM52hXw1Y7K8PZKBDDxIBJ7TrxF1TAbnUe57UuNuNtev
	Ud1fBjxBUKitI+SGr97QePwKdxv9YbhtthGgGTmo4Oa6eBfADKkDQC04z/Ydp/v/ROBsVr
	VNSclkN2On4H1kN1b7V1cqJOedzutFfK85Jrp4/29r59Z15xFa83PoF4u/CQKAZka8S2pn
	RNjyQYrdvrAsyA2HT7JYPEIbzFKDNC+N8l5WLFWJLNp4lYMd17TLzJeunNnf1fEW4uoQiG
	hv0fyY3vDA==
Received: from cachy-ak (88.215.123.80.dyn.pyur.net [88.215.123.80])
	by mta.al2klimov.de (OpenSMTPD) with ESMTPSA id 50619732 (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO);
	Tue, 26 May 2026 20:42:35 +0000 (UTC)
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Jonas Jensen <jonas.jensen@gmail.com>,
	Mike Turquette <mturquette@linaro.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/MOXA ART SOC),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list)
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH] clk: moxart: remove unused variables, fix refcount leak
Date: Tue, 26 May 2026 22:42:26 +0200
Message-ID: <20260526204227.23181-1-grandmaster@al2klimov.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Not only these error checks are redundand,
those of_clk_get() return values weren't cleaned up via clk_put().

Fixes: c7bb4fc16ead ("clk: add MOXA ART SoCs clock driver")
Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 drivers/clk/clk-moxart.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/clk/clk-moxart.c b/drivers/clk/clk-moxart.c
index 3786a0153ad1..40663ef3ef0a 100644
--- a/drivers/clk/clk-moxart.c
+++ b/drivers/clk/clk-moxart.c
@@ -17,7 +17,6 @@ static void __init moxart_of_pll_clk_init(struct device_node *node)
 {
 	void __iomem *base;
 	struct clk_hw *hw;
-	struct clk *ref_clk;
 	unsigned int mul;
 	const char *name = node->name;
 	const char *parent_name;
@@ -34,12 +33,6 @@ static void __init moxart_of_pll_clk_init(struct device_node *node)
 	mul = readl(base + 0x30) >> 3 & 0x3f;
 	iounmap(base);
 
-	ref_clk = of_clk_get(node, 0);
-	if (IS_ERR(ref_clk)) {
-		pr_err("%pOF: of_clk_get failed\n", node);
-		return;
-	}
-
 	hw = clk_hw_register_fixed_factor(NULL, name, parent_name, 0, mul, 1);
 	if (IS_ERR(hw)) {
 		pr_err("%pOF: failed to register clock\n", node);
@@ -56,7 +49,6 @@ static void __init moxart_of_apb_clk_init(struct device_node *node)
 {
 	void __iomem *base;
 	struct clk_hw *hw;
-	struct clk *pll_clk;
 	unsigned int div, val;
 	unsigned int div_idx[] = { 2, 3, 4, 6, 8};
 	const char *name = node->name;
@@ -78,12 +70,6 @@ static void __init moxart_of_apb_clk_init(struct device_node *node)
 		val = 0;
 	div = div_idx[val] * 2;
 
-	pll_clk = of_clk_get(node, 0);
-	if (IS_ERR(pll_clk)) {
-		pr_err("%pOF: of_clk_get failed\n", node);
-		return;
-	}
-
 	hw = clk_hw_register_fixed_factor(NULL, name, parent_name, 0, 1, div);
 	if (IS_ERR(hw)) {
 		pr_err("%pOF: failed to register clock\n", node);
-- 
2.54.0

