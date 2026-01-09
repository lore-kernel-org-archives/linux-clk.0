Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2577423F417;
	Fri,  9 Jan 2026 03:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767929094; cv=none; b=UKrc+FJVOs8G/SQ3mHtb7+ZGdF2M4ydHmygV4I15dsaTx1hpVWH3c2WXxoCcWfw4k3R1iSFQdZgbS9NfsBZd3xwq7A9+h3an+e4rhRA3mXpFI01A+y9Ru/5ZQwZPna8EfSFMZcfvypSNMm4x1DCkfyWVmikqgpcntjDVner2bX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767929094; c=relaxed/simple;
	bh=9ExaRafBQocvaGCRo+tp+2cx3fyRiVRb4iMhhfzO1jo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fmlsMaTnJLnHr2y6Chr2GCMhSG81Z7GYgv3ZE/2h7h7C/6Ltsf0vFH25gedfAugUFOkfCZBNKCd3YHBrTI9Y45/NjnYqwyCVo5vqXwa8ZqZEgIsd/916bBZ2yCgRqRtpiVD+d2rOO/GWd745X3qGAq4tkGEluJktolSkCV8QZ8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JXG2YF/K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JXG2YF/K"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9CDD5C4CEF1;
	Fri,  9 Jan 2026 03:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767929093;
	bh=9ExaRafBQocvaGCRo+tp+2cx3fyRiVRb4iMhhfzO1jo=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=JXG2YF/KDFeAE3dYclhITtEE0QXyxmtQW5Ia3S0hE3lV26xuvvyHmRrfSSZvlgCop
	 nLxxW+cX0wkxatGWmbcd/2A6UdZHGnnJWhLem0dyYLGgX7dFN2PQXBfG7vEBNoLKSE
	 AyoXVOJzjAwaJziGnml+o9weLfBINWn/DUum1nvNF6jhJyvmWhFnHeZgoytq19lcbG
	 4TZpjt2z/+ukIs3EC6HWROnoSxzo1cb7TT9I/kz7AATofRnMwT0m0ekAXyUHE2foWy
	 QhYBMraRfOASlnZv3uwYDA+Sz73+GOU7Ob2rFg2ZCVytu3YC5mj8Kf5RBEK6dkmlZj
	 MTiiqYhxqJ5og==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9411ED232C5;
	Fri,  9 Jan 2026 03:24:53 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 09 Jan 2026 11:24:22 +0800
Subject: [PATCH] clk: Ensure correct consumer's rate boundaries
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260109-fix_error_setting_clk_rate_range-v1-1-bae0b40e870f@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAOV0YGkC/x2NSwqAMAxEryJZK9Qu/F1FpBSbalCqpEUE6d2Nb
 gYezJt5ICITRhiKBxgvinQEgbosYF5tWLAiJwxa6UbVqq083QaZDzYRU6KwmHnfDNuEEl/f9bp
 ztmmt7xXIzMkozn8xTjm/P+F7THIAAAA=
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767929092; l=1489;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=iAO6kZohGujkhzhp+PGjVKzMDmm3KwoHd3yOlenUwTg=;
 b=dklgwC075h3YRM54I0zr7DtZkIYv/Y+AVjOdXmt8hcpOeuKhFpjJQhRjBkBonddOkbY+MvAUQ
 lPhkBifsCffA4npjw9eyRfrtfzMFRjZzkyO92BFAvLM9bUg37MjVLPD
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
Reply-To: chuan.liu@amlogic.com

From: Chuan Liu <chuan.liu@amlogic.com>

If we were to have two users of the same clock, doing something like:

clk_set_rate_range(user1, 1000, 2000);
clk_set_rate_range(user2, 3000, 4000);

Even when user2's call returns -EINVAL, the min_rate and max_rate of
user2 are still incorrectly updated. This causes subsequent calls by
user1 to fail when setting the clock rate, as clk_core_get_boundaries()
returns corrupted boundaries (min_rate = 3000, max_rate = 2000).

To prevent this, clk_core_check_boundaries() now rollback to the old
boundaries when the check fails.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 drivers/clk/clk.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 85d2f2481acf..0dfb16bf3f31 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2710,13 +2710,17 @@ static int clk_set_rate_range_nolock(struct clk *clk,
 	 */
 	rate = clamp(rate, min, max);
 	ret = clk_core_set_rate_nolock(clk->core, rate);
+
+out:
 	if (ret) {
-		/* rollback the changes */
+		/*
+		 * Rollback the consumer’s old boundaries if check_boundaries or
+		 * set_rate fails.
+		 */
 		clk->min_rate = old_min;
 		clk->max_rate = old_max;
 	}
 
-out:
 	if (clk->exclusive_count)
 		clk_core_rate_protect(clk->core);
 

---
base-commit: 7f98ab9da046865d57c102fd3ca9669a29845f67
change-id: 20260107-fix_error_setting_clk_rate_range-d928da67af90

Best regards,
-- 
Chuan Liu <chuan.liu@amlogic.com>


