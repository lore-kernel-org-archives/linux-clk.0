Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB32378D8A;
	Thu,  5 Mar 2026 10:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772705484; cv=none; b=Gn5CymE4puX+As1SYIg34hLiGG/NvD7whTdqDOzARgNZ18KVDW4LnFOOWVPvAtDzdylmBFVIuRwLmGBf9s9q7TsZMFoatoZJd1Ci85kznKK05aug2kO+L8OtKT2XDmjdvpd4yyvnTxF6CPbr8T9iIswMV8m81FSnCBpidg81A/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772705484; c=relaxed/simple;
	bh=BG5V+wT8YulB9rECE6ROeFRKBKq5B5gKT0rmP64bEjE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BGduxMgxiLYi4U5uOPnVsr0lr+U8eRoyCt6JL9ke+QNNRVRvP6OlY88Gu6CvvMSNVdzLEWP07p6SCCu7ZQPzgCTLQ8/fZg9vllGMy5a8YvxPJK/9XiQuG/9bU85WhYozRd1dPlLPe8HC119mySFyBCgqn9bn89JnWEp2+VYaDi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46610C116C6;
	Thu,  5 Mar 2026 10:11:22 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Khuong Dinh <khuong@os.amperecomputing.com>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: xgene: Fix mapping leak in xgene_pllclk_init()
Date: Thu,  5 Mar 2026 11:11:16 +0100
Message-ID: <0d175826e203f2c2fa7060d57763286ec3fe2f43.1772705227.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If xgene_register_clk_pll() fails, the mapped register block is never
unmapped.

Fixes: 308964caeebc45eb ("clk: Add APM X-Gene SoC clock driver")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/clk-xgene.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/clk-xgene.c b/drivers/clk/clk-xgene.c
index ba3b1057e4f0c61d..abb6c8fcdc91fad3 100644
--- a/drivers/clk/clk-xgene.c
+++ b/drivers/clk/clk-xgene.c
@@ -188,6 +188,8 @@ static void xgene_pllclk_init(struct device_node *np, enum xgene_pll_type pll_ty
 		of_clk_add_provider(np, of_clk_src_simple_get, clk);
 		clk_register_clkdev(clk, clk_name, NULL);
 		pr_debug("Add %s clock PLL\n", clk_name);
+	} else {
+		iounmap(reg);
 	}
 }
 
-- 
2.43.0

