Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B768D244665;
	Sun,  1 Mar 2026 01:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772327886; cv=none; b=LsffdrF9OFl0HtWJ9EYCwf3eDE8wqjlQMkcpczk4YWZ+1EHjFIcD7pda0ruyX+VR4sCYuXsq1q2rT2iBfNV2xhgMeSQa7lx34oYDS7c2qaEfpwqMlvaJmCXyyfObD9orjzErhBhbMt5NbYSpMkeZqByuzt0ForTYmMxV+pUXQtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772327886; c=relaxed/simple;
	bh=uxyROrbsnnHuxtm4Ogy2NEKZR8k0HlvnQwgG16F+36g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L0svTPrvZtgTxb4FUj3iNfY2VbkIPfAm4EogDw2VY8WpYc0CY/AhN3PkFy5IAbcq/r69oH8gn7E3eZlKVGwBEyePKDIZh9CQtfxRDbHbezajk9V/YUkrWbFikzSghgPj9teUFA2v7Nx6EOXn5AWJ1UkqgNN6rOThXIdnCeyIrZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u8U4O05E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u8U4O05E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B365DC19424;
	Sun,  1 Mar 2026 01:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772327886;
	bh=uxyROrbsnnHuxtm4Ogy2NEKZR8k0HlvnQwgG16F+36g=;
	h=From:To:Cc:Subject:Date:From;
	b=u8U4O05E6862vIpubu5FKP42hSWKujti6h3QGzVsfR8sc5lCXbEy7Ll5fWuJlAd5y
	 MLlje9oe8G/H8M9rmxOVGbvAJgWbTSwhc5yNNF2kuunuHu4/FtWxzjQaJcLaH2VAme
	 VclYQKFNsaVGdMk+Oi3ENjIRlEhSVEYWngM98CO3Elk/zOxj6bxaBdW8jXcFHHpQS1
	 0cSAef34yA3S0nMhXCSzX1qqeCSX7XqHNGtWb5/sqZeWrme5hdhLIxe+BzHLRmNSz2
	 Tot2TSngedIRID+ttXfdi1IxIHOvUesUSoB5nBiSagbn+cLZPwkn3zTvg9DZ28NJX2
	 tFrMyEWZOCh9Q==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	chris.brandt@renesas.com
Cc: Hugo Villeneuve <hugo@hugovil.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: FAILED: Patch "clk: renesas: rzg2l: Fix intin variable size" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:18:04 -0500
Message-ID: <20260301011804.1672172-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From a00655d98cd885472c311f01dff3e668d1288d0a Mon Sep 17 00:00:00 2001
From: Chris Brandt <chris.brandt@renesas.com>
Date: Fri, 14 Nov 2025 14:37:11 -0500
Subject: [PATCH] clk: renesas: rzg2l: Fix intin variable size

INTIN is a 12-bit register value, so u8 is too small.

Fixes: 1561380ee72f ("clk: renesas: rzg2l: Add FOUTPOSTDIV clk support")
Cc: stable@vger.kernel.org
Reported-by: Hugo Villeneuve <hugo@hugovil.com>
Closes: https://lore.kernel.org/20251107113058.f334957151d1a8dd94dd740b@hugovil.com
Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Link: https://patch.msgid.link/20251114193711.3277912-1-chris.brandt@renesas.com
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/rzg2l-cpg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 64d1ef6e4c943..dfe0f5e87d8cf 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -122,8 +122,8 @@ struct div_hw_data {
 
 struct rzg2l_pll5_param {
 	u32 pl5_fracin;
+	u16 pl5_intin;
 	u8 pl5_refdiv;
-	u8 pl5_intin;
 	u8 pl5_postdiv1;
 	u8 pl5_postdiv2;
 	u8 pl5_spread;
-- 
2.51.0




