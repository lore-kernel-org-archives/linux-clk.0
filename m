Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8FC7F
	for <linux-clk@vger.kernel.org>; Sun,  3 Mar 2024 12:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709467666; cv=none; b=CzYuYFXAbX1Yt+TyXmfqiQcCcVDQK6vWkbPXBri0x/U3H+fFpKtZmvahtNOX1qTURYGsjqa5TyMcuf3x6iX8y1fwElPPK6fCfDRuhFuYs5NnxpLT9lTKt8WNDRL9mGFN0/SN3gwCvivvw2nS3NR8Kycuhe0Z3K9pWbcvE2HMoXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709467666; c=relaxed/simple;
	bh=8TfYbH/Sb4JWApIFsRo+aPKWTwj/9+8x40iu73tFba4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SjDb6G2KQbBz0VYSRwu6s/SFOMO9bf/k4kY02JkfjoIiESUStIbOoUVYEl0hP9S1dHoYk9iAajpaQNhpQPRkFng7hadmpAfGKNf9+Ox9LRb6h99MlMO9GaSijLYcOR3qKGwFZ55lx2vg2XK6jMRvy2V+o5UJsVvSLigb2R/73eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-217.elisa-laajakaista.fi [88.113.26.217])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTP
	id 9ef0446a-d956-11ee-a9de-005056bdf889;
	Sun, 03 Mar 2024 14:07:35 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v1 1/1] clk: fractional-divider: Use bit operations consistently
Date: Sun,  3 Mar 2024 14:07:32 +0200
Message-ID: <20240303120732.240355-1-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use BIT() where makes sense. This alings usage of bit operations
in the same pieces of code. Moreover, strictly speaking by the
letter of the C standard, left shift of 1 by 31 bits is UB (undefined
behaviour), switching to BIT() addresses that as well.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/clk/clk-fractional-divider.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-fractional-divider.c b/drivers/clk/clk-fractional-divider.c
index 5067e067e906..a0178182fc72 100644
--- a/drivers/clk/clk-fractional-divider.c
+++ b/drivers/clk/clk-fractional-divider.c
@@ -140,8 +140,8 @@ void clk_fractional_divider_general_approximation(struct clk_hw *hw,
 	}
 
 	if (fd->flags & CLK_FRAC_DIVIDER_ZERO_BASED) {
-		max_m = 1 << fd->mwidth;
-		max_n = 1 << fd->nwidth;
+		max_m = BIT(fd->mwidth);
+		max_n = BIT(fd->nwidth);
 	} else {
 		max_m = GENMASK(fd->mwidth - 1, 0);
 		max_n = GENMASK(fd->nwidth - 1, 0);
@@ -182,8 +182,8 @@ static int clk_fd_set_rate(struct clk_hw *hw, unsigned long rate,
 	u32 val;
 
 	if (fd->flags & CLK_FRAC_DIVIDER_ZERO_BASED) {
-		max_m = 1 << fd->mwidth;
-		max_n = 1 << fd->nwidth;
+		max_m = BIT(fd->mwidth);
+		max_n = BIT(fd->nwidth);
 	} else {
 		max_m = GENMASK(fd->mwidth - 1, 0);
 		max_n = GENMASK(fd->nwidth - 1, 0);
-- 
2.44.0

