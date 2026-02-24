Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C112264AA;
	Tue, 24 Feb 2026 02:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771899584; cv=none; b=fIJ/Gz4NME98O9V7XDMevbKCN/R+Ya2uI/ud+6k7SWB5tXIZA9Yj4LnbK1OdzMo8Upq7dwSpmODg6Y+KJeqvm5nY0eawSNtPQxdsRewNJ/y5PWNtz52HOk2DxdG4dT6mbRSdFFIE3mpn2vjgk+ZSYFrg9KDhNY83OzLppCOxLvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771899584; c=relaxed/simple;
	bh=ANiuwIUXcb3PANvoO/MfnsEGTw5nCgf0pio/Qst+ANY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lR/nERGeO3CZ55cXkon4wGI4U4TZVX6HQcjdbW0ZTLVcuEM3Eq10D6q53NJLjz76kwbAU7K6bftDGxIhKbokpDRP4XHztgPP6w2infIYLIWXoobze5umLl81o7Kz3ONSzYCedrSkHc0sU9+kGZBT1i5p4fn0KLNmMOGtybeHwg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iwkQkP6z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iwkQkP6z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 294F4C116C6;
	Tue, 24 Feb 2026 02:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771899583;
	bh=ANiuwIUXcb3PANvoO/MfnsEGTw5nCgf0pio/Qst+ANY=;
	h=From:To:Cc:Subject:Date:From;
	b=iwkQkP6zHgIkytM+CnBb0hP33ll/JiXaX612ZXXYFrze3RTyO4vLw1wXgCC2DfVN1
	 lZSUh8c04n0vsvXMdTO6dP1T8zNn9MAAy4v9+eanZJnqFWMq67yx79hpLa0v+R2pff
	 cPn2sNqiKnPeg3x6Qwuo+EUU81EK45kEz8LO/EBYS+z0i4CcH303DusWN80wzkR4kU
	 X1p2nHf9UkVmNknikDu2dgoS1kOlx5aUbx4wK6BlmvpEygKS7Jjm7tiyNr3B+cxsKQ
	 yTBEDd/8HIc8PtzIzsUJQMHB8GM5CcZefGrJRr4QMaDcbUp1rFvJnmbBdzwppb0MKS
	 L6IVSy3i4amLw==
From: Shawn Guo <shawnguo@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH] clk: hisilicon: reset: Use kzalloc instead of kmalloc
Date: Tue, 24 Feb 2026 10:19:12 +0800
Message-ID: <20260224021912.54365-1-shawnguo@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With commit c721f189e89c ("reset: Instantiate reset GPIO controller for
shared reset-gpios") in place, the call sequence hisi_reset_init() ->
reset_controller_register() starts failing on Hi3798CV200 Poplar platform,
due to the new check added by the commit above.

	if (rcdev->of_node && rcdev->of_args)
		return -EINVAL;

The failure is caused by that hisi_reset_init() allocates memory for rcdev
without zeroing it out.  Fix the issue by using kzalloc instead of
kmalloc for memory allocation.

Signed-off-by: Shawn Guo <shawnguo@kernel.org>
---
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
2.47.3

